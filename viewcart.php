<?php
	
	$base_filename = basename(__FILE__, '.php');
	$page_body_file = "$base_filename/$base_filename.body.tpl";
	$loadpicture = "picture/nonpicture.body.tpl";
	require_once "./lib/db.php";
	require_once 'cart.inc';
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
					$sql = "insert into orders(OrderDate, UserID, Total) values('$str_OrderDate', $o_UserID, $o_Total)";
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
					}
					$_SESSION["cart"] = array();
					
				}
				if($_SESSION["ttdn"] == 0)
				{
					echo "<div class='alert alert-danger text-center' role='alert'><strong>Đăng nhập!</strong> Vui lòng đăng nhập để thực hiện thanh toán</div>";
				}
			}
		}
	}
include 'views/_layout.php';