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
					<th class="col-md-2">Số lượng</th>
					<th>Thành tiền</th>
					<th>&nbsp;</th>
				</tr>
			</thead>
			<tbody>
				<?php
				$total = 0;
				foreach ($_SESSION["cart"] as $proId => $q) :
					$sql = "select * from products where ProID = $proId";
					$rs = load($sql);
					$row = $rs->fetch_assoc();
					$amount = $q * $row["Price"];
					$total += $amount;
				?>
				<tr>
					<td><?= $row["ProName"] ?></td>
					<td><?= number_format($row["Price"]) ?></td>
					<!-- <td><?= $q ?></td> -->
					<td>
						<input class="quantity-textfield" type="text" name="" id="" value="<?= $q ?>">
					</td>
					<td><?= number_format($amount) ?></td>
					<td class="text-right">
						<a class="btn btn-xs btn-danger cart-remove" data-id="<?= $proId ?>" href="javascript:;" role="button">
							Re
						</a>
						<a class="btn btn-xs btn-primary cart-update" data-id="<?= $proId ?>" href="javascript:;" role="button">
							Up
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
					Tiếp tục mua hàng
				</a>
			</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td><b><?= number_format($total) ?></b></td>
			<td class="text-right">
				<form method="post" action="">
					<input type="hidden" name="txtTotal" value="<?= $total ?>">
					<button name="btnCheckOut" type="submit" class="btn btn-primary">
					Thanh toán
					</button>
				</form>
			</td>
			</tfoot>
		</table>
	</div>
</div>