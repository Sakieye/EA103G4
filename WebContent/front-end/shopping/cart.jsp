<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.shping.model.*"%>
<%@ page import="com.mem.model.*"%>

<%
	@SuppressWarnings("unchecked")
	List<Cart> cartlist = (Vector<Cart>) session.getAttribute("shpingcart");
	String[] totalPrice = (String[]) session.getAttribute("getTotal");
	pageContext.setAttribute("totalPrice", totalPrice);
	pageContext.setAttribute("cartlist", cartlist);
	MemVO memVO = (MemVO)session.getAttribute("memVO");
%>

<!DOCTYPE html>
<html>
<head>
<title>我的部客匣購物車</title>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- 	購物車每分鐘刷新一次 -->
<meta http-equiv="refresh" content="1800">


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
<!-- jQuery AutoCompelete -->
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-ui.css">
<script src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.auto-complete.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery.auto-complete.css" />

<!--===============================================================================================-->	
	<link rel="icon" type="image/cliff/png" href="<%=request.getContextPath()%>/image/cliff/icons/favicon.png"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/vendor/shop/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/vendor/shop/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/shoputil.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/shopmain.css">
<!--===============================================================================================-->
<style>
    button#normal-search-icon{
        background-color: #f2f2f2;
    }
</style>
</head>

<body class="animsition">
	<section class="headercart">
	<jsp:include page="/front-end/header/header-with-cart.jsp"/>
	</section>
	<section id="One" class="wrapper style4" style="padding: 3.25rem 0 0rem 0;">
		<!-- Eshop Header -->
		<div id="logoDiv">
			<%@include file="/front-end/header/eshop-header.jsp"%>
		</div>
	</section>	
	
	<!-- Shoping Cart -->
	<div class="bg0 p-t-75 p-b-85">
		<div class="container container-cart">
			<c:set var="count" scope="session"/>
			<div class="row">
			<%	
				if (cartlist != null && cartlist.size() > 0) {
			%>
				<div class="col-lg-10 col-xl-7 m-lr-auto m-b-50">
					<div class="m-l-25 m-r--38 m-lr-0-xl">
						<div class="wrap-table-shopping-cart">
						
							<table class="table-shopping-cart" id="cartTable">
								<tr class="table_head">
									<th class="column-1">參考圖</th>
									<th class="column-2">書名</th>
									<th class="column-3">單價</th>
									<th class="column-4">數量</th>
									<th class="column-5">小計</th>
									<th class="column-3">刪除</th>
								</tr>

							<c:forEach var="cart" items="${cartlist}" varStatus="cartstatus" >
								<tr class="table_row">
									<td class="column-1">
										<div class="how-itemcart1">
											<img src="${pageContext.request.contextPath}/ShowBookPic?bookID=${cart.book_Id}" alt="暫時無法顯示圖片">
										</div>
									</td>
									<td class="column-2">
										<a class="js-name-del" href='${pageContext.request.contextPath}/Shopping.html?book_id=${cart.book_Id}'>
											${cart.book_Name}
										</a>
									</td>
									<td class="column-3">$
										<fmt:formatNumber type="number" value="${cart.price}" maxFractionDigits="0" />
									</td>
									<td class="column-4">
										${cart.comm_Qty}本
									</td>
									<td class="column-5">TWD$
										<fmt:formatNumber type="number" value="${cart.price*cart.comm_Qty}" maxFractionDigits="0" />
										<p style="font-size:10px;">(+ <fmt:formatNumber type="number" value="${cart.book_BP*cart.comm_Qty}" maxFractionDigits="0" />點)</p>
									</td>
									<td class="column-4">
										<input type="hidden" name="action" id="action" value="DEL"> 
										<input type="hidden" name="del" id="del" value="${cartstatus.index}">
										<input type="hidden" name="url" value=<%=request.getRequestURL()%>> 
										<button class="flex-c-m stext-101 cl2 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-5 js-cart-del" type="submit" style="width: 25px; height: 25px;">X</button>
									</td>
								</tr>
							</c:forEach>
							</table>
						</div>
						<div class="flex-w flex-sb-m bor15 p-t-18 p-b-15 p-lr-40 p-lr-15-sm">
							<a class="flex-c-m stext-101 cl2 size-119 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-10 js-goindex"
								href='${pageContext.request.contextPath}/front-end/bookshop-eshop/index.jsp'>
								繼續購物
							</a>
						</div>
						
					</div>
				</div>

				<div class="col-sm-10 col-lg-7 col-xl-5 m-lr-auto m-b-50">
					<div class="bor10 p-lr-40 p-t-30 p-b-40 m-l-63 m-r-40 m-lr-0-xl p-lr-15-sm">
						<h4 class="mtext-109 cl2 p-b-30">
							Cart Totals
						</h4>

						<div class="flex-w flex-t bor12 p-b-13">
							<div class="size-208">
								<span class="stext-110 cl2">
									Subtotal:
								</span>
							</div>

							<div class="size-209">
								<span class="mtext-110 cl2" id="prdtotal">
									${totalPrice[0]}
								</span>
							</div>
						</div>

						<div class="flex-w flex-t p-t-27 p-b-33">
							<div class="size-208">
								<span class="mtext-101 cl2">
									Total:
								</span>
							</div>

							<div class="size-209 p-t-1">
								<span class="mtext-110 cl2">
									TWD$ ${totalPrice[0]}
								</span>
							</div>
						</div>
							<button class="flex-c-m stext-101 cl0 size-116 bg3 bor14 hov-btn3 p-lr-15 trans-04 pointer js-cart-paycheck">
								<b><font color=#000>結　帳</font></b>
							</button>
					</div>
				</div>
				<%
					} else {
				%>
					<div class="bg0 p-t-75 p-b-85">
						<div class="container container-cart">
							<div class="row">
								<a style="color: #668787; font-size: 42px; text-aglin: center;">
								<c:out value="購物車空空der... "/><br>
								<c:out value="　　　　是否與你的皮夾一樣ＱＱ"/>
								</a>
								<input type="image"  class=""  src="<%=request.getContextPath()%>/images/cliff/ifine.png">
							</div>
						</div>
					</div>								
				<%} %>
			</div>
		</div>
	</div>

	<!-- Back to top -->
	<div class="btn-back-to-top" id="myBtn">
		<span class="symbol-btn-back-to-top">
			<i class="zmdi zmdi-chevron-up"></i>
		</span>
	</div>
	
