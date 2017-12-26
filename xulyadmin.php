<?php
require_once "./lib/db.php";
if(isset($_POST["remove"]))
{
	$doituongxoa = $_POST["ProID"];
	$sql = "delete from products where ProID = $doituongxoa";
	write($sql);
	if (is_dir("img/product/$doituongxoa")){
		deleteDir("img/product/$doituongxoa");
	}
}
header('Location: ' . $_SERVER['HTTP_REFERER']);
if(isset($_POST["update"]))
{
	$doituongupdate = $_POST["ProID"];
}
function deleteDir($dirPath) {
if (! is_dir($dirPath)) {
throw new InvalidArgumentException("$dirPath must be a directory");
}
if (substr($dirPath, strlen($dirPath) - 1, 1) != '/') {
$dirPath .= '/';
}
$files = glob($dirPath . '*', GLOB_MARK);
foreach ($files as $file) {
if (is_dir($file)) {
self::deleteDir($file);
} else {
unlink($file);
}
}
rmdir($dirPath);
}