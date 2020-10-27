<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.celebrity_book.model.*,com.mem.model.*,com.book.model.*,com.bookpic.model.*"%>
<script type="text/javascript"  src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<!DOCTYPE HTML>
<html>
<head>
	<title>bookshopCelebrity_Books</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	
	<link rel="stylesheet" href="<%= request.getContextPath()%>/css/main-front.css" />
    <link rel="stylesheet" href="<%= request.getContextPath()%>/css/header.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/memSpace_forum.css" />
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
				<h2>會員中心MemberCenter</h2>
			</header>
		</div>
	</section>
	<div class="content">
		<div class="menuDiv">
			<ul class="myMenu">
				<li class="itembox drop-down"><a class="item">會員資料管理</a>
					<div class="submenu">
						<a class="submenu-item" href="<%=request.getContextPath()%>/front-end/member/updatePwd.jsp">修改密碼</a>
						<a class="submenu-item" href="<%=request.getContextPath()%>/front-end/member/memberSpace.jsp">會員資料更新</a>
						<a class="submenu-item" href="<%=request.getContextPath()%>/front-end/member/payMethod.jsp">支付管理</a>
					</div></li>
				<li class="itembox drop-down"><a class="item">訂單管理</a>
					<div class="submenu">
						<a class="submenu-item" href="<%=request.getContextPath()%>/front-end/member/selectOrder.jsp">訂單查詢</a>
					</div></li>
				<li class="itembox drop-down"><a class="item">互動紀錄</a>
					<div class="submenu">
						<a class="submenu-item" href="<%=request.getContextPath()%>/front-end/forum/memberCenter_forum.jsp">討論區發文紀錄</a>
						<a class="submenu-item" href="<%=request.getContextPath()%>/front-end/forum/memberCenter_forum_collections.jsp">收藏文章</a>
					</div></li>
				<li class="itembox drop-down"><a class="item">讀書會管理</a>
					<div class="submenu">
						<a class="submenu-item" href="<%=request.getContextPath()%>/front-end/bookclub/myBookClub.jsp">我的讀書會</a>
						<a class="submenu-item" href="<%=request.getContextPath()%>/front-end/bookclub/review_BookClub.jsp">讀書會報名紀錄</a>
					</div></li>
				<li class="itembox drop-down"><a class="item">講座</a>
					<div class="submenu">
						<a class="submenu-item" href="#">講座報名紀錄</a>
					</div></li>
				<li class="itembox drop-down"><a class="item">收藏的書單管理</a>
					<div class="submenu">
						<a class="submenu-item" href="<%=request.getContextPath()%>/front-end/favorite_book/favoriteBook.jsp">已收藏書單</a>
						<c:if test="${sessionScope.memVO.mem_iskol == 1}">
			            	<a class="submenu-item" href="<%= request.getContextPath()%>/front-end/celebrity_book/celebrityBook.jsp">收藏書單分享</a>
			        	</c:if>
					</div></li>
			</ul>

    
		    <div class="mem-info">
				<div class="container">
					<div class="row">
								<c:if test="${not empty messages}">												
										<c:forEach var="message" items="${messages}">
											<script>
												swal("${message}","","success");
											</script>									
										</c:forEach>
								</c:if>
								<c:if test="${not empty errorMsgs}">			
								<c:forEach var="errorMsgs" items="${errorMsgs}">
											<script>
												swal("${errorMsgs}","分享書單已有此商品","error");
											</script>
										</c:forEach>
								</c:if>
								<table class="table table-hover">
									<thead>
									<tr>
										<%
											MemVO memVO = (MemVO)session.getAttribute("memVO");
											Celebrity_BookService cbSvc = new Celebrity_BookService();
											List<Celebrity_Book> list = cbSvc.getAll(memVO.getMem_id());
											pageContext.setAttribute("list", list);
											BookService bookService = (BookService) getServletContext().getAttribute("bookService");							
										%>
										<th>商品圖</th>						
										<th>書名</th>
										<th>作者</th>
										<th>狀態</th>
										
										<th></th>
										<th></th>						
									</tr>
									</thead>
									<%@ include file="page1.file" %> 
									<c:forEach var="celebrity_Book" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
										<% 
										Celebrity_Book celebrity_book = (Celebrity_Book) pageContext.getAttribute("celebrity_Book");
										String bookID = celebrity_book.getBook_ID();
										String bookName = bookService.getByBookID(bookID).get().getBookName();
										String author = bookService.getByBookID(bookID).get().getAuthor();
										
										BookPicService bookPicService = (BookPicService) getServletContext().getAttribute("bookPicService");
										Optional<BookPicture> bookPicture = bookPicService.getFirstPicByBookID(bookID);
										String bookPicName = bookPicture.get().getBookPicName();
										%>
									<tbody>
										<tr>
											
											<td><img src="${pageContext.request.contextPath}/ShowBookPic?bookID=<%=bookID%>&bookPicName=<%=bookPicName%>" alt="Product" class="max-auto d-block" width="50"></td>				
											<td><%=bookName%></td>
											<td><%=author%></td>
											<td>${celebrity_Book.share_State eq 1 ? "分享中" : "未分享"}</td>	 
											
											<td>
											  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/celebrity_book/celebrity_book.do" style="margin-bottom: 0px;">
											     
											     <input type="submit" value="修改分享狀態">
											     <input type="hidden" name="book_ID"  value="${celebrity_Book.book_ID}">
											     <input type="hidden" name="mem_ID"  value="${celebrity_Book.mem_ID}">
											     <input type="hidden" name="share_State" value="${celebrity_Book.share_State}">
											     <input type="hidden" name="action" value="updateCelBook"></FORM>
											</td>
											<td>
											  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/celebrity_book/celebrity_book.do" style="margin-bottom: 0px;">
											     <input type="submit" value="刪除">
											     <input type="hidden" name="book_ID"  value="${celebrity_Book.book_ID}">
											     <input type="hidden" name="mem_ID"  value="${celebrity_Book.mem_ID}">
											     <input type="hidden" name="action" value="deleteCelBook"></FORM>
											</td>
											
										</tr>
									</tbody>	
									</c:forEach>							            
								</table>
								<%@ include file="page2.file" %>
						</div> 
					 </div>
		           </div>
		       </div>
		    
		   </div>
		
	<jsp:include page="/front-end/footer/footer.jsp" />
	<script src='<%=request.getContextPath()%>/js/jquery.min.js'></script>
	<script src="<%=request.getContextPath()%>/js/jquery.scrollex.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/skel.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/util.js"></script>
	<script src="<%=request.getContextPath()%>/js/main.js"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
		    
</body>
</html>