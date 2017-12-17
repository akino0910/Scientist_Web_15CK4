<?php

$base_filename = basename(__FILE__, '.php');
$page_body_file = "$base_filename/$base_filename.body.tpl";
$loadpicture = "picture/nonpicture.body.tpl";
include "views/_layout.php";