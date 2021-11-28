<?php
    class myAccountModel extends db {
        private function _query($sql)
        {
            return mysqli_query($this->connect, $sql);
        }
    
        public function updateAccount($email, $password,$age, $fname, $lname, $id){
            $sql = "UPDATE account SET email = '$email',Age='$age', password = '$password',Fname = '$fname', Lname = '$lname' WHERE ID = '$id'";
            $query = $this->_query($sql);
            return $query;
        }
    }
?>