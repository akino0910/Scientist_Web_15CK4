// JavaScript Document
function hello() {
	alert('hello');
}

$(document).ready(function () {
	var n1 = 0,
		n2 = 0,
		n3 = 0,
		n4 = 0,
		n5 = 0,
		n6 = 0;

	//đợi phản hồi
	$.ajaxSetup({
		async: false
	});

	//Name
	$("#regName").blur(function () {
		if ($(this).val().length === 0) {
			$("#errName").show();
		} else {
			$("#errName").hide();
		}
	});

	//Username
	$("#regUsername").on("input", function () {
		if ($(this).val().search(' ') !== -1) {
			$("#errUsername").html("Vui lòng chỉ sử dụng chữ cái (a-z), số và dấu chấm.");
			$("#errUsername").show();
		} else {
			$("#errUsername").hide();
		}
	});


	$("#regUsername").blur(function () {
		if ($(this).val().length === 0) {
			$("#errUsername").html("Không có username thì đăng nhập làm sao đây? <strong>(・・ ) ?</strong>");
			$("#errUsername").show();
		} else {
			$.ajax({
				url: "views/user/checkUsername.php",
				type: "POST",
				data: {
					username: $("#regUsername").val()
				},
				success: function (data) {
					if (data == 1) {
						var txt1 = "Tên người dùng ";
						var txt2 = $("#regUsername").val();
						var txt3 = " đã tồn tại rồi nhen ( ﾟｏ⌒)";
						var msg = txt1.concat("<strong>", txt2, "</strong>", txt3);
						$("#errUsername").html(msg);
						$("#errUsername").show();
					} else {
						if ($(this).val().search(' ') !== -1) {
							$("#errUsername").html("Vui lòng chỉ sử dụng chữ cái (a-z), số và dấu chấm.");
							$("#errUsername").show();
						} else {
							$("#errUsername").hide();
						}
					}
				}
			});
		}
	});

	//Email
	$("#regUsername").on("input", function () {
		if ($(this).val().search(' ') !== -1) {
			$("#errsername").html("Các ký tự sau được phép sử dụng cho mật khẩu của bạn: a-z, A-Z, 0-9 và dấu chấm câu thông thường.");
			$("#errUsername").show();
		} else {
			$("#errUsername").hide();
		}
	});

	$("#regEmail").blur(function () {
		if ($(this).val().length === 0) {
			$("#errEmail").html("<strong>(⇀_⇀)</strong> Nhập Email vô kìa ấy ới ơi.");
			$("#errEmail").show();
		} else {
			if ($(this).val().search(' ') !== -1) {
				$("#errEmail").html("Vui lòng chỉ sử dụng chữ cái (a-z), số và dấu chấm.");
				$("#errEmail").show();
			} else {
				$("#errEmail").hide();
			}
		}
	});

	//Password
	$("#regPass").on("input", function () {
		if ($("#regRePass").val() != "") {
			$("#regRePass").val(null);
			$("#errRePass").hide();
		}
		if ($(this).val().search(' ') !== -1) {
			$("#errPass").html("Các ký tự sau được phép sử dụng cho mật khẩu của bạn: a-z, A-Z, 0-9 và dấu chấm câu thông thường.");
			$("#errPass").show();
		} else {
			$("#errPass").hide();
		}
	});

	$("#regPass").blur(function () {
		if ($(this).val().length === 0) {
			$("#errPass").html("<strong>(⊙_⊙)</strong> Không có mật khẩu thì bảo mật bằng niềm tin à.");
			$("#errPass").show();
		} else {
			if ($(this).val().search(' ') !== -1) {
				$("#errPass").html("Các ký tự sau được phép sử dụng cho mật khẩu của bạn: a-z, A-Z, 0-9 và dấu chấm câu thông thường.");
				$("#errPass").show();
			} else {
				$("#errPass").hide();
			}
		}
	});

	//RePassword
	$("#regRePass").on("input", function () {
		if ($(this).val().search(' ') !== -1) {
			$("#errRePass").html("Các ký tự sau được phép sử dụng cho mật khẩu của bạn: a-z, A-Z, 0-9 và dấu chấm câu thông thường.");
			$("#errRePass").show();
		} else {
			$("#errRePass").hide();
		}
	});

	$("#regRePass").blur(function () {
		if ($(this).val().length === 0) {
			$("#errRePass").html("<strong>┐(￣～￣)┌</strong> Bạn không được để trống trường này đâu.");
			$("#errRePass").show();
		} else if ($(this).val() !== $("#regPass").val()) {
			$("#errRePass").html("<strong>(ノ°益°)ノ</strong> Gõ lại mật khẩu mà cũng sai nữa là sao.");
			$("#errRePass").show();
		} else {
			$("#errRePass").hide();
		}
	});

	//Form
	$("#btnReg").click(function () {
		var name = $("#regName").val();
		var email = $("#regEmail").val();
		var username = $("#regUsername").val();
		var pass = $("#regPass").val();
		var repass = $("#regRePass").val();
		var response = grecaptcha.getResponse();
		var secret = "6Ld9zjgUAAAAAJ-R6dUh3nHr8Sb324a7168xhpXG";

		//name
		if (name.length === 0) {
			$("#errName").show();
			n1 = 1;
		} else {
			$("#errName").hide();
			n1 = 0;
		}

		//username
		if (username.length === 0) {
			$("#errUsername").html("Không có username thì đăng nhập làm sao đây? <strong>(・・ ) ?</strong>");
			$("#errUsername").show();
			n2 = 1;
		} else {
			$.ajax({
				url: "views/user/checkUsername.php",
				type: "POST",
				data: {
					username: username
				},
				success: function (data) {
					if (data === '1') {
						var txt1 = "Tên người dùng ";
						var txt2 = $("#regUsername").val();
						var txt3 = " đã tồn tại rồi nhen. ( ﾟｏ⌒)";
						var msg = txt1.concat("<strong>", txt2, "</strong>", txt3);
						$("#errUsername").html(msg);
						$("#errUsername").show();
						n2 = 1;
					} else {
						if (username.search(' ') !== -1) {
							$("#errUsername").html("Vui lòng chỉ sử dụng chữ cái (a-z), số và dấu chấm.");
							$("#errUsername").show();
							n2 = 1;
						} else {
							$("#errUsername").hide();
							n2 = 0;
						}
					}
				}
			});
		}

		//email
		if (email.length === 0) {
			$("#errEmail").html("<strong>(⇀_⇀)</strong> Nhập Email vô kìa ấy ới ơi.");
			$("#errEmail").show();
			n3 = 1;
		} else {
			if (email.search(' ') !== -1) {
				$("#errEmail").html("Vui lòng chỉ sử dụng chữ cái (a-z), số và dấu chấm.");
				$("#errEmail").show();
				n3 = 1;
			} else {
				$("#errEmail").hide();
				n3 = 0;
			}
		}



		//pass
		if (pass.length === 0) {
			$("#errPass").html("<strong>(⊙_⊙)</strong> Không có mật khẩu thì bảo mật bằng niềm tin à.");
			$("#errPass").show();
			n4 = 1;
		} else {
			if ($(this).val().search(' ') !== -1) {
				$("#errPass").html("Các ký tự sau được phép sử dụng cho mật khẩu của bạn: a-z, A-Z, 0-9 và dấu chấm câu thông thường.");
				$("#errPass").show();
				n4 = 1;
			} else {
				$("#errPass").hide();
				n4 = 0;
			}
		}

		//repass
		if (repass.length === 0) {
			$("#errRePass").html("<strong>┐(￣～￣)┌</strong> Bạn không được để trống trường này đâu.");
			$("#errRePass").show();
			n5 = 1;
		} else if (repass !== pass) {
			$("#errRePass").html("<strong>(ノ°益°)ノ</strong> Gõ lại mật khẩu mà cũng sai nữa là sao.");
			$("#errRePass").show();
			n5 = 1;
		} else {
			$("#errRePass").hide();
			n5 = 0;
		}

		//captcha
		$.ajax({
			url: "views/user/userXL.php",
			type: "POST",
			data: {
				secretKey: secret,
				responseKey: response
			},
			success: function (data) {
				if (data == false) {
					$("#errCaptcha").show();
					n6 = 1;
				} else {
					$("#errCaptcha").hide();
					n6 = 0;
				}
			}
		});

		var arr = [n1, n2, n3, n4, n5, n6];
		if (arr.indexOf(1) !== -1) {
			grecaptcha.reset();
		} else {
			//			var msg = "chuoi hien hanh: " + n1 + n2 + n3 + n4 + n5 + n6;
			//			alert(msg);
			//			$("#regForm").submit();
			$.ajax({
				url: "views/user/regUser.php",
				type: "POST",
				data: {
					name: name,
					username: username,
					email: email,
					password: pass
				},
				success: function (data) {
					if (data === '1') {
						alert('(ᗒᗣᗕ)՞   Đăng ký lỗi!!!   (ᗒᗣᗕ)՞');
					} else {
						alert('＼(≧▽≦)／   Đăng ký thành công   ＼(≧▽≦)／');
						$("#myModal").modal('toggle');
					}
				}
			});
		}
	});
});
