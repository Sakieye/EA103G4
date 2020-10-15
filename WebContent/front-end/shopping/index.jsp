<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.book.model.*"%>
<%@ page import="com.bookpic.model.*"%>
<%@ page import="com.category.model.*"%>
<%@ page import="java.util.*"%>

<%
	CategoryService ctgSvc = (CategoryService) getServletContext().getAttribute("categoryService");
	List<Category> categories = ctgSvc.getAll();
	pageContext.setAttribute("categories", categories);
%>


<!DOCTYPE html>
<html>
<head>
<title>BOOKSHOP書香天地</title>
<meta charset="UTF-8">

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

<body translate="no" class="subpage">
	<jsp:include page="/front-end/header/header.jsp" />

	<!-- 點擊置頂按鈕 -->
	<button type="button" id="BackTop" class="toTop-arrow"></button>
	<div class="container">
		<main id="center" class="column">
			<div class="container-fluid">
				<div class="row">
					<!-- multistep form -->
					<div class=" col-md-12" id="main_in">

						<div class="container-fluid">
							<nav class="navbar navbar-light bg-light">
								<h3>│分類搜尋測試頁面</h3>
								<c:if test="${not empty errorMsgs}">
									<ul>
										<font style="color: red">▲Error： </font>
										<c:forEach var="message" items="${errorMsgs}">
											<li style="color: black">${message}</li>
										</c:forEach>
									</ul>
								</c:if>
								
								<hr size="10px" align="center" width="100%" >
								
								<FORM class="BookManagement" METHOD="post" 
								ACTION="<%=request.getContextPath()%>/front-end/shopping/bookindex.jsp">
									<div class="col-md-3">
										<label for="categoryID">書籍類別</label> <select name="categoryID"
											id="categoryID" class="form-control mr-sm-2">
											<option></option>
											<c:forEach var="category" items="${categories}">
												<option value="${category.categoryID}">${category.categoryName}</option>
											</c:forEach>
										</select>
									</div>
									<input type="hidden" name="action" value="${category.categoryID}" >
									<button class="btn btn-sm btn-outline-secondary" type="submit">開始查詢</button>
								</FORM>
							</nav>
						</div>
					</div>
				</div>














			</div>
		</main>
	</div>
	<jsp:include page="/front-end/footer/footer.jsp" />
	<script
		src="<%=request.getContextPath()%>/js/stopExecutionOnTimeout.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.easing.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/js/jquery.datetimepicker.full.js"></script>
	<script id="rendered-js">
		
	</script>
	<script id="question_button">
		
	</script>
	<script id="picture">
		
	</script>
</body>
</html>