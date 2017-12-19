<?php
?>
<div class="panel panel-default">
	<div class="borderdiv">
		<h3 class="panel-title">Sản phẩm mới</h3>
	</div>
	<div class="panel-body">
		<div class="row">
			<?php
				$sql = "select * from products order by ProID DESC limit 10";
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
						<a href="viewpros.php?Pro=<?= $row["ProID"] ?>" class="btn btn-secondary">Xem chi tiết</a>
					</div>
				</div>
			</div>
			<?php
			endwhile;
			?>
		</div>
	</div>
</div>
<div class="panel panel-default">
	<div class="borderdiv">
		<h3 class="panel-title">Sản phẩm bán chạy</h3>
	</div>
	<div class="panel-body">
		<div class="row">
			<?php
				$sql = "select * from products order by SLB DESC limit 10";
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
<div class="panel panel-default">
	<div class="borderdiv">
		<h3 class="panel-title">Sản phẩm xem nhiều nhất</h3>
	</div>
	<div class="panel-body">
		<div class="row">
			<?php
				$sql = "select * from products order by LX DESC limit 10";
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