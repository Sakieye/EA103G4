<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.promo.model.*"%>
<%@ page import="com.promodetail.model.*"%>
<%@ page import="com.book.model.*"%>
<%@ page import="com.publishers.model.*"%>

<%
	Promo promo = (Promo) request.getAttribute("promo");
	String promoID = promo.getPromoID();
	PromoDetail PromoDetail = (PromoDetail) request.getAttribute("promoDetail");
	Book book = (Book) request.getAttribute("book");
	PublisherService publisherService = (PublisherService) getServletContext().getAttribute("publisherService");
	PromoDetailService promoDetailService = (PromoDetailService) getServletContext()
			.getAttribute("promoDetailService");
	String publisherName = publisherService.getOnePublisher(book.getPublisherID()).getPublisher_Name();
%>

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
<title>修改促銷明細(單筆)</title>
</head>

<body>
	<div class="col-md-12">
		<%@include file="/back-end/jsp_Common/PromoInfo.jsp"%>
		<form method='post' action='${pageContext.request.contextPath}/UpdatePromoDetail'>
			<div class="form-row">
				<div class="col-md-2">
					<label for="discount">設定折扣百分比</label>
					<input type="number" class="form-control" id="discount" name="discount" min="0" max="99" required>
				</div>
				<div class="col-md-2">
					<label for="bpPercent">設定紅利百分比</label>
					<input type="number" class="form-control" id="bpPercent" name="bpPercent" min="0" max="99" required>
				</div>
				<input type="hidden" name="promoID" value="${promo.promoID}">
				<input type="hidden" name="bookID" value="${book.bookID}">
				<div class="col-md-2">
					<button type="submit" class="btn btn-danger" id="UpdateAllPromoDetails" style="position: absolute; bottom: 0;">確認修改此筆促銷明細</button>
				</div>
			</div>
		</form>
		<!-- Table - Hoverable rows -->
		<table class="table table-hover">
			<thead>
				<tr>
					<th scope="col">書名/書名原文</th>
					<th scope="col">作者</th>
					<th scope="col">出版社</th>
					<th scope="col">定價</th>
					<th scope="col">
						預設
						<br>
						售價
					</th>
					<th scope="col">
						促銷售價/
						<br>
						折扣百分比
					</th>
					<th scope="col">
						紅利
						<br>
						回饋
					</th>
					<th scope="col">
						促銷紅利/
						<br>
						紅利百分比
					</th>
					<th scope="col">
						上架
						<br>
						狀態
					</th>
					<th scope="col">庫存量</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<a href="${pageContext.request.contextPath}/Shopping.html?book_id=${book.bookID}">${book.bookName}</a>
						<p>${book.bookNameOriginal}</p>
					</td>
					<td>${book.author}</td>
					<td><%=publisherName%></td>
					<td>${book.listPrice}</td>
					<td>${book.salePrice}</td>
					<td>${book.salePricePromo eq Double.NaN ? "" : book.salePricePromo}
						<p>${promoDetail eq null ? "" : promoDetail.discount}</p>
					</td>
					<td>${book.bookBP}</td>
					<td>${book.bookBPPromo eq Double.NaN ? "" : book.bookBPPromo}
						<p>${promoDetail eq null ? "" : promoDetail.bpPercent}</p>
					</td>
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
				</tr>
			</tbody>
		</table>
	</div>
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <%@include file="/back-end/jsp_Common/jquery-popper-bootstrap-js.jsp"%>
</body>

</html>