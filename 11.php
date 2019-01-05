<?php
$con = new MySQLi("localhost","root","root","admin.yidianxueche.cn");
//判断是否有错误

if(mysqli_connect_error()){

    echo "连接失败";

    exit();

}

//写SQL语句

$sql = "update sent_protect set status=2 where deactivation_time < unix_timestamp(now())";
echo $sql;
//执行SQL语句，返回结果集

$result = $con->query($sql);
?>