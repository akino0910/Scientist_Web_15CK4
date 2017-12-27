<?php
require_once './lib/db.php';
session_start();
if(!isset($_SESSION["admin"]) || $_SESSION["admin"] == 0)
{
	$_SESSION["admin"] = 0;
	header("Location: admin.php");
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
							<h3 class="borderdiv">Quản lý danh mục</h3>
						</div>
						<div class="panel-body">
							
							<table class="table table-hover">
								<thead>
									<tr>
										<th>#</th>
										<th>Tên danh mục</th>
										<th class="text-right">Xóa</th>
									</tr>
								</thead>
								<tbody>
									
									<?php
									$sql = "select * from nsx";
									$rs = load($sql);
									while ($row = $rs->fetch_assoc()) :
									?>
									
									<tr>
										<form action="addnsx.php" method="post">
											<td width="15%"><?= $row["IDNSX"] ?><input class="form-control" type="hidden" name="IDNSX" id="IDNSX" value="<?= $row["IDNSX"] ?>"></td>
											<td width="50%"><input class="form-control" name="NameNSX" id="NameNSX" value="<?= $row["NameNSX"] ?>"></td>
											<td class="text-right">
													<button class="btn btn-danger" name="Remove" id="Remove"><li class="fa fa-remove"></li></button>
													<button class="btn btn-primary" name="Update" id="Update"><li class="fa fa-pencil"></li></button>
											</td>
											</form>
										</tr>
										<?php
										endwhile;
										?>
										
									</tbody>
								</table>
								<div class="row">
									<div class="col-6">
										<a class="btn btn-primary" href="addnsx.php" role="button"> Thêm mới</a>
									</div>
									
								</div>
								
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