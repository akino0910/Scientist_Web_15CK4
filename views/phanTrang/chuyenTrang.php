<?php
require_once("db.php");

$db = new DBController();
isset($_GET["page"]) ? $page = $_GET["page"] : $page = 1;
settype($page, "int");

$limit = $_GET["limit"];

//trang hiện tại
$offset = ($page - 1) * $limit;

$qr = "	SELECT * FROM products
		ORDER BY proID ASC
		LIMIT $offset, $limit";


$row = $db->runQuery($qr);

foreach ($row as $key=>$value):
	?>
		<tr>
		<th scope='row'> <?php echo $row[$key]['ProID'] ?> </th>
		<td>  <?php echo $row[$key]['ProName'] ?> </td>
		<td>  <?php echo number_format($row[$key]['Price']) ?> đ</td>
		<td>  <?php echo $row[$key]['TinyDes'] ?> </td>
		</tr>
<?php endforeach; ?>