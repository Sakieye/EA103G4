<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.shping.model.*"%>

<!DOCTYPE html>
<html>
<head>
<title>我的部客匣購物車</title>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- 	購物車每分鐘刷新一次 -->
<meta http-equiv="refresh" content="60">


<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/main-front.css" />
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bookshop_index.css" />

<script>
	window.console = window.console || function(t) {
	};
</script>
<script>
	if (document.location.search.match(/type=embed/gi)) {
		window.parent.postMessage("resize", "*");
	}
</script>

</head>

<body translate="no" class="subpage" style="background-color: #EBE5D9;">
	<jsp:include page="/front-end/header/header.jsp" />


	<div class="container">
		<main id="center" class="column">
			<div class="container-fluid">
				<div class="row">
					<!-- multistep form -->
					<div class=" col-md-12" id="main_in">

						<div class="container-fluid">
							<nav class="navbar navbar-light bg-light">
								<font>│ 鑲 金 購 物 車</font>

								<hr size="10px" align="center" width="100%">

								<%
									@SuppressWarnings("unchecked")
									List<Cart> cartlist = (Vector<Cart>) session.getAttribute("shpingcart");
									String totalPrice = (String) session.getAttribute("getTotal");
									pageContext.setAttribute("cartlist", cartlist);

									if (cartlist != null && cartlist.size() > 0) {
								%>


								<table class="cartprd">

									<c:forEach var="cart" items="${cartlist}"
										varStatus="cartstatus">
										<tr>
											<td><h5>${cartstatus.index}</h5></td>
											<td>商品圖</td>
											<td><h6>ISBN：${cart.isbn}</h6>
												<h3>${cart.book_Name}</h3>
												<h6>${cart.publisher_Id}</h6></td>
											<td><h5>${cart.order_Qty}個</h5></td>
											<td><h5>
													$
													<fmt:formatNumber type="number"
														value="${cart.price*cart.order_Qty}" maxFractionDigits="0" />
												</h5></td>
											<td><h5>${cart.book_BP}</h5></td>
											<td><div class="cardright">
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
								<hr size="10px" align="center" width="100%">
								<div class="checklist">
											<p>商品總金額：<span id="prdtotal"><%=totalPrice%></span></p>
											<p>折抵紅利：<input
											type="number" id="use_Bonus" step="5" min="0" max="10000"
											value="10" style="width: 80px; height: 30px;"></p>
											<p>
												結帳總金額：$<span id="total">${sessionScope.getTotal}</span>
											</p>
										

										<FORM class="form-inline" name="checkFrom" method="POST"
											action="<%=request.getContextPath()%>/Shopping.html">
											<input type="hidden" name="isbn" value="${cart.isbn}">
											<input type="hidden" name="book_Name" value="${cart.book_Name}">
											<input type="hidden" name="pay" value="${cartstatus.index}">
											<input type="hidden" name="action" value="PAY">
											<button class="btn btn-sm btn-outline-secondary"
												type="submit">下一步</button>
										</FORM>
								</div>
						</div>


						<%
							} else {
						%>
						<a style="color: #668787; font-size: 20px; text-aglin: center;"><c:out
								value="購物車空空der...與您的腦一樣ＱＱ" /></a>
						<%
							}
						%>
						</nav>
					</div>
				</div>
			</div>
		</main>
	</div>
	<%-- 	<jsp:include page="/front-end/footer/footer.jsp" /> --%>
	<script
		src="<%=request.getContextPath()%>/js/stopExecutionOnTimeout.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.easing.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/js/jquery.datetimepicker.full.js"></script>
	

</body>
</html>