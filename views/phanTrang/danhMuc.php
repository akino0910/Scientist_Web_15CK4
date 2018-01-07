<?php
require_once("db.php");

$db = new DBController();
$sql = "SELECT * FROM categories";

$row = $db->runQuery($sql);
foreach ($row as $key=>$value):
?>
<div>
	<a class = "list-group-item btnnavDanhMuc" href="javascript:void(0);" id="<?php echo $row[$key]["CatID"] ?>">
		<?= $row[$key]["CatName"] ?>
	</a>
</div>
<?php endforeach; ?>