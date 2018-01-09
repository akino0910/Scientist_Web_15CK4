<?php
require_once './lib/db.php';
session_start();
if(!isset($_SESSION["admin"]) || $_SESSION["admin"] == 0)
{
	$_SESSION["admin"] = 0;
	header("Location: admin.php");
}
if(isset($_POST["Remove"]))
{
	if(isset($_POST["IDNSX"]))
	{
		$Cid = $_POST["IDNSX"];
		$sql = "delete from nsx where IDNSX = $Cid";
		write($sql);
		$sql = "delete from products where IDNSX = $Cid";
		write($sql);
	}
	header( "refresh:3;url=xulynsx.php" );
}
if(isset($_POST["OK"]))
{
	if(!isset($_POST["ID"]))
	{
		$sql = "select max(IDNSX) from nsx";
		$max = load($sql)->fetch_assoc();
		$id = $max["max(IDNSX)"] + 1;
		$NAME = $_POST["Name"];
		if($NAME != "")
		{
		$sql = "insert into nsx values ($id ,'$NAME')";
		write($sql);
		}
	}
	else
	{
		$ID = $_POST["ID"];
		$NAME = $_POST["Name"];
		if($NAME != "")
		{
		$sql = "update nsx set NameNSX = '$NAME' where IDNSX = $ID";
		write($sql);
		}
	}
	header( "refresh:3;url=xulynsx.php" );
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
							<h3 class="borderdiv">Cập nhật danh mục</h3>
						</div>
						<div class="row">
							<?php 
							if(!isset($_POST['OK']) && !isset($_POST['Remove']))
							{
							?>
							<div class="col-2"></div>
							<div class="col-8">
								<form action="" method="post">
									<?php
									if(!isset($_POST["Update"]))
									{
									?>
									Tên danh mục: <input class="form-control" name="Name" id="Name" placeholder="Tên NSX">
									<div class="text-right martop">
										<button class="btn btn-success" name="OK" id="OK"><li class="fa fa-check"></li></button>
									</div>
									<?php
									}
									elseif(isset($_POST["Update"]))
									{
									?>
									Tên danh mục: <input class="form-control" name="Name" id="Name" value="<?= $_POST["NameNSX"] ?>" placeholder="Tên NSX">
									<input class="form-control" type="hidden" name="ID" id="ID" value="<?= $_POST["IDNSX"] ?>">
									<div class="text-right martop">
										<button class="btn btn-success" name="OK" id="OK"><li class="fa fa-check"></li></button>
									</div>
									<?php
									}
									?>
								</form>
							</div>
							<?php 
							}
							else
							{
								if(isset($_POST['Name']) && $_POST['Name'] == '')
								{
									echo "<div class='alert alert-danger text-center col-12' role='alert'><strong>Thất bại!</strong> Nội dung bị rỗng! Chờ 3s để quay lại!</div>";
								}
								else
								{
								echo "<div class='alert alert-success text-center col-12' role='alert'><strong>Xử lý thành công!</strong> Bạn sẽ được chuyển về trang quản lý sau 3 giây!</div>";
								}
							}
							?>
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