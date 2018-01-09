<?php
require_once './lib/db.php';
session_start();
if(!isset($_SESSION["admin"]) || $_SESSION["admin"] == 0)
{
	$_SESSION["admin"] = 0;
	header("Location: admin.php");
}
if(isset($_POST['ChuyenDM']))
{
	if (!isset($_POST['DM1']) || !isset($_POST['DM2'])) {
		echo "<div class='alert alert-danger text-center col-12' role='alert'><strong>Thất bại!</strong> Vui lòng chọn danh mục</div>";
	}
	else
	{
		$dm1 = $_POST['DM1'];
		$dm2 = $_POST['DM2'];
		$sql = "update products set CatID = $dm2 where CatID = $dm1";
		write($sql);
		echo "<div class='alert alert-success text-center col-12' role='alert'><strong>Xử lý thành công!</strong></div>";
	}
	header( "refresh:1;url=chuyendm.php" );
}
if(isset($_POST['ChuyenNSX']))
{
	if (!isset($_POST['NSX1']) || !isset($_POST['NSX2'])) {
		echo "<div class='alert alert-danger text-center col-12' role='alert'><strong>Thất bại!</strong> Vui lòng chọn nsx</div>";
	}
	else
	{
		$NSX1 = $_POST['NSX1'];
		$NSX2 = $_POST['NSX2'];
		$sql = "update products set IDNSX = $NSX2 where IDNSX = $NSX1";
		write($sql);
		echo "<div class='alert alert-success text-center col-12' role='alert'><strong>Xử lý thành công!</strong></div>";
	}
	header( "refresh:1;url=chuyendm.php" );
}
?>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Quản lý sản phẩm</title>
		<link rel="stylesheet" href="assets/bootstrap4.min.css" >
		<link rel="stylesheet" type="text/css" href="assets/style.css">
		<link rel="stylesheet" type="text/css" href="assets/font-awesome-4.7.0/css/font-awesome.min.css">
	</head>
	<body>
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<a class="navbar-brand" href="admin.php"><i class="fa fa-camera"></i> ProCam</a>
			<?php
			if($_SESSION["admin"] == 1)
				{
			?>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
				</ul>
				<ul class="navbar-nav mr-0">
					<li class="nav-item">
						<li class="nav-item dropdown">
							<a class="nav-link" href="admin.php?Thoat" role="button">
								Thoát
							</a>
						</li>
					</li>
				</ul>
				<?php
					}
				?>
			</div>
		</nav>
		<div class="container-fluid">
			<div class="row">
				<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
					<div class="panel panel-default">
						<div class="borderdiv">
							<h3 class="panel-title">Quyền Admin</h3>
						</div>
						<div class="list-group">
							<a class="dropdown-toggle list-group-item" href="https://example.com" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								Quản lý danh mục và NSX
							</a>
							<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
								<a class="dropdown-item" href="xulydanhmuc.php">Cập nhật danh mục</a>
								<a class="dropdown-item" href="xulynsx.php">Cập nhật nhà sản xuất</a>
								<a class="dropdown-item" href="chuyendm.php">Chuyển DM và NSX</a>
							</div>
							<a class="list-group-item" href="admin.php?quyen=1">Quản lý sản phẩm</a>
							<a class="list-group-item" href="admin.php?quyen=0">Quản lý đơn hàng</a>
						</div>
					</div>
				</div>
				<div class="col-md-10 col-lg-10">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="borderdiv">Chuyển danh mục</h3>
						</div>
						<div class="row">
							
							<div class="col-3"></div>
							<div class="col-8">
								<form action="" method="post">
								<div>
								Danh mục: 
								</div>
								<select class="martop custom-select" name="DM1">
									<option value="" selected disabled>Chọn mục cần chuyển</option>
								<?php
								$sql = 'select * from categories';
								$rs = load($sql);
								while ($row = $rs -> fetch_assoc()) :
								?>
								
									
									<option value="<?= $row["CatID"] ?>"><?= $row["CatName"] ?></option>
								
								<?php 
								endwhile;
								?>
								</select>
								------>
								<select class="martop custom-select" name="DM2">
									<option value="" selected disabled>Chọn mục cần chuyển</option>
								<?php
								$sql = 'select * from categories';
								$rs = load($sql);
								while ($row = $rs -> fetch_assoc()) :
								?>
									<option value="<?= $row["CatID"] ?>"><?= $row["CatName"] ?></option>
								<?php 
								endwhile;
								?>
								</select>
								<button class="btn btn-primary martop" name="ChuyenDM" id="ChuyenDM" type="submit"><i class="fa fa-check-circle	"></i></button>
							</form>
							</div>
							<div class="col-1"></div>
							<div class="col-3"></div>
							<div class="martop col-8">
								<form action="" method="post">
								<div class="martop">Nhà sản xuất: </div>
								<select class="martop custom-select" name="NSX1">
									<option value="" selected disabled>Chọn mục cần chuyển</option>
								<?php
								$sql = 'select * from nsx';
								$rs = load($sql);
								while ($row = $rs -> fetch_assoc()) :
								?>
								
									
									<option value="<?= $row["IDNSX"] ?>"><?= $row["NameNSX"] ?></option>
								
								<?php 
								endwhile;
								?>
								</select>
								------>
								<select class="martop custom-select" name="NSX2">
									<option value="" selected disabled>Chọn mục cần chuyển</option>
								<?php
								$sql = 'select * from nsx';
								$rs = load($sql);
								while ($row = $rs -> fetch_assoc()) :
								?>
									<option value="<?= $row["IDNSX"] ?>"><?= $row["NameNSX"] ?></option>
								<?php 
								endwhile;
								?>
								</select>
								<button class="btn btn-primary martop" name="ChuyenNSX" id="ChuyenNSX" type="submit"><i class="fa fa-check-circle	"></i></button>
							</form>
							</div>

						</div>
					</div>
				</div>
			</div>
			<script src="assets/jquery3.2.1.slim.min.js"></script>
			<script src="assets/popper.min.js"></script>
			<script src="assets/bootstrap4.min.js"></script>
			<script src="assets/tinymce/tinymce.min.js"></script>
			<script type="text/javascript">
				tinymce.init({
				selector: '#txtFullDes',
				menubar: false,
				toolbar1: "styleselect | bold italic | link image | alignleft aligncenter alignright | bullist numlist | fontselect | fontsizeselect | forecolor backcolor",
				// toolbar2: "",
				// plugins: 'link image textcolor',
				//height: 300,
				// encoding: "xml",
				});
			</script>
		</body>
	</html>