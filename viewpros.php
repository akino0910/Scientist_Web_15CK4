<?php
require_once "./lib/db.php";
$base_filename = basename(__FILE__, '.php');
if(!isset($_GET["Pro"]))
{
	header('location: index.php');
}
$sql = "select * from products";
$nr = findnumrow($sql);
if(isset($_GET['Pro']))
{
	$ProID = $_GET['Pro'];
	if($ProID <= 0 || $ProID >$nr)
	{
		header('location: index.php');
		return;
	}
}
$page_body_file = "$base_filename/$base_filename.body.tpl";
$loadpicture = "picture/nonpicture.body.tpl";
include "views/_layout.php";