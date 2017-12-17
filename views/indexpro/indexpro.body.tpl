<?php
// Cai nay hem lam dc
if((!isset($_GET['SP'])) && (!isset($_GET['NSX'])))
	{
		header("Location: index.php");
		echo "hahahaha";
		return;
	}
if(isset($_GET['SP']))
{
	$sql = "select * from categories";
	$nrc = findnumrow($sql);
	$SP = $_GET['SP'];
	if($SP<=0 || $SP > $nrc)
	{
		header("Location: index.php");
		return;
	}
	$sql = "select * from products where CatID = $SP";
}
if(isset($_GET['NSX']))
{
	$sql = "select * from categories";
	$nrsx = findnumrow($sql);
	$NSX = $_GET['NSX'];
	if($NSX<=0 || $NSX > $nrsx)
	{
		header("Location: index.php");
		return;
	}
	
	$sql = "select * from products where IDNSX = $NSX";
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
					<div class="card-body">
						<img src="img/nikon1.jpg" style="width: 200px;">
						<h4 class="card-title"><?= $row["ProName"] ?></h4>
						<p class="red"><?= number_format($row["Price"]) ?>đ</p>
						<a href="#" class="btn btn-success">Mua</a>
						<a href="viewpros.php?Pro=<?= $row['ProID'] ?>" class="btn btn-secondary">Xem chi tiết</a>
					</div>
				</div>
			</div>
			<?php	
				endwhile;
			?>
		</div>
	</div>
</div>