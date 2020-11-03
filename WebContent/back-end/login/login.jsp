<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.admins.model.*"%>
<%
String quit = (String) request.getAttribute("quit");
String error = (String) request.getAttribute("error");
String badguy = (String) request.getAttribute("badguy");
String update = (String) request.getAttribute("update");
%>
<html>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="0">
<meta charset="UTF-8">
<title>登入</title>
<!-- BOOSTRAP CSS-->
<link href="<%=request.getContextPath()%>/css/sb-admin-2.min.css"
	rel="stylesheet">
<style type="text/css">
body {
	background-color: #000000;
	padding: 0px;
	margin: 0px;
}

#gradient {
	width: 100%;
	height: 800px;
	padding: 0px;
	margin: 0px;
}
#login {
	color: #fff;
	background-color: #8dc9cc;
	border-color: #8dc9cc;
}

#login:hover {
	color: #fff;
	background-color: #2ab1b8;
	border-color: ##22c1c9;
}

.
#login:focus, #login.focus {
	color: #fff;
	background-color: #2ab1b8;
	border-color: #22c1c9;
	box-shadow: 0 0 0 0.2rem rgba(78, 115, 223, 0.25);
}

#login.disabled, #login:disabled {
	color: #fff;
	background-color: #8dc9cc;
	border-color: #8dc9cc;
}

#login:not (:disabled ):not (.disabled ):active, #login:not (:disabled 
	):not 
	 (.disabled ).active, .show>#login.dropdown-toggle {
	color: #fff;
	background-color: #2ab1b8;
	border-color: #22c1c9;
}

#login:not (:disabled ):not (.disabled ):active:focus, #login:not (:disabled
	 ):not (.disabled ).active:focus, .show>#login.dropdown-toggle:focus {
	box-shadow: 0 0 0 0.2rem rgba(78, 115, 223, 0.25);
}

.container {
	padding-top: 150px;
}
</style>
</head>

<body id="gradient" onload="note()">
	<div class="container">
		<!-- Outer Row -->
		<div class="row justify-content-center">
			<div class="col-xl-10 col-lg-12 col-md-9">
				<div class="card  border-0 shadow-lg my-5">
					<div class="card-body p-0">
						<!-- Nested Row within Card Body -->
						<div class="row">
							<div class="col-lg-6 d-none d-lg-block"
								style="background-color: #222222">
								<img src="<%=request.getContextPath()%>/images/login/logo.png"
									width="456 px" height="500px">
							</div>
							<div class="col-lg-6">
								<div class="p-5">
									<div class="text-center">
										<h1 class="h4 text-gray-900 mb-4">嘿! 部客俠</h1>
										<h6 class="h6 text-gray-700 mb-4">－歡迎回家－</h6>
									</div>
									<form method="post"
										action="<%=request.getContextPath()%>/back-end/admin/admins.do"
										class="user">
										<div class="form-group">
											<input type="text" name="admin_id"
												class="form-control form-control-user"
												id="exampleInputAccount" aria-describedby="accountHelp"
												placeholder="請輸入帳號..." required>
										</div>
										<div class="form-group">
											<input type="password" name="admin_pswd"
												class="form-control form-control-user"
												id="exampleInputPassword" placeholder="密碼" required>
										</div>
										<input type="hidden" name="action" value="login"> <input
											type="submit" value="登入" class="btn btn-user btn-block"
											id="login">
									</form>
									<hr>
									<div class="text-center">
										<p class="m-0">2020 &copy; Bookshop admin</p>
									</div>
									<div>
										<img style="cursor: pointer" id="button"
											src="<%=request.getContextPath()%>/images/login/8.png"
											height="60px" width="60px" align="right">
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- js-->
	<script src="<%=request.getContextPath()%>/js/sb-admin-2.min.js"></script>
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>	
	<script type="text/javascript">
		var button = document.getElementById("button");
		var exampleInputAccount = document
				.getElementById("exampleInputAccount");
		var exampleInputPassword = document
				.getElementById("exampleInputPassword");
		button.addEventListener("click", function(e) {
			e.preventDefault();
			exampleInputAccount.value = "ADM0007";
			exampleInputPassword.value = "000000";
		});
	</script>
	<script>
		var colors = new Array([ 208, 193, 198 ], [ 214, 214, 214 ], [ 188,
				169, 162 ], [ 146, 172, 209 ], [ 155, 144, 138 ], [ 177, 122,
				125 ], [ 128, 42, 42 ], [ 255, 249, 238 ]);

		var step = 0;
		//color table indices for: 
		// current color left
		// next color left
		// current color right
		// next color right
		var colorIndices = [ 0, 1, 2, 3 ];

		//transition speed
		var gradientSpeed = 0.005;

		function updateGradient() {

			if ($ === undefined)
				return;

			var c0_0 = colors[colorIndices[0]];
			var c0_1 = colors[colorIndices[1]];
			var c1_0 = colors[colorIndices[2]];
			var c1_1 = colors[colorIndices[3]];

			var istep = 1 - step;
			var r1 = Math.round(istep * c0_0[0] + step * c0_1[0]);
			var g1 = Math.round(istep * c0_0[1] + step * c0_1[1]);
			var b1 = Math.round(istep * c0_0[2] + step * c0_1[2]);
			var color1 = "rgb(" + r1 + "," + g1 + "," + b1 + ")";

			var r2 = Math.round(istep * c1_0[0] + step * c1_1[0]);
			var g2 = Math.round(istep * c1_0[1] + step * c1_1[1]);
			var b2 = Math.round(istep * c1_0[2] + step * c1_1[2]);
			var color2 = "rgb(" + r2 + "," + g2 + "," + b2 + ")";

			$('#gradient')
					.css(
							{
								background : "-webkit-gradient(linear, left top, right top, from("
										+ color1 + "), to(" + color2 + "))"
							}).css(
							{
								background : "-moz-linear-gradient(left, "
										+ color1 + " 0%, " + color2 + " 100%)"
							});

			step += gradientSpeed;
			if (step >= 1) {
				step %= 1;
				colorIndices[0] = colorIndices[1];
				colorIndices[2] = colorIndices[3];

				//pick two new target color indices
				//do not pick the same as the current one
				colorIndices[1] = (colorIndices[1] + Math.floor(1
						+ Math.random() * (colors.length - 1)))
						% colors.length;
				colorIndices[3] = (colorIndices[3] + Math.floor(1
						+ Math.random() * (colors.length - 1)))
						% colors.length;

			}
		}

		setInterval(updateGradient, 10);
	</script>
	
	<script type="text/javascript">
	var quit = `${quit}`;
	var error = `${error}`;
	var badguy = `${badguy}`;
	var update = `${update}`;
	
	function note(){
		if(quit === "quit"){
			swal({
				title : "你已離職，還想幹嘛!",
				text : "5秒後，為您轉至轉職好朋友",
	 			icon : "warning",			
				timer : 3000,
			}).then(function() {
			    window.location = "https://www.tibame.com/";
			});
		}
		
	 if(error === "error"){
			swal({
				title : "帳號或密碼有誤!",
				text : "請再重新輸入",
	 			icon : "error",			
				timer : 5000
			});
		}
	 
	 if(badguy === "badguy"){
			swal({
				title : "你確定是部客俠一員嗎?",
				text : "逼逼~報警前趕緊走！",
	 			icon : "error",			
				timer : 5000
			});
		}
	 if(update === "update"){
			swal({
				title : "修改密碼完成！",
				text : "請以新密碼重新登入",
	 			icon : "success",			
				timer : 5000
			});
		}
	}
	
	</script>
</body>

</html>