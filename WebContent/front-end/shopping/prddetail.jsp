<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.Optional"%>
<%@ page import="com.book.model.*"%>
<%@ page import="com.bookpic.model.*"%>
<%@ page import="com.publishers.model.*"%>
<%@ page import="com.language.model.*"%>
<%@ page import="com.promo.model.*"%>
<%@ page import="com.promodetail.model.*"%>


<%
	Book book = (Book) request.getAttribute("prddetail");
	LanguageService lggeSvc = (LanguageService) getServletContext().getAttribute("languageService");
	PublisherService pblSvc = (PublisherService) getServletContext().getAttribute("publisherService");
	pageContext.setAttribute("book", book);
	String languageName = "暫無資訊";
	String publisherName = publisherName = pblSvc.getOnePublisher(book.getPublisherID()).getPublisher_Name();
	if(book.getLanguageID()!=null){
		languageName = lggeSvc.getOneLanguage(book.getLanguageID()).getLanguage_Name();
	}
	
%>


<!DOCTYPE html>
<html lang="zh-tw">
<head>
	<title>${prddetail.bookName}</title>
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
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/vendor/shop/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/vendor/shop/animsition/css/animsition.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/vendor/shop/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/vendor/shop/slick/slick.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/vendor/shop/MagnificPopup/magnific-popup.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/vendor/shop/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
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
		

	<!-- Product Detail -->
	<section class="sec-product-detail bg0 p-t-65 p-b-60">
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-lg-7 p-b-30">
					<div class="p-l-25 p-r-30 p-lr-0-lg">
						<div class="wrap-slick3 flex-sb flex-w">
							<div class="wrap-slick3-dots"></div>
							<div class="wrap-slick3-arrows flex-sb-m flex-w"></div>

							<div class="slick3 gallery-lb">
							<c:forEach var="pic" items="${bookPiclist}" varStatus="picindex">
								<div class="item-slick3" data-thumb="${pageContext.request.contextPath}/ShowBookPic?bookID=${pic.bookID}&bookPicName=${pic.bookPicName}">
									<div class="wrap-pic-w pos-relative">
										<img src="${pageContext.request.contextPath}/ShowBookPic?bookID=${pic.bookID}&bookPicName=${pic.bookPicName}" id="${picindex.index}" alt="IMG-PRODUCT">
										<a class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" href="${pageContext.request.contextPath}/ShowBookPic?bookID=${pic.bookID}&bookPicName=${pic.bookPicName}">
											<i class="fa fa-expand"></i>
										</a>
									</div>
								</div>
							</c:forEach>
							</div>
						</div>
					</div>
				</div>
					
				<div class="col-md-6 col-lg-5 p-b-30">
					<div class="p-r-50 p-t-5 p-lr-0-lg">
						<span class="mt-0" style="font-size: 8px;">
							<b>ISBN：${prddetail.isbn}</b> 
						</span>
						<h4 class="mtext-105 cl2 js-name-detail p-b-14">
							${prddetail.bookName}
						</h4>
						
						<p class="stext-102 cl3 p-t-23">
							作者：${prddetail.author}<br>
							出版社：<%=publisherName%><br>
						</p>
						<p class="stext-102 cl3 p-t-23">
							結帳方式：信用卡、貨到付款<br>
							配送方式：超取、宅配<br>
							紅利折抵：可<br>
						</p>
						<span class="mt-0" style="font-size: 8px;">
							註：單筆訂單未滿$490,運費$75、離島$200.<br>
						</span>
						<br>

						<span class="mtext-106 cl2">
							定價： <span style="text-decoration: line-through; font-style: oblique;">
									<fmt:formatNumber type="number" maxFractionDigits="0" value="${book.listPrice}" />
								</span>元，&nbsp;&nbsp;促銷價： <b>
								<span style="color: red; font-style: oblique;"> 
									<fmt:formatNumber type="number" maxFractionDigits="0" value="${book.bookRealPrice/book.listPrice*100}" />
								</span></b>折 <b>
								<span style="color: red; text-decoration: underline; font-style: oblique;">
									<fmt:formatNumber type="number" maxFractionDigits="0" value="${book.bookRealPrice}" />
								</span></b>元
						</span>

						
						
						<!--  -->
						<div class="p-t-33">
							<!-- 此區可補充 -->
							
							<div class="flex-w flex-r-m p-b-10">
								<div class="size-204 flex-w flex-m respon6-next">
								<FORM class="form-inline" name="cartFrom" id="cartFrom" method="POST" action="<%=request.getContextPath()%>/Shopping.html">
									<div class="wrap-num-product flex-w m-r-20 m-tb-10">
										<div class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m">
											<i class="fs-16 zmdi zmdi-minus"><b>－</b></i>
										</div>
										<input class="mtext-104 cl3 txt-center num-product" type="number" name="comm_Qty" id="comm_Qty" step="1"
												min="1" max="50" value="1">
										<div class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m">
											<i class="fs-16 zmdi zmdi-plus"><b>＋</b></i>
										</div>
									</div>
										<input type="hidden" name="book_Name" id="book_Name" value="${book.bookName}"> 
										<input type="hidden" name="book_Id" id="book_Id" value="${book.bookID}"> 
										<input type="hidden" name="isbn" id="isbn" value="${book.isbn}"> 
										<input type="hidden" name="book_BP" id="book_BP" value="${book.bookRealBP}">
										<input type="hidden" name="publisher_Id" id="publisher_Id" value="${book.publisherID}"> 
										<input type="hidden" name="price" id="price" value="${book.bookRealPrice}">
										<input type="hidden" name="action" id="action" value="ADD">
										</FORM>
									<button class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04 js-addcart-detail"
											type="submit" name="action" value="ADD">
										放入購物車
									</button>
									
								</div>
							</div>	
						</div>

						<!-- 其通功能 -->
						<div class="flex-w flex-m p-l-100 p-t-40 respon7">
							<a href="#" class="btn-addwish-b2 dis-block pos-relative js-addwish-b2">
							<img class="icon-heart1 dis-block trans-04" src="<%=request.getContextPath()%>/images/cliff/icons/icon-heart-01.png" alt="圖標">
							<img class="icon-heart2 dis-block trans-04 ab-t-l" src="<%=request.getContextPath()%>/images/cliff/icons/icon-heart-02.png" alt="圖標">
							</a>
							
							<a href="https://www.facebook.com/sharer/sharer.php?u=http%3A%2F%2Flocalhost:8081/EA103G4/Shopping.html?bookID=${book.bookID}%2F&amp;src=sdkpreparse" 
							class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100" data-tooltip="Facebook">
								<i class="fa fa-facebook"></i>
							</a>
						</div>
					</div>
				</div>
			</div>

			<div class="bor10 m-t-50 p-t-43 p-b-40">
				<!-- Tab01 -->
				<div class="tab01">
					<!-- Nav tabs -->
					<ul class="nav nav-tabs" role="tablist">
						<li class="nav-item p-b-10">
							<a class="nav-link active" data-toggle="tab" href="#description" role="tab">商品簡介</a>
						</li>

						<li class="nav-item p-b-10">
							<a class="nav-link" data-toggle="tab" href="#information" role="tab">商品詳細資訊</a>
						</li>
					</ul>

					<!-- Tab panes -->
					<div class="tab-content p-t-43">
						<!-- - -->
						<div class="tab-pane fade show active" id="description" role="tabpanel">
							<div class="how-pos2 p-lr-15-md">
								<div class="divTableCell" id="prddetailinfo">
								<p>簡介</p>
								</div>
								<span><br>&nbsp;&nbsp;&nbsp;&nbsp;${book.bookIntro}</span>
							</div>
						</div>
						<div class="tab-pane fade" id="information" role="tabpanel">
							<div class="how-pos2 p-lr-15-md">
								<div class="divTableCell" id="prddetailinfo">
								<p>詳細資訊</p>
								</div>
								<span>
									<br>
									&nbsp;&nbsp;ISBN：${prddetail.isbn}<br>
									&nbsp;&nbsp;作者：${prddetail.author}<br>
									&nbsp;&nbsp;出版社：<%=publisherName%><br>
									&nbsp;&nbsp;出版日期：${prddetail.publicationDate}<br>
									&nbsp;&nbsp;語言：<%=languageName%><br>
									&nbsp;&nbsp;類別：<br>
									&nbsp;&nbsp;標籤：<br>
								</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="bg6 flex-c-m flex-w size-302 m-t-73 p-tb-15">
			<span class="stext-107 cl6 p-lr-25">
				《&nbsp;退換貨說明&nbsp;》
			</span>

			<span class="stext-107 cl6 p-lr-25">
				會員均享有10天的商品猶豫期（含例假日）。若您欲辦理退換貨，請於取得該商品10日內寄回。<br>
				辦理退換貨時，請保持商品全新狀態與完整包裝（商品本身、贈品、贈票、附件、內外包裝、保證書、隨貨文件等）一併寄回。<br>
				若退回商品無法回復原狀者，可能影響退換貨權利之行使或須負擔部分費用。<br>
				訂購本商品前請務必詳閱退換貨原則。
			</span>
		</div>
		<div class="flex-c-m flex-w size-302 m-t-73 ">
		<button class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04 js-addcart-detail"
				type="submit" name="action" value="ADD">放入購物車
		</button>
		</div>
	</section>


	<!-- 你可能也喜歡這些商品 -->
	<section class="sec-relate-product bg0 p-t-45 p-b-105">
		<div class="container">
			<div class="p-b-45">
				<h3 class="ltext-106 cl5 txt-center">
					您可能也喜歡這些書籍
				</h3>
			</div>

			<!-- Slide2 -->
			<div class="wrap-slick2">
				<div class="slick2">
					<div class="item-slick2 p-l-15 p-r-15 p-t-15 p-b-15">
					</div>
				</div>		
			</div>
		</div>
	</section>
	

	<!-- Back to top -->
	<div class="btn-back-to-top" id="myBtn">
		<span class="symbol-btn-back-to-top">
			<i class="zmdi zmdi-chevron-up">︿</i>
		</span>
	</div>

