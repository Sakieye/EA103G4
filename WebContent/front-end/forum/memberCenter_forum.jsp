<%@ page contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.mem.model.*"%>
<%@ page import="com.Fa.model.*"%>

<%
	MemVO memVO = (MemVO) session.getAttribute("memVO");
	String memId = memVO.getMem_id();
	FaService faSvc = new FaService();
	List<FaVO> list = faSvc.getOneMemFa(memId);
	pageContext.setAttribute("list", list);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberCenter</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/main-front.css" />
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/memSpace_forum.css" />
	<link rel="stylesheet"
    href="<%=request.getContextPath()%>/css/header.css">

</head>
<body>
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
						<a class="submenu-item" href="#">修改密碼</a> <a class="submenu-item"
							href="<%=request.getContextPath()%>/front-end/member/memberSpace.jsp">會員資料更新</a>
						<a class="submenu-item" href="#">支付管理</a>
					</div></li>
				<li class="itembox drop-down"><a class="item">訂單管理</a>
					<div class="submenu">
						<a class="submenu-item" href="#">訂單修改/取消</a> <a
							class="submenu-item" href="#">訂單查詢</a>
					</div></li>
				<li class="itembox drop-down"><a class="item">二手書訂單管理</a>
					<div class="submenu">
						<a class="submenu-item" href="#">二手書訂單修改/取消</a> <a
							class="submenu-item" href="#">二手書訂單查詢</a>
					</div></li>
				<li class="itembox drop-down"><a class="item">互動紀錄</a>
					<div class="submenu">
						  <a class="submenu-item" href="<%= request.getContextPath()%>/front-end/forum/memberCenter_forum.jsp">討論區發文紀錄</a>
			            <a class="submenu-item" href="<%=request.getContextPath()%>/front-end/forum/memberCenter_forum_collections.jsp">追蹤文章</a>
			            <a class="submenu-item" href="#">書評發表紀錄</a>
					</div></li>
				<li class="itembox drop-down"><a class="item">讀書會管理</a>
					<div class="submenu">
						<a class="submenu-item" href="#">我的讀書會</a> <a class="submenu-item"
							href="#">讀書會報名紀錄</a>
					</div></li>
				<li class="itembox drop-down"><a class="item">講座</a>
					<div class="submenu">
						<a class="submenu-item" href="#">講座報名紀錄</a>
					</div></li>
				<li class="itembox drop-down"><a class="item">收藏的書單管理</a>
					<div class="submenu">
						<a class="submenu-item" href="#">已收藏書單</a> <a class="submenu-item"
							href="#">收藏書單分享</a>
					</div></li>
			</ul>

			<div class="mem-info">
				<div class="container">
					<div class="row">
						<div class="col-md-8">主題</div>
						<div class="col-md-2">時間</div>
						<div class="col-md-1"></div>
						<div class="col-md-1"></div>
					</div>
					<hr>
					<%@ include file="pageForMemberCenter_forum.file" %>
					<c:forEach var="faVO" items="${list}" begin="<%=pageIndex%>"
						end="<%=pageIndex+rowsPerPage-1%>">
						<div class="row" id=forum_record>
							<div class="col-md-8"><a href="<%=request.getContextPath() %>/front-end/forum/fa.do?action=getOne_For_Display&faId=${faVO.faId}">${faVO.faTopic}</a></div>
							<div class="col-md-2">
								<fmt:formatDate value="${faVO.faDate}"
									pattern="yyyy-MM-dd HH:mm:ss" />
							</div>
							<div class="col-md-1">
							<form method="post" action="<%=request.getContextPath()%>/front-end/forum/fa.do">
								<input type="submit" value="修改">
								<input type="hidden" name="faId" value="${faVO.faId}">
								<input type="hidden" name="action" value="getOne_For_Update">
							</form>
							</div>
							<div class="col-md-1">
							<form method="post" action="<%=request.getContextPath()%>/front-end/forum/fa.do">
								<input type="submit" value="刪除">
								<input type="hidden" name="action" value="delete">
								<input type="hidden" name="faId" value="${faVO.faId}">
							</form>
							</div>
						</div>
						<hr>
					</c:forEach>
					<%@ include file="page2.file" %>
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
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>

</body>
</html>