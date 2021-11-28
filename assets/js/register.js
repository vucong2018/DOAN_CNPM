function ValidateEmail(mail) 
        {
        if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(mail.value))
        {
            return true;
        }
            return (false)
        }
        function check_text_length(var_check, start, end) {
            if(var_check.value.length < start || var_check.value.length > end) {
                return false;
            }
            return true;
        }
        function vadilation() {
            
            var first_name = document.getElementById('first_name_text');
            var last_name  = document.getElementById('last_name_text');
            var email = document.getElementById('email_text');
            var password = document.getElementById('password_text');
            var re_password = document.getElementById('re-password_text');
            var age = document.getElementById('age');

            var check_firstname = check_text_length(first_name,2,30);
            var check_lastname = check_text_length(last_name,2,30);
            var check_email = ValidateEmail(email);
            var check_password = check_text_length(password,6,30);
            var check_repass = (password.value == re_password.value) ? true : false;
            var check_age = Number.isInteger(age.value/1) && (age.value > 16);
            
            if (check_firstname && check_lastname && check_email && check_password && check_repass&&check_age){
                
            }
            else {
                if(!check_firstname || !check_lastname) {
                    alert('Họ và tên từ 2 đến 30 ký tự');
                }
                else if(!check_email) {
                    alert('Email không hợp lệ');
                }
                else if (!check_age){
                    alert('Age không hợp lệ');
                }
                else if(!check_password){
                    alert('Password không hợp lệ');
                }
                else if (!check_repass) {
                    alert('Xác nhận Password không trùng khớp');
                }
                
            }
        }