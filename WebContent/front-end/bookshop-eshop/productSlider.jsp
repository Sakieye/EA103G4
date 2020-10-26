<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.book.model.*"%>

<%
	String type = request.getParameter("type");
	List<Book> books = (List<Book>) request.getAttribute(type);
	pageContext.setAttribute("books", books);

	int firstSlideItems = 6;
	if (books.size() < 6) {
		firstSlideItems = books.size();
	}
%>
<div class="row">
	<div class="col-md-12">
		<h3 class="text-center carousel-title">${param.title}</h3>
		<br>
		<br>
		<br>
	</div>
	<div class="col-md-12">
		<!--Carousel-->
		<div id="${param.type}" class="carousel slide d-none d-sm-none d-md-block" data-ride="carousel" data-interval="false">
			<!-- Carousel Contorls -->
			<a class="carousel-control-prev carousel-indicator" href="#${param.type}" role="button" data-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a>
			<a class="carousel-control-next carousel-indicator" href="#${param.type}" role="button" data-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
			<!--End of Carousel Contorls-->
			<div class="carousel-inner">
				<!--First Slide-->
				<div class="carousel-item active">
					<div class="row">
						<c:forEach var="book" items="${books}" begin="0" end="<%=firstSlideItems-1%>">
							<div class="col-md-2" id="product-slider-div">
								<div class="product-block">
									<a href='${pageContext.request.contextPath}/Shopping.html?book_id=${book.bookID}'>
										<img class="d-block w-100" src="${pageContext.request.contextPath}/ShowBookPic?bookID=${book.bookID}" alt="Product">
									</a>
									<div class="product-infomation">
										<ul>
											<li class="product-name">
												<a href='${pageContext.request.contextPath}/Shopping.html?book_id=${book.bookID}'>${book.bookName}</a>
											</li>
											<li class="product-author">
												<a href='${pageContext.request.contextPath}/front-end/shopping/bookindex.jsp?author=${book.author}'>作者:&nbsp;${book.author}</a>
											</li>
											<li class="product-real-sale-price">
												優惠價:&nbsp;
												<span>
													<fmt:formatNumber type="number" maxFractionDigits="0" value="${book.bookRealPrice/book.listPrice*100}" />
												</span>
												折
												<span>
													<fmt:formatNumber type="number" maxFractionDigits="0" value="${book.bookRealPrice}" />
												</span>
												元
											</li>
										</ul>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
				<!--End of First Slide-->
				<!--Other Slides-->
				<c:if test="${books.size() > 6}">
					<%
						int cnt = firstSlideItems;
					%>
					<c:forEach var="b" items="${books}" begin="<%=firstSlideItems-1%>" end="${books.size()-1}" step="6">
						<%
							cnt += 6;
									if (cnt > books.size()) {
										cnt = books.size();
									}
						%>
						<div class="carousel-item">
							<div class="row">
								<c:forEach var="book" items="${books}" begin="<%=cnt-6%>" end="<%=cnt-1%>">
									<div class="col-md-2" id="product-slider-div">
										<div class="product-block">
											<a href='${pageContext.request.contextPath}/Shopping.html?book_id=${book.bookID}'>
												<img class="d-block w-100" src="${pageContext.request.contextPath}/ShowBookPic?bookID=${book.bookID}" alt="Product">
											</a>
											<div class="product-infomation">
												<ul>
													<li class="product-name">
														<a href='${pageContext.request.contextPath}/Shopping.html?book_id=${book.bookID}'>${book.bookName}</a>
													</li>
													<li class="product-author">
														<a href='${pageContext.request.contextPath}/front-end/shopping/bookindex.jsp?author=${book.author}'>作者:&nbsp;${book.author}</a>
													</li>
													<li class="product-real-sale-price">
														優惠價:&nbsp;
														<span>
															<fmt:formatNumber type="number" maxFractionDigits="0" value="${book.bookRealPrice/book.listPrice*100}" />
														</span>
														折
														<span>
															<fmt:formatNumber type="number" maxFractionDigits="0" value="${book.bookRealPrice}" />
														</span>
														元
													</li>
												</ul>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</c:forEach>
				</c:if>
				<!--End of Other Slides-->
			</div>
		</div>
		<!--End of Carousel-->
	</div>
	<!-- End of Row -->
</div>