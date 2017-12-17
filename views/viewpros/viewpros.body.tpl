<?php
$sql = "select * from products";
$nr = findnumrow($sql);
if(isset($_GET['Pro']))
{
	$ProID = $_GET['Pro'];
	if($ProID <= 0 || $ProID >$nr)
	{
		header("Location: index.php");
		return;
	}
	$sql = "select * from products where ProID = $ProID";
	$rs = load($sql);
	while($row = $rs -> fetch_assoc()) :
	$CatID = $row["CatID"];
	$IDNSX = $row["IDNSX"];
	$LX = $row["LX"] + 1;
	$sql = "update products set LX = $LX where ProID = $ProID";
	write($sql);
?>
<div class="row martop">
	<div class="col-sm-4">
		<img src="img/nikon1.jpg" style="width: 100%">
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
		</div>
	</div>
</div>
<?php
	endwhile;
}
else{
	header("Location: index.php");
	return;
}
?>
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
				<img src="img/nikon1.jpg" style="width: 100px;">
				<div class="dam"><?= $kq["ProName"] ?></div>
				<p class="red"><?= number_format($kq["Price"]) ?>đ</p>
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
				<img src="img/nikon1.jpg" style="width: 100px;">
				<div class="dam"><?= $kq["ProName"] ?></div>
				<p class="red"><?= number_format($kq["Price"]) ?>đ</p>
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