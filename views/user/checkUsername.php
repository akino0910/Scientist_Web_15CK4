<?php

define( "HOST", "localhost" );
define( "DB", "qlbh" );
define( "UID", "root" );
define( "PWD", "" );

$UN = $_POST[ "username" ];

$cn = new mysqli( HOST, UID, PWD, DB );
if ( $cn->connect_errno ) {
	die( "FAILED: " . mysqli_connect_error() );
}

$sql = "SELECT * FROM users WHERE f_Username='$UN' ";
$result = $cn->query( $sql );
if ( $result->num_rows !== 0 ) {
	echo( '1' );
} else {
	echo( '0' );
}