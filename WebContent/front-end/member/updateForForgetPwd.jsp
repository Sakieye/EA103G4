<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.mem.model.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>BOOKSHOP部客匣</title>
<link rel="stylesheet" href="<%= request.getContextPath()%>/css/main-front.css" />
<link rel="stylesheet" href="<%= request.getContextPath()%>/css/header.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<link href="<%=request.getContextPath()%>/css/updateForForgetPwd.css" rel="stylesheet">

</head>
<body>
	<jsp:include page="/front-end/header/header.jsp" />
	<div class="myContent">
		<div id="inner">
			<form METHOD="post" ACTION="<%=request.getContextPath()%>/mem/mem.do">
				<h1>請輸入新密碼,並至您的手機收取驗證碼</h1>
				<div class="inputDiv">
					<label>新密碼</label> <input name="newPwd" type="password"
						id="userInput1" class="form-control form-control-sm" /> <span
						id="pic1"></span>
				</div>
				<div class="inputDiv">
					<label>確認密碼</label> <input name="confirmPwd" type="password"
						id="userInput2" class="form-control form-control-sm" /> <span
						id="pic2"></span>
				</div>
				<div class="inputDiv">
					<label>驗證碼</label> <input name="userInputCode" type="text"
						id="userInput3" class="form-control form-control-sm" /> <span
						id="pic3"></span>
						<c:if test="${not empty errorMsgs.userInputCodeError}">
							<div class="errorMsg">${errorMsgs.userInputCodeError}</div>
						</c:if>
				</div>
				<div id="btnDiv">
					<input type="hidden" name="action" value="updatePwdFromForgetPwd" />
					<button type="submit" class="btn btn-info" id="btn">送出</button>
				</div>
				
			</form>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>

	<script>
		window.onload = function() {
			var btn = document.getElementById("btn");
			btn.disabled = true;
			
			var userInput1 = document.getElementById("userInput1");
			var userInput2 = document.getElementById("userInput2");
			var userInput3 = document.getElementById("userInput3");

			function validatePassword() {
				var pic1 = document.getElementById("pic1");
				var pic2 = document.getElementById("pic2");
				var pic3 = document.getElementById("pic3");
				
				if (userInput1.value != userInput2.value
						&& userInput2.value != "") {
					pic2.innerHTML = "<font font-size='35px'>👎🏻</font>";
				} else if (userInput1.value != ""
						&& userInput2.value == "") {
					pic1.innerHTML = "<font font-size='35px'>👌🏻</font>";
				} else if (userInput1.value === userInput2.value) {
					pic2.innerHTML = "<font font-size='35px'>👌🏻</font>";
					btn.disabled = false;
				} else {
					pic1.innerText = "";
					pic2.innerText = "";
				}

			}
			userInput1.onchange = validatePassword;
			userInput2.onkeyup = validatePassword;
		}
	</script>

	<script src='<%= request.getContextPath()%>/js/jquery.min.js'></script>
    <script src="<%= request.getContextPath()%>/js/jquery.scrollex.min.js"></script>
    <script src="<%= request.getContextPath()%>/js/skel.min.js"></script>
    <script src="<%= request.getContextPath()%>/js/util.js"></script>
    <script src="<%= request.getContextPath()%>/js/main.js"></script>

</body>
</html>