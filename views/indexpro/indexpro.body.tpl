<?php
if(isset($_GET["SP"]))
{
	$sql = "select max(CatID) from categories";
	$nrc = load($sql)->fetch_assoc()['max(CatID)'];
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
	$sql = "select max(IDNSX) from nsx";
	$nrsx = load($sql)->fetch_assoc()['max(IDNSX)'];
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
?>
<div class="panel panel-default">
	<div class="borderdiv">
		<h3 class="panel-title">Sản phẩm</h3>
	</div>
	<div class="panel-body">
		<div class="row">
			<?php
				$current_page = $_GET['page'];
				$nr = findnumrow($sql);
				$limit = 9;
				$page = ceil($nr/$limit);
				if($current_page > $page)
				{
					$current_page = $page;
				}
				if($current_page < 1)
				{
					$current_page = 1;
				}
				$off = ($current_page - 1) * $limit;
				$sql = $sql . " LIMIT $limit OFFSET $off";
				$rs = load($sql);
				if($nr == 0)
				{
					echo "<div> Không có sản phẩm trong mục cần tìm </div>";
				}
				else
				{
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
			}
			?>
		</div>
		<?php
		if($nr > $limit){
		?>
		<nav aria-label="Page navigation example">
			<ul class="pagination martop">
			<?php for ($i=1; $i <= $page; $i++) {
					if($i == $current_page)
					{
						if(isset($_GET['SP']))
						{
				?>
				<li class="page-item active"><a class="page-link" href="indexpro.php?SP=<?= $SP ?>&page=<?= $i ?>"><?= $i ?></a></li>
				<?php
						}
						else{
				?>
				<li class="page-item active"><a class="page-link" href="indexpro.php?NSX=<?= $NSX ?>&page=<?= $i ?>"><?= $i ?></a></li>
				<?php
						}
					}
					else
					{
						if(isset($_GET['SP']))
						{
				?>
				<li class="page-item"><a class="page-link" href="indexpro.php?SP=<?= $SP ?>&page=<?= $i ?>"><?= $i ?></a></li>
				<?php
						}
						else{
				?>
				<li class="page-item"><a class="page-link" href="indexpro.php?NSX=<?= $NSX ?>&page=<?= $i ?>"><?= $i ?></a></li>
				<?php
					}
				}
			}
			?>
			</ul>
		</nav>
		<?php
		}
		?>
	</div>
</div>