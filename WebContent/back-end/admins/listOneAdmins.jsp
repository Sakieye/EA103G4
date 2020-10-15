<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.admins.model.*"%>
<%@ page import="com.adminpermission.model.*"%>
<%@ page import="com.permissiondelimit.model.*"%>
<%@ page import="java.util.*"%>


<%
	AdminsVO adminsVO = (AdminsVO) request.getAttribute("adminsVO");
%>

<%
	List<AdminPermissionVO> adminpermissionVO = (List<AdminPermissionVO>) request
			.getAttribute("adminpermissionVO"); //用集合來接許多權限的物件

	List<PermissionDelimitVO> permissiondelimitVO = (List<PermissionDelimitVO>) request
			.getAttribute("permissiondelimitVO"); //用集合來接許多權限的物件
%>

<%
	java.sql.Date admin_dutydate = null;
	try {
		admin_dutydate = adminsVO.getAdmin_dutydate();
	} catch (Exception e) {
		admin_dutydate = new java.sql.Date(System.currentTimeMillis());
	}
%>


<html>

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
	<title>員工詳情資料</title>
	
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
	padding: 80px 50px 100px 270px
}
</style>


</head>


<body>
<jsp:include page="/back-end/header/header.jsp" />
	<div class="main-container">
	<main>
		<div class="pd-ltr-20 xs-pd-20-10">
			<div class="min-height-200px">
				<div class="pd-20 card-box mb-30">

					<div class="clearfix">
						<h2 class="text-dark h2">員工資料詳情</h2>
						<div class="pull-right" style="padding-bottom: 10px">
						
							<a
								href="<%=request.getContextPath()%>/back-end/admins/listAllAdmins.jsp"><img
								type="button" id="button"
								src="<%=request.getContextPath()%>/images/admins/back.png"
								height="30px" width="30px"></a>
						</div>
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


						<!-- Area Chart -->
						<div class="card shadow mb-4">
							<div class="card-header py-3">
								<h3 class="m-0 font-weight-bold text-danger">${adminsVO.admin_id}</h3>

							</div>

							<div class="card-body">
								<div class="row">
									<div class="col-md-12">
										<div class="form-group">
											<div id="img" style="text-align: center;">
												<img width="200px" heigh="200px"
													src="${pageContext.request.contextPath}/ShowAdminPic?admin_id=${adminsVO.admin_id}" />
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<div class="h5 text-gray">姓名:</div>
											<div class="h3 text-dark">${adminsVO.admin_name}</div>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<div class="h5 text-gray">身分證:</div>
											<div class="h3 text-dark">${adminsVO.admin_id_no}</div>
										</div>
									</div>
								</div>
								<hr>
								<div class="row h4 text-dark">
									<div class="col-md-6">
										<div class="form-group">
											<div class="h5 text-gray">Email:</div>
											<div class="h3 text-dark">${adminsVO.admin_mail}</div>

										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<div class="h5 text-gray">手機:</div>
											<div class="h3 text-dark">${adminsVO.admin_mobile}</div>
										</div>
									</div>
								</div>
								<hr>

								<div class="row h4 text-dark">
									<div class="col-md-6">
										<div class="form-group">
											<div class="h5 text-gray">雇用日期:</div>
											<div class="h3 text-dark">${adminsVO.admin_dutydate}</div>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<div class="h5 text-gray">在職狀態:</div>
											<div class="h3 text-dark">${adminsVO.admin_jobstate == 1?"在職":"離職"}</div>
										</div>
									</div>
								</div>
								<hr>
								<div class="row h4 text-dark">
									<div class="col-md-6">
										<div class="form-group">
											<div class="h5 text-gray">地址:</div>
											<div class="h3 text-dark">${adminsVO.admin_address}</div>

										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<div class="h5 text-gray">權限:</div>
											<div class="form-group h3 text-dark">
												<c:forEach var="permissiondelimitVO"
													items="${permissiondelimitVO}">${permissiondelimitVO.per_name} <br>
		                                        </c:forEach>
											</div>
										</div>
									</div>
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
