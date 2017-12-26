<?php
require_once './lib/db.php';
if(isset($_POST["Remove"]))
{
	if(isset($_POST["CatID"]))
	{
		$Cid = $_POST["CatID"];
		$sql = "delete from categories where CatID = $Cid";
		write($sql);
	}
	header('Location: ' . $_SERVER['HTTP_REFERER']);
}
if(isset($_POST["OK"]))
{
	if(!isset($_POST["ID"]))
	{
		$sql = "select max(CatID) from categories";
		$max = load($sql)->fetch_assoc();
		$id = $max["max(CatID)"] + 1;
		$NAME = $_POST["Name"];
		if($NAME == "")
		{
			$NAME = "No-Name";
		}
		$sql = "insert into categories values ($id ,'$NAME')";
	}
	else
	{
		$ID = $_POST["ID"];
		$NAME = $_POST["Name"];
		if($NAME == "")
		{
			$NAME = "No-Name";
		}
		$sql = "update categories set CatName = '$NAME' where CatID = $ID";
	}
	write($sql);
	header('Location: xulydanhmuc.php');
	echo "qua du";
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
							<h3 class="borderdiv">Cập nhật danh mục</h3>
						</div>
						<div class="row">
							<div class="col-2"></div>
							<div class="col-8">
								<form action="" method="post">
									<?php
									if(!isset($_POST["Update"]))
									{
									?>
									Tên danh mục: <input class="form-control" name="Name" id="Name" placeholder="Tên danh mục">
									<div class="text-right martop">
										<button class="btn btn-success" name="OK" id="OK"><li class="fa fa-check"></li></button>
									</div>
									<?php
									}
									elseif(isset($_POST["Update"]))
									{
									?>
									Tên danh mục: <input class="form-control" name="Name" id="Name" value="<?= $_POST["CatName"] ?>" placeholder="Tên danh mục">
									<input class="form-control" type="hidden" name="ID" id="ID" value="<?= $_POST["CatID"] ?>">
									<div class="text-right martop">
										<button class="btn btn-success" name="OK" id="OK"><li class="fa fa-check"></li></button>
									</div>
									<?php
									}
									?>
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