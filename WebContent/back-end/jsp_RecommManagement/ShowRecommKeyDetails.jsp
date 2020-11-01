<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.book.model.*"%>
<%@ page import="com.publishers.model.*"%>

<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- 自訂css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main-back.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bookManagement.css" />
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
<title>推薦系統管理</title>
</head>
<body>
	<%@include file="/back-end/header/header.jsp"%>
	<div id="container">
		<main id="center" class="column">
			<h1>${param.keyName}</h1>
			<div>
				<button type="button" class="btn btn-danger" onclick="location.href='${pageContext.request.contextPath}/UpdateRecommKey?keyName=${param.keyName}'">在此Key中新增/更新統計資料</button>
			</div>
			<br>
			<!-- Table - Hoverable rows -->
			<table class="table table-hover">
				<thead>
					<tr>
						<th scope="col">瀏覽次數</th>
						<th scope="col">書名/書名原文</th>
						<th scope="col">作者</th>
						<th scope="col">出版社</th>
						<th scope="col">定價</th>
						<th scope="col">
							預設
							<br>
							售價
						</th>
						<th scope="col">促銷售價</th>
						<th scope="col">
							紅利
							<br>
							回饋
						</th>
						<th scope="col">促銷紅利</th>
						<th scope="col">
							上架
							<br>
							狀態
						</th>
						<th scope="col">庫存量</th>
						<th scope="col">操作</th>
					</tr>
				</thead>

				<%
					//若是未查詢，會是空List或是前一次搜尋結果
					List<Book> books = (ArrayList<Book>) request.getAttribute("books");
					Map<String, Double> viewedCount = (Map<String, Double>) request.getAttribute("viewedCount");
					String keyName = (String) request.getAttribute("keyName");
					session.setAttribute("books", books);
					session.setAttribute("viewedCount", viewedCount);
					session.setAttribute("keyName", keyName);
				%>
				<tbody>
					<c:if test="${not empty books}">
						<%@include file="/back-end/jsp_RecommManagement/page1.file"%>
						<c:forEach var="book" items="${books}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
							<%
								Book book = (Book) pageContext.getAttribute("book");
								String bookID = book.getBookID();
								PublisherService publisherService = (PublisherService) getServletContext().getAttribute("publisherService");
								String publisherName = publisherService.getOnePublisher(book.getPublisherID()).getPublisher_Name();
							%>
							<tr>
								<td><%=viewedCount.get(bookID)%></td>
								<td>
									<a href="${pageContext.request.contextPath}/Shopping.html?book_id=${book.bookID}">${book.bookName}</a>
									<p>${book.bookNameOriginal}</p>
								</td>
								<td>${book.author}</td>
								<td><%=publisherName%></td>
								<td>${book.listPrice}</td>
								<td>${book.salePrice}</td>
								<td>${book.salePricePromo eq Double.NaN ? "" : book.salePricePromo}</td>
								<td>${book.bookBP}</td>
								<td>${book.bookBPPromo eq Double.NaN ? "" : book.bookBPPromo}</td>
								<td>${book.isSold eq 1 ? "上架" : "下架"}</td>
								<c:choose>
									<c:when test="${book.stock < book.safetyStock}">
										<td style="color: red;">${book.stock}<br>
											庫存不足
										</td>
									</c:when>
									<c:otherwise>
										<td>${book.stock}</td>
									</c:otherwise>
								</c:choose>
								<td>
									<form METHOD="get" action="${pageContext.request.contextPath}/UpdateRecommKey" style="margin-bottom: 0px;" target="_blank">
										<input type="hidden" name="keyName" value="${param.keyName}">
										<input type="hidden" name="bookID" value="${book.bookID}">
										<input type="submit" value="編輯">
									</form>
								</td>
							</tr>
						</c:forEach>
						<%@include file="/back-end/jsp_RecommManagement/page2.file"%>
					</c:if>
				</tbody>
			</table>
		</main>
		<%@include file="/back-end/sidebar/sidebar.jsp"%>
	</div>
</body>
</html>