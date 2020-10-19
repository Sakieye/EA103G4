<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.mem.model.*"%>

<% 
	MemVO memVO = (MemVO)session.getAttribute("memVO");
	int bonus = memVO.getMem_bonus().intValue();
	int exp = memVO.getMem_exp().intValue();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BOOKSHOP部客匣</title>

<link rel="stylesheet" href="<%= request.getContextPath()%>/css/main-front.css" />
<link rel="stylesheet" href="<%= request.getContextPath()%>/css/header.css" />
<link rel="stylesheet" href="<%= request.getContextPath()%>/css/memSpace.css" />

</head>
<body>
<jsp:include page="/front-end/header/header.jsp"/>
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
			    <li class="itembox drop-down">
			        <a class="item">會員資料管理</a>
			        <div class="submenu">
			            <a class="submenu-item" href="<%= request.getContextPath()%>/front-end/member/updatePwd.jsp">修改密碼</a>
			            <a class="submenu-item" href="<%= request.getContextPath()%>/front-end/member/memberSpace.jsp">會員資料更新</a>
			            <a class="submenu-item" href="<%= request.getContextPath()%>/front-end/member/payMethod.jsp">支付管理</a>
			        </div>
			    </li>
			    <li class="itembox drop-down">
			        <a class="item">訂單管理</a>
			        <div class="submenu">
			            <a class="submenu-item" href="#">訂單修改/取消</a>
			            <a class="submenu-item" href="<%= request.getContextPath()%>/front-end/member/selectOrder.jsp">訂單查詢</a>
			        </div>
			    </li>
			    <li class="itembox drop-down">
			        <a class="item">互動紀錄</a>
			        <div class="submenu">
			            <a class="submenu-item" href="<%= request.getContextPath()%>/front-end/forum/memberCenter_forum.jsp">討論區發文紀錄</a>
			            <a class="submenu-item" href="<%=request.getContextPath()%>/front-end/forum/memberCenter_forum_collections.jsp">收藏文章</a>
			            <a class="submenu-item" href="#">書評發表紀錄</a>
			        </div>
			    </li>
			    <li class="itembox drop-down">
			        <a class="item">讀書會管理</a>
			        <div class="submenu">
			            <a class="submenu-item" href="<%=request.getContextPath()%>/front-end/bookclub/myBookClub.jsp">我的讀書會</a>
			            <a class="submenu-item" href="<%=request.getContextPath()%>/front-end/bookclub/review_BookClub.jsp">讀書會報名紀錄</a>
			        </div>
			    </li>
			    <li class="itembox drop-down">
			        <a class="item">講座</a>
			        <div class="submenu">
			            <a class="submenu-item" href="#">講座報名紀錄</a>
			        </div>
			    </li>
			    <li class="itembox drop-down">
			        <a class="item">收藏的書單管理</a>
			        <div class="submenu">
			            <a class="submenu-item" href="<%= request.getContextPath()%>/front-end/favorite_book/favoriteBook.jsp">已收藏書單</a>
			            <a class="submenu-item" href="<%= request.getContextPath()%>/front-end/celebrity_book/celebrityBook.jsp">收藏書單分享</a>
			        </div>
			    </li>
			</ul>
			<div class="mem-info">
				<% if(memVO.getMem_pic() != null) {%>
					<img src="<%=request.getContextPath()%>/mem/MemPic?mem_id=${memVO.mem_id}" style="width: 220px; height: 220px;">	
				<%} else {%>			
					<img src="<%=request.getContextPath()%>/BookShopLogo/3.png" style="width: 220px; height: 220px;">		
				<% } %>
				<table style="margin-top: 10px; background-color: white;" class="myTable">
					<tr>
						<td>姓名</td>
						<td>${memVO.mem_name}</td>
					</tr>
					<tr>
						<td>暱稱</td>
						<td>${memVO.mem_nickname}</td>
					</tr>
					<tr>
						<td>E-MAIL</td>
						<td>${memVO.mem_email}</td>
					</tr>
					<tr>
						<td>紅利點數</td>
						<td><%= bonus %></td>
					</tr>
					<tr>
						<td>等級</td>
						<td>
							<% if(exp <= 1000) {%>
								LV.1
							<%} else if (exp > 1000 && exp <= 2000) {%>
								LV.2
							<%} else if (exp > 2000 && exp <= 3000) {%>
								LV.3
							<%} else if (exp > 3000 && exp <= 4000) {%>
								LV.4
							<%} else {%>
								LV.5
							<%} %>
							&nbsp;&nbsp;(<%= exp %>)
						</td>
					</tr>
				</table>
			</div>
		</div>
		
		
	</div>
	

<jsp:include page="/front-end/footer/footer.jsp"/>

	<script src='<%= request.getContextPath() %>/js/jquery.min.js'></script>
    <script src="<%= request.getContextPath() %>/js/jquery.scrollex.min.js"></script>
    <script src="<%= request.getContextPath() %>/js/skel.min.js"></script>
    <script src="<%= request.getContextPath() %>/js/util.js"></script>
    <script src="<%= request.getContextPath() %>/js/main.js"></script>
</body>
</html>