<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.book.model.*"%>
<%@ page import="com.bookpic.model.*"%>
<%@ page import="com.category.model.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>

<!DOCTYPE html>
<html>
<head>
<title>部客匣網路書城</title>
<meta charset="UTF-8">


<link rel="stylesheet" href="<%=request.getContextPath()%>/css/main-front.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/header.css" />
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

</head>

<body>
	<jsp:include page="/front-end/header/header-with-cart.jsp" />
	<section id="One" class="wrapper style4" style="background-color: #FFF;">
		<!-- Eshop Header -->
		<div id="logoDiv">
			<%@include file="/front-end/header/eshop-header.jsp"%>
		</div>


		<div class="container">
			<div class="row">
				<!-- multistep form -->
				<div class="row mx-md-n6" id="main_in" style="text-algin: center;">
					<div class="col-md-12">
						<h1>此商品已下架 :(</h1>
					</div>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="/front-end/footer/footer.jsp" />
	<!--Header進階搜尋toggle顯示/隱藏表單、一般搜尋按鈕註冊-->
	<script src="${pageContext.request.contextPath}/front-end/header/header-search-bar-js.jsp"></script>
	<!--Header下拉式書籍類別選單-->
	<script src="${pageContext.request.contextPath}/js/jquery.smartmenus.min.js"></script>
	<!--Header Search Autocompelete-->
	<%@include file="/front-end/header/header-search-autocompelete-js.jsp"%>
	<script src="<%=request.getContextPath()%>/js/jquery.scrollex.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/skel.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/util.js"></script>
	<script src="<%=request.getContextPath()%>/js/main.js"></script>
</body>
</html>