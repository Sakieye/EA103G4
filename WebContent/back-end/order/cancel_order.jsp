<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.order.model.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
								<h3>│訂單刪除</h3>
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

								<FORM class="form-inline" METHOD="post"
									ACTION="<%=request.getContextPath()%>/back-end/order/listAll_order.jsp">
									<jsp:useBean id="odSvc" scope="page"
										class="com.order.model.OrderService" />
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

				<!-- 客服取消訂單 -->


				<FORM METHOD="post" ACTION="order.do" id="form1" name="form1">
					<table>
						<tr>
							<th>訂單編號</th>
							<th>會員編號</th>
							<th>收件人姓名</th>
							<th>收件人電話</th>
							<th>收件人地址</th>
							<th>訂單日期</th>
							<th>訂購數量</th>
							<th>訂單總額</th>
							<th>付款方式<br>(請填數字)
							</th>
							<th>配送方式<br>(請填數字)
							</th>
							<th>紅利總計</th>
							<th>紅利折抵</th>
							<th>訂單狀態<br>(請填數字)
							</th>
							<th>備註</th>
							<th>更改完成</th>
						</tr>

						<tr>
							<td>${odVO.order_id}</td>
							<td>${odVO.mem_id}</td>
							<td>${odVO.rec_name}</td>
							<td>${odVO.rec_tel}</td>
							<td>${odVO.rec_add}</td>
							<td><fmt:formatDate value="${odVO.order_date}"
									pattern="yyyy-MM-dd HH:mm:ss" /></td>
							<td>${odVO.order_qty}</td>
							<td>${odVO.order_total}</td>
							<c:choose>
								<c:when test="${odVO.order_pay==1}">
									<td>信用卡</td>
								</c:when>
								<c:when test="${odVO.order_pay==2}">
									<td>貨到付款</td>
								</c:when>
								<c:otherwise>
									<td>無</td>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${odVO.delivery==1}">
									<td>超商取貨</td>
								</c:when>
								<c:when test="${odVO.delivery==2}">
									<td>宅配</td>
								</c:when>
							</c:choose>
							<td>${odVO.get_bonus}</td>
							<td>${odVO.use_bonus}</td>
							<c:choose>
								<c:when test="${odVO.order_status==1}">
									<td>訂單成立</td>
								</c:when>
								<c:when test="${odVO.order_status==2}">
									<td>已出貨</td>
								</c:when>
								<c:when test="${odVO.order_status==3}">
									<td>商品已送達</td>
								</c:when>
								<c:when test="${odVO.order_status==4}">
									<td>訂單取消</td>
								</c:when>
								<c:otherwise>
									<td>請洽客服</td>
								</c:otherwise>
							</c:choose>
							<td>${odVO.mem_note}</td>
						</tr>
					</table>
					<input type="hidden" name="action" value="cancel">
					<input type="hidden" name="order_id" value="${odVO.order_id}">
					<input type="submit" id="cancel" class="btn btn-sm btn-outline-secondary" value="執行取消">
					
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