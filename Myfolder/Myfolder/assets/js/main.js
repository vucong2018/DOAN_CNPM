
var main_view = document.getElementsByClassName("main-content")[0];
var detail_view = document.getElementsByClassName("book-detail")[0];
var payment_view = document.getElementsByClassName("payment")[0];

var arrBuy = [];
var total_Money = 0;
//Back-btn
var back_node;
var back = document.getElementById("back-btn");
back.addEventListener('click',function() {
    if (detail_view.classList.contains("hide") == false)
    {
        detail_view.classList.add("hide");
        main_view.classList.remove("hide");
        document.getElementsByClassName("book-detail-add")[0].classList.add("hide")
    }
    if (payment_view.classList.contains("hide") == false)
    {
        payment_view.classList.add("hide");
        if (back_node == "main_view") main_view.classList.remove("hide");
        if (back_node == "detail_view") 
        {
            detail_view.classList.remove("hide");
            document.getElementsByClassName("book-detail-add")[0].classList.remove("hide");
        }
    }
});

//Cart-btn
var cart = document.getElementById("cart-btn");

cart.addEventListener('click',function() {
    if (main_view.classList.contains("hide") == false)
    {
        main_view.classList.add("hide");
        back_node = "main_view";
    }
    if (detail_view.classList.contains("hide") == false)
    {
        detail_view.classList.add("hide");
        back_node = "detail_view";
        document.getElementsByClassName("book-detail-add")[0].classList.add("hide");
    }
    payment_view.classList.remove("hide");

    let payment_view_html = `
        <div class="product-list">
            <div class="list-header row">
                <div class="product-name col-6">Tên sản phẩm</div>
                <div class="product-price col-2">Đơn giá</div>
                <div class="product-count col-2">Số lượng</div>
                <div class="product-total col-2">Thành tiền</div>
            </div>
            <div class="show-product">
        `;

    arrBuy.forEach(ele => {
        payment_view_html += `
                <div class="product row">
                    <div class="product-img col-1">${ele.img}</div>
                    <div class="product-name col-md-5 col-6">${ele.name}</div>
                    <div class="product-price col-2">${ele.price}</div>
                    <div class="product-count col-2">${ele.quantity}</div>
                    <div class="product-total col-2">${ele.total_price}đ</div>
                </div>
        `
    });
    payment_view_html += `
            </div>
            <div class="total row">
                <div class="total-text col-md-2 col-sm-3 col-4">TỔNG TIỀN</div>
                <div class="total-num col-md-2 col-sm-3 col-4">${total_Money}đ</div>
            </div>
        </div>
    `;

    payment_view_html += `
        <div class="chooseMethod">
            <div class="chooseMethod--title">Chọn phương thức thanh toán:</div>
            <div class="chooseMethod--choose row" id="chooseMethod--choose">
                <div onclick="changemethod('e-banking')" id="e-banking1" class="chooseMethod--method">E-Banking</div>
                <div onclick="changemethod('e-wallet')" id="e-wallet1" class="chooseMethod--method active--payment">E-Wallet</div>
            </div>
            <div class="form" id="form">
                <form id="e-banking" class="form__e-banking hide" action="">
                    <label for="bank">Chọn ngân hàng:</label>
                    <select id="bank" name="bank">
                        <option value="ACB">Ngân hàng Á Châu (ACB)</option>
                        <option value="Agribank">Agribank</option>
                        <option value="SHB">SHB</option>
                    </select>
                    <label for="seri">Số seri:</label>
                    <input type="text" name="seri" id="seri">
                    <p class="price">Tổng tiền : ${total_Money}đ</p>
                    <input type="submit" value="THANH TOÁN">
        
                </form>
        
                <form id="e-wallet" class="form__e-wallet" action="">
                    <label for="bank">Chọn Ví điện tử:</label>
                    <select id="e-wallet" name="e-wallet">
                        <option value="zalo">Zalo Pay</option>
                        <option value="momo">Momo</option>
                    </select>
                    <label for="seri">Số điện thoại:</label>
                    <input type="text" name="phone" id="phone" placeholder="Phone number">
                    <p class="price">Tổng tiền : ${total_Money}đ</p>
     
                    <input type="submit" value="THANH TOÁN">
                </form>
            </div>
        </div>
    `;

    document.querySelector('.payment').innerHTML = payment_view_html;
});