<!--===============================================================================================-->	
	<!-- Scripts -->
	<script src="<%=request.getContextPath()%>/js/skel.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/util.js"></script>
	<script src="<%=request.getContextPath()%>/js/main.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/stopExecutionOnTimeout.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.easing.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.datetimepicker.full.js"></script>
	<!--Header進階搜尋toggle顯示/隱藏表單、一般搜尋按鈕註冊-->
	<script src="${pageContext.request.contextPath}/front-end/header/header-search-bar-js.jsp"></script>
	<!--Header下拉式書籍類別選單-->
	<script src="${pageContext.request.contextPath}/js/jquery.smartmenus.min.js"></script>
	<!-- pic -->
	<script src="<%=request.getContextPath()%>/js/smoothproducts.min.js"></script>
<!--===============================================================================================-->
	<script src="<%=request.getContextPath()%>/vendor/shop/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="<%=request.getContextPath()%>/vendor/shop/bootstrap/js/popper.js"></script>
	<script src="<%=request.getContextPath()%>/vendor/shop/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="<%=request.getContextPath()%>/vendor/shop/sweetalert/sweetalert.min.js"></script>
	<script>
	var PathURL = window.document.location.href;
	var localhost = PathURL.substring(0, PathURL
			.indexOf(window.document.location.pathname));

	$('.js-cart-del').each(
			function() {
				var nameProduct = $(this).parent().parent().parent()
						.parent().find('.js-name-del').html();
				var div=$('.wrap-table-shopping-cart').html();
				$(this).on('click',
						function() {
							$.ajax({
								type : "POST",
								url : localhost + '/EA103G4/Shopping.html',
								data : cartFormJSON(
										 $(this).parent().children('#action').val(), 
										 $(this).parent().children('#del').val()),
								dataType : "json",

								success : function(data) {
									swal(nameProduct, "此商品成功移除!",
											"success").then(function(isConfirm){
												  if (isConfirm) {
									go();}});
									$('.headercart').load(localhost+'/EA103G4/front-end/header/header-with-cart.jsp');
								},
								error : function(data) {
									swal(nameProduct, "無法移除, 請稍後再試。",
											"error");
								}
							})
						})
					})
	function go(){history.go(0)};
	function cartFormJSON(action, del) {
		var cartFormJSON = {
			"action" : action,
			"del" : del
		};
		return cartFormJSON;
	}
	/*=========================================================*/
	$('.js-cart-paycheck').on('click',function(){window.location.href=localhost+'/EA103G4/front-end/shopping/pay.jsp';})
	
	</script>

</body>
<jsp:include page="/front-end/footer/footer.jsp" />

</html>