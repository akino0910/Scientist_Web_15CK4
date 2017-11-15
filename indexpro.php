<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<title>ABC</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
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
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							Sản phẩm
						</a>
				

					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="indexpro.php?id=MAKTS">Máy ảnh kỹ thuật số</a>
						<a class="dropdown-item" href="indexpro.php?id=DSLR">Máy ảnh DSLR</a>
						<a class="dropdown-item" href="indexpro.php?id=MQP">Máy quay phim</a>
						<a class="dropdown-item" href="indexpro.php?id=MALL">Máy ảnh chụp lấy liền</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="indexpro.php?id=PKMA">Phụ kiện máy ảnh</a>
					</div>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">Hỗ trợ</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#" data-toggle="modal" data-target="#myCont">Liên hệ</a>
				</li>

			</ul>
			<form class="form-inline my-2 my-lg-0">
				<input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
			</form>
			<ul class="navbar-nav mr-0">
				<li class="nav-item">
					<a class="nav-link" href="#">Giỏ hàng</a>
				</li>
			</ul>
			<ul class="navbar-nav mr-0">
				<li class="nav-item">
					<a class="nav-link" href="#" data-toggle="modal" data-target=".bs-modal-sm">Đăng nhập</a>
				</li>
			</ul>
		</div>
	</nav>
	<div>
		<img src="img/nikon1.jpg" width="100%">
	</div>
	<div class="container-fluid">
		<div class="row">

			<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
				<div class="panel panel-default">
					<div class="borderdiv">
						<h3 class="panel-title">Danh mục</h3>
					</div>
					<div class="list-group">
						<a class="list-group-item" href="indexpro.php?id=MAKTS">Máy ảnh kỹ thuật số</a>
						<a class="list-group-item" href="indexpro.php?id=DSLR">Máy ảnh DSLR</a>
						<a class="list-group-item" href="indexpro.php?id=MQP">Máy quay phim</a>
						<a class="list-group-item" href="indexpro.php?id=MALL">Máy ảnh chụp lấy liền</a>
						<a class="list-group-item" href="indexpro.php?id=PKMA">Phụ kiện máy ảnh</a>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="borderdiv">
						<h3 class="panel-title">Nhà sản xuất</h3>
					</div>
					<a href="#" class="list-group-item">Nikon</a>
					<a href="#" class="list-group-item">Canon</a>
					<a href="#" class="list-group-item">Sony</a>
					<a href="#" class="list-group-item">Khác</a>
				</div>
			</div>
			<div class="col-xs-9 col-sm-9 col-md-9 col-lg-9">
				<div class="panel panel-default">
					<div class="borderdiv">
						<h3 class="panel-title">Sản phẩm</h3>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-sm-3">
								<div class="card">
									<div class="card-body">
										<h4 class="card-title">Special title treatment</h4>
										<p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
										<a href="#" class="btn btn-success">Mua</a>
										<a href="#" class="btn btn-secondary">Xem chi tiết</a>

									

									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="modal fade bs-modal-sm" id="myModal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-md">
						<div class="modal-content">
							<br>
							<div class="bs-example bs-example-tabs">
								<ul id="myTab" class="nav nav-tabs">
									<li class="active"><a href="#signin" data-toggle="tab">Đăng nhập</a>
									</li>
									<div> | </div>
									<li class=""><a href="#signup" data-toggle="tab">Đăng ký</a>
									</li>
								</ul>
							</div>
							<div class="modal-body">
								<div id="myTabContent" class="tab-content">
									<div class="tab-pane fade active in" id="signin">
										<form class="form-group">
											<!--       <h2 class="form-signin-heading">Đăng Nhập</h2> -->
											<div class="form-group">
												<label for="inputEmail" class="sr-only">Địa chỉ Email</label>
												<input type="email" id="inputEmail" class="form-control" placeholder="Địa chỉ Email" required autofocus>
											</div>
											<div class="form-group">
												<label for="inputPassword" class="sr-only">Mật khẩu</label>
												<input type="password" id="inputPassword" class="form-control" placeholder="Mật khẩu" required>
											</div>
											<div class="form-check">
												<label class="form-check-label">
													<input type="checkbox" class="form-check-input">Ghi nhớ đăng nhập
												</label>
											</div>
											<button class="btb btn-lg btn-primary btn-block" type="submit">Đăng nhập</button>
										</form>
									</div>
									<div class="tab-pane fade" id="signup">
										<form class="form-horizontal">
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
													<div class="g-recaptcha" data-sitekey="6Ld9zjgUAAAAAHpQ35RNeLBFfzZHsr2GmHA9xrnS"></div>
												</div>

												<!-- Button -->
												<div class="control-group">
													<label class="control-label" for="confirmsignup"></label>
													<div class="controls">
														<button id="confirmsignup" name="confirmsignup" class="btn btn-success">Đăng ký</button>
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
							<p><a href="https://mail.google.com">Email: tuansang9710@gmail.com</a>
							</p>
							<p><a href="https://www.facebook.com/tuan.sang97">FB: www.facebook.com/tuan.sang97<a></p>
										<p>SĐT: 01216955090</p>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
									</div>
								</div>
							</div>
						</div>
						<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
						<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
						<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
				<script src='https://www.google.com/recaptcha/api.js?hl=vi'></script>
					</body>
				</html>