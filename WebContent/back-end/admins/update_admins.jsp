<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.admins.model.*"%>
<%@ page import="com.permissiondelimit.model.*"%>
<%@ page import="java.util.*"%>
<%
	AdminsVO adminsVO = (AdminsVO) request.getAttribute("adminsVO");

	List<PermissionDelimitVO> permissiondelimitVO = (List<PermissionDelimitVO>) request
			.getAttribute("permissiondelimitVO");
%>
<html>

<head>
<meta charset="utf-8">
<title>修改員工資料</title>
<!--BOOSTRAP CSS -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/vendors/styles/core.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/vendors/styles/icon-font.min.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/src/plugins/jquery-steps/jquery.steps.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/vendors/styles/style.css">
<style>
.main-container {
	padding: 80px 30px 100px 270px
}

#preview img {
	height: 200px;
	width: 200px;
}
.city, .town {
	width: 100%;
}

.f1 {
	float: left;
	margin-left: 5px;
	margin-right: 5px;
	width: calc(5% - 10px)
}

.f2 {
	float: left;
	margin-left: 5px;
	margin-right: 5px;
	width: calc(10% - 10px)
}

.f3 {
	float: left;
	margin-left: 5px;
	margin-right: 5px;
	width: calc(15% - 10px)
}

.f4 {
	float: left;
	margin-left: 5px;
	margin-right: 5px;
	width: calc(20% - 10px)
}

.f5 {
	float: left;
	margin-left: 5px;
	margin-right: 5px;
	width: calc(25% - 10px)
}

.f6 {
	float: left;
	margin-left: 5px;
	margin-right: 5px;
	width: calc(30% - 10px)
}

.f7 {
	float: left;
	margin-left: 5px;
	margin-right: 5px;
	width: calc(35% - 10px)
}

.f8 {
	float: left;
	margin-left: 5px;
	margin-right: 5px;
	width: calc(40% - 10px)
}

.f9 {
	float: left;
	margin-left: 5px;
	margin-right: 5px;
	width: calc(45% - 10px)
}

.f10 {
	float: left;
	margin-left: 5px;
	margin-right: 5px;
	width: calc(50% - 10px)
}

.f11 {
	float: left;
	margin-left: 5px;
	margin-right: 5px;
	width: calc(55% - 10px)
}

.f12 {
	float: left;
	margin-left: 5px;
	margin-right: 5px;
	width: calc(60% - 10px)
}

.f13 {
	float: left;
	margin-left: 5px;
	margin-right: 5px;
	width: calc(65% - 10px)
}

.f14 {
	float: left;
	margin-left: 5px;
	margin-right: 5px;
	width: calc(70% - 10px)
}

.f15 {
	float: left;
	margin-left: 5px;
	margin-right: 5px;
	width: calc(75% - 10px)
}

.f16 {
	float: left;
	margin-left: 5px;
	margin-right: 5px;
	width: calc(80% - 10px)
}

.f17 {
	float: left;
	margin-left: 5px;
	margin-right: 5px;
	width: calc(85% - 10px)
}

.f18 {
	float: left;
	margin-left: 5px;
	margin-right: 5px;
	width: calc(90% - 10px)
}

.f19 {
	float: left;
	margin-left: 5px;
	margin-right: 5px;
	width: calc(95% - 10px)
}

.f20 {
	float: left;
	margin-left: 5px;
	margin-right: 5px;
	width: calc(100% - 10px)
}
</style>
<!-- 下拉式地址 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.twzipcode.min.js"></script>
</head>

