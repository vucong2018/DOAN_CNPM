<?php
require_once "./mvc/core/basehref.php";
$home_url = getUrl().'/';

if (!$_SESSION['username']){
    header("Location: " . geturl(). "/login");
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <?php
        echo "<base href='${home_url}'>";
    ?>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MyAccount</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="assets/css/signin.css">
    <link rel="stylesheet" href="assets/css/navbar.css">
</head>
<body style="background-color: #c4c4c4 !important;">
<?php require_once "./mvc/views/blocks/navbar.php";?>
<br>
<br>
<div class="container"  style="font-family: 'Dancing Script', cursive; background-color: #fff">
        <div class="head--form">
        <img  class = "logobk" style = "height: 62px; width: 62px; margin: 0 4px 4px 0 "src="assets/img/logobk.png" alt="logobk">
            <h3 style="font-family: 'Dancing Script', cursive; font-size: 36px; color: #fff">
                <!-- <span class = "logo"></span> -->
                
                YOUR ACCOUNT
            </h3>
        </div>
        <div class="my_content">
            <form action="myAccount/update" method="post" onsubmit="vadilation()">
                <label class="form-label" for="FirstName" id="first_name">Fisrt Name</label>
                <input style="border: 1px solid #ccc" name="fname" class="form-control" type="text" id="first_name_text" value="<?php echo $_SESSION['firstname']?>"> 

                <br>
                <label class="form-label" for="LastName" id="last_name">Last Name</label>
                <input style="border: 1px solid #ccc" name="lname" class="form-control" type="text" id="last_name_text" value="<?php echo $_SESSION['lastname']?>">

                <br>
                <label class="form-label" for="Age" id="age-cute">Age</label>
                <input style="border: 1px solid #ccc" name="age" class="form-control" type="text" id="age" value="<?php echo $_SESSION['age']?>">

                <br>

                
                <label class="form-label" for="email" id="email">Email Address</label>
                <input name ="email" class="form-control" type="email" id="email_text" value="<?php echo $_SESSION['email']?>">
                
                <br>

                <label class="form-label" for="password" id="password">Password</label>
                <input name="pass" class="form-control" type="password" id="password_text">

                <br>
                <label class="form-label" for="re-password" id="re-password">Re-password</label>
                <input name="repass" class="form-control" type="password" id="re-password_text">
                
                <br>

                <div class="d-grid mt-2 mb-1">
                    <button value="REGISTER" type="submit" class="btn btn-dark"><span class="fw-bold">UPDATE INFO</span></button>
                </div>
                <p></p>
            </form>
            </div>
        </div>
    <script src="assets/js/register.js"></script>
</body>
</html>