<!--===============================================================================================-->	
	<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/stopExecutionOnTimeout.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.easing.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.datetimepicker.full.js"></script>
	<!--Header進階搜尋toggle顯示/隱藏表單、一般搜尋按鈕註冊-->
	<script
		src="${pageContext.request.contextPath}/front-end/header/header-search-bar-js.jsp"></script>
	<!--Header下拉式書籍類別選單-->
	<script
		src="${pageContext.request.contextPath}/js/jquery.smartmenus.min.js"></script>
	<!-- pic -->
	<script src="js/smoothproducts.min.js"></script>
<!--===============================================================================================-->
	<script src="<%=request.getContextPath()%>/vendor/shop/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="<%=request.getContextPath()%>/vendor/shop/bootstrap/js/popper.js"></script>
	<script src="<%=request.getContextPath()%>/vendor/shop/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="<%=request.getContextPath()%>/vendor/shop/daterangepicker/moment.min.js"></script>
	<script src="<%=request.getContextPath()%>/vendor/shop/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="<%=request.getContextPath()%>/vendor/shop/slick/slick.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/shopslick-custom.js"></script>
<!--===============================================================================================-->
	<script src="<%=request.getContextPath()%>/vendor/shop/parallax100/parallax100.js"></script>
	<script>
        $('.parallax100').parallax100();
	</script>
