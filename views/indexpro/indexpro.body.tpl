<?php
if(isset($_GET["SP"]))
{
	$sql = "select * from categories";
	$nrc = findnumrow($sql);
	$SP = $_GET["SP"];
	if($SP <= 0)
	{
		$SP = 1;
	}
	if($SP > $nrc)
	{
		$SP = $nrc;
	}
	$sql = "select * from products where CatID = $SP";
}
elseif(isset($_GET["NSX"]))
{
	$sql = "select * from nsx";
	$nrsx = findnumrow($sql);
	$NSX = $_GET["NSX"];
	if($NSX <= 0)
	{
		$NSX = 1;
	}
	if($NSX > $nrsx)
	{
		$NSX = $nrsx;
	}
	$sql = "select * from products where IDNSX = $NSX";
}
else
{
	header("Location: index.php");
	return;
}
?>
<div class="panel panel-default">
	<div class="borderdiv">
		<h3 class="panel-title">Sản phẩm</h3>
	</div>
	<div class="panel-body">
		<div class="row">
			<?php
				$rs = load($sql);
				while($row = $rs -> fetch_assoc()) :
			?>
			<div class="col-sm-4">
				<div class="card cao">
					<div class="card-body row">
						<div class="col-sm-6">
							<img src="img/product/<?= $row["ProID"]?>/1.png" style="width: 80%;">
						</div>
						<div class="col-sm-6">
							<h4 class="card-title"><?= $row["ProName"] ?></h4>
							<p class="red"><?= number_format($row["Price"]) ?>đ</p>
						</div>
					</div>
					<div class="marbotle rig">
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