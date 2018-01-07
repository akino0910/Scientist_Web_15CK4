<?php
require_once( "db.php" );

$db = new DBController();

if ( isset( $_GET[ "idDanhMuc" ] ) ) {
	$sql = "SELECT * FROM categories";
	$numRowsCat = $db->numRows($sql);
	$idDanhMuc = $_GET[ "idDanhMuc" ];
	$page = $_GET["page"];
	$limit = $_GET["limit"];
	
	if(isset($_GET["page"]) ? $offset = (($page - 1) * $limit) : $offset = 1);
	
	if ( $idDanhMuc <= 0 ) {
		$idDanhMuc = 1;
	}
	if ( $idDanhMuc > $numRowsCat ) {
		$idDanhMuc = $numRowsCat;
	}
	$sql = "SELECT * FROM products WHERE CatID = $idDanhMuc Limit $offset, $limit";
} elseif ( isset( $_GET[ "idNSX" ] ) ) {
	$sql = "SELECT * FROM nsx";
	$nrsx = $db->numRows($sql);
	$idNSX = $_GET[ "idNSX" ];
	if ( $idNSX <= 0 ) {
		$idNSX = 1;
	}
	if ( $idNSX > $nrsx ) {
		$idNSX = $nrsx;
	}
	$sql = "SELECT * FROM products WHERE IDNSX = $idNSX";
}
elseif(isset($_GET['ProID']))
{
	$ProID = $_GET['ProID'];
	$sql = "SELECT * FROM products WHERE ProID = $ProID";
	$rs = $db->runQuery($sql);
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
			$rows = $db->runQuery($sql);
			foreach($rows as $key=>$value):
			?>
			<div class="col-sm-4">
				<div class="card cao">
					<div class="card-body row">
						<div class="col-sm-6">
							<img src="img/product/<?= $rows[$key]['ProID']?>/1.png" style="width: 80%;">
						</div>
						<div class="col-sm-6">
							<h4 class="card-title">
								<?= $rows[$key]['ProName'] ?>
							</h4>
							<p class="red">
								<?= number_format($rows[$key]['Price']) ?>đ</p>
						</div>
					</div>
					<div class="marbotle rig">
						<form name="faddpro" action="addItemToCart.inc.php" method="post">
							<input type="hidden" name="txtProID" value="<?= $rows[$key]['ProID'] ?>">
							<input type="hidden" name="txtQuantity" value="1">
							<button class="btn btn-success" type="submit" name="btnAddItemToCart">
							Mua
							</button>
							<a href="javascript:void(0);" class="btn btn-secondary btnFullItem" id="<?php echo $rows[$key]['ProID'] ?>">Xem chi tiết</a>
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
<div id="paginationNumber"></div>