//detail-book
var book_click = document.getElementsByClassName("book-box");
var arrData = [];

for (let i = 0; i < book_click.length; i++)
{
    var book_obj = {};
    book_obj.img = book_click[i].getElementsByClassName('book-img')[0].innerHTML;
    book_obj.name = book_click[i].getElementsByClassName('book-name')[0].innerHTML;
    book_obj.price = book_click[i].getElementsByClassName('book-price')[0].innerHTML;
    book_obj.description = book_click[i].getElementsByClassName('book-description')[0].innerHTML;
    arrData.push(book_obj);
}

for (let i = 0; i < book_click.length; i++)
{ 
    book_click[i].addEventListener('click', function() {
        var current = document.getElementsByClassName("book-detail")[0];
        current.getElementsByClassName("detail-img")[0].innerHTML = arrData[i].img;
        current.getElementsByClassName("detail-name")[0].innerHTML = arrData[i].name;
        current.getElementsByClassName("detail-price")[0].innerHTML = arrData[i].price;
        current.getElementsByClassName("detail-description")[0].innerHTML = arrData[i].description;
        current.classList.remove("hide");
        document.getElementsByClassName("main-content")[0].classList.add("hide");
        current.getElementsByClassName("detail-quantity")[0].getElementsByClassName("quantity-box")[0].getElementsByClassName("quantity-num")[0].getElementsByTagName("input")[0].value = 1
        back_node = "main_view";
        document.getElementsByClassName("book-detail-add")[0].classList.remove("hide");
    });
}

//quantity change
function change_quantity(change)
{
    var qtt = document.getElementsByClassName("book-detail")[0].getElementsByClassName("detail-quantity")[0].getElementsByClassName("quantity-box")[0].getElementsByClassName("quantity-num")[0].getElementsByTagName("input")[0];
    if (change == 'down')
    {
        if (Number(qtt.value) != '1') qtt.value = Number(qtt.value) - 1;
    }
    if (change == 'up')
    {
        qtt.value = Number(qtt.value) + 1;
    }
}

//Buy-btn
var buyNow = document.getElementById("buy-btn");
buyNow.addEventListener('click',function() {
    var bookBuy = {};
    var current = document.getElementsByClassName("book-detail")[0];
    bookBuy.img = current.getElementsByClassName("detail-img")[0].innerHTML;
    bookBuy.name = current.getElementsByClassName("detail-name")[0].innerHTML;
    bookBuy.quantity = current.querySelector(".quantity-num").getElementsByTagName("input")[0].value;
    bookBuy.price = current.getElementsByClassName("detail-price")[0].innerHTML;
    bookBuy.total_price = Number(bookBuy.price.substring(0,bookBuy.price.length - 1)) * Number(bookBuy.quantity);
    bookBuy.check = true;
    total_Money += bookBuy.total_price;
    if (arrBuy.find(function(ele) {return ele.name == bookBuy.name;}) == undefined)
    {
        arrBuy.push(bookBuy);
    }
    else
    {
        var index = arrBuy.findIndex(function(ele) {return ele.name == bookBuy.name;});
        arrBuy[index].quantity = Number(arrBuy[index].quantity) + Number(bookBuy.quantity);
        arrBuy[index].total_price += bookBuy.total_price;
    }
});

function changemethod(id) {
    if (id == "e-wallet") {
        current = document.getElementById("e-wallet");
        current.classList.remove("hide")
        document.getElementById("e-banking").className += " hide";

        document.getElementById("e-wallet1").className += " active--payment";
        current1 = document.getElementById("e-banking1");
        current1.classList.remove("active--payment")
    }
    if (id == "e-banking") {
        current = document.getElementById("e-banking");
        current.classList.remove("hide")
        document.getElementById("e-wallet").className += " hide";

        document.getElementById("e-banking1").className += " active--payment";
        current1 = document.getElementById("e-wallet1");
        current1.classList.remove("active--payment")
    }
}

