<?php
require_once "./lib/db.php";
require_once 'cart.inc';
if ( !isset( $_SESSION[ "ttdn" ] ) ) {
	$_SESSION[ "ttdn" ] = 0;
}
if ( $_SESSION[ "ttdn" ] == 0 ) {
	if ( isset( $_COOKIE["auth_user_id"] ) ) {
		// tái tạo session
		$user_id = $_COOKIE["auth_user_id"];
		$sql = "select * from users where f_ID = $user_id";
		$rs = load( $sql );
		$_SESSION["current_user"] = $rs->fetch_object();
		$_SESSION["ttdn"] = 1;
	}
}
if(isset($_COOKIE["errsignin"]))
{
	echo "<script> alert('Sai tên đăng nhập hoặc mật khẩu!'); </script>";
	setcookie("errsignin", 1, time() - 3600);
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<title>ProCam</title>
	<link rel="stylesheet" type="text/css" href="assets/bootstrap-touchspin/jquery.bootstrap-touchspin.min.css">
	<link rel="stylesheet" href="assets/bootstrap4.min.css">
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
						$rs = load( $sql );
						while ( $row = $rs->fetch_assoc() ):
							?>
						<a class="dropdown-item" href="indexpro.php?SP=<?= $row["CatID"]?>">
							<?= $row["CatName"] ?>
						</a>
						<?php
						endwhile;
						?>
					</div>
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
			if ( $_SESSION[ "ttdn" ] == 0 ) {
				?>
			<ul class="navbar-nav mr-0">
				<li class="nav-item">
					<a class="nav-link" href="#" data-toggle="modal" data-target=".bs-modal-sm"><i class="fa fa-user-circle-o"></i> Đăng nhập</a>
				</li>
			</ul>
			<?php
			}
			if ( $_SESSION[ "ttdn" ] == 1 ) {
				$nguoidung = $_SESSION[ "current_user" ];
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
					<div class="list-group" id="nav-DanhMuc"></div>
				</div>
				<div class="panel panel-default">
					<div class="borderdiv">
						<h3 class="panel-title">Nhà sản xuất</h3>
					</div>
					<div class="list-group" id="nav-NSX"></div>
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
								$rs = load( $sql );
								while ( $row = $rs->fetch_assoc() ):
									?>
								<div class="input-group">
									<div class="input-group-prepend">
										<div class="input-group-text">
											<input type="checkbox" id="SP<?= $row["CatID"] ?>" name="SP<?= $row["CatID"] ?>">
										</div>
									</div>
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
								$rs = load( $sql );
								while ( $row = $rs->fetch_assoc() ):
									?>
								<div class="input-group">
									<div class="input-group-prepend">
										<div class="input-group-text">
											<input type="checkbox" id="NSX<?= $row["IDNSX"] ?>" name="NSX<?= $row["IDNSX"] ?>">
										</div>
									</div>
									<input class="form-control" type="text" value="<?= $row["NameNSX"]?>">
								</div>
								<?php
								endwhile;
								?>
							</div>
						</div>
						<div class="martop col-sm-6">
							<button class="btn btn-success my-2 my-sm-0" type="submit"><i class="fa fa-search"></i> Lọc</button>
						</div>
					</form>
				</div>
			</div>
			<div class="col-xs-10 col-sm-10 col-md-10 col-lg-10" id="cardDanhMuc">
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
								<form class="form-horizontal" method="post" action="xuly.php" id="loginForm">
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
								<form class="form-horizontal" method="post" id="regForm">
									<input type="text" id="regName" class="form-control" placeholder="Họ và tên">
									<div class="alert alert-danger" role="alert" style="display: none" id="errName">
										<strong>(◕‿◕)</strong> Nhập họ và tên vào hộ mình nhé.
									</div>
									<br>
									<input type="text" id="regUsername" class="form-control" placeholder="Tên tài khoản">
									<div class="alert alert-danger" role="alert" style="display: none" id="errUsername"></div>
									<br>
									<input type="email" id="regEmail" class="form-control" placeholder="Email">
									<div class="alert alert-danger" role="alert" style="display: none" id="errEmail"></div>
									<br>
									<input type="password" id="regPass" class="form-control" placeholder="Mật khẩu">
									<div class="alert alert-danger" role="alert" style="display: none" id="errPass"></div>
									<br>
									<input type="password" id="regRePass" class="form-control" placeholder="Nhập lại mật khẩu">
									<div class="alert alert-danger" role="alert" style="display: none" id="errRePass"></div>
									<br>
									<div class="g-recaptcha" data-sitekey="6Ld9zjgUAAAAAHpQ35RNeLBFfzZHsr2GmHA9xrnS"></div>
									<div class="alert alert-danger" role="alert" id="errCaptcha" style="display: none">
										<strong>(￣_￣)・・・</strong> Chú ý capcha kìa bạn ơi.
									</div>
									<br>
									<button id="btnReg" type="button" class="btn btn-success">Đăng ký</button>
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
					<p><a href="https://mail.google.com"><i class="fa fa-address-card-o"></i> : tuansang9710@gmail.com</a>
					</p>
					<p><a href="https://www.facebook.com/tuan.sang97"><i class="fa fa-facebook-official"></i> : www.facebook.com/tuan.sang97<a></p>
						<p><i class="fa fa-phone"></i> : 01216955090</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
		<script src="assets/jquery-3.2.1.min.js"></script>
		<script src="assets/popper.min.js"></script>
		<script src="assets/bootstrap4.min.js"></script>
		<script src="assets/bootstrap-touchspin/jquery.bootstrap-touchspin.min.js"></script>
		<script type="text/javascript">
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
		<script src="views/user/userXL.js"></script>
		<script src="views/phanTrang/phanTrang.js"></script>
		<script>
			var limit = 10;
			var page = 1, current_page = 1;
			var idDM = 1;
			$(document).ready(function(){
				load_DanhMuc();
				load_NSX();
				
				function load_DanhMuc(){
					$.ajax({
						url: "views/phanTrang/danhMuc.php",
						success: function(data){
							$("#nav-DanhMuc").html(data);
						}
					})
				}
				
				function load_NSX(){
					$.ajax({
						url: "views/phanTrang/NSX.php",
						success: function(data){
							$("#nav-NSX").html(data);
						}
					})
				}
				function load_Card(idDanhMuc, page, limit){
					$.ajax({
						url: "views/phanTrang/card.php",
						type: "GET",
						data: {idDanhMuc: idDanhMuc, page: page, limit: limit},
						success: function(data){
							$("#cardDanhMuc").html(data);
						}
					})
				}
				
				function load_FullItem(idPro){
					$.ajax({
						url: "views/phanTrang/fullItem.php",
						type: "GET",
						data: {ProID: idPro},
						success: function(data){
							$("#cardDanhMuc").html(data);
						}
					})
				}
				
				function QuantityTP(idPro, Quantity){
					var quan = $('#txtQuantity').attr("quan");
					$('#txtQuantity').TouchSpin({
						min: 1,
						max: quan
					 });
				}
				
				$(document).on('click', '.btnnavDanhMuc', function () {
					var idDanhMuc = $(this).attr("id");
					idDM = idDanhMuc;
					load_Card(idDanhMuc, 1, limit);
					pagination(idDanhMuc, 1, limit);
				});
				
				$(document).on('click', '.btnFullItem', function () {
					var idPro = $(this).attr("id");
					load_FullItem(idPro);
					QuantityTP();
				});
				

				function pagination(idDanhMuc ,page, limit){
					$.ajax({
						url: "views/phanTrang/phanTrang.php",
						type: "GET",
						data: {idDanhMuc: idDanhMuc, page: page, limit: limit},
						success: function(data){
							$("#paginationNumber").html(data);
						}
					})
				}
				
				
				
				$(document).on('click', '.page-link', function () {
				page = $(this).attr("id");

				if (page == 'nextPage') {
					load_Card(idDM, parseInt(current_page + 1), limit);
					pagination(idDM, parseInt(current_page + 1), limit);
					current_page++;
				} else if (page == 'prevPage') {
					load_Card(idDM, parseInt(current_page - 1), limit);
					pagination(idDM, parseInt(current_page - 1), limit);
					current_page--;
				} else {
					load_Card(idDM, parseInt(page), limit);
					pagination(idDM, parseInt(page), limit);
					current_page = page;
				}
			});
			})
		</script>
	</body>
</html>