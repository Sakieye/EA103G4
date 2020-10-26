<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	response.setHeader("refresh","12;URL=http://localhost:8081/EA103G4/front-end/bookshop-eshop/index.jsp") ;
%>

	
<!DOCTYPE html>
<html lang="zh-tw">
<head>
	<title>訂購完成</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/main-front.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/header.css" />
<!--書城首頁CSS-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bookshop-eshop-index.css" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<!--商品展示Slider CSS與字體-->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.1.0/css/all.css"
	integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/product-slider.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+JP:wght@500;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/prddetailpage.css" />
<!--Header購物車、次Header搜尋欄-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/header-front-with-cart-and-search.css">
<!--下拉式書籍類別選單-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/sm-core-css.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/sm-clean.css">
<!--===============================================================================================-->	
	<link rel="icon" type="image/cliff/png" href="<%=request.getContextPath()%>/image/cliff/icons/favicon.png"/>
<!--=============================================================================================== -->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/vendor/shop/animate/animate.css">
<!--=============================================================================================== -->
<%-- 	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/vendor/shop/animsition/css/animsition.min.css"> --%>
<!--=============================================================================================== -->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/vendor/shop/perfect-scrollbar/perfect-scrollbar.css">
<!--=============================================================================================== -->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/shoputil.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/shopmain.css">
<!--===============================================================================================-->
	
	
</head>
<body class="animsition">
	
	<!-- Header -->
	<header class="header-v4">
		<!-- Header desktop -->
		<div class="container-menu-desktop">
			<!-- Topbar -->
			<div class="top-bar">
				<jsp:include page="/front-end/header/header-with-cart.jsp"/>
			</div>

			<div class="wrap-menu-desktop how-shadow1">
				<nav class="limiter-menu-desktop container">
						<!-- Eshop Header -->
					<div id="logoDiv">
						<%@include file="/front-end/header/eshop-header.jsp"%>
					</div>
				</nav>
			</div>	
			
		</div>
		
	</header>

	<!-- Title page -->
	<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('<%=request.getContextPath() %>/images/cliff/bg-01.jpg');">
		<h2 class="ltext-105 cl0 txt-center">
			訂單成立
		</h2>
	</section>	


	<!-- Content page -->
	<section class="bg0 p-t-75 p-b-120">
		<div class="container">
			<div class="row p-b-148">
				<div class="col-md-7 col-lg-8">
					<div class="p-t-7 p-r-85 p-r-15-lg p-r-0-md">
						<h2 class="mtext-111 cl2 p-b-16">
							親愛的顧客您好，再次感謝您的訂購。
						</h2>

						<h3 class="stext-113 cl6 p-b-26">
							[ 退換貨相關說明 ]<br><br>
							&nbsp;&nbsp;&nbsp;&nbsp;請至『我的帳戶→訂單查詢相關』點選「取消/退貨」，或「換貨」服務選項，確認所要取消或辦理退貨的商品後，按下「退貨」/「換貨」鈕，則將立即為您辦理訂單取消、退/換貨事宜，若該筆訂單無法線上「取消/退貨」，則請於網頁點選「聯絡客服」，將由網路客服人員為您服務。<br><br>
							&nbsp;&nbsp;&nbsp;&nbsp;註：提醒您，申請退貨時，請務必將您所訂購之完整商品、配件、贈品及包裝盒置入於原外包裝箱內，並將商品回復原狀，並向取貨人員收取退貨簽單並保留該單據到收到退款為止，以利後續退換貨作業。如您已收到發票，請依發票背面之銷退折讓單上說明，簽章後寄回BOOKSHOP，以便儘速為您辦理退款。若您是以其他方式(電話/語音/型錄)訂購則恕不提供本項服務。<br>
						</h3>
						
						<h3 class="stext-113 cl6 p-b-26">
							>>本頁面將於10秒後回到首頁 ...
						</h3>
					</div>
				</div>
				
				
			<div class="col-11 col-md-5 col-lg-4 m-lr-auto">
					<div class="how-bor1 ">
						<div class="hov-img0">
							<img src="<%=request.getContextPath()%>/images/cliff/about-01.jpg" alt="IMG">
						</div>
					</div>
				</div>

			</div>
		</div>
	</section>	
	
	
	<jsp:include page="/front-end/footer/footer.jsp" />
</body>
</html>