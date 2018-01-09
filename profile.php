<?php
require_once "./lib/db.php";
require_once 'cart.inc';
$nguoidung = $_SESSION["current_user"];
$oldpass = $nguoidung->f_Password;
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
		// header('Location: ' . $_SERVER['HTTP_REFERER']);
		echo "<div class='alert alert-success text-center' role='alert'><strong>Cập nhật thông tin thành công!</strong></div>";
	}
	if(isset($_POST["oldpass"]) && isset($_POST["pass"]) && isset($_POST["repass"])){
		$ID = $nguoidung->f_ID;
		$oldpass2 = md5($_POST["oldpass"]);
		$pass = md5($_POST["pass"]);
		$repass = md5($_POST["repass"]);
		if ($oldpass2 != $oldpass) {
			echo "<div class='alert alert-danger text-center' role='alert'><strong>Sai mật khẩu!</strong></div>";
			
		}
		elseif($pass != $repass)
		{
			echo "<div class='alert alert-danger text-center' role='alert'><strong>Mật khẩu mới và mật khẩu xác nhận không trùng khớp!</strong></div>";
		}
		else
		{
			$sql = "update users set f_Password = '$pass' where f_ID = $ID";
			write($sql);
			echo "<div class='alert alert-success text-center' role='alert'><strong>Cập nhật thông tin thành công!</strong></div>";
		}
		
		// header('Location: ' . $_SERVER['HTTP_REFERER']);
		
	}
	$sql = "select * from users where f_ID = '$ID'";
	$rs = load($sql);
	if ($rs->num_rows > 0) {
		$_SESSION["current_user"] = $rs->fetch_object();
		$_SESSION["ttdn"] = 1;
	}
}
?>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<title>ProCam - Thông tin cá nhân</title>
		<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css> -->
		<link rel="stylesheet" href="assets/bootstrap4.min.css" >
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
					<li class="nav-item">
						<a class="nav-link" href="viewcart.php"><i class="fa fa-cart-arrow-down"></i> Giỏ hàng (<?= get_total_items() ?>) </a>
					</li>
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
							<a class="list-group-item" href="?td3">Lịch sử mua hàng</a>
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
								<div class="martop">
									<button class="btn btn-success my-2 my-sm-0" type="submit" name="tt" id="tt">Cập nhật</button>
								</div>
							</div>
						</div>
						<?php
						}
						elseif(isset($_GET["td1"])){
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
								<div class="martop">
									<button class="btn btn-success my-2 my-sm-0" type="submit" name="tt" id="tt">Cập nhật</button>
								</div>
							</div>
						</div>
						<?php
						}
						elseif(isset($_GET["td3"])){
							$ID = $nguoidung->f_ID;
						?>
						<div class="borderdiv">
							<h3 class="panel-title">Lịch sử mua hàng</h3>
						</div>
						<div class="row">
							<div class="list-group col-1">
							</div>
							<div class="list-group col-10">
								<table class="table table-hover">
									<thead>
										<tr>
											<th>Mã đơn hàng</th>
											<th>Ngày đặt hàng</th>
											<th>Thành tiền</th>
											<th>Trạng thái</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
										<?php
										$sql = "select * from orders where UserID = $ID ORDER BY OrderID DESC";
										$rs = load($sql);
										while ($row = $rs->fetch_assoc()) :
										?>
										<tr>
											<td><?= $row["OrderID"] ?></td>
											<td><?= $row["OrderDate"] ?></td>
											<td><?=  number_format($row["Total"]) ?>đ</td>
											<td><?= $row["TrangThai"] ?></td>
											<td><a class="btn btn-xs btn-success" href="?dh=<?= $row["OrderID"] ?>" role="button">
												Chi tiết
											</a></td>
										</tr>
										<?php
										endwhile;
										?>
									</tbody>
								</table>
							</div>
						</div>
						<?php
						}
						elseif(isset($_GET["dh"])){
						?>
						<div class="borderdiv">
							<h3 class="panel-title">Lịch sử mua hàng</h3>
						</div>
						<div class="row">
							<div class="list-group col-1">
							</div>
							<div class="list-group col-10">
								<table class="table table-hover">
									<thead>
										<tr>
											<th>#</th>
											<th>Tên mặt hàng</th>
											<th>Số lượng</th>
											<th>Đơn giá</th>
											<th>Thành tiền</th>
										</tr>
									</thead>
									<tbody class="bg">
										<?php
										$madon = $_GET["dh"];
										$sql = "select * from orderdetails where OrderID = $madon";
										$rs = load($sql);
										while ($row = $rs->fetch_assoc()) :
										?>
										<tr>
											<td><?= $row["ID"] ?></td>
											<?php
											$ProID = $row["ProID"];
											$sqlnew = "select ProName from products where ProID = $ProID";
											$kq = load($sqlnew);
											$Name = $kq->fetch_assoc();
											?>
											<td><?= $Name["ProName"] ?></td>
											<td><?= $row["Quantity"] ?></td>
											<td><?= number_format($row["Price"]) ?>đ</td>
											<td><?= number_format($row["Amount"]) ?>đ</td>
										</tr>
										<?php
										endwhile;
										?>
									</tbody>
								</table>
								<div>
									<a class="btn btn-xs btn-success" href="?td3" role="button">
										Quay lại
									</a>
								</div>
							</div>
						</div>
						<?php
						}
						?>
						<div class="martop col-8 text-right">
						</div>
					</form>
				</div>
			</div>
		</div>
		<script src="assets/jquery3.2.1.slim.min.js"></script>
		<script src="assets/popper.min.js"></script>
		<script src="assets/bootstrap4.min.js"></script>
	</body>
</html>