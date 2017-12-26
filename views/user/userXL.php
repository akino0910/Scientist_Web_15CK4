<?php

$secretKey = $_POST[ 'secretKey' ];
$responseKey = $_POST[ 'responseKey' ];
//$userIP = $_POST['userIP'];
//&remoteip=$userIP
$url = "https://www.google.com/recaptcha/api/siteverify?secret=$secretKey&response=$responseKey";
$response = file_get_contents( $url );
$result = json_decode( $response );
if ( !$result->success ) {
	echo false;
} else {
	echo true;
}