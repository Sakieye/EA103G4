<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.promo.model.*"%>
<%@ page import="com.promodetail.model.*"%>
<%@ page import="com.book.model.*"%>
<%@ page import="com.publishers.model.*"%>

<%
	//到此頁面就有
	Promo promo = (Promo) request.getAttribute("promo");
	String promoID = promo.getPromoID();
	pageContext.setAttribute("promoID", promoID);
	List<Category> categories = (ArrayList<Category>) request.getAttribute("categories");
	PublisherService publisherService = (PublisherService) getServletContext().getAttribute("publisherService");
	PromoDetailService promoDetailService = (PromoDetailService) getServletContext()
			.getAttribute("promoDetailService");
	//查詢後才有
	List<Book> books = (ArrayList<Book>) request.getAttribute("books");
	//換頁操作需用session紀錄
	session.setAttribute("promo", promo);
	session.setAttribute("books", books);
	session.setAttribute("categories", categories);
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
<!-- jQuery AutoCompelete -->
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-ui.css">
<script src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.auto-complete.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery.auto-complete.css" />

<title>新增促銷事件明細</title>
</head>

<body>
	<!-- header -->
	<%@include file="/back-end/header/header.jsp"%>
	<div id="container">
		<main id="center" class="column">
			<%@include file="/back-end/jsp_Common/PromoInfo.jsp"%>
			<!-- search form -->
			<form method='post' action='${pageContext.request.contextPath}/AddPromoDetails?promoID=<%=promoID%>'>
				<%@include file="/back-end/jsp_Common/BookSearchForm.jsp"%>
				<span style="float: right; color: red; font-size: 12px; position: relative; top: -4em;">*售價是指當下定價、預設售價、促銷售價之中最低者</span>
				<button type="button" class="btn btn-danger" id="AddToPromo">將已選商品加入此促銷事件</button>
				<button type="button" class="btn btn-danger" id="AddAllToPromo" onclick="location.href='${pageContext.request.contextPath}/AddPromoDetails?action=AddAllToPromo&promoID=<%=promoID%>'">將全站商品加入此促銷事件</button>
			</form>
			<!-- Table - Hoverable rows -->
			<table class="table table-hover">
				<%@ include file='/back-end/jsp_Common/PromoDetailTableHead.jsp'%>
				<tbody>
					<c:if test="${not empty books}">
						<%@ include file='/back-end/jsp_BookManagement/page1.file'%><%-- 查詢筆數和現在頁數的顯示 --%>
						<c:forEach var="book" items="${books}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
							<%
								Book book = (Book) pageContext.getAttribute("book");
										String bookID = book.getBookID();
										String publisherName = publisherService.getOnePublisher(book.getPublisherID()).getPublisher_Name();
										Boolean isExisted = promoDetailService.getByPromoIDAndBookID(promoID, bookID).isPresent();
										pageContext.setAttribute("isExisted", isExisted);
							%>
							<tr>
								<td>
									<c:choose>
										<c:when test="${isExisted}">
                                                                                                                                        已加入
                                         </c:when>
										<c:otherwise>
											<input type="checkbox" value="${book.bookID}">
										</c:otherwise>
									</c:choose>
								</td>
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
								<td></td>
							</tr>
						</c:forEach>
						<%@ include file='/back-end/jsp_BookManagement/page2.file'%>
					</c:if>
				</tbody>
			</table>
		</main>
		<%@include file="/back-end/sidebar/sidebar.jsp"%>
	</div>
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="${pageContext.request.contextPath}/js/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<script>
        $(document).ready(function() {
            //註冊全選按鈕click
            $('#select-all').click(function() {
                var checked = this.checked;
                $('input[type="checkbox"]').each(function() {
                    this.checked = checked;
                });
            })
            //註冊新增按鈕click
            $('#AddToPromo').click(function() {
                var bookList = "";
                $('input[type="checkbox"]').each(function() {
                    if (this.checked === true) {
                        bookList = bookList + "," + this.value;
                    }
                });
                
                $.post('${request.header("Referer")}?action=AddToPromo&promoID=<%=promoID%>', { bookList: bookList }, function(){
                    alert("成功加入！請接著設定促銷折扣和紅利");
                    window.location.replace("<%=request.getContextPath() + "/ShowPromoDetails?promoID=" + promoID%>
		");
																})
											})
						});
	</script>
	<!--Search Autocompelete-->
	<%@include file="/front-end/header/header-search-autocompelete-js.jsp"%>
</body>

</html>