<body>
	<jsp:include page="/back-end/header/header.jsp" />
	<div class="main-container">
		<main>
			<div class="pd-ltr-20 xs-pd-20-10">
				<div class="min-height-200px">
					<div class="pd-20 card-box mb-30">
						<div class="clearfix">
							<h2 class="text-dark h2">修改員工資料</h2>
							<div class="pull-right">
								<a
									href="<%=request.getContextPath()%>/back-end/admins/listAllAdmins.jsp">
									<img type="button" id="button"
									src="<%=request.getContextPath()%>/images/admins/back.png"
									height="30px" width="30px">
								</a>
							</div>
						</div>
						<!-- 錯誤表列 -->
						<c:if test="${not empty errorMsgs}">
							<font style="color: red">請修正以下錯誤:</font>
							<ul>
								<c:forEach var="message" items="${errorMsgs}">
									<li style="color: red">${message}</li>
								</c:forEach>
							</ul>
						</c:if>
						<form method="post" action="admins.do" name="form1"
							enctype="multipart/form-data">
							<section>
								<div class="h3">
									<div>
										<label>員工編號:<font color=red><b>*</b></font></label>
										${adminsVO.admin_id}
									</div>
								</div>
								<div class="row">
									<div class="col-md-4">
										<div class="form-group">
											<label>姓名:</label> <input type="text" class="form-control"
												name="admin_name" value="${adminsVO.admin_name}" />
										</div>
									</div>
									<div class="col-md-4">
										<div class="form-group">
											<label>身分證:<font color=red><b>*</b></font></label>
											<div name="admin_id_no">${adminsVO.admin_id_no}</div>
										</div>
									</div>
									<div class="col-md-4">
										<div class="form-group">
											<label>雇用日期:<font color=red><b>*</b></font></label>
											<div name="admin_dutydate">${adminsVO.admin_dutydate}</div>
										</div>
									</div>
								</div>
								<hr>
								<div class="row">
									<div class="col-md-4">
										<div class="form-group">
											<label>Email:</label> <input type="email"
												class="form-control" name="admin_mail"
												value="${adminsVO.admin_mail}" />
										</div>
									</div>
									<div class="col-md-4">
										<div class="form-group">
											<label>手機:</label> <input type="text" class="form-control"
												name="admin_mobile" value="${adminsVO.admin_mobile}" />
										</div>
									</div>
									<div class="col-md-4">
										<div class="form-group">
											<label>在職狀態:</label> <select
												class="custom-select form-control" name="admin_jobstate">
												<option value="${adminsVO.admin_jobstate == 1 ? 1:0}">${adminsVO.admin_jobstate == 1?"在職":"離職"}</option>
												<option value="${adminsVO.admin_jobstate == 1 ? 0:1}">${adminsVO.admin_jobstate == 1?"離職":"在職"}
												</option>
											</select>
										</div>
									</div>
								</div>
								<hr>
								<div class="row">
									<div class="col-md-12">
										<div id="twzipcode"></div>
										<div class="form-group">
											<label>地址:</label>
											
												<input type="text" class=" form-control"
													style="margin-top: 10px" name="admin_address"
													value="${adminsVO.admin_address}">
											
										</div>
									</div>
								</div>
								<hr>
								<div class="row">
									<div class="col-md-4">
										<div class="form-group">
											<label>權限:</label>
											<div class="form-group pull-right">
												<jsp:useBean id="permissiondelimitSvc" scope="page"
													class="com.permissiondelimit.model.PermissionDelimitService" />
												<c:forEach var="permissiondelimitVO"
													items="${permissiondelimitSvc.all}">
													<span class="nike"><label><input
															type="checkbox" name="per_id[]" class="check1"
															value="${permissiondelimitVO.per_id}">
															${permissiondelimitVO.per_name} </label></span>
												</c:forEach>
											</div>
										</div>
									</div>
									<div class="col-md-4">
										<div class="form-group">
											<label>上傳照片:</label> <input type="file" name="admin_pic"
												id="admin_pic" multiple>
										</div>
										<div id="preview"></div>
									</div>
									<div class="col-md-4">
										<div class="form-group">
											<input type="hidden" name="action" value="update"> <input
												type="hidden" name="admin_id"
												value="${adminsVO.admin_id}"> <input
												type="hidden" name="admin_id_no"
												value="${adminsVO.admin_id_no}"> <input
												type="hidden" name="admin_dutydate"
												value="${adminsVO.admin_dutydate}"> <input
												type="submit" value="送出" class="btn btn-dark btn-sm">
										</div>
									</div>
								</div>

							</section>
						</form>
					</div>
				</div>
		</main>
	</div>
	<jsp:include page="/back-end/sidebar/sidebar.jsp" />

	<!-- 自訂js -->
	<!--  比對權限 有的繼續勾勾 -->
	<div id="auth" align="center" style="display: none">
		<c:forEach var="permissiondelimitVO" items="${permissiondelimitVO}">
			<span class="check2">${permissiondelimitVO.per_id}</span>
			<br>
		</c:forEach>
	</div>

	<script>
		var check1 = document.getElementsByClassName("check1");
		var arr1 = [];
		for (let i = 0; i < check1.length; i++) {
			var x = check1[i].value;
			arr1.push(x);
		}

		console.log(arr1);

		var check2 = document.getElementsByClassName("check2");
		var arr2 = [];
		for (let i = 0; i < check2.length; i++) {
			var y = check2[i].innerText;
			arr2.push(y);
		}

		console.log(arr2);

		var nike = document.getElementsByClassName("nike");

		for (let i = 0; i < arr1.length; i++) {
			for (let j = 0; j < arr2.length; j++) {
				if (arr1[i] === arr2[j]) {
					check1[i].checked = true;

				}
			}
		}
	</script>


	<!-- 圖片 -->
	<script type="text/javascript">
		function init() {

			var admin_pic = document.getElementById("admin_pic");
			var preview = document.getElementById('preview');

			admin_pic.addEventListener('change', function() {

				var files = admin_pic.files;

				if (files !== null) {
					for (var i = 0; i < files.length; i++) {
						var file = files[i];
						console.log(file);

						if (file.type.indexOf('image') > -1) {

							var reader = new FileReader();

							reader.addEventListener('load', function(e) {

								var img = document.createElement('img');
								img.setAttribute('src', e.target.result);
								preview.append(img);
							});
							reader.readAsDataURL(file); // ***** trigger
						} else {
							alert('請上傳圖片！');
						}
					}
				}
			});
		}
		window.onload = init;
	</script>

	<!-- 地址 -->
	<script>
		$("#zipcode3").twzipcode({
			"zipcodeIntoDistrict" : true,
			"css" : [ "city form-control", "town form-control" ],
			"countyName" : "city", // 指定城市 select name
			"districtName" : "town" // 指定地區 select name
		});
	</script>

	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/taiwan_address_auto_change.js"
		charset="UTF-8"></script>

	<!-- js -->
	<script src="<%=request.getContextPath()%>/vendors/scripts/core.js"></script>
	<script
		src="<%=request.getContextPath()%>/vendors/scripts/script.min.js"></script>
	<script src="<%=request.getContextPath()%>/vendors/scripts/process.js"></script>
	<script
		src="<%=request.getContextPath()%>/vendors/scripts/layout-settings.js"></script>
	<script
		src="<%=request.getContextPath()%>/src/plugins/jquery-steps/jquery.steps.js"></script>
	<script
		src="<%=request.getContextPath()%>/vendors/scripts/steps-setting.js"></script>
</body>

</html>