<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.favorite_book.model.*,com.mem.model.*,com.book.model.*,com.bookpic.model.*"%>
<script type="text/javascript"  src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!DOCTYPE HTML>
<html>
<head>
	<title>bookshopFavorite_Books</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />

	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/main-front.css" />
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/header.css" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    

<style>
      table td{
         font-size: 16px;
         font-family: "Helvetica", "Arial","LiHei Pro","黑體-繁","微軟正黑體", sans-serif;
         text-align: center;
      }
      table th{
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
						<c:if test="${not empty messages}">												
								<c:forEach var="messages" items="${messages}">
									<script>
										swal("${messages}","","success");
									</script>
								</c:forEach>
						</c:if>
						<c:if test="${not empty errorMsgs}">			
						<c:forEach var="errorMsgs" items="${errorMsgs}">
									<script>
										swal("${errorMsgs}","收藏書單已有此商品","error");
									</script>
								</c:forEach>
						</c:if>
						<table class="table table-hover">
							<thead>
							<%
								MemVO memVO = (MemVO) session.getAttribute("memVO");
								Favorite_BookService fbSvc = new Favorite_BookService();
								List<Favorite_Book> list = fbSvc.getAll(memVO.getMem_id());
								pageContext.setAttribute("list", list);
								BookService bookService = (BookService) getServletContext().getAttribute("bookService");
							%>
							<tr>
								<th>商品圖</th>
								<th>書名</th>
								<th>作者</th>
								<th>收藏時間</th>
								<th></th>
								<th></th>	

							</tr>
							</thead>
							<%@ include file="page1.file"%>
							<c:forEach var="favorite_Book" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
								<%
									Favorite_Book favorite_Book = (Favorite_Book) pageContext.getAttribute("favorite_Book");
									String bookID = favorite_Book.getBook_ID();
									String bookName = bookService.getByBookID(bookID).get().getBookName();
									String author = bookService.getByBookID(bookID).get().getAuthor();
									
									BookPicService bookPicService = (BookPicService) getServletContext().getAttribute("bookPicService");
									Optional<BookPicture> bookPicture = bookPicService.getFirstPicByBookID(bookID);
									String bookPicName = bookPicture.get().getBookPicName();
									
								%>
							<tbody>	
								<tr>
									<td><img src="${pageContext.request.contextPath}/ShowBookPic?bookID=<%=bookID%>&bookPicName=<%=bookPicName%>" alt="Product" class="max-auto d-block" width="100"></td>				
									<td><%=bookName%></td>
									<td><%=author%></td>
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
							</tbody>	
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