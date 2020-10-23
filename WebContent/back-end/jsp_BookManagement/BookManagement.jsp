<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.book.model.*"%>
<%@ page import="com.category.model.*"%>
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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<title>商品上下架管理</title>
</head>

<body>
	<%@include file="/back-end/header/headerYH.jsp"%>
	<div id="container">
		<main id="center" class="column">
			<!-- search form -->
			<form method='post' action='${pageContext.request.contextPath}/BookManagement'>
				<%@include file="/back-end/jsp_Common/BookSearchForm.jsp"%>
				<button type="button" class="btn btn-primary" id="isSold0">下架已選商品</button>
				<button type="button" class="btn btn-primary" id="isSold1">上架已選商品</button>
				<button type="button" class="btn btn-primary" id="addBook" onclick="javascript:location.href='${pageContext.request.contextPath}/AddOneBook'">新增商品(單筆)</button>
				<span style="float: right; color: red; font-size: 12px">
					*售價是指當下定價、預設售價、促銷售價之中最低者
					<br>
					*折扣是以預設售價為準
				</span>
			</form>
			<!-- Table - Hoverable rows -->
			<table class="table table-hover">
				<%@include file="/back-end/jsp_Common/BookTableHead.jsp"%>
				<tbody>
					<%
						//若是未查詢，會是空List或是前一次搜尋結果
						List<Book> books = (ArrayList<Book>) request.getAttribute("books");
						session.setAttribute("books", books);
						PublisherService publisherService = (PublisherService) getServletContext().getAttribute("publisherService");
					%>
					<c:if test="${not empty books}">
						<%@ include file='/back-end/pages_BookManagement/page1.file'%><%-- 查詢筆數和現在頁數的顯示 --%>
						<c:forEach var="book" items="${books}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
							<%
								Book book = (Book) pageContext.getAttribute("book");
										String publisherName = publisherService.getOnePublisher(book.getPublisherID()).getPublisher_Name();
							%>
							<tr>
								<td>
									<input type="checkbox" value="${book.bookID}">
								</td>
								<td>
									<a href="${pageContext.request.contextPath}/Product/${book.bookID}">${book.bookName}</a>
									<p>${book.bookNameOriginal}</p>
								</td>
								<td>${book.isbn}</td>
								<td>${book.author}</td>
								<td><%=publisherName%></td>
								<td>${book.listPrice}</td>
								<td>${book.salePrice}</td>
								<td>${book.salePricePromo eq Double.NaN ? "" : book.salePricePromo}</td>
								<td>${book.bookBP  eq 0.0 ? "" : book.bookBP}</td>
								<td>${book.bookBPPromo eq Double.NaN ? "" : book.bookBPPromo}</td>
								<td>${book.publicationDate}</td>
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
									<FORM METHOD="get" enctype="multipart/form-data" action="${pageContext.request.contextPath}/BookUpdateOne" style="margin-bottom: 0px;" target="_blank">
										<input type="hidden" name="bookID" value="${book.bookID}">
										<input type="submit" value="編輯">
									</FORM>
								</td>
							</tr>
						</c:forEach>
						<%@ include file="/back-end/pages_BookManagement/page2.file"%>
					</c:if>
				</tbody>
			</table>
		</main>
		<%@include file="/back-end/sidebar/sidebar.jsp"%>
	</div>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
	<script>
		$(document).ready(function() {
			//註冊全選按鈕click
			$('#select-all').click(function() {
				var checked = this.checked;
				$('input[type="checkbox"]').each(function() {
					this.checked = checked;
				});
			})
			//註冊下架按鈕click
			$('#isSold0').click(function() {
				var bookList = "0";
				$('input[type="checkbox"]').each(function() {
					if (this.checked === true) {
						bookList = bookList + "," + this.value;
					}
				});
				$.post('${request.header("Referer")}?isSold=0', {
					bookList : bookList
				}, alert("下架成功！請重新查詢確認"));
			})

			//註冊上架按鈕click
			$('#isSold1').click(function() {
				var bookList = "1";
				$('input[type="checkbox"]').each(function() {
					if (this.checked === true) {
						bookList = bookList + "," + this.value;
					}
				});
				$.post('${request.header("Referer")}?isSold=1', {
					bookList : bookList
				}, alert("上架成功！請重新查詢確認"));
			})
		});
	</script>
</body>
</html>
