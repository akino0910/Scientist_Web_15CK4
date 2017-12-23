<?php
require_once "./lib/db.php";
require_once 'cart.inc';
if (!isset($_SESSION["ttdn"]))
{
	$_SESSION["ttdn"] = 0;
}
if ($_SESSION["ttdn"] == 0) {
		if(isset($_COOKIE["auth_user_id"])) {
			// tái tạo session
			$user_id = $_COOKIE["auth_user_id"];
			$sql = "select * from users where f_ID = $user_id";
			$rs = load($sql);
			$_SESSION["current_user"] = $rs->fetch_object();
			$_SESSION["ttdn"] = 1;
		}
	}
?>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<title>ProCam</title>
		<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" > -->
		<link rel="stylesheet" type="text/css" href="assets/bootstrap-touchspin/jquery.bootstrap-touchspin.min.css">
		<link rel="stylesheet" href="assets/bootstrap4.min.css" >
		<link rel="stylesheet" type="text/css" href="assets/style.css">
		<link rel="stylesheet" type="text/css" href="assets/font-awesome-4.7.0/css/font-awesome.min.css">
	</head>
	<body>
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<a class="navbar-brand" href="index.php"><i class="fa fa-camera"></i> ProCam</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							Sản phẩm
						</a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<?php
								$sql = "select * from categories";
								$rs = load($sql);
								while($row = $rs->fetch_assoc()) :
							?>
							<a class="dropdown-item" href="indexpro.php?SP=<?= $row["CatID"]?>"><?= $row["CatName"] ?></a>
							<?php
								endwhile;
							?>
						</div>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="#">Hỗ trợ</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="#" data-toggle="modal" data-target="#myCont">Liên hệ</a>
					</li>
					
				</ul>
				<ul class="navbar-nav mr-0">
					<li class="nav-item">
						<a class="nav-link" href="viewcart.php"><i class="fa fa-cart-arrow-down"></i> Giỏ hàng (<?= get_total_items() ?>) </a>
					</li>
				</ul>
				<?php
					if ($_SESSION["ttdn"] == 0)
					{
				?>
				<ul class="navbar-nav mr-0">
					<li class="nav-item">
						<a class="nav-link" href="#" data-toggle="modal" data-target=".bs-modal-sm"><i class="fa fa-user-circle-o"></i> Đăng nhập</a>
					</li>
				</ul>
				<?php
					}
					if($_SESSION["ttdn"] == 1)
					{
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
				<?php
					}
				?>
			</div>
		</nav>
		<?php include_once $loadpicture; ?>
		<div class="container-fluid">
			<div class="row">
				
				<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
					<div class="panel panel-default">
						<div class="borderdiv">
							<h3 class="panel-title">Danh mục</h3>
						</div>
						<div class="list-group">
							<?php
								$sql = "select * from categories";
								$rs = load($sql);
								while($row = $rs->fetch_assoc()) :
							?>
							<a class="list-group-item" href="indexpro.php?SP=<?= $row["CatID"]?>"><?= $row["CatName"] ?></a>
							<?php
								endwhile;
							?>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="borderdiv">
							<h3 class="panel-title">Nhà sản xuất</h3>
						</div>
						<?php
								$sql = "select * from NSX";
								$rs = load($sql);
								while($row = $rs->fetch_assoc()) :
						?>
						<a class="list-group-item" href="indexpro.php?NSX=<?= $row["IDNSX"]?>"><?= $row["NameNSX"] ?></a>
						<?php
							endwhile;
						?>
					</div>
					<div class="panel panel-default">
						<div class="borderdiv">
							<h3 class="panel-title">Lọc tìm sản phẩm</h3>
						</div>
						<form name="formsearch" action="search.php" method="post">
							<div class="dam marbotle">Tìm theo tên: </div>
							<div>
								<input class="form-control" type="text" id="Ten" name="Ten" placeholder="Nhập tên sản phẩm cần tìm">
							</div>
							<div class="dam marbotle">Tìm theo giá: </div>
							<div>
								<!-- <input class="form-control" type="number" id="nhonhat" name="nhonhat" value="0">
								<input class="form-control" type="number" id="lonnhat" name="lonnhat" value="1000000000"> -->
								<input type="text" class="form-control" value="1" name="nhonhat" id="nhonhat">
								<input type="text" class="form-control" value="1000000000" name="lonnhat" id="lonnhat">
							</div>
							<div class="dam marbotle">Tìm theo loại: </div>
							<div class="row">
								<div class="col-lg-12">
									<?php
									$sql = "select * from categories";
									$rs = load($sql);
									while($row = $rs->fetch_assoc()) :
									?>
									<div class="input-group">
										<span class="input-group-addon">
											<input type="checkbox" id="SP<?= $row["CatID"] ?>" name="SP<?= $row["CatID"] ?>">
										</span>
										<input class="form-control" type="text" value="<?= $row["CatName"]?>">
										
									</div>
									<?php
										endwhile;
									?>
								</div>
							</div>
							<div class="dam marbotle">Tìm theo NSX: </div>
							<div class="row">
								<div class="col-lg-12">
									<?php
									$sql = "select * from nsx";
									$rs = load($sql);
									while($row = $rs->fetch_assoc()) :
									?>
									<div class="input-group">
										<span class="input-group-addon">
											<input type="checkbox" id="NSX<?= $row["IDNSX"] ?>" name="NSX<?= $row["IDNSX"] ?>">
										</span>
										<input class="form-control" type="text" value="<?= $row["NameNSX"]?>">
										
									</div>
									<?php
										endwhile;
									?>
								</div>
							</div>
							<div class="martop col-sm-6">
								<button class="btn btn-success my-2 my-sm-0" type="submit">Lọc</button>
							</div>
						</form>
					</div>
				</div>
				<div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
					<?php include_once $page_body_file; ?>
				</div>
			</div>
			<div class="modal fade bs-modal-sm" id="myModal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-md">
					<div class="modal-content">
						<br>
						<div class="bs-example bs-example-tabs">
							<ul id="myTab" class="nav nav-tabs">
								<li class="active"><a href="#signin" data-toggle="tab">Đăng nhập</a></li>
								<div> | </div>
								<li><a href="#signup" data-toggle="tab">Đăng ký</a></li>
							</ul>
						</div>
						<div class="modal-body">
							<div id="myTabContent" class="tab-content">
								<div class="tab-pane fade active in" id="signin">
									<form class="form-horizontal" name="fdangnhap" action="xuly.php" method="post">
										<fieldset>
											<!-- Sign In Form -->
											<!-- Text input-->
											<div class="control-group">
												<label class="control-label" for="userid">Tên tài khoản:</label>
												<div class="controls">
													<input required="" id="userid" name="userid" type="text" class="form-control" placeholder="sangdeptrai" class="input-medium" required="">
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
								<div class="tab-pane fade" id="signup">
									<form class="form-horizontal" name="fdangky" action="xuly.php" method="post">
										<fieldset>
											<!-- Sign Up Form -->
											<!-- Text input-->
											<div class="control-group">
												<label class="control-label" for="Email">Email:</label>
												<div class="controls">
													<input id="Email" name="Email" class="form-control" type="text" placeholder="tuansang9710@gmail.com" class="input-large" required="">
												</div>
											</div>
											
											<!-- Text input-->
											<div class="control-group">
												<label class="control-label" for="userid">Tên tài khoản:</label>
												<div class="controls">
													<input id="userid" name="userid" class="form-control" type="text" placeholder="sangdeptrai" class="input-large" required="">
												</div>
											</div>
											
											<!-- Password input-->
											<div class="control-group">
												<label class="control-label" for="password">Mật khẩu:</label>
												<div class="controls">
													<input id="password" name="password" class="form-control" type="password" placeholder="********" class="input-large" required="">
												</div>
											</div>
											
											<!-- Text input-->
											<div class="control-group">
												<label class="control-label" for="reenterpassword">Nhập lại mật khẩu:</label>
												<div class="controls">
													<input id="reenterpassword" class="form-control" name="reenterpassword" type="password" placeholder="********" class="input-large" required="">
												</div>
											</div>
											
											<!-- Multiple Radios (inline) -->
											<br>
											<div class="control-group">
												<label class="control-label" for="humancheck">Humanity Check:</label>
												<div class="controls">
													<label class="radio inline" for="humancheck-0">
														<input type="radio" name="humancheck" id="humancheck-0" value="robot" checked="checked">I'm a Robot
													</label>
													<label class="radio inline" for="humancheck-1">
														<input type="radio" name="humancheck" id="humancheck-1" value="human">I'm Human
													</label>
												</div>
											</div>
											
											<!-- Button -->
											<div class="control-group">
												<label class="control-label" for="confirmsignup"></label>
												<div class="controls">
													<button id="signup" name="signup" class="btn btn-success">Đăng ký</button>
												</div>
											</div>
										</fieldset>
									</form>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<center>
							<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
							</center>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="myCont" class="modal fade" role="dialog" class="modal-dialog modal-lg">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">Liên hệ</h4>
					</div>
					<div class="modal-body">
						<p><a href="https://mail.google.com"><i class="fa fa-address-card-o"></i> : tuansang9710@gmail.com</a></p>
						<p><a href="https://www.facebook.com/tuan.sang97"><i class="fa fa-facebook-official"></i> : www.facebook.com/tuan.sang97<a></p>
						<p><i class="fa fa-phone"></i> : 01216955090</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
		<!-- <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script> -->
		<script src="assets/jquery3.2.1.slim.min.js"></script>
		<script src="assets/popper.min.js"></script>
		<script src="assets/bootstrap4.min.js"></script>
		<script src="assets/bootstrap-touchspin/jquery.bootstrap-touchspin.min.js"></script>
		<script type="text/javascript">
		$(function () {
			$('#txtQuantity').TouchSpin({
				min: 1,
				max: <?= $row["Quantity"] ?>
			});
		});
		$(function () {
			$('#nhonhat').TouchSpin({
				min: 0,
                max: 1000000000,
                step: 100000
			});
		});
		$(function () {
			$('#lonnhat').TouchSpin({
				min: 1000,
                max: 1000000000,
                step: 100000
			});
		});
		</script>
		<script type="text/javascript">
			$('.cart-remove').on('click', function() {
				var id = $(this).data('id');
				$('#txtDProId').val(id);
			$('#txtCmd').val('D');
			$('#f').submit();
			});
			$('.cart-update').on('click', function() {
				var q = $(this).closest('tr').find('.quantity-textfield').val();
				$('#txtUQ').val(q);
				var id = $(this).data('id');
				$('#txtDProId').val(id);
			$('#txtCmd').val('U');
			$('#f').submit();
			});
		</script>
	</body>
</html>