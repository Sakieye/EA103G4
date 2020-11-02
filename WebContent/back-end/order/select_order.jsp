<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<title>部客匣管理後台</title>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- 自訂css -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/od_management.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/main-back.css" />
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap.min.css">


<style>
.cover {
	width: 100px;
	height: 100px;
}
</style>
</head>


<body>
	<jsp:include page="/back-end/header/header.jsp" />
	<div id="container">
		<main id="center" class="column">
			<div class="container-fluid">
				<div class="row">
					<div class="col-12 col-md-12">

						<!-- 訂單管理 -->
						<div class="container-fluid">
							<nav class="navbar navbar-light bg-light">
								<h3>│訂單管理</h3>
								<c:if test="${not empty errorMsgs}">
									<ul>
									<font style="color: red">▲Error： </font>
										<c:forEach var="message" items="${errorMsgs}">
											<li style="color: black">${message}</li>
										</c:forEach>
									</ul>
								</c:if>
								<hr>

								<FORM class="form-inline" METHOD="post" ACTION="<%=request.getContextPath()%>/order/order.do">
									<input class="form-control mr-sm-2" type="text" placeholder="輸入訂單編號 (共12碼)" aria-label="Search" name=order_id>
									<input type="hidden" name="action" value="selOneOd">
									<button class="btn btn-sm btn-outline-secondary" type="submit">開始查詢</button>
								</FORM>
								
								<a>│</a>
								
								<FORM class="form-inline" METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/order/listAll_order.jsp">
									<jsp:useBean id="odSvc" scope="page" class="com.order.model.OrderService" />
									<button class="btn btn-sm btn-outline-secondary" type="submit">總覽</button>
								</FORM>

								<a>│</a>

								<FORM class="form-inline" METHOD="post"
									ACTION="<%=request.getContextPath()%>/back-end/order/create_order.jsp">
									<button class="btn btn-sm btn-outline-secondary" type="submit">客服新增</button>
								</FORM>
							</nav>
						</div>
					</div>
				</div>
				<hr size="10px" align="center" width="100%">
				
			</div>
		</main>

		<jsp:include page="/back-end/sidebar/sidebar.jsp" />

	</div>

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/popper.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
	<script>
		$(function() {
			var len = 15; // 超過50個字以"..."取代
			$(".JQellipsis").each(function(i) {
				if ($(this).text().length > len) {
					$(this).attr("title", $(this).text());
					var text = $(this).text().substring(0, len - 1) + "...";
					$(this).text(text);
				}
			});
		});
	</script>

</body>
</html>