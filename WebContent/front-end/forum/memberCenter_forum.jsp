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
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/main-front.css" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/memSpace_forum.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/header.css">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
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
						<a class="submenu-item" href="#">訂單修改/取消</a>
						<a class="submenu-item" href="<%=request.getContextPath()%>/front-end/member/selectOrder.jsp">訂單查詢</a>
					</div></li>
				<li class="itembox drop-down"><a class="item">互動紀錄</a>
					<div class="submenu">
						<a class="submenu-item" href="<%=request.getContextPath()%>/front-end/forum/memberCenter_forum.jsp">討論區發文紀錄</a>
						<a class="submenu-item" href="<%=request.getContextPath()%>/front-end/forum/memberCenter_forum_collections.jsp">收藏文章</a>
						<a class="submenu-item" href="#">書評發表紀錄</a>
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
						<a class="submenu-item" href="<%=request.getContextPath()%>/front-end/celebrity_book/celebrityBook.jsp">收藏書單分享</a>
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
					<%@ include file="pageForMemberCenter_forum.file"%>
					<c:forEach var="faVO" items="${list}" varStatus="update" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
						<div class="row" id=forum_record>
							<div class="col-md-8">
								<a href="<%=request.getContextPath() %>/front-end/forum/fa.do?action=getOne_For_Display&faId=${faVO.faId}">${faVO.faTopic}</a>
							</div>
							<div class="col-md-2">
								<fmt:formatDate value="${faVO.faDate}" pattern="yyyy-MM-dd HH:mm:ss" />
							</div>
							<div class="col-md-1">
								<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal${update.index}">修改文章</button>

								<div class="modal fade" id="exampleModal${update.index}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog modal-lg" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel">修改文章</h5>
												<button type="button" class="close" data-dismiss="modal" aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<form method="post" action="<%=request.getContextPath()%>/front-end/forum/fa.do">
											<div class="modal-body">
												<p>
													<label for="topic">主題 :</label>
													<input type="text" name="faTopic" value="${faVO.faTopic}">
												</p>
												<p>
													<label for="content">內容 :</label>
													<textarea id="summernote${update.index}" name="faContent">${faVO.faContent}</textarea>
												</p>
												<p style="display: inline-flex;">
													<input type="submit">
													<input type="button" type="button" class="btn btn-secondary" data-dismiss="modal" value="取消">
													<input type="hidden" name="action" value="update">
													<input type="hidden" name="memId" value="${sessionScope.memVO.mem_id}">
													<input type="hidden" name="faId" value="${faVO.faId}">
													
												</p>
											</div>
											
											</form>
										</div>
									</div>
								</div>
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
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	
	<!-- include summernote css/js -->
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
	<script type="text/javascript">
		$(document).ready(
				function() {
					for(let i = 0; i < `${list.size()}`;i++){
					$('#summernote'+i).summernote(
							{
								fontSizes : [ '8', '9', '10', '11', '12', '14',
										'18', '24', '36', '48', '64', '82',
										'150' ],
								height : 300,
								lang : 'zh-CN',
								focus : true
							})
					}
				});
	</script>
</body>
</html>