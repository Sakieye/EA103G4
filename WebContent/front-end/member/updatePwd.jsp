<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.mem.model.*"%>
<%@ page import="java.util.*"%>

<%
	MemVO memVO = (MemVO) session.getAttribute("memVO");
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BOOKSHOP部客匣</title>
<%-- 	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css"> --%>
	<link rel="stylesheet" href="<%= request.getContextPath()%>/css/main-front.css" />
    <link rel="stylesheet" href="<%= request.getContextPath()%>/css/header.css" />
	<link rel="stylesheet" href="<%= request.getContextPath()%>/css/updatePwd.css" />
</head>
<body>
	<jsp:include page="/front-end/header/header.jsp"/>
		<section id="One" class="wrapper style3">
	        <div class="inner">
	            <header class="align-center">
	                <p>部客匣BookShop</p>
	                <h2>修改密碼UpdatePWD</h2>
	            </header>
	        </div>
    	</section>
    	<div class="content">
    		<div class="menuDiv">
			<ul class="myMenu">
			    <li class="itembox drop-down">
			        <a class="item">會員資料管理</a>
			        <div class="submenu">
			            <a class="submenu-item" href="#">修改密碼</a>
			            <a class="submenu-item" href="<%= request.getContextPath()%>/front-end/member/memberSpace.jsp">會員資料更新</a>
			            <a class="submenu-item" href="#">支付管理</a>
			        </div>
			    </li>
			    <li class="itembox drop-down">
			        <a class="item">訂單管理</a>
			        <div class="submenu">
			            <a class="submenu-item" href="#">訂單修改/取消</a>
			            <a class="submenu-item" href="#">訂單查詢</a>
			        </div>
			    </li>
			    <li class="itembox drop-down">
			        <a class="item">二手書訂單管理</a>
			        <div class="submenu">
			            <a class="submenu-item" href="#">二手書訂單修改/取消</a>
			            <a class="submenu-item" href="#">二手書訂單查詢</a>
			        </div>
			    </li>
			    <li class="itembox drop-down">
			        <a class="item">互動紀錄</a>
			        <div class="submenu">
			            <a class="submenu-item" href="#">討論區發文紀錄</a>
			            <a class="submenu-item" href="#">討論區留言紀錄</a>
			            <a class="submenu-item" href="#">書評發表紀錄</a>
			        </div>
			    </li>
			    <li class="itembox drop-down">
			        <a class="item">讀書會管理</a>
			        <div class="submenu">
			            <a class="submenu-item" href="#">我的讀書會</a>
			            <a class="submenu-item" href="#">讀書會報名紀錄</a>
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
			            <a class="submenu-item" href="#">已收藏書單</a>
			            <a class="submenu-item" href="#">收藏書單分享</a>
			        </div>
			    </li>
			</ul>
			<div class="updateBlock">
				<div class="inputBlock">
					<form METHOD="post" action="<%=request.getContextPath()%>/mem/mem.do">
						<div class="div1">
							<div class="left"><label>原始密碼</label></div>
							<div class="right"><input type="password" id="old" placeholder="請輸入原始密碼" name="mem_password" /></div>
							<span id="pic1"></span>
<%-- 							<c:if test="${not empty errorMsgs.one}" > --%>
<%-- 								<div class="errorMsg2">${errorMsgs.one}</div> --%>
<%-- 							</c:if> --%>
							<div class="errorMsg" id="pwdMsg"></div>
							
						</div>
						<div class="div1">
							<div class="left"><label>新密碼</label></div>
							<div class="right" id="spc"><input type="password" id="newPassword" placeholder="請輸入新密碼" name="new_password" /></div>
							<span id="pic2"></span>
<%-- 							<c:if test="${not empty errorMsgs.three}"> --%>
<%-- 								<div class="errorMsg2">${errorMsgs.three}</div> --%>
<%-- 							</c:if>				 --%>
						</div>
						<div class="div1">
							<div class="left"><label>確認密碼</label></div>
							<div class="right"><input type="password" id="confirmPassword" placeholder="請確認密碼" name="confirmPassword" /></div>
							<span id="pic3"></span>
