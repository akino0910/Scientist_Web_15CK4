<?php
	$sql = "select * from products where ProID = $ProID";
	$rs = load($sql);
	$row = $rs -> fetch_assoc();
	$CatID = $row["CatID"];
	$IDNSX = $row["IDNSX"];
	$LX = $row["LX"] + 1;
	$sql = "update products set LX = $LX where ProID = $ProID";
	write($sql);
	$sqlnew = "select SLAnh from products where ProID = $ProID";
	$rsnew = load($sqlnew);
	$kqnew = $rsnew->fetch_assoc();
	$slanh = $kqnew["SLAnh"];
?>
<div class="row martop">
	<div class="col-sm-4">
		<div id="demo" class="carousel slide" data-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="img/product/<?= $ProID ?>/1.png" width="100%" >
				</div>
				<?php
				for ($i=2; $i <= $slanh ; $i++) {
				?>
				<div class="carousel-item">
					<img src="img/product/<?= $ProID ?>/<?= $i ?>.png" width="100%" >
				</div>
				<?php
					}
				?>
			</div>
			<a class="carousel-control-prev" href="#demo" data-slide="prev">
				<span class="carousel-control-prev-icon"></span>
			</a>
			<a class="carousel-control-next" href="#demo" data-slide="next">
				<span class="carousel-control-next-icon"></span>
			</a>
		</div>
	</div>
	<div class="col-sm-8">
		<h3 class="card-title borderbot"><?= $row["ProName"] ?></h3>
		<p class="red"><?= number_format($row["Price"]) ?>đ</p>
		<div class="row">
			<div class="col-sm-6">
				<div class="dam">Mô tả: </div>
				<?= $row["FullDes"] ?>
			</div>
			<div class="col-sm-6 martop borderleft">
				<div class="martop">Lượt xem: <?= $row["LX"] ?></div>
				<div class="martop">Đã bán: <?= $row["SLB"] ?> sản phẩm</div>
				<div class="martop">Xuất xứ: <?= $row["XX"] ?></div>
				<?php
				$sql = "select CatName from categories where CatID = $CatID";
				$rs = load($sql);
				$kq = $rs->fetch_assoc();
				?>
				<div class="martop">Loại: <?= $kq['CatName'] ?></div>
				<?php
					$sql = "select NameNSX from nsx where IDNSX = $IDNSX";
					$rs = load($sql);
					$kq = $rs->fetch_assoc();
				?>
				<div class="martop">Nhà sản xuất: <?= $kq["NameNSX"] ?></div>
			</div>
			<div class="">
				<input class="" type="number" value="1" size="100px">
				<a href="#" class="btn btn-success">Đặt mua</a>
			</div>
		</div>
	</div>
</div>
<div class="dam martop">
	Các mặt hàng cùng loại:
</div>
<div class="row martop">
	<?php
		$sql = "select * from products where CatID = $CatID and ProID != $ProID";
		$rs = load($sql);
		for ($i=0; $i < 5; $i++) {
			$kq = $rs->fetch_assoc();
			if(isset($kq))
			{
	?>
	<div class="col-sm-2">
		<div class="card cao">
			<div class="card-body">
				<img src="img/product/<?= $kq['ProID'] ?>/1.png" style="width: 100px;">
				<div class="dam martop"><?= $kq["ProName"] ?></div>
				<p class="red"><?= number_format($kq["Price"]) ?>đ</p>
				
			</div>
			<div class="marbotle">
				<a href="#" class="btn btn-success">Mua</a>
				<a href="viewpros.php?Pro=<?= $kq["ProID"] ?>" class="btn btn-secondary">Chi tiết</a>
			</div>
		</div>
	</div>
	<?php
			}
		}
	?>
</div>
<div class="dam martop">
	Các mặt hàng cùng NSX:
</div>
<div class="row martop">
	<?php
		$sql = "select * from products where IDNSX = $IDNSX and ProID != $ProID";
		$rs = load($sql);
		for ($i=0; $i < 5; $i++) {
			$kq = $rs->fetch_assoc();
			if(isset($kq))
			{
	?>
	<div class="col-sm-2">
		<div class="card cao">
			<div class="card-body">
				<img src="img/product/<?= $kq['ProID'] ?>/1.png" style="width: 100px;">
				<div class="dam martop"><?= $kq["ProName"] ?></div>
				<p class="red"><?= number_format($kq["Price"]) ?>đ</p>
			</div>
			<div class="marbotle">
				<a href="#" class="btn btn-success">Mua</a>
				<a href="viewpros.php?Pro=<?= $kq["ProID"] ?>" class="btn btn-secondary">Chi tiết</a>
			</div>
		</div>
	</div>
	<?php
			}
		}
	?>
</div>