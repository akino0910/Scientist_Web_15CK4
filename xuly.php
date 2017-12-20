<?php
	session_start();
	if (!isset($_SESSION["ttdn"])) {
		$_SESSION["ttdn"] = 0;
	}
	require_once './lib/db.php';
	if (isset($_POST["signin"])) {
		$username = $_POST["userid"];
		$password = $_POST["passwordinput"];
		$enc_password = md5($password);
		$sql = "select * from users where f_Username = '$username' and f_Password = '$enc_password'";
		$rs = load($sql);
		if ($rs->num_rows > 0) {
			$_SESSION["current_user"] = $rs->fetch_object();
			$_SESSION["ttdn"] = 1;
			// lưu cookie, thông tin cần lưu là id của người dùng
			if(isset($_POST["rememberme"])) {
				$user_id = $_SESSION["current_user"]->f_ID;
				setcookie("auth_user_id", $user_id, time() + 86400);
			}
			header('Location: ' . $_SERVER['HTTP_REFERER']);
		} else {
			header('Location: ' . $_SERVER['HTTP_REFERER']);
			// sinh viên xử lý show_alert
		}
	}
	if(isset($_POST["signup"]))
	{
		if($_POST["password"] != $_POST["reenterpassword"])
		{
			header('Location: ' . $_SERVER['HTTP_REFERER']);
			return;
		}
		$Email = $_POST["Email"];
		$userid = $_POST["userid"];
		$pass = md5($_POST["password"]);
		$sql = "insert into users(f_Username,f_Password,f_Name,f_Email,f_Permission) values ('$userid','$pass','$userid','$Email',0)";
		write($sql);
		header('Location: ' . $_SERVER['HTTP_REFERER']);
	}
	if(isset($_GET["Thoat"]))
	{
		if (isset($_SESSION["ttdn"])) {
			unset($_SESSION["ttdn"]);
			unset($_SESSION["current_user"]);
			// xoá cookie auth_user_id
			setcookie("auth_user_id", "", time() - 3600);
		}
		header('Location: ' . $_SERVER['HTTP_REFERER']);
	}
?>