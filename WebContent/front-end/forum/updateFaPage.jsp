<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.Fa.model.*"%>

<%
	FaVO faVO = (FaVO) request.getAttribute("faVO");
%>
<!DOCTYPE HTML>
<html>

<head>
<title>BookShop</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/main-front.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/addFaPage.css">
<link rel="stylesheet"
    href="<%=request.getContextPath()%>/css/header.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
</head>

<body class="subpage">
	<!-- Header -->
	<jsp:include page="/front-end/header/header.jsp" />
	
	<!-- One -->
	<section id="One" class="wrapper style3">
		<div class="inner">
			<header class="align-center">
				<p>share your passion for reading</p>
				<h2>BookShop 討論區</h2>
			</header>
		</div>
	</section>
	<!-- Two -->
	<section id="two" class="wrapper style2">
		<div class="inner">
			<div class="box">
				<div class="content">
					<header class="align-center">
						<h2>
							<b>修改文章</b>
						</h2>
						<c:if test="${not empty errorMsgs}">
							<font style="color: red">請修正以下錯誤:</font>
							<ul>
								<c:forEach var="message" items="${errorMsgs}">
									<li style="color: red">${message}</li>
								</c:forEach>
							</ul>
						</c:if>
					</header>
					<div id="addform">
						<form method="post" action="<%=request.getContextPath()%>/front-end/forum/fa.do">
							<fieldset>
								<legend>
									<b>修改文章</b>
								</legend>
								<p>
									<label for="topic">主題 :</label> 
									<input type="text" name="faTopic" value="${faVO.faTopic}">
								</p>
								<p>
									<label for="content">CONTENT :</label>
									<textarea id="summernote" name="faContent">	${faVO.faContent}</textarea>
								</p>
								<p>
									<input type="submit"> 
									<input type="hidden" name="action" value="update"> 
									<input type="hidden" name="memId" value="${memVO.mem_id}">
									<input type="hidden" name="faId" value="${faVO.faId}">
								</p>
							</fieldset>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Footer -->
	<jsp:include page="/front-end/footer/footer.jsp" />
	<script src='<%=request.getContextPath()%>/js/jquery.min.js'></script>
	<script src="<%=request.getContextPath()%>/js/jquery.scrollex.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/skel.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/util.js"></script>
	<script src="<%=request.getContextPath()%>/js/main.js"></script>
	<!-- Footer -->
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" rel="stylesheet"></script>
		<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js" ></script>
	<!-- include summernote css/js -->
		
    	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
   
	<script type="text/javascript">
		$(document).ready(function() {
			$('#summernote').summernote({
				fontSizes: ['8', '9', '10', '11', '12', '14', '18', '24', '36', '48' , '64', '82', '150'],
				height: 300,
				lang: 'zh-CN',
				focus:true
			})
		});
	</script>

</body>

</html>