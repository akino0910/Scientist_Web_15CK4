<?php

require_once( "db.php" );

$db = new DBController();

isset($_GET['limit']) ? $limit = $_GET['limit'] : $limit = 10;

?>


<div class="panel panel-default">
	<div class="borderdiv">
		<h3 class="panel-title">Sản phẩm mới</h3>
	</div>
	<div class="panel-body">
		<div class="row">
			<?php
				$sql = "SELECT * FROM products ORDER BY ProID DESC LIMIT $limit";
				$row = $db->runQuery($sql);
				foreach($row as $key=>$value):
			?>
			<div class="col-sm-6 col-md-6 col-lg-4">
				<div class="card cao">
					<div class="card-body row">
						<div class="col-sm-6">
							<img src="img/product/<?= $row[$key]["ProID"]?>/1.png" style="width: 80%;">
						</div>
						<div class="col-sm-6">
							<h4 class="card-title"><?= $row[$key]["ProName"] ?></h4>
							<p class="red"><?= number_format($row[$key]["Price"]) ?>đ</p>
						</div>
					</div>
					<div class="marbotle">
						<form name="faddpro" action="../index/addItemToCart.inc.php" method="post">
							<input type="hidden" name="txtProID" value="<?= $row[$key]["ProID"] ?>">
							<input type="hidden" name="txtQuantity" value="1">
							<!-- <a href="addItemToCart.inc.php?" class="btn btn-success">Mua</a> -->
							<button class="btn btn-success" type="submit" name="btnAddItemToCart">Mua</button>
							<a href="../index/viewpros.php?Pro=<?= $row[$key]['ProID'] ?>" class="btn btn-secondary">Xem chi tiết</a>
						</form>
					</div>
				</div>
			</div>
			<?php
			endforeach;
			?>
		</div>
	</div>
</div>
<div class="panel panel-default">
	<div class="borderdiv">
		<h3 class="panel-title">Sản phẩm bán chạy</h3>
	</div>
	<div class="panel-body">
		<div class="row">
			<?php
				$sql = "SELECT * FROM products ORDER BY SLB DESC LIMIT $limit";
				$row = $db->runQuery($sql);
				foreach($row as $key=>$value):
			?>
			<div class="col-sm-6 col-md-6 col-lg-4">
				<div class="card cao">
					<div class="card-body row">
						<div class="col-sm-6">
							<img src="img/product/<?= $row[$key]["ProID"]?>/1.png" style="width: 80%;">
						</div>
						<div class="col-sm-6">
							<h4 class="card-title"><?= $row[$key]["ProName"] ?></h4>
							<p class="red"><?= number_format($row[$key]["Price"]) ?>đ</p>
						</div>
					</div>
					<div class="marbotle">
						<form name="faddpro" action="../index/addItemToCart.inc.php" method="post">
							<input type="hidden" name="txtProID" value="<?= $row[$key]["ProID"] ?>">
							<input type="hidden" name="txtQuantity" value="1">
							<!-- <a href="addItemToCart.inc.php?" class="btn btn-success">Mua</a> -->
							<button class="btn btn-success" type="submit" name="btnAddItemToCart">Mua</button>
							<a href="../index/viewpros.php?Pro=<?= $row[$key]['ProID'] ?>" class="btn btn-secondary">Xem chi tiết</a>
						</form>
					</div>
				</div>
			</div>
			<?php
			endforeach;
			?>
		</div>
	</div>
</div>
<div class="panel panel-default">
	<div class="borderdiv">
		<h3 class="panel-title">Sản phẩm xem nhiều nhất</h3>
	</div>
	<div class="panel-body">
		<div class="row">
			<?php
				$sql = "SELECT * FROM products ORDER BY LX DESC LIMIT $limit";
				$row = $db->runQuery($sql);
				foreach($row as $key=>$value):
			?>
			<div class="col-sm-6 col-md-6 col-lg-4">
				<div class="card cao">
					<div class="card-body row">
						<div class="col-sm-6">
							<img src="img/product/<?= $row[$key]["ProID"]?>/1.png" style="width: 80%;">
						</div>
						<div class="col-sm-6">
							<h4 class="card-title"><?= $row[$key]["ProName"] ?></h4>
							<p class="red"><?= number_format($row[$key]["Price"]) ?>đ</p>
						</div>
					</div>
					<div class="marbotle">
						<form name="faddpro" action="../index/addItemToCart.inc.php" method="post">
							<input type="hidden" name="txtProID" value="<?= $row[$key]["ProID"] ?>">
							<input type="hidden" name="txtQuantity" value="1">
							<!-- <a href="addItemToCart.inc.php?" class="btn btn-success">Mua</a> -->
							<button class="btn btn-success" type="submit" name="btnAddItemToCart">Mua</button>
							<a href="../index/viewpros.php?Pro=<?= $row[$key]['ProID'] ?>" class="btn btn-secondary">Xem chi tiết</a>
						</form>
					</div>
				</div>
			</div>
			<?php
			endforeach;
			?>
		</div>
	</div>
</div>