<?php
require_once "./lib/db.php";
session_start();
$nguoidung = $_SESSION["current_user"];
$oldpass = $nguoidung->f_Password;
var_dump($oldpass);
if (!isset($_SESSION["ttdn"]) || $_SESSION["ttdn"] == 0)
{
	header("location: index.php");
	return;
}
if(isset($_POST["tt"]))
{
	if(isset($_POST["Email"]) && isset($_POST["Name"])){
		$newEmail = $_POST["Email"];
		$newName = $_POST["Name"];
		$newDOB = $_POST["NS"];
		$ID = $nguoidung->f_ID;
		if($newDOB == "")
		{
			$sql = "update users set f_Name = '$newName',f_Email = '$newEmail',f_DOB = null where f_ID = $ID";
		}
		else
		{
		$sql = "update users set f_Name = '$newName',f_Email = '$newEmail',f_DOB = '$newDOB' where f_ID = $ID";
		}
		write($sql);
		header('Location: ' . $_SERVER['HTTP_REFERER']);
	}
	if(isset($_POST["oldpass"]) && isset($_POST["pass"]) && isset($_POST["repass"])){
		$ID = $nguoidung->f_ID;
		$oldpass2 = md5($_POST["oldpass"]);
		var_dump($oldpass2);
		$pass = md5($_POST["pass"]);
		$repass = md5($_POST["repass"]);
		if ($oldpass2 != $oldpass) {
			header('Location: ' . $_SERVER['HTTP_REFERER']);
		}
		elseif($pass != $repass)
		{
			header('Location: ' . $_SERVER['HTTP_REFERER']);
		}
		else
		{
			$sql = "update users set f_Password = '$pass' where f_ID = $ID";
		}
		write($sql);
		// header('Location: ' . $_SERVER['HTTP_REFERER']);
	}
}
?>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<title>ProCam - Thông tin cá nhân</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
		<link rel="stylesheet" type="text/css" href="assets/style.css">
	</head>
	<body>
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<a class="navbar-brand" href="index.php">ProCam</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					
				</ul>
				<ul class="navbar-nav mr-0">
				</ul>
				<?php
					$nguoidung = $_SESSION["current_user"];
					
				?>
				<ul class="navbar-nav mr-0">
					<li class="nav-item">
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								<?= $nguoidung->f_Name ?>
							</a>
							<div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
								<a class="dropdown-item" href="profile.php">Thông tin cá nhân</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="xuly.php?Thoat=1">Thoát</a>
							</div>
						</li>
					</li>
				</ul>
			</div>
		</nav>
		<div class="container-fluid">
			<div class="row">
				<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
					<div class="panel panel-default">
						<div class="borderdiv">
							<h3 class="panel-title">Thông tin cá nhân</h3>
						</div>
						<div class="list-group">
							<a class="list-group-item" href="?td1">Cập nhật thông tin cá nhân</a>
							<a class="list-group-item" href="?td2">Thay đổi mật khẩu</a>
						</div>
					</div>
				</div>
				<div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
					<form name="fttcn" method="post">
						
						<?php if (isset($_GET["td2"])) {
						?>
						<div class="borderdiv">
							<h3 class="panel-title">Thay đổi mật khẩu</h3>
						</div>
						<div class="row">
							<div class="list-group col-2">
							</div>
							<div class="list-group col-6">
								Mật khẩu hiện tại:
								<input class="form-control" type="password" id="oldpass" name="oldpass">
								Mật khẩu mới:
								<input class="form-control" type="password" id="pass" name="pass">
								Xác nhận lại mật khẩu:
								<input class="form-control" type="password" id="repass" name="repass">
							</div>
						</div>
						<?php
						}
						else{
						?>
						<div class="borderdiv">
							<h3 class="panel-title">Thông tin cá nhân</h3>
						</div>
						<div class="row">
							<div class="list-group col-2">
							</div>
							<div class="list-group col-6">
								Email:
								<input class="form-control" type="text" id="Email" name="Email" value="<?= $nguoidung->f_Email ?>">
								Tên người dùng:
								<input class="form-control" type="text" id="Name" name="Name" value="<?= $nguoidung->f_Name ?>">
								Ngày sinh:
								<input class="form-control" type="date" id="NS" name="NS" value="<?= $nguoidung->f_DOB ?>">
							</div>
						</div>
						<?php
						}
						?>
						<div class="martop col-8 text-right">
							<button class="btn btn-success" name="tt" id="tt">Cập nhật</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
	</body>
</html>