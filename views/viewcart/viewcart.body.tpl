<div class="panel panel-default">
	<div class="borderdiv">
		<h3 class="panel-title">Giỏ hàng của bạn</h3>
	</div>
	<div class="panel-body">
		<form id="f" method="post" action="updateCart.inc.php">
			<input type="hidden" id="txtCmd" name="txtCmd">
			<input type="hidden" id="txtDProId" name="txtDProId">
			<input type="hidden" id="txtUQ" name="txtUQ">
		</form>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>Sản phẩm</th>
					<th>Giá</th>
					<th>Số lượng</th>
					<th>Thành tiền</th>
					<th>Trạng thái</th>
					<th>&nbsp;</th>
				</tr>
			</thead>
			<tbody>
				<?php
				$ttthanhtoan = 1;
				$total = 0;
				foreach ($_SESSION["cart"] as $proId => $q) :
					$sql = "select * from products where ProID = $proId";
					$rs = load($sql);
					$row = $rs->fetch_assoc();
					$amount = $q * $row["Price"];
					$total += $amount;
					if($q>$row["Quantity"] || $q == 0)
					{
						$ttthanhtoan = 0;
					}
					if($q>$row["Quantity"] || $q == 0)
					{
				?>
				<tr class="alert-danger">
					<?php
					}
					else
					{
					?>
					<tr>
						<?php
						}
						?>
						<td><?= $row["ProName"] ?></td>
						<td><?= number_format($row["Price"]) ?></td>
						<!-- <td><?= $q ?></td> -->
						<td>
							<input class="quantity-textfield" type="text" name="soluongdat" id="soluongdat" value="<?= $q ?>"> / <?= $row["Quantity"] ?>
						</td>
						<td><?= number_format($amount) ?></td>
						<td>
							<?php
								if($q>$row["Quantity"] || $q == 0){
							?>
							Lỗi số lượng
							<?php
							}
							else
							{
							?>
							Có thể thanh toán
							<?php
							}
							?>
						</td>
						<td class="text-right">
							<a class="btn btn-xs btn-primary cart-update" data-id="<?= $proId ?>" href="javascript:;" role="button">
								<i class="fa fa-refresh"></i>
							</a>
							<a class="btn btn-xs btn-danger cart-remove" data-id="<?= $proId ?>" href="javascript:;" role="button">
								<i class="fa fa-remove"></i>
							</a>
						</td>
					</tr>
					<?php
					endforeach;
					?>
				</tbody>
				<tfoot>
				<td>
					<a class="btn btn-success" href="indexpro.php?SP=1" role="button">
						<i class="fa fa-backward"></i> Quay về mua hàng
					</a>
				</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td><b><?= number_format($total) ?></b></td>
				<td class="text-right">
					<form method="post" action="">
						<input type="hidden" name="txtTotal" value="<?= $total ?>">
						<?php
						if($ttthanhtoan == 0)
						{
						?>
						<button name="btnCheckOut" type="submit" class="btn btn-primary" disabled="">
						<i class="fa fa-shopping-basket"></i> Không thể thanh toán
						</button>
						<?php
						}
						else
						{
						?>
						<button name="btnCheckOut" type="submit" class="btn btn-primary">
						<i class="fa fa-shopping-basket"></i> Thanh toán
						</button>
						<?php 
						}
						?>
					</form>
				</td>
				</tfoot>
			</table>
		</div>
	</div>