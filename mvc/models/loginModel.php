<?php
class loginModel extends db {
    private function _query($sql)
    {
        return mysqli_query($this->connect, $sql);
    }

    public function checkAccount($info){
        $sql = "SELECT * FROM account WHERE Email = '".$info['email']."'";
        // echo $sql;
        $query = $this->_query($sql);
        $data = [];
        while ($row = mysqli_fetch_assoc($query)) {
            array_push($data, $row);
        }
        if (empty($data)){
            return "";
        }
        if ($data[0]['Password'] == md5($info['pass'])){
            echo "xac nhan thanh cong";
            return $data[0];
        }
        return "";
    }

}
?>