<?php
class logout extends controller
{

    public function __construct()
    {
        require_once "./mvc/core/basehref.php";
       session_destroy();
        header("Location: " . getUrl(). "/Home");
    }

}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <button name="logout">Logout</button>
</body>
</html>
<?php
