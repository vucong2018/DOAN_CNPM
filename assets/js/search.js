function autocomplete(inp, arr) {
    var currentFocus;
    inp.addEventListener("input", function(e) {
        var a, b, i, val = this.value;
        closeAllLists();
        if (!val) { return false;}
        currentFocus = -1;
        a = document.createElement("DIV");
        a.setAttribute("id", this.id + "autocomplete-list");
        a.setAttribute("class", "autocomplete-items");
        this.parentNode.appendChild(a);
        for (i = 0; i < arr.length; i++) {
          if (arr[i].substr(0, val.length).toUpperCase() == val.toUpperCase()) {
            b = document.createElement("DIV");
            b.innerHTML = "<strong>" + arr[i].substr(0, val.length) + "</strong>";
            b.innerHTML += arr[i].substr(val.length);
            b.innerHTML += "<input type='hidden' value='" + arr[i] + "'>";
            b.addEventListener("click", function(e) {
                inp.value = this.getElementsByTagName("input")[0].value;
                closeAllLists();
            });
            a.appendChild(b);
          }
        }
    });
    inp.addEventListener("keydown", function(e) {
        var x = document.getElementById(this.id + "autocomplete-list");
        if (x) x = x.getElementsByTagName("div");
        if (e.keyCode == 40) { //nút mũi tên xuống
          currentFocus++;
          addActive(x);
        } else if (e.keyCode == 38) { //nút mũi tên lên
          currentFocus--;
          addActive(x);
        } else if (e.keyCode == 13) {//nút Enter
          if (currentFocus > -1) {
            e.preventDefault();
            if (x) x[currentFocus].click();
            currentFocus = -1;
          }
        }
    });
    function addActive(x) {
      if (!x) return false;
      removeActive(x);
      if (currentFocus >= x.length) currentFocus = 0;
      if (currentFocus < 0) currentFocus = (x.length - 1);
      x[currentFocus].classList.add("autocomplete-active");
    }
    function removeActive(x) {
      for (var i = 0; i < x.length; i++) {
        x[i].classList.remove("autocomplete-active");
      }
    }
    function closeAllLists(elmnt) {
      var x = document.getElementsByClassName("autocomplete-items");
      for (var i = 0; i < x.length; i++) {
        if (elmnt != x[i] && elmnt != inp) {
          x[i].parentNode.removeChild(x[i]);
        }
      }
    }
    document.addEventListener("click", function (e) {
        closeAllLists(e.target);
    });
  }
  
  var books = ["Giải tích 1", "Giải tích 2", "Giải tích 2 cô Xuân Anh", "Giải tích 3", "Giải tích mạch", "Giải tích hàm", "Giải tích số", "Vật lý 1", "Vật lý 2", "Vật lý 3", "Xác suất thống kê", "Đại số tuyến tính", "Triết học Mác-Lênin", "Kinh tế chính trị Mác-Lênin", "Nhập môn lập trình", "Hóa đại cương"];
  autocomplete(document.getElementById("myInput"), books);