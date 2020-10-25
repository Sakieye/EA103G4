<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.order.model.*"%>

<%
	OrderVO odVO = (OrderVO) request.getAttribute("odVO");
%>
<!DOCTYPE html>
<html>

<head>
<title>部客匣管理後台</title>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/main-back.css" />
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap.min.css">
	<!-- 自訂css -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/od_management.css" />


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
								<h3>│客服訂單</h3>
								<c:if test="${not empty errorMsgs}">
									<ul>
										<font style="color: red">▲Error： </font>
										<c:forEach var="message" items="${errorMsgs}">
											<li style="color: black">${message}</li>
										</c:forEach>
									</ul>
								</c:if>
								<hr>
								<FORM class="form-inline" METHOD="post" ACTION=""></FORM>
								<FORM class="form-inline" METHOD="post" ACTION=""></FORM>
								<FORM class="form-inline" METHOD="post" ACTION=""></FORM>

								<FORM class="form-inline" METHOD="post"
									ACTION="<%=request.getContextPath()%>/order/order.do">
									<input class="form-control mr-sm-2" type="text"
										placeholder="輸入訂單編號 (共12碼)" aria-label="Search" name=order_id>
									<input type="hidden" name="action" value="selOneOd">
									<button class="btn btn-sm btn-outline-secondary" type="submit">開始查詢</button>
								</FORM>

								<a>│</a>

								<FORM class="form-inline" METHOD="post"
									ACTION="listAll_order.jsp">
									<jsp:useBean id="odSvc" scope="page"
										class="com.order.model.OrderService" />
									<button class="btn btn-sm btn-outline-secondary" type="submit">總覽</button>
								</FORM>

								<a>│</a>

								<FORM class="form-inline" METHOD="post"
									ACTION="create_order.jsp">
									<button class="btn btn-sm btn-outline-secondary" type="submit">客服新增</button>
								</FORM>
								
							</nav>
						</div>
					</div>
				</div>
				<hr size="10px" align="center" width="100%">

				<!-- 新增訂單 -->
				
				<FORM METHOD="post" ACTION="order.do" id="form1" name="form1">
					<table id="create" style="width: auto">
						<tr>
							<td>會員ID:</td>
							<td><input required type="TEXT" name="mem_id" size="50"
								value="<%=(odVO == null) ? "M006" : odVO.getMem_id()%>" /></td>
						</tr>
						<tr>
							<td>收件人:</td>
							<td><input required type="TEXT" name="rec_name" size="50"
								value="<%=(odVO == null) ? "CLIFF" : odVO.getRec_name()%>" /></td>
						</tr>
						<tr>
							<td>收件人電話:</td>
							<td><input required type="TEL" name="rec_tel" size="50"
								value="<%=(odVO == null) ? "0981375666" : odVO.getRec_tel()%>" /></td>
						</tr>
						<tr>
							<td>收件人地址:</td>
							<td><input required type="TEXT" name="rec_add" size="50"
								value="<%=(odVO == null) ? "高雄市鳳山區" : odVO.getRec_add()%>" /></td>
						</tr>
						<tr>
							<td>訂單總數:</td>
							<td><input required type="TEXT" name="order_qty" size="50"
								value="<%=(odVO == null) ? "0" : odVO.getOrder_qty()%>" /></td>
						</tr>
						<tr>
							<td>訂單金額:</td>
							<td><input required type="TEXT" name="order_total" size="50"
								value="<%=(odVO == null) ? "0" : odVO.getOrder_total()%>" /></td>
						</tr>

						<tr>
							<td>付款方式(請填數字):<br> 1-信用卡 2-貨到付款
							</td>
							<td><input required type="TEXT" name="order_pay" size="50"
								value="<%=(odVO == null) ? "1" : odVO.getOrder_pay()%>" /></td>
						</tr>
						<tr>
							<td>收件方式(請填數字):<br> 1-超取 2-宅配
							</td>
							<td><input required type="TEXT" name="delivery" size="50"
								value="<%=(odVO == null) ? "1" : odVO.getDelivery()%>" /></td>
						</tr>
						<tr>
							<td>獲得紅利:</td>
							<td><input type="TEXT" name="get_bonus" size="50"
								value="<%=(odVO == null) ? "0" : odVO.getGet_bonus()%>" /></td>
						</tr>
						<tr>
							<td>紅利折抵:</td>
							<td><input type="TEXT" name="use_bonus" size="50"
								value="<%=(odVO == null) ? "0" : odVO.getUse_bonus()%>" /></td>
						</tr>
						<tr>
							<td>備註:</td>
							<td><input type="TEXT" name="mem_note" size="50"
								value="<%=(odVO == null) ? "從網頁新增" : odVO.getMem_note()%>" /></td>
						</tr>
					</table>
					<br> <input type="hidden" name="action" value="insert">
					<input class="btn btn-sm btn-outline-secondary" type="submit" value="確定新增">
				</FORM>


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