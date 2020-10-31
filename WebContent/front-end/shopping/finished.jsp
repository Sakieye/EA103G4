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
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/main-front.css" />
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/header.css" />
	<!--Header購物車、次Header搜尋欄-->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header-front-with-cart-and-search.css">
	<!-- jQuery AutoCompelete -->
	<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<!--=============================================================================================== -->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/vendor/shop/animate/animate.css">
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
		<div class="container-menu-desktop" style="height:48px;">
			<!-- Topbar -->
			<div class="top-bar">
				<jsp:include page="/front-end/header/header-with-cart.jsp"/>
			</div>
			<div class="wrap-menu-desktop how-shadow1">
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
		<!-- Scripts -->
	<script src="<%=request.getContextPath()%>/js/skel.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/util.js"></script>
	<script src="<%=request.getContextPath()%>/js/main.js"></script>
</body>
</html>