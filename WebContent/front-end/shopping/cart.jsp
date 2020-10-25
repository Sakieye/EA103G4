<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.shping.model.*"%>
<%@ page import="com.mem.model.*"%>

<!DOCTYPE html>
<html>
<head>
<title>我的部客匣購物車</title>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- 	購物車每分鐘刷新一次 -->
<meta http-equiv="refresh" content="60">



<link rel="stylesheet" href="<%= request.getContextPath()%>/css/main-front.css" />
<link rel="stylesheet" href="<%= request.getContextPath()%>/css/header.css" />
<!--書城首頁CSS-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bookshop-eshop-index.css" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<!--商品展示Slider CSS與字體-->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/product-slider.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+JP:wght@500;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bookshop_index.css" />
<!--Header購物車、次Header搜尋欄-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header-front-with-cart-and-search.css">
<!--下拉式書籍類別選單-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/sm-core-css.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/sm-clean.css">



</head>

<body style="background-color: #EBE5D9;">
<%-- 	統一版<jsp:include page="/front-end/header/header.jsp" /> --%>
	<jsp:include page="/front-end/header/header-with-cart.jsp" />
	<section id="One" class="wrapper style4">
	<!-- Eshop Header -->
	<div id="logoDiv">
		<%@include file="/front-end/header/eshop-header.jsp"%>
	</div>

	<div class="container">
		<main id="center" class="column">
			<div class="container-fluid">
				<div class="row">
					<!-- multistep form -->
					<div class=" col-md-12" id="main_in">

						<div class="container-fluid">
							<nav class="navbar navbar-light bg-light">
								<h2><font>│ 購 物 車</font></h2>

								<hr size="10px" align="center" width="100%">

								<%
									@SuppressWarnings("unchecked")
									List<Cart> cartlist = (Vector<Cart>) session.getAttribute("shpingcart");
									String[] totalPrice = (String[]) session.getAttribute("getTotal");
									pageContext.setAttribute("totalPrice", totalPrice);
									pageContext.setAttribute("cartlist", cartlist);
									MemVO memVO = (MemVO)session.getAttribute("memVO");
								%>
									
								<%	
									if (cartlist != null && cartlist.size() > 0) {
								%>
								<c:set var="count" scope="session"/>

								<table class="cartprd">
									
									<c:forEach var="cart" items="${cartlist}"
										varStatus="cartstatus" >
										
										<tr >
											<!--項目 -->
											<td style="vertical-align:middle;"><h5>${count=count+1}</h5></td>
											<!--商品圖 -->
											<td id="imgTd" style="vertical-align:middle;">
									<img class="prdimgTd" alt="404 NOT FOUND"
										src="${pageContext.request.contextPath}/ShowBookPic?bookID=${cart.book_Id}">
								</td>
											<!--ISBN -->
											<td style="vertical-align:middle;">
												<h6>ISBN：${cart.isbn}</h6> 
												<!--商品名稱  -->
												<h5>${cart.book_Name}</h5> 
											<!--購買數量  -->
											<td style="vertical-align:middle;"><h5>${cart.comm_Qty}本</h5></td>
											<!--價錢小計  -->
											<td style="vertical-align:middle;"><h5>
													TWD$
													<fmt:formatNumber type="number"
														value="${cart.price*cart.comm_Qty}" maxFractionDigits="0" />
												</h5></td>
											<!--單項獲得紅利  -->
											<td style="vertical-align:middle;"><h5>+ 
											<fmt:formatNumber type="number"
																value="${cart.book_BP*cart.comm_Qty}"
																maxFractionDigits="0" />點</h5></td>
																
											<!--刪除商品  -->
											<td style="vertical-align:middle;"><div class="cardright">
													<FORM class="form-inline" name="delFrom" method="POST"
														action="<%=request.getContextPath()%>/Shopping.html">
														<input type="hidden" name="action" value="DEL"> <input
															type="hidden" name="del" value="${cartstatus.index}">
														<button class="btn btn-sm btn-outline-secondary"
															type="submit" style="width: 25px; height: 25px;">X</button>
													</FORM>
												</div></td>
										</tr>

									</c:forEach>
								</table>
									<div id=chelisBtn>
										<button class="btn btn-sm btn-outline-secondary"
											onClick="href='${pageContext.request.contextPath}/front-end/bookshop-eshop/index.jsp'">繼續選購</button>
									</div>
									<div id=chelisInf>
										<p>
											總金額(活動優惠已折扣)：<span id="prdtotal">${totalPrice[0]}</span>
										</p>
									</div>
									<!-- 結帳 -->
									<div id=chelisBtn>
										<FORM class="form-inline" name="checkFrom" method="POST"
											action="<%=request.getContextPath()%>/Shopping.html">
											<!-- 訂單資訊 -->
											
											<input type="hidden" name="action" value="PAYCHECK">
												
											<button class="btn btn-sm btn-outline-secondary"
												type="submit">下一步</button>
										</FORM>
									</div>


								<%
									} else {
								%>
								<a style="color: #668787; font-size: 20px; text-aglin: center;">
								<c:out value="購物車空空der...與您的腦一樣ＱＱ" /></a>
								<div style="height:80%; width:100%;"></div>
								
								
								<%} %>
							</nav>
						</div>
					</div>
				</div>
				</div>
		</main>
	</div>
	</section>
	<script
		src="<%=request.getContextPath()%>/js/stopExecutionOnTimeout.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.easing.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/js/jquery.datetimepicker.full.js"></script>


</body>
<jsp:include page="/front-end/footer/footer.jsp" />
</html>