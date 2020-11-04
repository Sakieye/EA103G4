<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.mem.model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BOOKSHOP部客匣</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<link rel="stylesheet" href="<%= request.getContextPath()%>/css/main-front.css" />

<link rel="stylesheet" href="<%= request.getContextPath()%>/css/header.css" />
<link href="<%=request.getContextPath()%>/css/confirmationCode.css" rel="stylesheet">

<style>
body {
       display: -ms-flexbox;
       display: flex;
       -ms-flex-align: center;
       align-items: center;
       background-color: #f5f5f5;
}
.myContent{
        width: 100%;
        height: 100%;
        background-image:url(../images/member/signUpbg.jpg);
        background-size: cover;
}
</style>
</head>
<body>
	
	<jsp:include page="/front-end/header/header.jsp" />
	<div class="myContent">
		<div id="inner" style="background-color: lightskyblue;" >
			<h1>請至您的信箱收取驗證信，並輸入</h1>
			<form METHOD="post" ACTION="<%=request.getContextPath()%>/mem/mem.do" enctype="multipart/form-data">
				<input name="userInputCode" id="userInput" class="form-control form-control-lg" type="text" maxlength="8" style="border-radius: 7px;"/>
				<input type="hidden" name="action" value="insert">
				<div id="btnDiv"><button type="submit" class="btn btn-info" id="btn">送出</button></div>
				<c:if test="${not empty error}">
					<div class="errorMsg">${error}</div>
				</c:if>
			</form>
		</div>	
	</div>
		
	<script src='<%= request.getContextPath()%>/js/jquery.min.js'></script>
    <script src="<%= request.getContextPath()%>/js/jquery.scrollex.min.js"></script>
    <script src="<%= request.getContextPath()%>/js/skel.min.js"></script>
    <script src="<%= request.getContextPath()%>/js/util.js"></script>
    <script src="<%= request.getContextPath()%>/js/main.js"></script>	
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
</body>
</html>