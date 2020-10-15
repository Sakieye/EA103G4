<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BOOKSHOP部客匣</title>
<link rel="stylesheet" href="<%= request.getContextPath()%>/css/main-front.css" />
<link rel="stylesheet" href="<%= request.getContextPath()%>/css/header.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<link href="<%=request.getContextPath()%>/css/forgetPwd.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/front-end/header/header.jsp" />
	<div class="myContent">
		<div id="inner">
			<h1>請輸入您註冊時所使用的E-MAIL</h1>
			<form METHOD="post" ACTION="<%=request.getContextPath()%>/mem/ForgetPwdEmail.do">
				<input name="to" type="email" id="userInput" class="form-control form-control-sm" />
				<input type="hidden" name="from" value="bookshop.ea103@gmail.com" />
				<input type="hidden" name="subject" value="忘記密碼" />
				<div id="btnDiv"><button type="submit" class="btn btn-info" id="btn">送出</button></div>
				<c:if test="${not empty error}">
					<div class="errorMsg">${error}</div>
				</c:if>
			</form>
		</div>	
	</div>

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
    
    <script src='<%= request.getContextPath()%>/js/jquery.min.js'></script>
    <script src="<%= request.getContextPath()%>/js/jquery.scrollex.min.js"></script>
    <script src="<%= request.getContextPath()%>/js/skel.min.js"></script>
    <script src="<%= request.getContextPath()%>/js/util.js"></script>
    <script src="<%= request.getContextPath()%>/js/main.js"></script>
    
</body>
</html>