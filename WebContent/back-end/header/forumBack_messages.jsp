<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.Far.model.*"%>
<%@ page import="com.Fmr.model.*"%>
<%@ page import="java.util.*"%>

<%
	FmrService fmrSvc = new FmrService();
	List<FmrVO> list_fmr = fmrSvc.getAll();
	pageContext.setAttribute("list_fmr", list_fmr);
%>

<jsp:useBean id="faSvc" scope="page" class="com.Fa.model.FaService" />
<jsp:useBean id="fmSvc" scope="page" class="com.Fm.model.FmService" />



<!DOCTYPE html>
<html>

<head>
<meta name="name" content="content" charset="UTF-8">
<title></title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/main-back.css" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<style>
html {
	margin-left: 250px;
	margin-top: 50px;
}

#center {
	margin: 50px auto;
}

#center .row div {
	border: solid 1px;
	height: 50px;
}
</style>
</head>

<body>
	<!-- header -->
	<header id="header" class="">
		<div>
			<div id="logo">
				<a href="bookshopbake.html"> 儀表板<span>Dashboard</span></a>
			</div>
			<div id="userbar">
				<svg width="1em" height="1em" viewBox="0 0 16 16"
					class="bi bi-person" fill="currentColor"
					xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd"
						d="M10 5a2 2 0 1 1-4 0 2 2 0 0 1 4 0zM8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm6 5c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z" />
                </svg>
				<span id="username">Administrator 您好!</span> <a href="login.html"
					title="login" id="login_out">(登出)</a> <a href=""><svg
						width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-gear"
						fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd"
							d="M8.837 1.626c-.246-.835-1.428-.835-1.674 0l-.094.319A1.873 1.873 0 0 1 4.377 3.06l-.292-.16c-.764-.415-1.6.42-1.184 1.185l.159.292a1.873 1.873 0 0 1-1.115 2.692l-.319.094c-.835.246-.835 1.428 0 1.674l.319.094a1.873 1.873 0 0 1 1.115 2.693l-.16.291c-.415.764.42 1.6 1.185 1.184l.292-.159a1.873 1.873 0 0 1 2.692 1.116l.094.318c.246.835 1.428.835 1.674 0l.094-.319a1.873 1.873 0 0 1 2.693-1.115l.291.16c.764.415 1.6-.42 1.184-1.185l-.159-.291a1.873 1.873 0 0 1 1.116-2.693l.318-.094c.835-.246.835-1.428 0-1.674l-.319-.094a1.873 1.873 0 0 1-1.115-2.692l.16-.292c.415-.764-.42-1.6-1.185-1.184l-.291.159A1.873 1.873 0 0 1 8.93 1.945l-.094-.319zm-2.633-.283c.527-1.79 3.065-1.79 3.592 0l.094.319a.873.873 0 0 0 1.255.52l.292-.16c1.64-.892 3.434.901 2.54 2.541l-.159.292a.873.873 0 0 0 .52 1.255l.319.094c1.79.527 1.79 3.065 0 3.592l-.319.094a.873.873 0 0 0-.52 1.255l.16.292c.893 1.64-.902 3.434-2.541 2.54l-.292-.159a.873.873 0 0 0-1.255.52l-.094.319c-.527 1.79-3.065 1.79-3.592 0l-.094-.319a.873.873 0 0 0-1.255-.52l-.292.16c-1.64.893-3.433-.902-2.54-2.541l.159-.292a.873.873 0 0 0-.52-1.255l-.319-.094c-1.79-.527-1.79-3.065 0-3.592l.319-.094a.873.873 0 0 0 .52-1.255l-.16-.292c-.892-1.64.902-3.433 2.541-2.54l.292.159a.873.873 0 0 0 1.255-.52l.094-.319z" />
                        <path fill-rule="evenodd"
							d="M8 5.754a2.246 2.246 0 1 0 0 4.492 2.246 2.246 0 0 0 0-4.492zM4.754 8a3.246 3.246 0 1 1 6.492 0 3.246 3.246 0 0 1-6.492 0z" />
                    </svg></a>
			</div>
		</div>
	</header>
	<div id="container">
		<main id="center" class="column">
		<div>
			<b>留言檢舉</b>
		</div>
		<div class="row">
			<div class="col-md-2">會員編號 or 暱稱</div>
			<div class="col-md-3">留言內容</div>
			<div class="col-md-3">檢舉原因</div>
			<div class="col-md-1">留言狀態</div>
			<div class="col-md-1">檢舉時間</div>
			<div class="col-md-1">是否通過</div>
		</div>
		<c:forEach var="fmrVO" items="${list_fmr}">
			<form method="post" action="fmr.do">
				<div class="row">
					<div class="col-md-2">${fmrVO.memId}</div>
					
					<div class="col-md-3">${fmSvc.getOneFm(fmrVO.fmId).fmContent }</div>
					<div class="col-md-3">${fmrVO.fmrContent}</div>
					<c:if test="${fmSvc.getOneFm(fmrVO.fmId).fmStatus == 0}">
						<div class="col-md-1">正常</div>
					</c:if>
					<c:if test="${fmSvc.getOneFm(fmrVO.fmId).fmStatus == 1}">
						<div class="col-md-1">下架</div>
					</c:if>
					<div class="col-md-1">
						<fmt:formatDate value="${fmrVO.fmrDate}"
 							pattern="yyyy-MM-dd HH:mm:ss" /> 
					</div>
					<div class="col-md-1">
						<c:if test="${fmrVO.fmrStatus == 0}">
							<c:if test="${fmSvc.getOneFm(fmrVO.fmId).fmStatus == 0}">
								<select name="fmrStatus">
									<option value="0"></option>
									<option value="1">通過</option>
									<option value="2">不通過</option>
								</select>
							</c:if>
						</c:if>
						<c:if test="${fmrVO.fmrStatus == 1}">
							通過
						</c:if>
						<c:if test="${fmrVO.fmrStatus == 2}">
							不通過
						</c:if>
						<c:if test="${fmrVO.fmrStatus == 0}">
							<c:if test="${fmSvc.getOneFm(fmrVO.fmId).fmStatus == 1}">
							文章下已架
							</c:if>
						</c:if>
					</div>
					<c:if test="${fmrVO.fmrStatus == 0}">
						<c:if test="${fmSvc.getOneFm(fmrVO.fmId).fmStatus == 0}">
							<div class="col-md-1">
							<input type="submit"> 
							<input type="hidden" name="action" value="judge">
							<input type="hidden" name="fmrId" value="${fmrVO.fmrId}"> 
							<input type="hidden" name="fmId" value="${fmrVO.fmId}">
							</div>
						</c:if>
					</c:if>
				</div>
			</form>
		</c:forEach>
	</main>
	<jsp:include page="/back-end/sidebar/sidebar.jsp" />
</body>

</html>