<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.order.model.*"%>
<%@ page import="com.detail.model.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.mem.model.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<%
	OrderVO odVO = (OrderVO) request.getAttribute("odVO");
	DetailService dtSvc = new DetailService();
	List<DetailVO> dtSvcVO = dtSvc.getOneOd(odVO.getOrder_id());
	pageContext.setAttribute("dtSvcVO", dtSvcVO);

	MemService memSvc = new MemService();
	MemVO memSvcVO = memSvc.getOneMem(odVO.getMem_id());
	pageContext.setAttribute("memSvcVO", memSvcVO);
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


<body style="background-color: #EEDCD9;">
	<jsp:include page="/back-end/header/header.jsp" />
	<div id="container">
		<main id="center" class="column">
			<div class="container-fluid">
				<div class="row">
					<div class="col-12 col-md-12">

						<!-- 訂單管理 -->

						<div class="container-fluid">
							<nav class="navbar navbar-light bg-light">
								<h3>│單筆查詢</h3>
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
									ACTION="<%=request.getContextPath()%>/back-end/order/order.do">
									<input class="form-control mr-sm-2" type="text"
										placeholder="輸入訂單編號 (共12碼)" aria-label="Search" name=order_id>
									<input type="hidden" name="action" value="selOneOd">
									<button class="btn btn-sm btn-outline-secondary" type="submit">開始查詢</button>
								</FORM>

								<a>│</a>

								<FORM class="form-inline" METHOD="post"
									ACTION="listAll_order.jsp">
									<button class="btn btn-sm btn-outline-secondary" type="submit">總覽</button>
								</FORM>

								<a>│</a>

								<FORM class="form-inline" METHOD="post"
									ACTION="create_order.jsp">
									<button class="btn btn-sm btn-outline-secondary" type="submit">客服新增</button>
								</FORM>
							</nav>



							<!-- 單筆訂單總覽 -->
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
													<h5>訂單明細</h5>
												</div>

											</div>

											<!-- 訂單資訊 -->
											<div class="divTableRow">
												<div class="divTableCell">${odVO.order_id}</div>
												<div class="divTableCell">${memSvcVO.mem_id}&nbsp;${memSvcVO.mem_name}</div>
												<div class="divTableCell">
													<fmt:formatDate value="${odVO.order_date}"
														pattern="yyyy-MM-dd HH:mm:ss" />
												</div>
												<div class="divTableCell">${odVO.order_qty}</div>
												<div class="divTableCell">${odVO.use_bonus}點</div>
												<div class="divTableCell">TWD$&nbsp;${odVO.order_total}</div>
												<c:choose>
													<c:when test="${odVO.order_pay==1}">
														<div class="divTableCell">信用卡</div>
													</c:when>
													<c:when test="${odVO.order_pay==2}">
														<div class="divTableCell">貨到付款</div>
													</c:when>
													<c:otherwise>
														<div class="divTableCell">請洽客服</div>
													</c:otherwise>
												</c:choose>
												<c:choose>
													<c:when test="${odVO.delivery==1}">
														<div class="divTableCell">超商取貨</div>
													</c:when>
													<c:when test="${odVO.delivery==2}">
														<div class="divTableCell">宅配</div>
													</c:when>
												</c:choose>

												<c:choose>
													<c:when test="${odVO.order_status==1}">
														<div class="divTableCell">訂單成立</div>
													</c:when>
													<c:when test="${odVO.order_status==2}">
														<div class="divTableCell">已出貨</div>
													</c:when>
													<c:when test="${odVO.order_status==3}">
														<div class="divTableCell">商品已送達</div>
													</c:when>
													<c:when test="${odVO.order_status==4}">
														<div class="divTableCell">訂單取消</div>
													</c:when>
													<c:otherwise>
														<div class="divTableCell">請洽客服</div>
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
												<div class="divTableCell">
													<button class="btn btn-link btn-block text-left"
														type="button" data-toggle="collapse"
														data-target="#collapseOne" aria-expanded="true"
														aria-controls="collapseOne" id="cardBtn"
														style="outline: none;">按我</button>
												</div>
												<hr size="10px" align="center" width="100%">
											</div>
										</div>
									</div>
									<div class="divTable">
										<div class="divTableBody" style="float: left;">
											<div class="divTableCell">
												&nbsp;&nbsp;&nbsp;&nbsp;收件資訊>>&nbsp;&nbsp;#Name：${odVO.rec_name}&nbsp;#Phone：${odVO.rec_tel}&nbsp;#Address：${odVO.rec_add}</div>
										</div>
									</div>


									<!-- 訂單明細 -->
									<div id="collapseOne" class="collapse show"
										aria-labelledby="headingOne" data-parent="#accordionExample">
										<div class="card-body">
											<div class="orderDT">
												<div class="orderDTBody">
													<div class="orderDTRow">
														<div class="orderDTCell" id="thDT">明細編號</div>
														<div class="orderDTCell" id="thDT">商品名稱(貨號)</div>
														<div class="orderDTCell" id="thDT">數量</div>
														<div class="orderDTCell" id="thDT">單價小計</div>
														<div class="orderDTCell" id="thDT">紅利</div>
													</div>
													<c:set var="count" scope="session" />
													<c:forEach var="detail" items="${dtSvcVO}"
														varStatus="detailstatus">
														<div class="orderDTRow">
															<div class="orderDTCell">${count=count+1}</div>
															<div class="orderDTCell" style="text-align: left;">${detail.items_name}(${detail.book_id})</div>
															<div class="orderDTCell">${detail.comm_qty}</div>
															<div class="orderDTCell">${detail.comm_price}</div>
															<div class="orderDTCell">+ ${detail.comm_bonus}</div>
														</div>
													</c:forEach>
												</div>
												<div class="orderDTBody">
													<div class="orderDTRow" style="border: 0px solid #8F9F9F;"></div>
													<div class="orderDTCell" style="border: 0px solid #8F9F9F;"></div>
													<div class="orderDTCell" style="border: 0px solid #8F9F9F;"></div>
													<div class="orderDTCell" style="border: 0px solid #8F9F9F;"></div>
													<div class="orderDTCell" style="border: 0px solid #8F9F9F;"></div>
													<div class="orderDTCell"
														style="border: 0px solid #8F9F9F; float: right;">
														<FORM METHOD="post" ACTION="order.do"
															class="btn btn-sm btn-outline-secondary">
															<input type="submit" value="修改訂單" style="outline: none;">
															<input type="hidden" name="order_id"
																value="${odVO.order_id}" /> <input type="hidden"
																name="action" value="getupdate" />
														</FORM>

														<FORM METHOD="post" ACTION="order.do"
															class="btn btn-sm btn-outline-secondary">
															<input type="submit" value="取消訂單" style="outline: none;">
															<input type="hidden" name="order_id"
																value="${odVO.order_id}"> <input type="hidden"
																name="action" value="getcancel">
														</FORM>
													</div>
												</div>
											</div>
										</div>
									</div>
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
	</script>

</body>
</html>