<?php
require_once "./lib/db.php";
session_start();
if (isset($_SESSION["ttdn"]))
{
	unset($_SESSION["ttdn"]);
	unset($_SESSION["current_user"]);
	// xoá cookie auth_user_id
	setcookie("auth_user_id", "", time() - 3600);
}
if(!isset($_SESSION["admin"]))
{
	$_SESSION["admin"] = 0;
}
if ($_SESSION["admin"] == 0) {
	if(isset($_COOKIE["auth_admin_id"])) {
		$admin_id = $_COOKIE["auth_admin_id"];
		$sql = "select * from users where f_ID = $admin_id";
		$rs = load($sql);
		$_SESSION["current_admin"] = $rs->fetch_object();
		$_SESSION["admin"] = 1;
	}
}
if (isset($_POST["signin"])) {
		$username = $_POST["userid"];
		$password = $_POST["passwordinput"];
		$enc_password = md5($password);
		$sql = "select * from users where f_Username = '$username' and f_Password = '$enc_password'";
		$rs = load($sql);
		if ($rs->num_rows > 0) {
			$_SESSION["current_admin"] = $rs->fetch_object();
			$_SESSION["admin"] = 1;
			if($_SESSION["current_admin"]->f_Permission == 0)
			{
				if (isset($_SESSION["admin"]))
				{
				unset($_SESSION["admin"]);
				unset($_SESSION["current_admin"]);
				}
			header('Location: ' . $_SERVER['HTTP_REFERER']);
			return;
			}
			// lưu cookie, thông tin cần lưu là id của người dùng
			if(isset($_POST["rememberme"])) {
				$user_id = $_SESSION["current_admin"]->f_ID;
				setcookie("auth_admin_id_id", $user_id, time() + 86400);
			}
			header('Location: ' . $_SERVER['HTTP_REFERER']);
		} else {
			header('Location: ' . $_SERVER['HTTP_REFERER']);
			// sinh viên xử lý show_alert
		}
	}
if(isset($_GET["Thoat"]))
	{
		if (isset($_SESSION["admin"])) {
			unset($_SESSION["admin"]);
			unset($_SESSION["current_admin"]);
			// xoá cookie auth_user_id
			setcookie("auth_admin_id", "", time() - 3600);
		}
		header("location: admin.php");
	}
if(isset($_GET["hanhdong"]))
{
	$hd = $_GET["hanhdong"];
	$DH = $_GET["DH"];
	$sql = "update orders set TrangThai = '$hd' where OrderID = $DH";
	write($sql);
	header('Location: ' . $_SERVER['HTTP_REFERER']);
}
?>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<title>ProCam</title>
		<link rel="stylesheet" href="assets/bootstrap4.min.css" >
		<link rel="stylesheet" type="text/css" href="assets/style.css">
		<link rel="stylesheet" type="text/css" href="assets/font-awesome-4.7.0/css/font-awesome.min.css">
	</head>
	<body>
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
<<<<<<< HEAD
			<a class="navbar-brand" href="admin.php"><i class="fa fa-camera"></i> ProCam</a>
=======
			<a class="navbar-brand" href="index.php"><i class="fa fa-camera"></i> ProCam</a>
