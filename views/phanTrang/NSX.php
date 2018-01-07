<?php
require_once("db.php");

$db = new DBController();
$sql = "SELECT * FROM nsx";

$row = $db->runQuery($sql);
foreach ($row as $key=>$value):
?>
<div>
	<a class = "list-group-item btnnavDanhMuc" href="javascript:void(0);" id="<?php echo $row[$key]["IDNSX"] ?>">
		<?= $row[$key]["NameNSX"] ?>
	</a>
</div>
<?php endforeach; ?>