<%-- 							<c:if test="${not empty errorMsgs.four}"> --%>
<%-- 								<div class="errorMsg2">${errorMsgs.four}</div> --%>
<%-- 							</c:if>				 --%>
							<div class="errorMsg" id="pwdMsg2"></div>
						</div>
						
						<input type="hidden" name="action" value="updatePwd" />
						<input type="hidden" name="mem_id" value="${memVO.mem_id}" />
						<button type="submit" id="mybtn">送出</button>
						<c:if test="${not empty success}">
								<div class="success">${success}</div>
						</c:if>				
					</form>
				</div>
			</div>
		</div>
	</div>
	 <jsp:include page="/front-end/footer/footer.jsp"/>
	 
	
    
    <script>
	    window.onload = function() {
	    	var mem_password = document.getElementsByName("mem_password")[0];
	    	var mybtn = document.getElementById("mybtn");
	    	mybtn.disabled = true;
	    	mem_password.onblur = function() {
				var mem_password = this.value;
				//1.获取XMLHttpRequest对象
				var req = getXMLHttpRequest();
				//4.处理响应结果
				req.onreadystatechange = function() {
					if (req.readyState == 4) {//XMLHttpRequest对象读取成功
						if (req.status == 200) {//服务器相应正常
							var pwdMsg = document.getElementById("pwdMsg");
							var pic = document.getElementById("pic1");
							var mybtn = document.getElementById("mybtn");
							//根据返回的结果显示不同的信息
							if (req.responseText === "true") {
								pwdMsg.innerText = "👎🏻原始密碼錯誤";
							} else if (req.responseText === "false" && mem_password.value != ""){
								pwdMsg.innerHTML = "";
								pic.innerHTML = "<font font-size='35px'>👌🏻</font>";
							} 
						} 
					}
				}
				
				//2.建立一个连接
				var mem_id = "${memVO.mem_id}";
				req.open("get",
						"${pageContext.request.contextPath}/mem/PasswordCheck.do?mem_password="
								+ mem_password + "&&mem_id=" + mem_id);
				//3.发送get请求
				req.send(null);
			}
	    	
	    	var newPassword = document.getElementById("newPassword");
			var confirmPassword = document.getElementById("confirmPassword");
			
			function validatePassword() {
				var pwdMsg = document.getElementById("pwdMsg2");
				var mybtn = document.getElementById("mybtn");
				var pic2 = document.getElementById("pic2");
				var pic3 = document.getElementById("pic3");
				
				if (newPassword.value != confirmPassword.value && confirmPassword.value != "") {
					pwdMsg.innerText = "👎🏻密碼不一致";
				} else if (newPassword.value != "" && confirmPassword.value == "") {
					pwdMsg.innerText = "請確認密碼";
					pic2.innerHTML = "<font font-size='35px'>👌🏻</font>";
				} else if (newPassword.value === confirmPassword.value) {
					pic3.innerHTML = "<font font-size='35px'>👌🏻</font>";
					pwdMsg.innerText = "";
					mybtn.disabled = false;
				} else {
					pwdMsg.innerText = "";
					pic3.innerText = "";
				}

			}
			newPassword.onchange = validatePassword;
			confirmPassword.onkeyup = validatePassword;
	
		}
	
		function getXMLHttpRequest() {
			var xmlhttp;
			if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
				xmlhttp = new XMLHttpRequest();
			} else {// code for IE6, IE5
				xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
			}
			return xmlhttp;
		}
    </script>
    
    <script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/jquery.scrollex.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/skel.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/util.js"></script>
    <script src="<%=request.getContextPath()%>/js/main.js"></script>
    
<!--     <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script> -->
<!--     <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script> -->
<!--     <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script> -->
</body>
</html>