>>>>>>> c262764f6966d6612d4c95fbbaef832752863c3e
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
				<?php
				if($_SESSION["admin"] == 1){?>
				<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
					<div class="panel panel-default">
						<div class="borderdiv">
							<h3 class="panel-title">Quyền Admin</h3>
						</div>
						<div class="list-group">
<<<<<<< HEAD
							<a class="list-group-item" href="updateadmin.php">Thêm sản phẩm</a>
								<a class="dropdown-toggle list-group-item" href="https://example.com" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
									Quản lý danh mục và NSX
								</a>
								<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
									<a class="dropdown-item" href="xulydanhmuc.php">Cập nhật danh mục</a>
									<a class="dropdown-item" href="xulynsx.php">Cập nhật nhà sản xuất</a>
								</div>
=======
>>>>>>> c262764f6966d6612d4c95fbbaef832752863c3e
							<a class="list-group-item" href="?quyen=1">Quản lý sản phẩm</a>
							<a class="list-group-item" href="?quyen=0">Quản lý đơn hàng</a>
						</div>
					</div>
				</div>
				<?php
				if(isset($_GET["quyen"]))
				{
				if($_GET["quyen"] == 0)
				{
				?>
				<div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
					<div class="panel panel-default">
						<div class="borderdiv">
							<h3 class="panel-title">Quản lý đơn hàng</h3>
						</div>
						<div class="list-group">
							<div class="row">
								<div class="list-group col-1">
								</div>
								<div class="list-group col-10">
									<table class="table table-hover">
										<thead>
											<tr>
												<th>Mã đơn hàng</th>
												<th>Ngày đặt hàng</th>
												<th>Khách hàng</th>
												<th>Thành tiền</th>
												<th>Trạng thái</th>
												<th></th>
											</tr>
										</thead>
										<tbody>
											<?php
											$ID = $_SESSION["current_admin"]->f_ID;
											$sql = "select * from orders ORDER BY OrderDate DESC";
											$rs = load($sql);
											while ($row = $rs->fetch_assoc()) :
												if($row["TrangThai"] === "Chưa giao"){
											?>
											<tr class="table-danger">
												<?php
												}
												elseif($row["TrangThai"] === "Đang giao"){
												?>
												<tr class="table-warning">
													<?php
													}
													else
													{
													?>
													<tr class="table-success">
														<?php
														}
														?>
														<td><?= $row["OrderID"] ?></td>
														<td><?= $row["OrderDate"] ?></td>
														<?php
														$OID = $row["UserID"];
														$sqlmoi = "select * from users where f_ID = $OID";
														$rsmoi = load($sqlmoi);
														$rowmoi = $rsmoi -> fetch_assoc();
														?>
														<td><?= $rowmoi["f_Name"] ?></td>
														<td><?=  number_format($row["Total"]) ?>đ</td>
														<td>
															<form method="" action="">
																<select name="hanhdong">
																	<?php
																	if($row["TrangThai"] === "Chưa giao"){
																	?>
																	<option value="Chưa giao" selected>Chưa giao</option>
																	<option value="Đang giao">Đang giao</option>
																	<option value="Đã giao">Đã giao</option>
																	<?php
																	}
																	elseif($row["TrangThai"] === "Đang giao"){
																	?>
																	<option value="Chưa giao">Chưa giao</option>
																	<option value="Đang giao" selected>Đang giao</option>
																	<option value="Đã giao">Đã giao</option>
																	<?php
																	}
																	else
																	{
																	?>
																	<option value="Chưa giao">Chưa giao</option>
																	<option value="Đang giao">Đang giao</option>
																	<option value="Đã giao" selected>Đã giao</option>
																	<?php
																	}
																	?>
																</select>
																<input type="hidden" name="DH" id="DH" value="<?= $row["OrderID"] ?>">
																<button class="btn btn-primary" type="submit"><i class="fa fa-check-circle	"></i></button>
															</form>
														</td>
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
								</div>
							</div>
						</div>
						<?php
						}
						else
						{
						?>
						<div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
							<div class="panel panel-default">
								<div class="borderdiv">
									<h3 class="panel-title">Quản lý sản phẩm</h3>
								</div>
								<div class="list-group">
									<div class="row">
										<div class="list-group col-1">
										</div>
										<div class="list-group col-10">
											<table class="table table-hover">
												<thead>
													<tr>
														<th>#</th>
														<th>Tên sản phẩm</th>
														<th>Giá</th>
														<th>Nhóm</th>
														<th>Nhà sản xuất</th>
														<th>Lượng tồn</th>
														<th></th>
													</tr>
												</thead>
												<tbody>
													<?php
													$page = $_GET["quyen"];
													$current_page = $page;
<<<<<<< HEAD
													$limit = 10;
													$off = ($page - 1)*$limit;
													$sql = "select * from products";
													$nr = findnumrow($sql);
														$trang = ceil($nr/$limit);
=======
													var_dump($page);
													$limit = 2;
													$off = ($page - 1)*$limit;
													var_dump($off);
>>>>>>> c262764f6966d6612d4c95fbbaef832752863c3e
													$sql = "select * from products ORDER BY ProID DESC LIMIT $limit OFFSET $off";
													$rs = load($sql);
													$dem=1;
													while ($row = $rs->fetch_assoc()) :
													?>
													<tr>
														<td><?= $dem ?></td>
														<td><?= $row["ProName"] ?></td>
														<td><?= number_format($row["Price"]) ?>đ</td>
														<?php
														$CatID = $row["CatID"];
														$sqlmoi = "select * from categories where CatID = $CatID";
														$rsmoi = load($sqlmoi);
														$rowmoi = $rsmoi -> fetch_assoc();
														?>
														<td><?= $rowmoi["CatName"] ?></td>
														<?php
														$IDNSX = $row["IDNSX"];
														$sqlnew = "select * from nsx where IDNSX = $IDNSX";
														$rsnew = load($sqlnew);
														$rownew = $rsnew -> fetch_assoc();
														?>
														<td><?= $rownew["NameNSX"] ?></td>
														<td><?= $row["Quantity"] ?></td>
<<<<<<< HEAD
														<td>
															<form action="updateadmin.php" method="post">
																<input class="form-control" name="ProID" id="ProID" type="hidden" value="<?= $row["ProID"] ?>">
																<button class="btn btn-primary" name="update" id="update"><li class="fa fa-pencil"></li></button>
															</form>
															<form action="xulyadmin.php" method="post">
																<input class="form-control" name="ProID" id="ProID" type="hidden" value="<?= $row["ProID"] ?>">
																<button class="btn btn-danger" name="remove" id="remove"><li class="fa fa-trash"></li></button>
															</form>
														</td>
=======
>>>>>>> c262764f6966d6612d4c95fbbaef832752863c3e
													</tr>
													<?php
													$dem++;
													endwhile;
													?>
												</tbody>
											</table>
											<nav aria-label="Page navigation example">
												<ul class="pagination">
<<<<<<< HEAD
													<?php
													if($current_page > 1){
													?>
													<li class="page-item"><a class="page-link" href="?quyen=<?= $current_page -1 ?>">Previous</a></li>
													<?php
													}
													if($current_page==1)
													{
													?>
													<li class="page-item active"><a class="page-link" href="?quyen=1">1</a></li>
													<?php
													}
													else
													{
													?>
													<li class="page-item"><a class="page-link" href="?quyen=1">1</a></li>
													<?php
													}
													
													if($trang<=6)
													{
														for ($i=2; $i < $trang; $i++) {
															if($i==$current_page)
															{
													?>
													<li class="page-item active"><a class="page-link" href="?quyen=<?= $i ?>"><?= $i ?></a></li>
													<?php
														}
														else{
													?>
													<li class="page-item"><a class="page-link" href="?quyen=<?= $i ?>"><?= $i ?></a></li>
													<?php
													}
													}
													}
													else
													{
													if($current_page < 4)
													{
														$current_page=4;
													}
													if($current_page > $page - 3)
													{
														$current_page = $page - 3;
													}
													for ($i=$current_page-2; $i <= $current_page + 2; $i++) {
													?>
													<li class="page-item"><a class="page-link" href="?quyen=<?= $i ?>"><?= $i ?></a></li>
													<?php
														}
													}
													if($current_page==$trang){
													?>
													<li class="page-item active"><a class="page-link" href="?quyen=<?= $trang?>"><?= $trang ?></a></li>
													<?php
													}
													else{
													?>
													<li class="page-item"><a class="page-link" href="?quyen=<?= $trang?>"><?= $trang ?></a></li>
													<?php
													}
													if($current_page<$trang){
													?>
													<li class="page-item"><a class="page-link" href="?quyen=<?= $current_page +1 ?>">Next</a></li>
													<?php
													}
													?>
=======
													<li class="page-item"><a class="page-link" href="?quyen=<?= $current_page -1 ?>">Previous</a></li>
													<li class="page-item"><a class="page-link" href="?quyen=1">1</a></li>
													<?php
													$sql = "select * from products";
													$nr = findnumrow($sql);
													$page = ceil($nr/$limit);
													if($page<=6)
													{
														for ($i=2; $i < $page; $i++) {
														?>
														<li class="page-item"><a class="page-link" href="?quyen=<?= $i ?>"><?= $i ?></a></li>
														<?php
														}
													}
													else
													{
														if($current_page < 4)
														{
															$current_page=4;
														}
														if($current_page > $page - 3)
														{
															$current_page = $page - 3;
														}
														for ($i=$current_page-2; $i <= $current_page + 2; $i++) {

													?>
														<li class="page-item"><a class="page-link" href="?quyen=<?= $i ?>"><?= $i ?></a></li>
													<?php 
														}
													}
													?>
													<li class="page-item"><a class="page-link" href="?quyen=<?= $page ?>"><?= $page ?></a></li>
													<li class="page-item"><a class="page-link" href="?quyen=<?= $current_page +1 ?>">Next</a></li>
>>>>>>> c262764f6966d6612d4c95fbbaef832752863c3e
												</ul>
											</nav>
										</div>
									</div>
									
								</div>
							</div>
						</div>
						<?php
							}
						}
						if(isset($_GET["dh"]))
						{
						?>
						<div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
							<div class="panel panel-default">
								<div class="borderdiv">
									<h3 class="panel-title">Quản lý đơn hàng</h3>
								</div>
								<div class="list-group">
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
<<<<<<< HEAD
											<div class="col-sm-6">
												<a class="btn btn-primary" href="admin.php?quyen=0" role="button"> Quay lại</a>
											</div>
										</div>
										
=======
										</div>
>>>>>>> c262764f6966d6612d4c95fbbaef832752863c3e
									</div>
								</div>
							</div>
						</div>
						<?php
							}
						}
						else
						{
						?>
						<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
						</div>
						<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4 martop">
							<form class="form-horizontal" name="fdangnhap" action="" method="post">
								<fieldset>
									<!-- Sign In Form -->
									<!-- Text input-->
									<div class="control-group">
										<label class="control-label" for="userid">Tên tài khoản:</label>
										<div class="controls">
											<input required="" id="userid" name="userid" type="text" class="form-control" placeholder="Tên đăng nhập" class="input-medium" required="">
										</div>
									</div>
									<!-- Password input-->
									<div class="control-group">
										<label class="control-label" for="passwordinput">Mật khẩu:</label>
										<div class="controls">
											<input required="" id="passwordinput" name="passwordinput" class="form-control" type="password" placeholder="********" class="input-medium">
										</div>
									</div>
									<!-- Multiple Checkboxes (inline) -->
									<div class="control-group">
										<label class="control-label" for="rememberme"></label>
										<div class="controls">
											<label class="checkbox inline" for="rememberme-0">
												<input type="checkbox" name="rememberme" id="rememberme" value="Remember me">
												Ghi nhớ tài khoản
											</label>
										</div>
									</div>
									<!-- Button -->
									<div class="control-group">
										<label class="control-label" for="signin"></label>
										<div class="controls">
											<button id="signin" name="signin" class="btn btn-success">Đăng nhập</button>
										</div>
									</div>
								</fieldset>
							</form>
						</div>
						<?php
						}
						?>
					</div>
				</div>
				<script src="assets/jquery3.2.1.slim.min.js"></script>
				<script src="assets/popper.min.js"></script>
				<script src="assets/bootstrap4.min.js"></script>
			</body>
		</html>