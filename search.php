<?php

$base_filename = basename(__FILE__, '.php');
$page_body_file = "$base_filename/$base_filename.body.tpl";
$loadpicture = "picture/nonpicture.body.tpl";

if(!isset($_POST["Ten"]))
	{
		header("location: index.php");
		return;
	}
include "views/_layout.php";