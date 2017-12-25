<?php

define("HOST", "localhost");
define("DB", "qlbh");
define("UID", "root");
define("PWD","");

$UN = $_POST["username"];

////Cach 1
//$cn= mysqli_connect(HOST, UID, pw, DB);
//if(!$cn){
//	die('Ket noi that bai: '.mysqli_connect_error());
//}
//else{
//	echo"Ket noi thanh cong";
//}

//Cach 2
$cn=new mysqli(HOST, UID,PWD, DB);
if ($cn->connect_errno) {
	    die("FAILED: ".mysqli_connect_error());
	}

$sql="SELECT * FROM users WHERE f_Username='$UN' ";
$result=$cn->query($sql);
if($result->num_rows !== 0)
{
	echo('1');
}
else{
	echo('0');
}

