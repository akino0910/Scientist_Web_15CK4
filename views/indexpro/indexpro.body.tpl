<?php
require_once "./lib/db.php";
// Cai nay hem lam dc
if((!isset($_GET['SP'])) && (!isset($_GET['NSX'])))
	{
		header("Location: index.php");
		echo "hahahaha";
		return;
	}
if(isset($_GET['SP']))
{
	$SP = $_GET['SP'];
	$sql = "select * from products where CatID = $SP";
}
if(isset($_GET['NSX']))
{
	$NSX = $_GET['NSX'];
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
						<a href="#" class="btn btn-secondary">Xem chi tiết</a>
					</div>
				</div>
			</div>
			<?php	
				endwhile;
			?>
		</div>
	</div>
</div>