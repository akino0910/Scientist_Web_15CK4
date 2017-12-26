// JavaScript Document
function hello(){
	alert('hello');
}

$(document).ready(function(){
	var n1 = 0, n2 = 0, n3 = 0, n4 = 0, n5 = 0;
	
	//đợi phản hồi
	$.ajaxSetup({async: false});
	
	//Email
	$("#userid").on("input", function() {
		if($(this).val().search(' ') !== -1){
			$("#errsername").html("Các ký tự sau được phép sử dụng cho mật khẩu của bạn: a-z, A-Z, 0-9 và dấu chấm câu thông thường.");
			$("#errUsername").show();
		} else {
			$("#errUsername").hide();
		}
	});
	
	$("#Email").blur(function(){
		if ($(this).val().length === 0)
		{
			$("#errEmail").show();
		} else {
			if($(this).val().search(' ') !== -1){
				$("#errEmail").html("Vui lòng chỉ sử dụng chữ cái (a-z), số và dấu chấm.");
				$("#errEmail").show();
			} else {
				$("#errEmail").hide();
			}
		}
	});
	
	//Username
	$("#userid").on("input", function() {
		if($(this).val().search(' ') !== -1){
			$("#errUsername").html("Vui lòng chỉ sử dụng chữ cái (a-z), số và dấu chấm.");
			$("#errUsername").show();
		} else {
			$("#errUsername").hide();
		}
	});
	
	
	$("#userid").blur(function(){
		if ($(this).val().length === 0)
		{
			$("#errUsername").show();
		} else {
			$.ajax({
			url:"views/user/checkUsername.php",
			type:"POST",
			data:{
				username: $("#userid").val()
			},
			success: function(data){
				if (data == 1){
					var txt1 = "Tên người dùng ";
					var txt2 = $("#userid").val();
					var txt3 = " đã tồn tại!!!";
					var msg = txt1.concat("<strong>", txt2, "</strong>", txt3);
					$("#errUsername").html(msg);
					$("#errUsername").show();
				} else {
					if($(this).val().search(' ') !== -1){
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
	
	//Password
	$("#password").on("input", function() {
		if($("#reenterpassword").val() != ""){
			$("#reenterpassword").val(null);
			$("#errRePass").hide();
		}
		if($(this).val().search(' ') !== -1){
			$("#errPass").html("Các ký tự sau được phép sử dụng cho mật khẩu của bạn: a-z, A-Z, 0-9 và dấu chấm câu thông thường.");
			$("#errPass").show();
		} else {
			$("#errPass").hide();
		}
	});
	
	$("#password").blur(function(){
		if ($(this).val().length === 0)
		{
			$("#errPass").show();
		} else {
			if($(this).val().search(' ') !== -1){
				$("#errPass").html("Các ký tự sau được phép sử dụng cho mật khẩu của bạn: a-z, A-Z, 0-9 và dấu chấm câu thông thường.");
				$("#errPass").show();
			} 
			else {
				$("#errPass").hide();
			}
		}
	});
	
	//RePassword
	$("#reenterpassword").on("input", function() {
		if($(this).val().search(' ') !== -1){
			$("#errRePass").html("Các ký tự sau được phép sử dụng cho mật khẩu của bạn: a-z, A-Z, 0-9 và dấu chấm câu thông thường.");
			$("#errRePass").show();
		} else {
			$("#errRePass").hide();
		}
	});
	
	$("#reenterpassword").blur(function(){
		if ($(this).val().length === 0)
		{
			$("#errRePass").html("Bạn không được để trống trường này.");
			$("#errRePass").show();
		} else if($(this).val() !== $("#password").val()) {
			$("#errRePass").html("<strong>Thiệt tình!</strong> Gõ lại mật khẩu mà cũng sai nữa là sao.");
			$("#errRePass").show();
		} else {
			$("#errRePass").hide();
		}
	});
	
	//Form
	$("#signup").click(function(){
		var email = $("#Email").val();
		var username = $("#userid").val();
		var pass = $("#password").val();
		var repass = $("#reenterpassword").val();
		var response = grecaptcha.getResponse();
		var secret = "6Ld9zjgUAAAAAJ-R6dUh3nHr8Sb324a7168xhpXG";
		
		
		//Email
		if (email.length === 0)
		{
			$("#errEmail").show();
			n1 = 1;
		} else {
			if(email.search(' ') !== -1){
				$("#errEmail").html("Vui lòng chỉ sử dụng chữ cái (a-z), số và dấu chấm.");
				$("#errEmail").show();
				n1 = 1;
			} else {
				$("#errEmail").hide();
				n1 = 0;
			}
		}
		
		//username
		
		if (username.length === 0)
		{
			$("#errUsername").show();
			n2 = 1;
		} else {
			$.ajax({
			url:"views/user/checkUsername.php",
			type:"POST",
			data:{
				username: username
			},
			success: function(data){
				if (data === '1'){
					var txt1 = "Tên người dùng ";
					var txt2 = $("#userid").val();
					var txt3 = " đã tồn tại rồi nhen!!!";
					var msg = txt1.concat("<strong>", txt2, "</strong>", txt3);
					$("#errUsername").html(msg);
					$("#errUsername").show();
					n2 = 1;
				} else {
					if(username.search(' ') !== -1){
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
		
		//pass
		if (pass.length === 0)
		{
			$("#errPass").show();
			n3 = 1;
		} else {
			if($(this).val().search(' ') !== -1){
				$("#errPass").html("Các ký tự sau được phép sử dụng cho mật khẩu của bạn: a-z, A-Z, 0-9 và dấu chấm câu thông thường.");
				$("#errPass").show();
				n3 = 1;
			} 
			else {
				$("#errPass").hide();
				n3 = 0;
			}
		}
		
		//repass
		if (repass.length === 0)
		{
			$("#errRePass").html("Bạn không được để trống trường này.");
			$("#errRePass").show();
			n4 = 1;
		} else if(repass !== pass) {
			$("#errRePass").html("<strong>Thiệt tình!</strong> Gõ lại mật khẩu mà cũng sai nữa là sao.");
			$("#errRePass").show();
			n4 = 1;
		} else {
			$("#errRePass").hide();
			n4 = 0;
		}
		
		//captcha
		$.ajax({
			url:"views/user/userXL.php",
			type:"POST",
			data:{
				secretKey: secret,
				responseKey: response
			},
			success: function(data){
				if (data == false){
					$("#errCaptcha").show();
					n5 = 1;
				}
				else {
					$("#errCaptcha").hide();
					n5 = 0;
				}
			}
		});
		
		var arr = [n1, n2, n3, n4  ,n5];
		if (arr.indexOf(0) === -1){
			grecaptcha.reset();
		} else {
			$("#regForm").submit();
		}
	})
});
