<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.Fa.model.*"%>
<%@ page import="com.mem.model.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>

<jsp:useBean id="memSvc" scope="page" class="com.mem.model.MemService" />

<!DOCTYPE HTML>
<html>

<head>
<title>BookShop討論區</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/main-front.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/forumPage.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/header.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.1.4/toastr.min.css" rel="stylesheet"  />
</head>

<body class="subpage">
	<!-- Header -->
	<jsp:include page="/front-end/header/header.jsp" />
	<!-- One -->
	<section id="One" class="wrapper style3">
		<div class="inner">
			<header class="align-center">
				<p><b>share your passion for reading</b></p>
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
								<form method="post" action="<%=request.getContextPath()%>/front-end/forum/fm.do">
									<input type="hidden" name="faId" value="${faVO.faId}">
									<input type="hidden" name="memId" value="${sessionScope.memVO.mem_id}">
									<input type="hidden" name="action" value="getOne_For_AddFm">
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
									<img src="<%=request.getContextPath()%>/mem/MemPic?mem_id=${faVO.memId}">
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
									<div class="col-md-8 faTopic">
										<b>${faVO.faTopic}</b>
									</div>
									<div class="col-md-4">
										<div class="reportBtn">
										<c:if test="${sessionScope.memVO != null && sessionScope.memVO.mem_id != faVO.memId}">
											<form method="post" action="<%=request.getContextPath()%>/front-end/forum/far.do">
												<input type="submit" value="檢舉">
												<input type="hidden" name="action" value="getOne_Fa_Report">
												<input type="hidden" name="faId" value="${faVO.faId}">
											</form>
												<div id="subscribe">
													<i class="far fa-bell fa-3x"></i>
													<input type="hidden" name="aMemId" value="${faVO.memId}">
													<input type="hidden" name="memId" value="${sessionScope.memVO.mem_id}">
												</div>
												<div id="starImg">
													<i class="far fa-star fa-3x"></i>
													<input type="hidden" name="faId" value="${faVO.faId}">
													<input type="hidden" name="memId" value="${sessionScope.memVO.mem_id}">
												</div>
											</c:if>
										</div>
									</div>
								</div>
								<div class="clear"></div>
								<hr>
								<div class="row">
									<div class="col-md-12 content">${faVO.faContent}</div>
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
										<img src="<%=request.getContextPath()%>/mem/MemPic?mem_id=${fmVO.memId}">
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
											<div class="col-md-12 content">
												<b>${fmVO.fmContent}</b>
											</div>
										</div>
									</div>
								</div>
							</div>
							<c:if test="${sessionScope.memVO != null && sessionScope.memVO.mem_id != fmVO.memId}">
							<form method="post" action="<%=request.getContextPath()%>/front-end/forum/fmr.do">
								<div class="reportBtn">
									<input type="submit" value="檢舉">
									<input type="hidden" name="action" value="getOne_Fm_Report">
									<input type="hidden" name="faId" value="${faVO.faId}">
									<input type="hidden" name="fmId" value="${fmVO.fmId}">
								</div>
							</form>
							</c:if>
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

	<script src="https://kit.fontawesome.com/21e3918c11.js"></script>
	<!-- jQuery v1.9.1 -->
  	<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
	<!-- toastr v2.1.4 -->
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.1.4/toastr.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
	
	<script type="text/javascript">
	
	$(document).ready(function(){
		  var MyPoint = "/SubscribeNotifyWs/${sessionScope.memVO.mem_id}";
	        var host = window.location.host;
	        var path = window.location.pathname;
	        var webCtx = path.substring(0, path.indexOf('/', 1));
	        var endPointURL = "ws://" + window.location.host + webCtx + MyPoint;
	        var webSocket;
			console.log(`${sessionScope.memVO}` !== "");
	        if (`${sessionScope.memVO}` !== "") {
	            connect();
	        }

	        function connect() {

	            webSocket = new WebSocket(endPointURL);

	            webSocket.onopen = function(event) {
	                console.log(endPointURL);
	                console.log("Connect Success!");
	            }

	            webSocket.onmessage = function(event) {
	            	 var jsonObj = JSON.parse(event.data);
	                 if(jsonObj.type === "addFaNotify"){
	                 	 console.log(jsonObj);
	                      toastr['success'](jsonObj.message, '追蹤通知');
	                 }
	                 if(jsonObj.type === "notifyAuthor"){
	                 	console.log(jsonObj);
	                 	toastr['success'](jsonObj.message, '被追蹤通知');
	                 }
	            }

	            webSocket.onclose = function(event) {
	                console.log("Disconnected")
	            }

	        }
	        if (`${exp}` !== "") {
	            toastr['success']('新增文章成功啦！', '${exp}');
	        }
		/*等級*/
			if((parseInt($("#AmemExp").text())) <= 1000){
				$("#AmemExp").text("Lv.1");
				$("#AmemExp").css("font-weight","bold");
				$("#AmemExp").css("color","gray");
				$("#AmemName > b").css("color","gray");
				$("#memPic").css("border-color","gray");
				$("#memPic").css("box-shadow"," 0 0 10px gray");
			}else if((parseInt($("#AmemExp").text())) <= 2000){
				$("#AmemExp").text("Lv.2");
				$("#AmemExp").css("font-weight","bold");
				$("#AmemExp").css("color","blue");
				$("#AmemName > b").css("color","blue");
				$("#memPic").css("border-color","blue");
				$("#memPic").css("box-shadow"," 0 0 10px blue");
			}else if((parseInt($("#AmemExp").text())) <= 3000){
				$("#AmemExp").text("Lv.3");
				$("#AmemExp").css("font-weight","bold");
				$("#AmemExp").css("color","red");
				$("#AmemName > b").css("color","red");
				$("#memPic").css("border-color","red");
				$("#memPic").css("box-shadow"," 0 0 10px red");
			}else if((parseInt($("#AmemExp").text())) <= 4000){
				console.log("123");
				$("#AmemExp").text("Lv.4");
				$("#AmemExp").css("font-weight","bold");
				$("#AmemExp").css("color","#5B4B00");
				$("#AmemName > b").css("color","#5B4B00");
				$("#memPic").css("border-color","#5B4B00");
				$("#memPic").css("box-shadow"," 0 0 10px #5B4B00");
			}else{
				$("#AmemExp").text("Lv.5");
				$("#AmemExp").css("font-weight","bold");
				$("#AmemExp").css("color","black");
				$("#AmemName > b").css("color","black");
				$("#memPic").css("border-color","black");
				$("#memPic").css("box-shadow"," 0 0 10px black");
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
				$("#memExp" + i).css("color","blue");
				$("#memName" + i +"> b").css("color","blue");
				$("#memPic" + i).css("border-color","blue");
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
				$("#memExp" + i).css("color","#5B4B00");
				$("#memName" + i +"> b").css("color","#5B4B00");
				$("#memPic" + i).css("border-color","#5B4B00");
				$("#memPic" + i).css("box-shadow"," 0 0 10px #5B4B00");
			}else{
				$("#memExp" + i).text("Lv.5");
				$("#memExp" + i).css("font-weight","bold");
				$("#memExp" + i).css("color","black");
				$("#memName" + i +"> b").css("color","black");
				$("#memPic" + i).css("border-color","black");
				$("#memPic" + i).css("box-shadow"," 0 0 10px #9ecaed");
			}
			
		}
		/*收藏*/
		$.ajax({
			type:"POST",
			url:"<%=request.getContextPath()%>/front-end/forum/fc.do?action=checkCollection",
			data:{
				"memId":$("#starImg").find('input[name = "memId"]').val(),
				"faId" :$("#starImg").find('input[name = "faId"]').val(),
			},
			success:function(count){
				if(count != 0){
					$('#starImg i').attr('class',"fas fa-star fa-3x");
					$('#starImg').css('color','#C4C400');
				} else if(count == 0){
					$('#starImg img').attr('class',"far fa-star fa-3x");
					$('#starImg').css('color','#000');
				}
			}
		})
		
		
		$("#starImg").click(function(){
			
			if($('#starImg i').attr('class') === "far fa-star fa-3x"){
				$.post(
						"<%=request.getContextPath()%>/front-end/forum/fc.do?action=collect",
						{
							"memId":$("#starImg").find('input[name = "memId"]').val(),
							"faId" :$("#starImg").find('input[name = "faId"]').val(),
						},
						function(){
							$('#starImg i').attr('class',"fas fa-star fa-3x");
							$('#starImg').css('color','#C4C400');
							toastr.success("已收藏");
						}
						
				)
				
			}else{
				$.post(
						"<%=request.getContextPath()%>/front-end/forum/fc.do?action=cancelCollect",
						{
							"memId":$("#starImg").find('input[name = "memId"]').val(),
							"faId" :$("#starImg").find('input[name = "faId"]').val(),
						},
						function(){
							$('#starImg i').attr('class',"far fa-star fa-3x");
							$('#starImg').css('color','#000');
						}
				)
				
			}
				
		})
		/*通知*/				
		$.ajax({
			type:"POST",
			url:"<%=request.getContextPath()%>/front-end/forum/follow.do?action=checkSubscribe",
			data:{
				"memId": $("#subscribe").find('input[name = "memId"]').val(),
				"aMemId": $("#subscribe").find('input[name = "aMemId"]').val(),
			},
			success:function(count){
				if(count != 0){
					$("#subscribe i").attr("class","fas fa-bell fa-3x");
					$("#subscribe").css("color","#743A3A");
				}else{
					$("#subscribe i").attr("class","far fa-bell fa-3x");
					$("#subscribe").css("color","#000");
				}
			}
		})
		
		$("#subscribe").click(function(){
			if($("#subscribe i").attr("class") === "far fa-bell fa-3x"){
				$.post(
						"<%=request.getContextPath()%>/front-end/forum/follow.do?action=Subscribe",
						{
							"memId" : $("#subscribe").find('input[name = "memId"]').val(),
							"aMemId" : $("#subscribe").find('input[name = "aMemId"]').val(),
						},
						function(){
							$("#subscribe i").attr("class","fas fa-bell fa-3x");
							$("#subscribe").css("color","#743A3A");
							toastr.info("已開啟通知");
							var jsonObj = {
									"type":"notifyAuthor",
									"memId":`${faVO.memId}`,
									"message":`${sessionScope.memVO.mem_name}` + "已追蹤您"
							}
							webSocket.send(JSON.stringify(jsonObj));
						}
				)
			}else{
				$.post(
						"<%=request.getContextPath()%>/front-end/forum/follow.do?action=unSubscribe",
						{
							"memId" : $("#subscribe").find('input[name = "memId"]').val(),
							"aMemId" : $("#subscribe").find('input[name = "aMemId"]').val(),
						},
						function(){
							$("#subscribe i").attr("class","far fa-bell fa-3x");
							$("#subscribe").css("color","#000");
						}
						
				)
			}
		})	
		
		toastr.options = {
				closeButton: true,
				debug: false,
				newestOnTop: false,
				progressBar: true,
				positionClass: "toast-top-right",
				preventDuplicates: false,
				onclick: null,
				showDuration: "300",
				hideDuration: "1000",
				timeOut: "15000",
				extendedTimeOut: "10000",
				showEasing: "swing",
				hideEasing: "linear",
				showMethod: "fadeIn",
				hideMethod: "fadeOut"
	};
											
			
			
	});
	</script>

</body>

</html>