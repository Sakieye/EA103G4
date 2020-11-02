<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.order.model.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.detail.model.*"%>
<%@ page import="com.mem.model.*"%>


<%
	OrderService odSvc = new OrderService();
	List<OrderVO> list = odSvc.getAll();
	pageContext.setAttribute("list", list);

	DetailService dtSvc = new DetailService();

	MemService memSvc = new MemService();
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
								<h3>│訂單總覽</h3>
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
									<button class="btn btn-sm btn-outline-secondary" type="submit">總覽</button>
								</FORM>

								<a>│</a>

								<FORM class="form-inline" METHOD="post"
									ACTION="<%=request.getContextPath()%>/back-end/order/create_order.jsp">
									<button class="btn btn-sm btn-outline-secondary" type="submit">客服新增</button>
								</FORM>
							</nav>

							<!-- 多筆訂單總覽 -->
							<div class="accordion" id="accordionExample">
								<!-- 標題 -->
								<div class="card">
									<div class="divTable">
										<div class="divTableBody">
											<div class="divTableRow">
												<div class="divTableCell" id="order_TH">
													<h5>訂單編號</h5>
												</div>
												<div class="divTableCell" id="order_TH">
													<h5>會員</h5>
												</div>
												<div class="divTableCell" id="order_TH">
													<h5>訂單日期</h5>
												</div>
												<div class="divTableCell" id="order_TH">
													<h5>訂購總項</h5>
												</div>
												<div class="divTableCell" id="order_TH">
													<h5>紅利折抵</h5>
												</div>
												<div class="divTableCell" id="order_TH">
													<h5>訂單總額</h5>
												</div>
												<div class="divTableCell" id="order_TH">
													<h5>付款方式</h5>
												</div>
												<div class="divTableCell" id="order_TH">
													<h5>配送方式</h5>
												</div>
												<div class="divTableCell" id="order_TH">
													<h5>訂單狀態</h5>
												</div>
												<div class="divTableCell" id="order_TH">
													<h5>備註</h5>
												</div>
												<div class="divTableCell" id="order_TH">
													<h5>快速出貨</h5>
												</div>

											</div>
										</div>
									</div>

									<!-- 訂單資訊 -->
									<c:forEach var="odVO" items="${list}">
										<div class="divTable">
											<div class="divTableBody">
												<div class="divTableRow">
													<div class="divTableCell" style="width: 114px;">
													<FORM class="form-inline" METHOD="post" ACTION="<%=request.getContextPath()%>/order/order.do"> 
													<b>
													<button type="submit" name="order_id" value="${odVO.order_id}" style="background-color: transparent; border:0px; color:#337CFC">${odVO.order_id}</button>
													</b>
													<input type="hidden" name="action" value="selOneOd">
													</FORM>
													</div>
													<div class="divTableCell" style="width: 122px;">${odVO.mem_id}&nbsp;${memSvcVO.mem_name}</div>
													<div class="divTableCell" style="width: 127px;">
														<fmt:formatDate value="${odVO.order_date}"
															pattern="yyyy-MM-dd HH:mm:ss" />
													</div>
													<div class="divTableCell" style="width: 185px;">${odVO.order_qty}</div>
													<div class="divTableCell" style="width: 146px;">${odVO.use_bonus}點</div>
													<div class="divTableCell" style="width: 159px;">TWD$&nbsp;${odVO.order_total}</div>
													<c:choose>
														<c:when test="${odVO.order_pay==1}">
															<div class="divTableCell" style="width: 140px;">信用卡</div>
														</c:when>
														<c:when test="${odVO.order_pay==2}">
															<div class="divTableCell" style="width: 140px;">貨到付款</div>
														</c:when>
														<c:otherwise>
															<div class="divTableCell" style="width: 140px;">請洽客服</div>
														</c:otherwise>
													</c:choose>
													<c:choose>
														<c:when test="${odVO.delivery==1}">
															<div class="divTableCell" style="width: 158px;">超商取貨</div>
														</c:when>
														<c:when test="${odVO.delivery==2}">
															<div class="divTableCell" style="width: 158px;">宅配</div>
														</c:when>
													</c:choose>

													<c:choose>
														<c:when test="${odVO.order_status==1}">
															<div class="divTableCell" style="width: 166px;">訂單成立</div>
														</c:when>
														<c:when test="${odVO.order_status==2}">
															<div class="divTableCell" style="width: 166px;">已出貨</div>
														</c:when>
														<c:when test="${odVO.order_status==3}">
															<div class="divTableCell" style="width: 166px;">商品已送達</div>
														</c:when>
														<c:when test="${odVO.order_status==4}">
															<div class="divTableCell" style="width: 166px;">訂單取消</div>
														</c:when>
														<c:otherwise>
															<div class="divTableCell" style="width: 166px;">請洽客服</div>
														</c:otherwise>
													</c:choose>
													<c:choose>
														<c:when test="${odVO.mem_note==null}">
															<div class="divTableCell">無</div>
														</c:when>
														<c:when test="${odVO.mem_note!=null}">
															<div class="divTableCell">${odVO.mem_note}</div>
														</c:when>
													</c:choose>
													<div class="divTableCell" style="width: 111px;">
													<FORM class="form-inline" METHOD="post" ACTION="<%=request.getContextPath()%>/order/order.do">
														<input type="hidden" name=order_id value="${odVO.order_id}">
														<input type="hidden" name="action" value="shipment">
														<button class="btn btn-sm btn-outline-secondary ${odVO.order_status}" type="submit" disabled="disabled">出貨</button>
													</FORM>
													</div>
												</div>
											</div>
										</div>
										<div class="divTable">
											<div class="divTableBody" style="float: left;">
												<div class="divTableRow">
													<div class="divTableCell" style="background-color: #353C42;color: #FFF;">收件資訊</div>
													<div class="divTableCell"></div>
													<div class="divTableCell">收件人：</div>
													<div class="divTableCell">${odVO.rec_name}</div>
													<div class="divTableCell"></div>
													<div class="divTableCell">電話：</div>
													<div class="divTableCell">${odVO.rec_tel}</div>
													<div class="divTableCell"></div>
													<div class="divTableCell">地址：</div>
													<div class="divTableCell">${odVO.rec_add}</div>
												</div>
											</div>
										</div>
										<hr size="10px" align="center" width="100%">
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
				</div>
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
		
		/*============================================================================*/
		
		$('.1').prop('disabled',false);
	</script>

</body>
</html>