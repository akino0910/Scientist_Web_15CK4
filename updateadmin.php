<?php
require_once './lib/db.php';
if (isset($_POST["btnSave"])) {
	$name = $_POST["txtProName"];
	$price = $_POST["txtPrice"];
	$quantity = $_POST["Quantity"];
	$catId = $_POST["selCatID"];
	$IdNSX = $_POST["selIDNSX"];
	$tinyDes = $_POST["txtTinyDes"];
	$fullDes = $_POST["txtFullDes"];
	$XX = $_POST["txtXX"];
	$sql = "select max(ProID) from products";
	$rs = load($sql)->fetch_assoc();
	$id = $rs["max(ProID)"]+1;
	if(isset($_POST["UpdatenotNew"]))
	{
		$idP = $_POST["UpdatenotNew"];
		$sql = "update products set ProName = '$name', TinyDes = '$tinyDes', FullDes = '$fullDes', Price = '$price',CatID = '$catId', IDNSX = '$IdNSX', Quantity = '$quantity', XX = '$XX' where ProID = $idP";
	}
	else
	{
	$sql = "insert into products(ProID, ProName, TinyDes, FullDes, Price, CatID, IDNSX, Quantity,SLB,LX, XX, SLAnh) values($id, '$name', '$tinyDes', '$fullDes', '$price', '$catId', '$IdNSX', $quantity, 0, 0, '$XX', 1)";
	}
	write($sql);
	$f = $_FILES["fuMain"];
	if ($f["error"] > 0) {
	} else {
		if(!is_dir("img/product/$id"))
		{
		mkdir("img/product/$id");
		}
		$tmp_name = $f["tmp_name"];
		$name = $f["name"];
		$destination = "img/product/$id/1.png";
		move_uploaded_file($tmp_name, $destination);
	}
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
			session_start();
			if($_SESSION["admin"] == 1)
				{
			?>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
				</ul>
				<ul class="navbar-nav mr-0">
					<li class="nav-item">
						<li class="nav-item dropdown">
							<a class="nav-link" href="?Thoat" role="button">
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
							<a class="list-group-item" href="updateadmin.php">Thêm sản phẩm</a>
								<a class="dropdown-toggle list-group-item" href="https://example.com" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
									Quản lý danh mục và NSX
								</a>
								<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
									<a class="dropdown-item" href="xulydanhmuc.php">Cập nhật danh mục</a>
									<a class="dropdown-item" href="xulynsx.php">Cập nhật nhà sản xuất</a>
								</div>
							<a class="list-group-item" href="admin.php?quyen=1">Quản lý sản phẩm</a>
							<a class="list-group-item" href="admin.php?quyen=0">Quản lý đơn hàng</a>
						</div>
					</div>
				</div>
				<div class="col-md-10 col-lg-10">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="borderdiv">Sản phẩm mới</h3>
						</div>
						<div class="panel-body">
							<form class="form-horizontal" method="POST" action="" enctype="multipart/form-data">
								<?php
								if(isset($_POST["ProID"]))
								{
									$ProID = $_POST["ProID"];
									$sql = "select * from products where ProID = $ProID";
									$rs = load($sql)->fetch_assoc();
								}
								?>
								<div class="form-group">
									<label for="txtProName" class="col-sm-2 control-label">Sản phẩm</label>
									<div class="col-sm-12">
										<input type="text" class="form-control" id="txtProName" name="txtProName" placeholder="Camera" <?php if(isset($_POST["ProID"])){	?> value="<?= $rs["ProName"] ?>" <?php	} ?>>
									</div>
								</div>
								<div class="form-group">
									<label for="txtTinyDes" class="col-sm-2 control-label">Mô tả</label>
									<div class="col-sm-12">
										<input type="text" class="form-control" id="txtTinyDes" name="txtTinyDes" placeholder="Mô tả" <?php if(isset($_POST["ProID"])){	?> value="<?= $rs["TinyDes"] ?>" <?php	} ?>>
									</div>
								</div>
								<div class="form-group">
									<label for="txtPrice" class="col-sm-2 control-label">Giá</label>
									<div class="col-sm-12">
										<input type="text" class="form-control" id="txtPrice" name="txtPrice" placeholder="30,000,000" <?php if(isset($_POST["ProID"])){	?> value="<?= $rs["Price"] ?>" <?php	} ?>>
									</div>
								</div>
								<div class="form-group">
									<label for="txtPrice" class="col-sm-2 control-label">Số lượng</label>
									<div class="col-sm-12">
										<input type="number" class="form-control" id="Quantity" name="Quantity" placeholder="1" <?php if(isset($_POST["ProID"])){	?> value="<?= $rs["Quantity"] ?>" <?php	} ?>>
									</div>
								</div>
								<div class="form-group">
									<label for="txtPrice" class="col-sm-2 control-label">Xuất xứ</label>
									<div class="col-sm-12">
										<input type="text" class="form-control" id="txtXX" name="txtXX" placeholder="Việt Nam" <?php if(isset($_POST["ProID"])){	?> value="<?= $rs["XX"] ?>" <?php	} ?>>
									</div>
								</div>
								<div class="form-group">
									<label for="selCatID" class="col-sm-2 control-label">Loại</label>
									<div class="col-sm-12">
										<select id="selCatID" name="selCatID" class="form-control">
											<?php
												$sql = "select * from categories";
												$rs = load($sql);
												while ($row = $rs->fetch_assoc()) :
											?>
											<option value="<?= $row["CatID"] ?>"><?= $row["CatName"] ?></option>
											<?php endwhile; ?>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="selCatID" class="col-sm-2 control-label">Loại</label>
									<div class="col-sm-12">
										<select id="selIDNSX" name="selIDNSX" class="form-control">
											<?php
												$sql = "select * from nsx";
												$rs = load($sql);
												while ($row = $rs->fetch_assoc()) :
											?>
											<option value="<?= $row["IDNSX"] ?>"><?= $row["NameNSX"] ?></option>
											<?php endwhile; ?>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="txtFullDes" class="col-sm-2 control-label">Chi tiết</label>
									<div class="col-sm-12">
										<textarea rows="6" id="txtFullDes" name="txtFullDes" class="form-control"></textarea>
									</div>
								</div>
								<div class="form-group">
									<label for="fuMain" class="col-sm-2 control-label">Ảnh lớn</label>
									<div class="col-sm-12">
										<!-- <input type="file" class="form-control" id="fuMain" name="fuMain"> -->
										<input class="form-control" type="file" id="fuMain" name="fuMain">
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-offset-2 col-sm-12">
										<div class="row">
											<div class="col-sm-6">
												<a class="btn btn-primary" href="admin.php?quyen=1" role="button"> Quay lại</a>
											</div>
											<div class="col-sm-6 text-right">
												<?php
												if(isset($_POST["ProID"]))
														{
												?>
												<input type="hidden" id="UpdatenotNew" name="UpdatenotNew" value="<?= $_POST["ProID"] ?>">
												<?php
													}
												?>
												<button name="btnSave" type="submit" class="btn btn-success">
												<span class="glyphicon glyphicon-ok"></span>
												Lưu
												</button>
											</div>
										</div>
									</div>
								</div>
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