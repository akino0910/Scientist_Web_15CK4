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
		<script src='https://www.google.com/recaptcha/api.js'></script>
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
							<ul id="myTab" class="nav nav-tabs" role="tablist">
								<li class="nav-item">
									<a class="nav-link active" href="#signin" data-toggle="tab" role="tab">Đăng nhập</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" href="#signup" data-toggle="tab" role="tab">Đăng ký</a>
								</li>
							</ul>
						</div>
						<div class="modal-body">
							<div id="myTabContent" class="tab-content active">
								<div class="tab-pane fade active show" id="signin">
<<<<<<< HEAD
									<form class="form-horizontal" method="post" action="xuly.php" id="loginForm">
=======
									<form class="form-horizontal" method="post" action="xuly.php">
>>>>>>> c262764f6966d6612d4c95fbbaef832752863c3e
										<input required="" id="userid" name="userid" type="text" class="form-control" placeholder="Tên đăng nhập" class="input-medium" required="">
										<br>
										<input required="" id="passwordinput" name="passwordinput" class="form-control" type="password" placeholder="********" class="input-medium">
										<br>
										<div class="form-check">
											<label class="form-check-label">
												<input type="checkbox" name="rememberme" id="rememberme" value="Remember me"> Ghi nhớ tài khoản
											</label>
										</div>
										<button id="signin" name="signin" class="btn btn-success">Đăng nhập</button>
									</form>
								</div>
								<div class="tab-pane fade" id="signup">
<<<<<<< HEAD
									<form class="form-horizontal" method="post" action="xuly.php" id="regForm>
										<input id="Email" name="Email" class="form-control" type="text" placeholder="Email của bạn" class="input-large" required="">
										<div class="alert alert-danger" role="alert" style="display: none" id="errEmail">
											<strong>Trời!</strong> Nhập Email vô kìa ấy ới ơi.
										</div>
										<br>
										<input id="userid" name="userid" class="form-control" type="text" placeholder="Tên tài khoản" class="input-large" required="">
										<div class="alert alert-danger" role="alert" style="display: none" id="errUsername">
											<strong>@@!</strong> Không có username thì đăng nhập làm sao đây???.
										</div>
										<br>
										<input id="password" name="password" class="form-control" type="password" placeholder="********" class="input-large" required="">
										<div class="alert alert-danger" role="alert" style="display: none" id="errPass">
											<strong>Bó tay!</strong> Không có mật khẩu thì bảo mật bằng niềm tin à.
										</div>
										<br>
										<input id="reenterpassword" class="form-control" name="reenterpassword" type="password" placeholder="********" class="input-large" required="">
										<div class="alert alert-danger" role="alert" style="display: none" id="errRePass">
											<strong>Thiệt tình!</strong> Gõ lại mật khẩu mà cũng sai nữa là sao.
										</div>
										<br>
										<div class="g-recaptcha" data-sitekey="6Ld9zjgUAAAAAHpQ35RNeLBFfzZHsr2GmHA9xrnS"></div>
										<br>
										<div class="alert alert-danger" role="alert" id="errCaptcha" style="display: none">
											<strong>Úi giời ơi!</strong> Chú ý capcha kìa bạn ơi.
										</div>
=======
									<form class="form-horizontal" method="post" action="xuly.php">
										<input id="Email" name="Email" class="form-control" type="text" placeholder="Email của bạn" class="input-large" required="">
										<div id="nd"></div>
										<br>
										<input id="userid" name="userid" class="form-control" type="text" placeholder="Tên tài khoản" class="input-large" required="">
										<br>
										<input id="password" name="password" class="form-control" type="password" placeholder="********" class="input-large" required="">
										<br>
										<input id="reenterpassword" class="form-control" name="reenterpassword" type="password" placeholder="********" class="input-large" required="">
										<br>
										<div class="g-recaptcha" data-sitekey="6Ld9zjgUAAAAAHpQ35RNeLBFfzZHsr2GmHA9xrnS"></div>
										<br>
>>>>>>> c262764f6966d6612d4c95fbbaef832752863c3e
											<button id="signup" name="signup" class="btn btn-success">Đăng ký</button>
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