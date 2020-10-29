<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.mem.model.*"%>

<%
	MemVO memVO = (MemVO) request.getAttribute("memVO");
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
					placeholder="Account" required autofocus name="mem_account"
					value="<%=(memVO == null) ? "" : memVO.getMem_account()%>" /> <label
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
			<div class="modal-content">
				<form METHOD="post" ACTION="<%=request.getContextPath()%>/mem/sendSMSForgerPwd.do" name="form" onclick="return false">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalCenterTitle"
							style="font-weight: 700;">請輸入手機號碼，並收取簡訊</h5>
						<button type="button" class="close" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<input type="text" name="phoneNum" id="phone" maxlength="10">
						<div class="errorMsg" id="err"></div>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-secondary mybtn2" id="button">Submit</button>
						<button type="button" class="btn btn-secondary mybtn2" data-dismiss="modal">Close</button>
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
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
		
	<script type="text/javascript">
	$(document).ready(function(){
	    $("#button").click(function(){
	        if($("#phone").val()==""){
	        	document.getElementById("err").innerText = "請輸入手機號碼";     	      	
	        } else {
	            document.form.submit();
	        }
	    })
	 })
	
	
	</script>

</body>

</html>