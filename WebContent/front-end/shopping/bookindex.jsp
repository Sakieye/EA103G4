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
<meta name="viewport" content="width=device-width, initial-scale=1">

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

<!-- jQuery AutoCompelete -->
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-ui.css">
<script src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.auto-complete.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery.auto-complete.css" />

<!--自訂prddetailpage.css-->
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/prddetailpage.css" />
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
<!--Header購物車、次Header搜尋欄-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header-front-with-cart-and-search.css">
<!--下拉式書籍類別選單-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/sm-core-css.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/sm-clean.css">
</head>

<body class="animsition">

	<!-- Header With Cart -->
	<%@include file="/front-end/header/header-with-cart.jsp"%>
	<section id="One" class="wrapper style4"
		style="padding: 3.25rem 0 0rem 0;">
		<!-- Eshop Header -->
		<div id="logoDiv">
			<%@include file="/front-end/header/eshop-header.jsp"%>
		</div>
	</section>

	<%
		//若是未查詢，會是空List或是前一次搜尋結果
		List<Book> books = (ArrayList<Book>) request.getAttribute("books");
		Map<String, String> catLevelMap = (Map<String, String>) request.getAttribute("catLevelMap");
		session.setAttribute("books", books);
		session.setAttribute("catLevelMap", catLevelMap);
	%>



	<!-- Product -->
	<div class="bg0 m-t-23 p-b-140">
		<div class="container">
			<c:choose>
				<c:when test="${not empty books}">
					<div class="flex-w flex-sb-m p-b-52">
						<div class="flex-w flex-l-m filter-tope-group m-tb-10">
							<!--類別查詢才顯示類別階層-->
							<jsp:include page="/front-end/bookshop-eshop/breadcrumb.jsp">
								<jsp:param name="breadcrumbFontSize" value="2.0em" />
							</jsp:include>
						</div>

						<div class="flex-w flex-c-m m-tb-10">
							<div class="page col-md-12" style="visibility:hidden">
								<!--換頁頁碼icon待修-->
								<%@ include file="/front-end/shopping/page1.file"%>
								<%-- <%@ include file="/front-end/shopping/page2.file"%> --%>
							</div>
						</div>
					</div>
					<div class="row isotope-grid">
						<c:forEach var="book" items="${books}" begin="<%=pageIndex%>"
							end="<%=pageIndex+rowsPerPage-1%>">
							<div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item men">
								<!-- Block2 -->
								<div class="block2">
									<!--商品清單  -->
									<div class="card" id="booklist">
										<div class="block2-pic hov-img0 block2-pic-bookindex">
											<FORM class="form-inline" name="detailFrom" method="GET"
												action="<%=request.getContextPath()%>/Shopping.html">
												<input type="hidden" name="action" value="BOOKDETAIL">
												<input type="image" class="card-img-top" alt="404 NOT FOUND"
													src="${pageContext.request.contextPath}/ShowBookPic?bookID=${book.bookID}">
												<input type="hidden" name="book_id" value="${book.bookID}">
											</FORM>
										</div>
										<div class="card-body">
											<div class="block2-txt flex-w flex-t p-t-14">
												<a
													href="${pageContext.request.contextPath}/Shopping.html?book_id=${book.bookID}"
													class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
													${book.bookName} </a>
											</div>
										</div>
										<div class="card-body">
											<div class="block2-txt flex-w flex-t p-t-14">
												<span class="stext-105-index cl3"> $ <b> <fmt:formatNumber
															type="number" value="${book.bookRealPrice}"
															maxFractionDigits="0" />
												</b>
												</span>
												<!--加入購物車  -->
													<input type="hidden" name="comm_Qty" id="comm_Qty" value="1"> 
													<input type="hidden" name="mem_Id" id="mem_Id" value="visitors"> 
													<input type="hidden" name="publisher_Id" id="publisher_Id" value="${book.publisherID}">
													<input type="hidden" class="js-name-index" name="book_Name" id="book_Name" value="${book.bookName}">
													<input type="hidden" name="book_Id" id="book_Id" value="${book.bookID}">
													<input type="hidden" name="isbn" id="isbn" value="${book.isbn}">
													<input type="hidden" name="book_BP" id="book_BP" value="${book.bookRealBP}">
													<input type="hidden" name="publisher_Id" id="publisher_Id" value="${book.publisherID}">
													<input type="hidden" name="price" id="price" value="${book.bookRealPrice}">
													<input type="hidden" name="action" id="action" value="ADD">
													<input type="image"  class="card-img-body js-addcart-index"  src="<%=request.getContextPath()%>/images/cliff/car.gif">
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</c:when>
				<c:otherwise>
					<div class="col-md-12">
						<h1>查無商品 :(</h1>
					</div>
				</c:otherwise>
			</c:choose>
			<div class="flex-w flex-sb-m p-b-52 pagenumber">
				<div class="flex-w flex-l-m filter-tope-group m-tb-10">
					<div class="page col-md-12">
						<!--換頁頁碼待修-->
						<%@ include file="/front-end/shopping/page1.file"%>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Back to top -->
	<div class="btn-back-to-top" id="myBtn">
		<span class="symbol-btn-back-to-top"> <i
			class="zmdi zmdi-chevron-up"><b>︿</b></i>
		</span>
	</div>




	<jsp:include page="/front-end/footer/footer.jsp" />
	<!--Scripts-->
	<script src="<%=request.getContextPath()%>/js/jquery.easing.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/js/jquery.datetimepicker.full.js"></script>
	<!-- pic -->
	<script src="<%=request.getContextPath()%>/js/smoothproducts.min.js"></script>
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
	<script src="<%=request.getContextPath()%>/vendor/shop/MagnificPopup/jquery.magnific-popup.min.js"></script>
	<script>
		$('.gallery-lb').each(function() {
			$(this).magnificPopup({
				delegate : 'a',
				type : 'image',
				gallery : {
					enabled : true
				},
				mainClass : 'mfp-fade'
			});
		});
	</script>
	<!--===============================================================================================-->
	<script src="<%=request.getContextPath()%>/vendor/shop/isotope/isotope.pkgd.min.js"></script>
	<!--===============================================================================================-->
	<script src="<%=request.getContextPath()%>/vendor/shop/sweetalert/sweetalert.min.js"></script>
	<script>
		var PathURL = window.document.location.href;
		var localhost = PathURL.substring(0, PathURL
				.indexOf(window.document.location.pathname));

		$('.js-addcart-index').each(
				function() {
					var nameProduct = $(this).parent().parent().parent()
							.parent().find('.js-name-index').html();
					$(this).on('click',
							function() {
								$.ajax({
									type : "POST",
									url : localhost + '/EA103G4/Shopping.html',
									data : cartFormJSON(
											 $(this).parent().children('#action').val(), 
											 $(this).parent().children('#book_Name').val(), 
											 $(this).parent().children('#book_Id').val(), 
											 $(this).parent().children('#isbn').val(), 
											 $(this).parent().children('#book_BP').val(), 
											 $(this).parent().children('#publisher_Id').val(), 
											 $(this).parent().children('#price').val(), 
											 $(this).parent().children('#comm_Qty').val()),
									dataType : "json",

									success : function(data) {
										swal(nameProduct, "此商品成功加入購物車 !", "success");
										$('.badge').load(localhost+'/EA103G4/front-end/header/header-with-cart.jsp');
									},
									error : function(data) {
										swal(nameProduct, "此商品無法加入購物車 Q_Q。", "error");
									}
								})
							})
						})
		function cartFormJSON(action, book_Name, book_Id, isbn, book_BP,publisher_Id, price, comm_Qty) {
			var cartFormJSON = {
				"action" : action,
				"book_Name" : book_Name,
				"book_Id" : book_Id,
				"isbn" : isbn,
				"book_BP" : book_BP,
				"publisher_Id" : publisher_Id,
				"price" : price,
				"comm_Qty" : comm_Qty
			};
			return cartFormJSON;
		}
		

	</script>
	<!--===============================================================================================-->
	<script src="<%=request.getContextPath()%>/js/shopmain.js"></script>
	<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/js/jquery.scrollex.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/skel.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/util.js"></script>
	<script src="${pageContext.request.contextPath}/js/main.js"></script>
	<!--carousel slider滑入滑出顯示contorls-->
	<script src="${pageContext.request.contextPath}/js/carousel-control-react.js"></script>
	<!--Header進階搜尋toggle顯示/隱藏表單、一般搜尋按鈕註冊-->
	<script src="${pageContext.request.contextPath}/front-end/header/header-search-bar-js.jsp"></script>
	<!--Header下拉式書籍類別選單-->
	<script src="${pageContext.request.contextPath}/js/jquery.smartmenus.min.js"></script>
	<!--Header Search Autocompelete-->
	<%@include file="/front-end/header/header-search-autocompelete-js.jsp"%>


</body>
</html>