<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
								<h3>│訂單修改及更新</h3>
								<c:if test="${not empty errorMsgs}">
									<ul>
										<font style="color: red">▲Error： </font>
										<c:forEach var="message" items="${errorMsgs}">
											<li style="color: black">${message}</li>
										</c:forEach>
									</ul>
								</c:if>
								<hr>

								<FORM class="form-inline" METHOD="post"
									ACTION="<%=request.getContextPath()%>/order/order.do">
									<input class="form-control mr-sm-2" type="text"
										placeholder="輸入訂單編號 (共12碼)" aria-label="Search" name=order_id>
									<input type="hidden" name="action" value="selOneOd">
									<button class="btn btn-sm btn-outline-secondary" type="submit">開始查詢</button>
								</FORM>

								<a>│</a>

								<FORM class="form-inline" METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/order/listAll_order.jsp">
									<jsp:useBean id="odSvc" scope="page" class="com.order.model.OrderService" />
									<button class="btn btn-sm btn-outline-secondary" type="submit">總覽</button>
								</FORM>

								<a>│</a>

								<FORM class="form-inline" METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/order/create_order.jsp">
									<button class="btn btn-sm btn-outline-secondary" type="submit">客服新增</button>
								</FORM>

							</nav>
						</div>
					</div>
				</div>
				<hr size="10px" align="center" width="100%">

				<!-- 更新訂單 -->

				<FORM METHOD="post" ACTION="order.do" id="form1" name="form1">
					<table>
						<tr>
							<th>訂單編號：</th>
							<td>${odVO.order_id}</td>
						</tr>
						<tr>
							<th>會員編號：</th>
							<td>${odVO.mem_id}</td>
						</tr>
						<tr>
							<th>收件人姓名：</th>
							<td><input type="TEXT" name="rec_name" size="10"
								value="${odVO.rec_name}" /></td>
						</tr>
						<tr>
							<th>收件人電話：</th>
							<td><input type="TEXT" name="rec_tel" size="10"
								value="${odVO.rec_tel}" /></td>
						</tr>
						<tr>
							<th>收件人地址：</th>
							<td><input type="TEXT" name="rec_add" size="50"
								value="${odVO.rec_add}" /></td>
						</tr>
						<tr>
							<th>訂單日期：</th>
							<td><fmt:formatDate value="${odVO.order_date}"
									pattern="yyyy-MM-dd HH:mm:ss" /></td>
						</tr>
						<tr>
							<th>訂購數量：</th>
							<td>${odVO.order_qty}</td>
						</tr>
						<tr>
							<th>訂單總額：</th>
							<td>${odVO.order_total}</td>
						</tr>
						<tr>
							<th>付款方式(填數字)：</th>
							<td><input type="TEXT" name="order_pay" size="1"
								value="${odVO.order_pay}" />註：1-信用卡、2-貨到付款(現金)</td>
						</tr>
						<tr>
							<th>配送方式(填數字)：</th>
							<td><input type="TEXT" name="delivery" size="1"
								value="${odVO.delivery}" />註：1-超商取貨、2-宅配</td>
						</tr>
						<tr>
							<th>紅利總計：</th>
							<td>${odVO.get_bonus}</td>
						</tr>
						<tr>
							<th>紅利折抵：</th>
							<td>${odVO.use_bonus}</td>
						</tr>
						<tr>
							<th>訂單狀態(填數字)：</th>
							<td><input type="TEXT" name="order_status" size="1"
								value="${odVO.order_status}" />註：1-訂單成立、2-已出貨、 3-已到貨、 4-取消訂單</td>
						</tr>
						<tr>
							<th>備註：</th>
							<td><input type="TEXT" name="mem_note" size="50" maxlength="50"
								value="${odVO.mem_note}" autocomplete="off" /></td>
						</tr>
					</table>
					<input type="hidden" name="action" value="update">
					<input type="hidden" name="order_id" value="${odVO.order_id}">
					<input class="btn btn-sm btn-outline-secondary" type="submit"
						value="執行修改">
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