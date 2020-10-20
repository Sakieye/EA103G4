<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>BOOKSHOP書香天地</title>
<meta charset="UTF-8">


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
	href="<%=request.getContextPath()%>/css/bookshop_index.css" />
<!--Header購物車、次Header搜尋欄-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/header-front-with-cart-and-search.css">
<!--下拉式書籍類別選單-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/sm-core-css.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/sm-clean.css">

</head>

<body>
	<jsp:include page="/front-end/header/header-with-cart.jsp" />
	<section id="One" class="wrapper style4">
		<!-- Eshop Header -->
		<div id="logoDiv">
			<%@include file="/front-end/header/eshop-header.jsp"%>
		</div>


		<div class="container">
			<div class="row">
				<!-- multistep form -->
				<div class="row mx-md-n6" id="main_in" style="text-algin: center;">

					<!-- 書 -->
					<%
						BookService bookService = (BookService) getServletContext().getAttribute("bookService");
						List<Book> shpingcart = bookService.getByCategoryID(request.getParameter("categoryID"));
						pageContext.setAttribute("shpingcart", shpingcart);
					%>
					<c:if test="${not empty shpingcart}">
						<div class="page">
							<%@ include file="/front-end/shopping/page1.file"%>
						</div>
						<div class="row mx-md-n6" id="book">

							<c:forEach var="book" items="${shpingcart}"
								begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
								<!--商品清單  -->
								<div class="cardTOP">
								<div class="card" id="booklist"
									onclick="<%=request.getContextPath()%> ">
									<div class="card-top">
										<FORM class="form-inline" name="cartFrom" method="POST" action="<%=request.getContextPath()%>/Shopping.html">
<%-- 											<img class="card-img-top" alt="404 NOT FOUND" src="${pageContext.request.contextPath}/ShowBookPic?bookID=${book.bookID}"> --%>
											<input type="image" class="card-img-top" alt="404 NOT FOUND" name="book_id" value="${book.bookID}"
													src="${pageContext.request.contextPath}/ShowBookPic?bookID=${book.bookID}">
											<input type="hidden" name="action" value="BOOKDETAIL">
										</FORM>
									</div>
									<div class="card-body">
										<div class="card-body-prdName"
											style="width: 120px; height: 50px; text-align: center;">
											<h3 class="prdName">${book.bookName}</h3>
										</div>
										<div class="card-body-price"
											style="width: 120px; height: 30px; text-align: left;">
											<span id="price"> $ <b><fmt:formatNumber
														type="number" value="${book.bookRealPrice}"
														maxFractionDigits="0" /></b>
											</span>
										</div>
									</div>
									<!--加入購物車  -->
									<FORM class="form-inline" name="cartFrom" method="POST"
										action="<%=request.getContextPath()%>/Shopping.html">
										<div class="card-body-car" style="text-align: left;">
											<h5 style="margin: 60px 0px 2px 16px;">
												數量： <input type="number" name="comm_Qty" step="1" min="1"
													max="50" value="1" style="width: 35%; height: 10%;">
											</h5>
											<input type="hidden" name="mem_Id" value="visitors">
											<input type="hidden" name="book_Name"
												value="${book.bookName}"> <input type="hidden"
												name="book_Id" value="${book.bookID}"> <input
												type="hidden" name="isbn" value="${book.isbn}"> <input
												type="hidden" name="book_BP" value="${book.bookRealBP}">
											<input type="hidden" name="publisher_Id"
												value="${book.publisherID}"> <input type="hidden"
												name="price" value="${book.bookRealPrice}">

											<button type="submit" class="card-body-btn" name="action"
												value="ADD">
												<img alt="404 NOT FOUND" class="card-img-body"
													onClick="herf='<%=request.getContextPath()%>/front-end/shopping/bookindex.jsp'"
													src="<%=request.getContextPath()%>/images/cliff/car.gif">
											</button>
										</div>
									</FORM>
									</div>
								</div>
							</c:forEach>
						</div>

					</c:if>
				</div>

			</div>
		</div>
	</section>
	<jsp:include page="/front-end/footer/footer.jsp" />
	<script
		src="<%=request.getContextPath()%>/js/stopExecutionOnTimeout.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.easing.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/js/jquery.datetimepicker.full.js"></script>

	<!--Header進階搜尋toggle顯示/隱藏表單、一般搜尋按鈕註冊-->
	<script
		src="${pageContext.request.contextPath}/front-end/header/header-search-bar-js.jsp"></script>
	<!--Header下拉式書籍類別選單-->
	<script
		src="${pageContext.request.contextPath}/js/jquery.smartmenus.min.js"></script>
	<!-- 
	<script id="">
		function check(){ 
			var action = document.getElementsByClassName("form-inline");
		    if(window.confirm("將商品加入購物車")){ 
		        alert("已加入!") 
		        return action; 
		    }else{ 
		        alert("取消!") 
		        return false; 
		    } 
		 
		} 

	</script>
	 -->

</body>
</html>