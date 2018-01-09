<?php

$base_filename = basename(__FILE__, '.php');
$page_body_file = "$base_filename/$base_filename.body.tpl";
$loadpicture = "picture/nonpicture.body.tpl";
if(!isset($_GET['SP']) && !isset($_GET['NSX']))
{
	header('location: index.php');
}
if(!isset($_GET['page']))
{
	$_GET['page'] = 1;
}

include "views/_layout.php";