<!--===============================================================================================-->
	<script src="<%=request.getContextPath()%>/vendor/shop/MagnificPopup/jquery.magnific-popup.min.js"></script>
	<script>
		$('.gallery-lb').each(function() { 
			$(this).magnificPopup({
		        delegate: 'a', 
		        type: 'image',
		        gallery: {
		        	enabled:true
		        },
		        mainClass: 'mfp-fade'
		    });
		});
	</script>
<!--===============================================================================================-->
	<script src="<%=request.getContextPath()%>/vendor/shop/isotope/isotope.pkgd.min.js"></script>
<!--===============================================================================================-->
	<script src="<%=request.getContextPath()%>/vendor/shop/sweetalert/sweetalert.min.js"></script>
	<script>
		$('.js-addwish-b2, .js-addwish-detail').on('click', function(e){
			e.preventDefault();
		});

		$('.js-addwish-b2').each(function(){
			var nameProduct = $(this).parent().parent().find('.js-name-b2').html();
			$(this).on('click', function(){
				swal(nameProduct, "is added to wishlist !", "success");

				$(this).addClass('js-addedwish-b2');
				$(this).off('click');
			});
		});

		$('.js-addwish-detail').each(function(){
			var nameProduct = $(this).parent().parent().parent().find('.js-name-detail').html();

			$(this).on('click', function(){
				swal(nameProduct, "is added to wishlist !", "success");

				$(this).addClass('js-addedwish-detail');
				$(this).off('click');
			});
		});

		/*---------------------------------------------*/
		var PathURL = window.document.location.href;
		var localhost = PathURL.substring(0,PathURL.indexOf(window.document.location.pathname));
		
		
		$('.js-addcart-detail').each(function(){
			var nameProduct = $(this).parent().parent().parent().parent().find('.js-name-detail').html();
			$(this).on('click', function(){
				 $.ajax({
					 type: "POST",
					 url: localhost+'/EA103G4/Shopping.html',
					 data: careFormJSON($('#action').val(),$('#book_Name').val(),$('#book_Id').val(),
							 $('#isbn').val(),$('#book_BP').val(),$('#publisher_Id').val(),$('#price').val(),$('#comm_Qty').val()),
					 dataType: "json",
					 
					 success:function(data){
						 swal(nameProduct, "此商品成功加入購物車 !", "success");
				 		setTimeout(function () {go();}, 2000);}
				 	,error:function(data){
						 swal(nameProduct, "此商品無法加入購物車 Q_Q。", "error");}
				})
			})
		})
		
		function go(){
			 history.go(0);
		}
		function careFormJSON(action, book_Name, book_Id, isbn, book_BP, publisher_Id, price, comm_Qty){
			var careFormJSON= {"action":action, "book_Name":book_Name, "book_Id":book_Id, "isbn":isbn, "book_BP":book_BP, "publisher_Id":publisher_Id
					, "price":price, "comm_Qty":comm_Qty};
			return careFormJSON;
		}
		
	
	</script>
<!--===============================================================================================-->
	<script src="<%=request.getContextPath()%>/vendor/shop/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script>
		$('.js-pscroll').each(function(){
			$(this).css('position','relative');
			$(this).css('overflow','hidden');
			var ps = new PerfectScrollbar(this, {
				wheelSpeed: 1,
				scrollingThreshold: 1000,
				wheelPropagation: false,
			});

			$(window).on('resize', function(){
				ps.update();
			})
		});
	</script>
<!--===============================================================================================-->
	<script src="<%=request.getContextPath()%>/js/shopmain.js"></script>
<!--===============================================================================================-->
<jsp:include page="/front-end/footer/footer.jsp" />
</body>
</html>