<?php
	require_once "./lib/db.php";
	$sql = "select max(CatID) from categories";
	$nrc = load($sql)->fetch_assoc()['max(CatID)'];
	$sql = "select max(IDNSX) from nsx";
	$nrsx = load($sql)->fetch_assoc()['max(IDNSX)'];
	if(isset($_POST["Ten"]))
	{
		$Ten = $_POST["Ten"];
		$min = $_POST["nhonhat"];
		$max = $_POST["lonnhat"];
		if($Ten == "")
		{
			$sql = "select * from products where Price >= $min and Price <= $max";
		}
		else
		{
			$sql = "select * from products where ProName LIKE '%$Ten%' and Price >= $min and Price <= $max";
		}
		$dem = 1;
		$str1 = "";
		for ($i=1; $i <= $nrc ; $i++) {
			if(isset($_POST["SP$i"])){
				if($dem > 1)
				{
					$str1 = $str1 . " or CatID = $i";
					$dem ++;
				}
				else
				{
				$str1 = $str1 . "CatID = $i";
				$dem ++;
				}
			}
		}
		if($str1 != "")
		{
			$sql = $sql . " and (" . $str1 .") ";
		}
		
		$dem = 1;
		$str2 = "";
		for ($j=1; $j <= $nrsx ; $j++) {
			if(isset($_POST["NSX$j"])){
				if($dem > 1)
				{
					$str2 = $str2 . " or IDNSX = $j";
					$dem ++;
				}
				else
				{
				$str2 = $str2 . "IDNSX = $j";
				$dem ++;
				}
			}
		}
		if($str2 != "")
		{
			$sql = $sql . " and (" . $str2 .") ";
		}
	}
	$nr = findnumrow($sql);
	$rs = load($sql);
?>
<div class="panel panel-default">
	<div class="borderdiv">
		<h3 class="panel-title">Sản phẩm</h3>
	</div>
	<div class="panel-body">
		<div class="row">
			<?php
			if($nr == 0)
			{
				echo "</br> Không có sản phẩm theo yêu cầu!";
			}
			else
			{
				while($row = $rs -> fetch_assoc()) :
			?>
			<div class="col-sm-4">
				<div class="card cao">
					<div class="card-body row">
						<div class="col-sm-6">
							<img src="img/product/<?= $row["ProID"]?>/1.png" style="width: 80% ">
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
			}
			?>
		</div>
	</div>
</div>