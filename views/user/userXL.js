// JavaScript Document

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

	//Thiết lập lỗi mặc định
	$( "#errName" ).tooltip( {
		title: "Lỗi họ và tên"
	} );
	$( "#errUsername" ).tooltip( {
		title: "Lỗi tên tài khoản"
	} );
	$( "#errEmail" ).tooltip( {
		title: "Lỗi email"
	} );
	$( "#errPass" ).tooltip( {
		title: "Lỗi mật khẩu"
	} );
	$( "#errRePass" ).tooltip( {
		title: "Lỗi nhập lại mật khẩu"
	} );
	$( "#errCaptcha" ).tooltip( {
		title: "(￣_￣)・・・ Chú ý capcha kìa bạn ơi."
	} );
	
	//Name
	$("#regName").blur(function () {
		if ($(this).val().length === 0) {
			$("#errName").attr( 'data-original-title', 'Nhập họ và tên vào hộ mình nhé ◕‿◕' );
			$("#errName").show();
		} else {
			$("#errName").hide();
		}
	});

	//Username
	$("#regUsername").on("input", function () {
		if ($(this).val().search(' ') !== -1) {
			$("#errUsername").attr( 'data-original-title', 'Vui lòng chỉ sử dụng chữ cái (a-z), số và dấu chấm.' );
			$("#errUsername").show();
		} else {
			$("#errUsername").hide();
		}
	});


	$("#regUsername").blur(function () {
		if ($(this).val().length === 0) {
			$("#errUsername").attr( 'data-original-title', 'Không có username thì đăng nhập làm sao đây? (・・ ) ?');
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
						var msg = txt1.concat(txt2, txt3);
						$("#errUsername").attr( 'data-original-title', msg);
						$("#errUsername").show();
					} else {
						if ($(this).val().search(' ') !== -1) {
							$("#errUsername").attr( 'data-original-title', "Vui lòng chỉ sử dụng chữ cái (a-z), số và dấu chấm.");
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
	$("#regEmail").on("input", function () {
		if ($(this).val().search(' ') !== -1) {
			$("#errEmail").attr( 'data-original-title', "Các ký tự sau được phép sử dụng cho mật khẩu của bạn: a-z, A-Z, 0-9 và dấu chấm câu thông thường.");
			$("#errEmail").show();
		} else {
			$("#errEmail").hide();
		}
	});

	$("#regEmail").blur(function () {
		if ($(this).val().length === 0) {
			$("#errEmail").attr( 'data-original-title', "(⇀_⇀) Nhập Email vô kìa ấy ới ơi.");
			$("#errEmail").show();
		} else {
			if ($(this).val().search(' ') !== -1) {
				$("#errEmail").attr( 'data-original-title', "Vui lòng chỉ sử dụng chữ cái (a-z), số và dấu chấm.");
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
			$("#errPass").attr( 'data-original-title', "Các ký tự sau được phép sử dụng cho mật khẩu của bạn: a-z, A-Z, 0-9 và dấu chấm câu thông thường.");
			$("#errPass").show();
		} else {
			$("#errPass").hide();
		}
	});

	$("#regPass").blur(function () {
		if ($(this).val().length === 0) {
			$("#errPass").attr( 'data-original-title', "(⊙_⊙) Không có mật khẩu thì bảo mật bằng niềm tin à.");
			$("#errPass").show();
		} else {
			if ($(this).val().search(' ') !== -1) {
				$("#errPass").attr( 'data-original-title', ("Các ký tự sau được phép sử dụng cho mật khẩu của bạn: a-z, A-Z, 0-9 và dấu chấm câu thông thường."));
				$("#errPass").show();
			} else {
				$("#errPass").hide();
			}
		}
	});

	//RePassword
	$("#regRePass").on("input", function () {
		if ($(this).val().search(' ') !== -1) {
			$("#errRePass").attr( 'data-original-title', "Các ký tự sau được phép sử dụng cho mật khẩu của bạn: a-z, A-Z, 0-9 và dấu chấm câu thông thường.");
			$("#errRePass").show();
		} else {
			$("#errRePass").hide();
		}
	});

	$("#regRePass").blur(function () {
		if ($(this).val().length === 0) {
			$("#errRePass").attr( 'data-original-title', "┐(￣～￣)┌ Bạn không được để trống trường này đâu.");
			$("#errRePass").show();
		} else if ($(this).val() !== $("#regPass").val()) {
			$("#errRePass").attr( 'data-original-title', "(ノ°益°)ノ Gõ lại mật khẩu mà cũng sai nữa là sao.");
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
			$("#errName").attr( 'data-original-title', 'Nhập họ và tên vào hộ mình nhé ◕‿◕' );
			$("#errName").show();
			n1 = 1;
		} else {
			$("#errName").hide();
			n1 = 0;
		}

		//username
		if (username.length === 0) {
			$("#errUsername").attr( 'data-original-title', "Không có username thì đăng nhập làm sao đây?(・・ ) ?");
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
						var msg = txt1.concat(txt2, txt3);
						$("#errUsername").attr( 'data-original-title', msg);
						$("#errUsername").show();
						n2 = 1;
					} else {
						if (username.search(' ') !== -1) {
							$("#errUsername").attr( 'data-original-title', "Vui lòng chỉ sử dụng chữ cái (a-z), số và dấu chấm.");
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

		//Email
		if (email.length === 0) {
			$("#errEmail").attr( 'data-original-title', "(⇀_⇀) Nhập Email vô kìa ấy ới ơi.");
			$("#errEmail").show();
			n3 = 1;
		} else {
			if (email.search(' ') !== -1) {
				$("#errEmail").attr( 'data-original-title', "Vui lòng chỉ sử dụng chữ cái (a-z), số và dấu chấm.");
				$("#errEmail").show();
				n3 = 1;
			} else {
				$("#errEmail").hide();
				n3 = 0;
			}
		}



		//pass
		if (pass.length === 0) {
			$("#errPass").attr( 'data-original-title', "(⊙_⊙) Không có mật khẩu thì bảo mật bằng niềm tin à.");
			$("#errPass").show();
			n4 = 1;
		} else {
			if ($(this).val().search(' ') !== -1) {
				$("#errPass").attr( 'data-original-title', "Các ký tự sau được phép sử dụng cho mật khẩu của bạn: a-z, A-Z, 0-9 và dấu chấm câu thông thường.");
				$("#errPass").show();
				n4 = 1;
			} else {
				$("#errPass").hide();
				n4 = 0;
			}
		}

		//Repass
		if (repass.length === 0) {
			$("#errRePass").attr( 'data-original-title', "┐(￣～￣)┌ Bạn không được để trống trường này đâu.");
			$("#errRePass").show();
			n5 = 1;
		} else if (repass !== pass) {
			$("#errRePass").attr( 'data-original-title', "(ノ°益°)ノ Gõ lại mật khẩu mà cũng sai nữa là sao.");
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
