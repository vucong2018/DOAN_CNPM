<?php

use function PHPSTORM_META\type;

class myAccount extends controller{

    public function viewHome(){
        
        $this->view("myAccount");
    }
    public function update() {
        require_once "./mvc/core/basehref.php";
        $id = $_SESSION['user_ID'];
        $fname = $_POST['fname'];
        $lname = $_POST['lname'];
        $email = $_POST['email'];
        $pass = $_POST['pass'];
        $repass = $_POST['repass'];
        $age = ctype_digit( $_POST['age']) ? (int)$_POST['age'] : $_POST['age'];
        if(is_int($age) && $age > 16 && $repass == $pass && strlen($fname) >= 2 && strlen($fname) <= 30 && strlen($lname) >=2 && strlen($lname) <= 30 && strlen($pass) >= 10 && preg_match("/^([a-z0-9\+_\-]+)(\.[a-z0-9\+_\-]+)*@([a-z0-9\-]+\.)+[a-z]{2,6}$/ix", $email)){
            $update = $this->model('myAccountModel')->updateAccount($email,md5($pass),$age,$fname,$lname,$id);
            $_SESSION['firstname'] = $fname;
            $_SESSION['lastname'] = $lname;
            $_SESSION['email'] = $email;
            $_SESSION['age'] = $age;
            $_SESSION['username'] = $fname." ".$lname;
        header("Location: " . geturl(). "/myAccount");
        }
        else {
            header("Location: " . geturl(). "/myAccount");
        }
        
       
    }
   
}
?>