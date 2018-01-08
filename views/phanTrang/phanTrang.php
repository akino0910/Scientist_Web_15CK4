<?php

require_once('db.php');

$db=new DBController();

isset($_GET["idDanhMuc"]) ? $idDanhMuc = $_GET["idDanhMuc"] : $idDanhMuc = 1;
isset($_GET["page"]) ? $page = $_GET["page"] : $page = 1;
isset($_GET["limit"]) ? $limit = $_GET["limit"] : $limit = 10;


$sql = "SELECT * FROM products WHERE CatID = $idDanhMuc";  
$row_cnt = $db->numRows($sql);
$num_page = ceil($row_cnt / $limit);
if($num_page != 1):
?>
<ul class="pagination">
	<li class="page-item <?php if($page == 1) echo 'disabled'?>" id="Prev">
		<a class="page-link" href="javascript:void(0);" id="prevPage" aria-label="Previous">
        	<span aria-hidden="true">&laquo;</span>
		</a>
	</li>
<?php
for($i = 1; $i <= $num_page; $i++ ):
?>
	<li class="page-item <?php if ($i == $page) echo 'active'; ?>">
		<a class="page-link" href="javascript:void(0);" id="<?php echo $i ?>"><?php echo $i ?></a>
	</li>
<?php endfor; ?>

	<li class="page-item <?php if($page == $num_page) echo 'disabled'?>" id="Next">
		<a class="page-link" href="javascript:void(0);" id="nextPage" aria-label="Next">
			<span aria-hidden="true">&raquo;</span>
		  </a>
	</li>
</ul>
<?php endif; ?>