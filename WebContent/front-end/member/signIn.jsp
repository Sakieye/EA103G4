<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.mem.model.*"%>

<%
	String account = (String) request.getAttribute("account");
	pageContext.setAttribute("account", account);
%>


<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>BOOKSHOP部客匣</title>



<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/main-front.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/header.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<link href="<%=request.getContextPath()%>/css/signIn.css"
	rel="stylesheet">
<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

.errorMsg {
	line-height: 15px;
	color: red;
	font-size: 15px;
	font-weight: 700;
	font-family: 微軟正黑體;
	letter-spacing: 1px;
	margin-bottom: 5px;
	margin-top: 10px;
}
.mybtn2{
	color: white !important;
}
#phone{
	border-radius: 10px;
}
#modal2 img{
	box-shadow: 0 0 9px black;
	margin-bottom:10px;
}
#member{
    width: 50%;
    margin-left: auto;
    margin-right: auto;
}

</style>
</head>

<body class="text-center">

	<jsp:include page="/front-end/header/header.jsp" />


	<div class="myContent">
		<form class="form-signin"
			ACTION="<%=request.getContextPath()%>/mem/mem.do" METHOD="post">
			<img class="mb-4"
				src="<%=request.getContextPath()%>/BookShopLogo/5.png" alt=""
				width="250" height="200"
				style="border-radius: 10px; box-shadow: 0 0 5px black;" />
			<h1 class="h3 mb-3 font-weight-normal">Please sign in</h1>

			<c:if test="${not empty errmsg}">
				<div class="errorMsg">${errmsg}</div>
			</c:if>
			<div id="input-div">
				<label for="inputEmail" class="sr-only">Account</label> <input
					type="text" id="inputEmail" class="form-control"
					placeholder="Account" required autofocus name="mem_account" value="${account}" /> <label
					for="inputPassword" class="sr-only">Password</label> <input
					type="password" id="inputPassword" class="form-control"
					placeholder="Password" required name="mem_password" value="" />
			</div>

			<input type="hidden" name="action" value="signin" />
			<button class="btn btn-lg btn-primary btn-block my-btn" type="submit"
				id="mybtn">Sign in</button>
			<button class="btn btn btn-secondary btn-lg btn-block my-btn"
				type="submit" id="mybtn2">
				<a id="myA"
					href="<%=request.getContextPath()%>/front-end/member/signUp.jsp">Sign
					up</a>
			</button>
			<button class="btn btn btn-danger btn-block my-btn" type="submit"
				id="mybtn3" data-toggle="modal" data-target="#myModal" data-backdrop="static">忘記密碼</button>
		</form>
		<%-- 	    <a id="myA" href="<%=request.getContextPath()%>/front-end/member/forgetPwd.jsp" > --%>


	</div>
	<!-- Modal -->
	<div class="modal fade" id="myModal"
		tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content" style="background-color: gainsboro;">
<%-- 				<form METHOD="post" ACTION="<%=request.getContextPath()%>/mem/sendSMSForgerPwd.do" name="form" onclick="return false"> --%>
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalCenterTitle"
							style="font-weight: 700;">請輸入手機號碼</h5>
						<button type="button" class="close" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body" id="modal1">
						<input type="text" name="phoneNum" id="phone" maxlength="10" style="font-size:20px; font-weight: 700; background-color: ghostwhite;">
						<div class="errorMsg" id="err"></div>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-secondary mybtn2" id="button" data-toggle="modal" data-target="#myModal2" data-backdrop="static">送出</button>
						<button type="button" class="btn btn-secondary mybtn2" data-dismiss="modal">Close</button>
					</div>
<!-- 				</form> -->
			</div>
		</div>
	</div>
	<!-- madal -->
	<jsp:useBean id="memService" scope="page" class="com.mem.model.MemService"/>
	<!-- Modal -->
	<div class="modal fade" id="myModal2"
		tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<form METHOD="post" ACTION="<%=request.getContextPath()%>/mem/sendSMSForgerPwd.do" name="form" style="margin-bottom: 0; background-color: gainsboro;">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalCenterTitle"
							style="font-weight: 700;">確認身分</h5>
						<button type="button" class="close" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body" id="modal2">
						
<!-- 					append內容區塊 -->
			
					</div>
					<div class="modal-footer">
						<input type="hidden" name="phoneNum" id="phone" maxlength="10">
						<input type="hidden" name="mem_id" id="memId">
						<button type="submit" class="btn btn-secondary mybtn2" id="button2" style="width: 60px;">是</button>
						<button type="button" class="btn btn-secondary mybtn2" data-dismiss="modal" id="button3" style="width: 60px;">否</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- madal -->

	
	
	
	<script src='<%=request.getContextPath()%>/js/jquery.min.js'></script>
	<script src="<%=request.getContextPath()%>/js/jquery.scrollex.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/skel.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/util.js"></script>
	<script src="<%=request.getContextPath()%>/js/main.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
		
	<script type="text/javascript">
	window.onload = function() {
		var button = document.getElementById("button");
		var phone = document.getElementById("phone");
		button.disabled = true;
		function validatePassword() {
			if(phone.value.length == 10){
				button.disabled = false;
			}
		}
		phone.onchange = validatePassword;
	}
	
	$(document).ready(function() {
		$("#button").click(function(){
			$.ajax({
                type: "POST",
                url: '${pageContext.request.contextPath}/mem/getMemData.do',
                data : {
                    "phone": $('#modal1').find('input[name = "phoneNum"]').val(),
                },
                success: function(data) {
                	var object = JSON.parse(data);
                	
               		var modal2 = document.getElementById("modal2");
               		var email = String(object.mem_email);
               		var memEmail = '';
               		for(let i=0; i<email.length;i++){
               			if(i==3 || i==4 || i==5 || i==8 || i==9){
               				memEmail += '*';
               			} else {
               				memEmail += email[i];
               			}
               		}
               		console.log(memEmail);
               		
               		modal2.innerHTML = 
               		'<div id="member"><img style="width:150px; height:125px; border-radius:10px;" src="${pageContext.request.contextPath}/mem/MemPic?mem_id=' + object.mem_id +'"/>'
               		+'<div style="font-size: 20px; font-weight: 700;">請問你是&nbsp;' + object.mem_name + '&nbsp;嗎?</div>'
               		+'<div style="font-size: 18px; font-weight: 500;">' + memEmail + '</div></div>';	
                	
               		$("#memId").val(object.mem_id);
               		$("#button2").show();
                },
                error:function(XMLHttpRequest, textStatus, errorThrown) {
                	var modal2 = document.getElementById("modal2");
            		modal2.innerHTML = 
            		'<img style="width:150px; height:125px; border-radius:10px;" src="${pageContext.request.contextPath}/BookShopLogo/4.png"/>'
            		+'<h5 style="font-weight: 700;">無此會員,請輸入您註冊的手機號碼！</h1>';
            		
            		$("#button2").hide();
            		$("#button3").text("Close");
                }
           });
		});
	})
	
		
	</script>

</body>

</html>