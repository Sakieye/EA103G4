<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.categorie.model.*"%>

<%
	CategorieVO categorieVO = (CategorieVO) request.getAttribute("categorieVO");
%>
<!DOCTYPE html>
<html>

<head>
<!-- Basic Page Info -->
<meta charset="utf-8">
<title>類別新增</title>
<!-- Mobile Specific Metas -->

<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<!-- CSS -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/vendors/styles/core.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/vendors/styles/icon-font.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/src/plugins/jquery-steps/jquery.steps.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/vendors/styles/style.css">

<style>
.main-container {
	padding: 80px 30px 100px 270px
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
</head>

<body>
	<jsp:include page="/back-end/header/header.jsp" />
	<div class="main-container">
		<div class="pd-ltr-20 xs-pd-20-10">
			<div class="min-height-200px">
				<div class="pd-20 card-box mb-30">

					<div class="clearfix">
						<h2 class="text-dark h2">新增類別資料</h2>
						<a href="<%=request.getContextPath()%>/back-end/categorie/listAllCategorie.jsp">回列表 <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-plus-circle" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  								<path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
  								<path fill-rule="evenodd" d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z" />
							</svg>
						</a>
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

					<form method="post" action="<%=request.getContextPath()%>/back-end/categorie/categorie.do" name="form1">
						<section>

							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label><font color=red><b>*</b></font>類別名稱:</label> <input type="text" class="form-control" name="lc_class_name" value="<%=(categorieVO == null) ? "測試類別" : categorieVO.getLc_class_name()%>" required="required" />
									</div>
								</div>
							</div>

							<div class="row">
								<input type="hidden" name="action" value="insert"> <input type="hidden" name="lc_class_id" value="${categorieVO.lc_class_id}"> <input type="submit" value="送出" class="btn btn-dark btn-sm">
							</div>

						</section>
					</form>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/back-end/sidebar/sidebar.jsp" />

	<!-- 自訂js -->
	<!-- js -->

	<script src="<%=request.getContextPath()%>/vendors/scripts/core.js"></script>
	<script src="<%=request.getContextPath()%>/vendors/scripts/script.min.js"></script>
	<script src="<%=request.getContextPath()%>/vendors/scripts/process.js"></script>
	<script src="<%=request.getContextPath()%>/vendors/scripts/layout-settings.js"></script>
	<script src="<%=request.getContextPath()%>/src/plugins/jquery-steps/jquery.steps.js"></script>
	<script src="<%=request.getContextPath()%>/vendors/scripts/steps-setting.js"></script>

</body>

</html>