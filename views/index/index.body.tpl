<div class="panel panel-default">
	<div class="borderdiv">
		<h3 class="panel-title">Sản phẩm mới</h3>
	</div>
	<div class="panel-body">
		<div class="row">
			<?php
				$sql = "select * from products order by ProID DESC limit 10";
				$rs = load($sql);
				while($row = $rs -> fetch_assoc()) :
			?>
			<div class="col-sm-4">
				<div class="card cao">
					<div class="card-body row">
						<div class="col-sm-6">
							<img src="img/product/<?= $row["ProID"]?>/1.png" style="height: 60%;">
						</div>
						<div class="col-sm-6">
							<h4 class="card-title"><?= $row["ProName"] ?></h4>
							<p class="red"><?= number_format($row["Price"]) ?>đ</p>
						</div>
					</div>
					<div class="marbotle">
						<form name="faddpro" action="addItemToCart.inc.php" method="post">
							<input type="hidden" name="txtProID" value="<?= $row["ProID"] ?>">
							<input type="hidden" name="txtQuantity" value="1">
							<!-- <a href="addItemToCart.inc.php?" class="btn btn-success">Mua</a> -->
							<button class="btn btn-success" type="submit" name="btnAddItemToCart">
							Mua
							</button>
						
						<a href="viewpros.php?Pro=<?= $row['ProID'] ?>" class="btn btn-secondary">Xem chi tiết</a>
						</form>
					</div>
				</div>
			</div>
			<?php
			endwhile;
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
				$sql = "select * from products order by SLB DESC limit 10";
				$rs = load($sql);
				while($row = $rs -> fetch_assoc()) :
			?>
			<div class="col-sm-4">
				<div class="card cao">
					<div class="card-body row">
						<div class="col-sm-6">
							<img src="img/product/<?= $row["ProID"]?>/1.png" style="height: 60%;">
						</div>
						<div class="col-sm-6">
							<h4 class="card-title"><?= $row["ProName"] ?></h4>
							<p class="red"><?= number_format($row["Price"]) ?>đ</p>
						</div>
					</div>
					<div class="marbotle">
						<form name="faddpro" action="addItemToCart.inc.php" method="post">
							<input type="hidden" name="txtProID" value="<?= $row["ProID"] ?>">
							<input type="hidden" name="txtQuantity" value="1">
							<!-- <a href="addItemToCart.inc.php?" class="btn btn-success">Mua</a> -->
							<button class="btn btn-success" type="submit" name="btnAddItemToCart">
							Mua
							</button>
						
						<a href="viewpros.php?Pro=<?= $row['ProID'] ?>" class="btn btn-secondary">Xem chi tiết</a>
						</form>
					</div>
				</div>
			</div>
			<?php
			endwhile;
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
				$sql = "select * from products order by LX DESC limit 10";
				$rs = load($sql);
				while($row = $rs -> fetch_assoc()) :
			?>
			<div class="col-sm-4">
				<div class="card cao">
					<div class="card-body row">
						<div class="col-sm-6">
							<img src="img/product/<?= $row["ProID"]?>/1.png" style="height: 60%;">
						</div>
						<div class="col-sm-6">
							<h4 class="card-title"><?= $row["ProName"] ?></h4>
							<p class="red"><?= number_format($row["Price"]) ?>đ</p>
						</div>
					</div>
					<div class="marbotle">
						<form name="faddpro" action="addItemToCart.inc.php" method="post">
							<input type="hidden" name="txtProID" value="<?= $row["ProID"] ?>">
							<input type="hidden" name="txtQuantity" value="1">
							<!-- <a href="addItemToCart.inc.php?" class="btn btn-success">Mua</a> -->
							<button class="btn btn-success" type="submit" name="btnAddItemToCart">
							Mua
							</button>
						
						<a href="viewpros.php?Pro=<?= $row['ProID'] ?>" class="btn btn-secondary">Xem chi tiết</a>
						</form>
					</div>
				</div>
			</div>
			<?php
			endwhile;
			?>
		</div>
	</div>
</div>