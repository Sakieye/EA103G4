<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.mem.model.*"%>
<%@ page import="com.Fc.model.*"%>
<%@ page import="com.Fa.model.*"%>
<jsp:useBean id="memVO" scope="session" type="com.mem.model.MemVO" />
<jsp:useBean id="fasvc" scope="page" class="com.Fa.model.FaService"/>
<jsp:useBean id="fcsvc" scope="page" class="com.Fc.model.FcService"/>
<jsp:useBean id="memSvc" scope="page" class="com.mem.model.MemService" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberCenter</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/main-front.css" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/header.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/memSpace_forum.css" />

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
						<div class="col-md-8">文章</div>
						<div class="col-md-2">發文時間</div>
						<div class="col-md-1"></div>
						<div class="col-md-1"></div>
					</div>
					<hr>
					<%@ include file="pageForMemberCenter_forum_collections.file"%>
					<c:forEach var="faVO" items="${fcsvc.getOneMemCollection(memVO.mem_id)}" varStatus="collections" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
						<div class="row" id=forum_record>
							<div class="col-md-8">
								<a href="<%=request.getContextPath() %>/front-end/forum/fa.do?action=getOne_For_Display&faId=${faVO.faId}" target="_blank">${fasvc.getOneFa(faVO.faId).faTopic}</a>
							</div>
							<div class="col-md-2">
								<fmt:formatDate value="${fasvc.getOneFa(faVO.faId).faDate}" pattern="yyyy-MM-dd HH:mm:ss" />
							</div>
							<div class="col-md-2">
								<form id="cancelCollect${collections.index}" method="post" action="<%=request.getContextPath()%>/front-end/forum/fc.do">
									<input type="hidden" name="faId" value="${faVO.faId}">
									<input type="hidden" name="memId" value="${memVO.mem_id}">
									<input type="hidden" name="action" value="cancelCollect">
									<input type="hidden" name="whichPage" value="<%=whichPage%>">
								</form>
								<input id="cancelBtn${collections.index}"type="submit" value="取消收藏">
							</div>

						</div>
						<hr>
					</c:forEach>
					<%@ include file="page2.file"%>
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
	
	<script src="https://kit.fontawesome.com/21e3918c11.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
	
	<!-- sweetalert -->
  	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  	
  	<script>
	$(document).ready(()=>{
		for(let i = 0; i < ${fcsvc.getOneMemCollection(memVO.mem_id).size()} ; i++){
			$("#cancelBtn" + i).click(() => {
				swal({
					title: "Are you sure ?",
					icon: "warning",
					buttons: {
						confirm:{
							text:"OK",
							value:true
						},
						danger:{
							text:"cancel",
							value:false
						}
					}
				}).then((value) => {
					if(value === true){
						$("#cancelCollect" + i).submit();
					}
				});
			})
		}
	})  	
  	</script>
</body>
</html>