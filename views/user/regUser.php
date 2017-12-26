<?php

define( "HOST", "localhost" );
define( "DB", "qlbh" );
define( "UID", "root" );
define( "PWD", "" );

$cn = new mysqli( HOST, UID, PWD, DB );
if ( $cn->connect_errno ) {
	die( "FAILED: " . mysqli_connect_error() );
}

$name = $cn->real_escape_string( $_POST[ 'name' ] );
$username = $cn->real_escape_string( $_POST[ 'username' ] );
$email = $cn->real_escape_string( $_POST[ 'email' ] );
$pass = $cn->real_escape_string( md5( $_POST[ 'password' ] ) );
$per = $cn->real_escape_string( 0 );

$cn->query( "set names 'utf8'" );

$sql = sprintf( "INSERT INTO users (f_Username, f_Name, f_Password, f_Email, f_Permission) VALUES ('$username', '$name', '$pass', '$email', '$per')" );
$result = $cn->query( $sql );
if ( $result !== false ) {
	echo( '0' );
} else {
	echo( '1' );
}