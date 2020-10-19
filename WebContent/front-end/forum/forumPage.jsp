<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.Fa.model.*"%>
<%@ page import="com.mem.model.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%
	FaVO faVO = (FaVO) request.getAttribute("faVO");
%>
<jsp:useBean id="memSvc" scope="page" class="com.mem.model.MemService" />

<!DOCTYPE HTML>
<html>

<head>
<title>BookShop</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/main-front.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/forumPage.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/header.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
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
					<div class="container">
						<div class="row">
							<div class="col-md-12" id="replyBtn">
								<form method="post"
									action="<%=request.getContextPath()%>/front-end/forum/fm.do">
									<input type="hidden" name="faId" value="${faVO.faId}">
									<input type="hidden" name="memId"
										value="${sessionScope.memVO.mem_id}"> <input
										type="hidden" name="action" value="getOne_For_AddFm">
									<input type="submit" value="我要回覆">
								</form>
							</div>
						</div>
						<div class="row">
							<div class="col-md-2" id="memInfo">
								<div>
									<b>樓主</b>
								</div>
								<div id="memPic">
									<img
										src="<%=request.getContextPath()%>/mem/MemPic?mem_id=${faVO.memId}"
										style="width: 100px; height: 100px;">
								</div>
								<div class="col-md-12" id="AmemName">
									<b>${memSvc.getOneMem(faVO.memId).mem_name}</b>
								</div>
								<div id="AmemExp">
									<b>${memSvc.getOneMem(faVO.memId).mem_exp}</b>
								</div>
							</div>
							<div class="col-md-10">
								<div class="row">
									<div class="col-md-8" style="font-size: 26px;">
										<b>${faVO.faTopic}</b>
									</div>
									<div class="col-md-4">
										<div class="reportBtn">
											<form method="post"
												action="<%=request.getContextPath()%>/front-end/forum/far.do">
												<input type="submit" value="檢舉"> <input
													type="hidden" name="action" value="getOne_Fa_Report">
												<input type="hidden" name="faId" value="${faVO.faId}">
											</form>
											<input type="submit" value="追蹤">
											<div id="starImg">
												<img src="<%=request.getContextPath()%>/images/forum/1.png"
													style="width: 35px; height: 35px; float: right; margin-right: 15px;">
												<input type="hidden" name="faId" value="${faVO.faId}">
												<input type="hidden" name="memId"
													value="${sessionScope.memVO.mem_id}">
											</div>
										</div>
									</div>
								</div>
								<div class="clear"></div>
								<hr>
								<div class="row">
									<div class="col-md-12">${faVO.faContent}</div>
								</div>
							</div>
						</div>
						<hr>
						<c:forEach var="fmVO" items="${list}" varStatus="tag">
							<div class="row">
								<div class="col-md-2" id="memInfo">
									<div id="reply">
										<b>${tag.index}樓</b>
									</div>
									<div class="memPic" id="memPic${tag.index}">
										<img
											src="<%=request.getContextPath()%>/mem/MemPic?mem_id=${fmVO.memId}"
											style="width: 100px; height: 100px;">
									</div>
									<div class="col-md-12" id="memName${tag.index}">
										<b>${memSvc.getOneMem(fmVO.memId).mem_name}</b>
									</div>
									<div id="memExp${tag.index}">
										<b>${memSvc.getOneMem(fmVO.memId).mem_exp}</b>
									</div>
								</div>
								<div class="col-md-10">
									<div class="container">
										<div class="row" id="fmContent">
											<div class="col-md-12">
												<b>${fmVO.fmContent}</b>
											</div>
										</div>
									</div>
								</div>
							</div>

							<form method="post"
								action="<%=request.getContextPath()%>/front-end/forum/fmr.do">
								<div class="reportBtn">
									<input type="submit" value="檢舉"> <input type="hidden"
										name="action" value="getOne_Fm_Report"> <input
										type="hidden" name="faId" value="${faVO.faId}"> <input
										type="hidden" name="fmId" value="${fmVO.fmId}">
								</div>
							</form>
							<div class="clear"></div>
							<hr>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Footer -->
	<jsp:include page="/front-end/footer/footer.jsp" />
	<!-- Footer -->
	<script src='<%=request.getContextPath()%>/js/jquery.min.js'></script>
	<script src="<%=request.getContextPath()%>/js/jquery.scrollex.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/skel.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/util.js"></script>
	<script src="<%=request.getContextPath()%>/js/main.js"></script>

	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript">
	
	$(document).ready(function(){
		
			if((parseInt($("#AmemExp").text())) < 1000){
				$("#AmemExp").text("Lv.1");
				$("#AmemExp").css("font-weight","bold");
				$("#AmemExp").css("color","gray");
				$("#AmemName > b").css("color","gray");
				$("#memPic").css("border-color","gray");
				$("#memPic").css("box-shadow"," 0 0 10px #9ecaed");
			}else if((parseInt($("#AmemExp").text())) <= 2000){
				$("#AmemExp").text("Lv.2");
				$("#AmemExp").css("font-weight","bold");
				$("#AmemExp").css("color","skyblue");
				$("#AmemName > b").css("color","skyblue");
				$("#memPic").css("border-color","skyblue");
				$("#memPic").css("box-shadow"," 0 0 10px #9ecaed");
			}else if((parseInt($("#AmemExp").text())) <= 3000){
				$("#AmemExp").text("Lv.3");
				$("#AmemExp").css("font-weight","bold");
				$("#AmemExp").css("color","red");
				$("#AmemName > b").css("color","red");
				$("#memPic").css("border-color","red");
				$("#memPic").css("box-shadow"," 0 0 10px #9ecaed");
			}else if((parseInt($("#AmemExp").text())) <= 4000){
				$("#AmemExp").text("Lv.4");
				$("#AmemExp").css("font-weight","bold");
				$("#AmemExp").css("color","yellow");
				$("#AmemName > b").css("color","yellow");
				$("#memPic").css("border-color","yellow");
				$("#memPic").css("box-shadow"," 0 0 10px #9ecaed");
			}else{
				$("#AmemExp").text("Lv.5");
				$("#AmemExp").css("font-weight","bold");
				$("#AmemExp").css("color","black");
				$("#AmemName > b").css("color","black");
				$("#memPic").css("border-color","black");
				$("#memPic").css("box-shadow"," 0 0 10px #9ecaed");
			}
		
		for(let i = 0; i < `${list.size()}`;i++){
			if((parseInt($("#memExp" + i).text())) <= 1000){
				$("#memExp" + i).text("Lv.1");
				$("#memExp" + i).css("font-weight","bold");
				$("#memExp" + i).css("color","gray");
				$("#memName" + i +"> b").css("color","gray");
				$("#memPic" + i).css("border-color","gray");
				$("#memPic" + i).css("box-shadow"," 0 0 10px #9ecaed");
			}else if((parseInt($("#memExp" + i).text())) <= 2000){
				$("#memExp" + i).text("Lv.2");
				$("#memExp" + i).css("font-weight","bold");
				$("#memExp" + i).css("color","skyblue");
				$("#memName" + i +"> b").css("color","skyblue");
				$("#memPic" + i).css("border-color","skyblue");
				$("#memPic" + i).css("box-shadow"," 0 0 10px #9ecaed");
			}else if((parseInt($("#memExp" + i).text())) <= 3000){
				$("#memExp" + i).text("Lv.3");
				$("#memExp" + i).css("font-weight","bold");
				$("#memExp" + i).css("color","red");
				$("#memName" + i +"> b").css("color","red");
				$("#memPic" + i).css("border-color","red");
				$("#memPic" + i).css("box-shadow"," 0 0 10px #9ecaed");
			}else if((parseInt($("#memExp" + i).text())) <= 4000){
				$("#memExp" + i).text("Lv.4");
				$("#memExp" + i).css("font-weight","bold");
				$("#memExp" + i).css("color","yellow");
				$("#memName" + i +"> b").css("color","yellow");
				$("#memPic" + i).css("border-color","yellow");
				$("#memPic" + i).css("box-shadow"," 0 0 10px #9ecaed");
			}else{
				$("#memExp" + i).text("Lv.5");
				$("#memExp" + i).css("font-weight","bold");
				$("#memExp" + i).css("color","black");
				$("#memName" + i +"> b").css("color","black");
				$("#memPic" + i).css("border-color","black");
				$("#memPic" + i).css("box-shadow"," 0 0 10px #9ecaed");
			}
			
		}
			
		
		
		
		
		
		
	
		
		
		
		$.ajax({
			type:"POST",
			url:"<%=request.getContextPath()%>/front-end/forum/fc.do?action=checkCollection",
			data:{
				"memId":$("#starImg").find('input[name = "memId"]').val(),
				"faId" :$("#starImg").find('input[name = "faId"]').val(),
			},
			success:function(count){
				if(count != 0){
					$('#starImg img').attr('src',"<%=request.getContextPath()%>/images/forum/2.png");
				} else if(count == 0){
					$('#starImg img').attr('src',"<%=request.getContextPath()%>/images/forum/1.png");
				}
			}
		})
		
		
		$("#starImg").click(function(){
			
			if($('#starImg img').attr('src') == "<%=request.getContextPath()%>/images/forum/1.png"){
				$.post(
						"<%=request.getContextPath()%>/front-end/forum/fc.do?action=collect",
						{
							"memId":$("#starImg").find('input[name = "memId"]').val(),
							"faId" :$("#starImg").find('input[name = "faId"]').val(),
						}
				)
				$('#starImg img').attr('src',"<%=request.getContextPath()%>/images/forum/2.png");
			}else{
				$.post("<%=request.getContextPath()%>/front-end/forum/fc.do?action=cancelCollect",
						{
							"memId":$("#starImg").find('input[name = "memId"]').val(),
							"faId" :$("#starImg").find('input[name = "faId"]').val(),
						}
				)
				$('#starImg img').attr('src',"<%=request.getContextPath()%>/images/forum/1.png");
												}
											})
						});
	</script>

</body>

</html>