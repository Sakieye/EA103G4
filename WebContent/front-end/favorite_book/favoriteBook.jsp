<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.favorite_book.model.*,com.mem.model.*,com.book.model.*"%>

<!DOCTYPE HTML>
<html>
<head>
<title>bookshopFavorite_Books</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/main-front.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/header.css" />
<style>
table td {
	font-size: 20px;
	font-family: "Helvetica", "Arial", "LiHei Pro", "黑體-繁", "微軟正黑體",
		sans-serif;
	font-weight: 900;
	border: 0;
	color: black;
}

table input {
	font-size: 20px;
	font-family: "Helvetica", "Arial", "LiHei Pro", "黑體-繁", "微軟正黑體",
		sans-serif;
	font-weight: 900;
}
</style>

<style>
table#table-1 {
	background-color: #CCCCFF;
	border: 2px solid black;
	text-align: center;
}

table#table-1 h4 {
	color: red;
	display: block;
	margin-bottom: 1px;
}

h4 {
	color: blue;
	display: inline;
}
</style>

<style>
table {
	width: 800px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
}

table, th, td {
	border: 1px solid #CCCCFF;
}

th, td {
	padding: 5px;
	text-align: center;
}
</style>

</head>
<body class="subpage">
	<jsp:include page="/front-end/header/header.jsp" />

	<section id="One" class="wrapper style3">
		<div class="inner">
			<header class="align-center">
				<p>部客匣BookShop</p>
				<h2>我的收藏清單</h2>
			</header>
		</div>
	</section>

	<section id="two" class="wrapper style2">
		<div class="inner">
			<div class="box">
				<div class="content">
					<div id="formdiv">
						<c:if test="${not empty errorMsgs}">
							<c:forEach var="message" items="${errorMsgs}">
								<script>
									alert("${message}");
								</script>
							</c:forEach>
						</c:if>
						<table>
							<%
								MemVO memVO = (MemVO) session.getAttribute("memVO");
								Favorite_BookService fbSvc = new Favorite_BookService();
								List<Favorite_Book> list = fbSvc.getAll(memVO.getMem_id());
								pageContext.setAttribute("list", list);
								BookService bookService = (BookService) getServletContext().getAttribute("bookService");
							%>
							<tr>
								<th class="align-center">書名</th>
								<th class="align-center">收藏時間</th>
								<c:if test="${ memVO.getMem_iskol()==1}">
									<th class="align-center">新增</th>
								</c:if>
								<th class="align-center">刪除</th>

							</tr>
							<%@ include file="page1.file"%>
							<c:forEach var="favorite_Book" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
								<%
									Favorite_Book favorite_Book = (Favorite_Book) pageContext.getAttribute("favorite_Book");
										//String bookID = favorite_Book.getBook_ID();
										String bookName = bookService.getByBookID(favorite_Book.getBook_ID()).get().getBookName();
								%>
								<tr>
									<td><%=bookName%></td>
									<td>${favorite_Book.fav_Time}</td>
									<c:if test="${ memVO.getMem_iskol()==1}">
										<td>
											<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/celebrity_book/celebrity_book.do" style="margin-bottom: 0px;">
												<input type="submit" value="新增">
												<input type="hidden" name="book_ID" value="${favorite_Book.book_ID}">
												<input type="hidden" name="mem_ID" value="${favorite_Book.mem_ID}">
												<input type="hidden" name="action" value="insertCelBook">
											</FORM>
										</td>
									</c:if>
									<td>
										<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/favorite_book/favorite_book.do" style="margin-bottom: 0px;">
											<input type="submit" value="刪除">
											<input type="hidden" name="book_ID" value="${favorite_Book.book_ID}">
											<input type="hidden" name="mem_ID" value="${favorite_Book.mem_ID}">
											<input type="hidden" name="action" value="deleteFavBook">
										</FORM>
									</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
<%@ include file="page2.file"%>

<script src='<%=request.getContextPath()%>/js/jquery.min.js'></script>
<script src="<%=request.getContextPath()%>/js/jquery.scrollex.min.js"></script>
<script src="<%=request.getContextPath()%>/js/skel.min.js"></script>
<script src="<%=request.getContextPath()%>/js/util.js"></script>
<script src="<%=request.getContextPath()%>/js/main.js"></script>
</html>