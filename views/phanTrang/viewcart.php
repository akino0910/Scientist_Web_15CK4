<?php
	require_once "../../lib/db.php";
	require_once '../../cart.inc';
	if (isset($_POST["btnCheckOut"])) {
		if ($_SESSION["cart"] == null) {
			echo "<div class='alert alert-danger text-center' role='alert'><strong>Giỏ hàng rỗng!</strong> Bạn chưa chọn bất cứ mặt hàng nào</div>";
		}
		if ($_SESSION["cart"] != null)
		{
			if(isset($_SESSION["ttdn"]))
			{
				if($_SESSION["ttdn"] == 1)
				{
					$o_Total = $_POST["txtTotal"];
					$o_UserID = $_SESSION["current_user"]->f_ID;
					$o_OrderDate = strtotime("+7 hours", time());
					$str_OrderDate = date("Y-m-d H:i:s", $o_OrderDate);
					$sql = "insert into orders(OrderDate, UserID, Total, TrangThai) values('$str_OrderDate', $o_UserID, $o_Total, 'Chưa giao')";
					write($sql);
					$sqlnew = "select max(OrderID) from orders";
					$rs = load($sqlnew);
					$o_ID = $rs->fetch_assoc();
					$o_ID = $o_ID["max(OrderID)"];
					// order_details
					foreach ($_SESSION["cart"] as $proId => $q) {
						$sql = "select * from products where ProID = $proId";
						$rs = load($sql);
						$row = $rs->fetch_assoc();
						$price = $row["Price"];
						$amount = $q * $price;
						$d_sql = "insert into orderdetails(OrderID, ProID, Quantity, Price, Amount) values($o_ID, $proId, $q, $price, $amount)";
						write($d_sql);
						$qban = $row["SLB"] + $q;
						$qton = $row["Quantity"] - $q;
						$sqlnew = "update products set Quantity = $qton, SLB = $qban where ProID = $proId";
						write($sqlnew);
					}
					$_SESSION["cart"] = array();
					echo "<div class='alert alert-success text-center' role='alert'><strong>Thanh toán!</strong> Thanh toán thành công</div>";
				}
				if($_SESSION["ttdn"] == 0)
				{
					echo "<div class='alert alert-danger text-center' role='alert'><strong>Đăng nhập!</strong> Vui lòng đăng nhập để thực hiện thanh toán</div>";
				}
			}
		}
	}
?>
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
					if($q>$row["Quantity"])
					{
						$ttthanhtoan = 0;
					}
					if($q>$row["Quantity"])
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
						 <td><?= $q ?></td> 
						<td>
							<input class="quantity-textfield" type="text" name="soluongdat" id="soluongdat" value="<?= $q ?>"> / <?= $row["Quantity"] ?>
						</td>
						<td><?= number_format($amount) ?></td>
						<td>
							<?php
								if($q>$row["Quantity"]){
							?>
							Vượt số lượng tồn
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
					<a class="btn btn-success" href="index.php" role="button">
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