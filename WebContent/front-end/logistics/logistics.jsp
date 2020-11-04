<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.order.model.*"%>
<%@ page import="java.util.*"%>

<%	
	String order_id = (String)request.getQueryString().subSequence(9, 21);
	OrderVO odVO = new OrderVO();
	OrderService odSvc = new OrderService();
	odVO = odSvc.getOneOd(order_id);
	pageContext.setAttribute("status", odVO.getOrder_status());
%>

<!DOCTYPE html>
<html lang="zh-tw">
<head>
	<title>部客俠快速出貨系統</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/main-front.css" />
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/header.css" />
	<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<!--=============================================================================================== -->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/vendor/shop/animate/animate.css">
<!--=============================================================================================== -->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/vendor/shop/perfect-scrollbar/perfect-scrollbar.css">
<!--=============================================================================================== -->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/shoputil.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/shopmain.css">
<!--===============================================================================================-->
	
	
</head>
<body class="animsition">
	<!-- Header -->
	<header class="header-v4">
		<!-- Header desktop -->
	</header>

	<!-- Title page -->
	<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('<%=request.getContextPath() %>/images/cliff/bg-01.jpg');">
		<h2 class="ltext-105 cl0 txt-center">
			｜部客俠 快速出貨 系統 ｜
		</h2>
	</section>	
	<!-- Content page -->
	<section class="bg0 p-t-75 p-b-120">
		<div class="container">
			<div class="row p-b-148">
				<div class="col-11 col-md-5 col-lg-6 m-lr-auto">
						<div class="how-bor10 ">
							<div class="hov-img0">
								<img src="<%=request.getContextPath()%>/images/cliff/logistics.jpg" alt="IMG">
							</div>
						</div>
					</div>
				<div class="col-md-7 col-lg-6">
					<div class="p-t-7 p-r-85 p-r-15-lg p-r-0-md">
						<h1 class="mtext-111 cl1 p-b-16 ">
							<input type="hidden" class="status" value="${status}">
							<c:choose>
								<c:when test="${status==1}">
									<div class="divTableCell" style="color:red;">訂單成立(尚未出貨)</div>
								</c:when>
								<c:when test="${status==2}">
									<div class="divTableCell" style="color:red;">已出貨</div>
								</c:when>
								<c:when test="${status==3}">
									<div class="divTableCell" style="color:red;">商品已送達</div>
								</c:when>
								<c:when test="${status==4}">
									<div class="divTableCell" style="color:red;">訂單取消</div>
								</c:when>
								<c:otherwise>
									<div class="divTableCell" style="color:red;">此單異動,請紀錄並通知主管!!</div>
								</c:otherwise>
							</c:choose>
						</h1>
						
						<h2 class="mtext-111 cl3 p-b-16">
							訂單編號：${param.order_id}
						</h2>
						<div class="mtext-111 cl3 p-b-16">
						<FORM class="form-inline" METHOD="post" ACTION="<%=request.getContextPath()%>/order/order.do">
							<input type="hidden" name=order_id value="${param.order_id}">
							<input type="hidden" name="action" value="shipment">
							<input type="hidden" name="logistics" value="logistics">
							<button class="btn btn-sm btn-outline-secondary js-btn-status ${status}" type="submit" disabled="disabled"
								 style="width:55%;font-size:15px;">出　貨</button>
						</FORM>
						</div>
					</div>
				</div>
				
			</div>
		</div>
	</section>	
	<jsp:include page="/front-end/footer/footer.jsp" />
		<!-- Scripts -->
	<script src="<%=request.getContextPath()%>/js/skel.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/util.js"></script>
	<script src="<%=request.getContextPath()%>/js/main.js"></script>
	<script src="<%=request.getContextPath()%>/js/stopExecutionOnTimeout.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.easing.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.datetimepicker.full.js"></script>
	<script src="<%=request.getContextPath()%>/vendor/shop/sweetalert/sweetalert.min.js"></script>
	<script>
		console.log($('.status').val() == 1);
		console.log($('.status').val());
		$(function(){
			if($('.status').val() == 1){
			$('.1').prop('disabled',false);
			swal({
				title: "是否確定出貨?",
				text: "出貨將無法退回未出貨狀態",
				type: "warning",
				buttons: true,
		      	dangerMode: true 
				}).then(function(isConfirm){
				  if (isConfirm) {
					  $('form').submit();
				    swal("出貨成功!", "請於8H內將商品上物流","success")
				    	.then(function(isConfirm){
				    	});
				    result = false;
				    
				  } else {
				    swal("已取消", "此訂單尚未出貨, 請盡速準備","error");
				  }
				});
			}else{
				$('.js-btn-status').attr('已出貨');
				swal({
					title: "注意：此訂單狀態已變更過",
					text: "",
					type: "warning",
			      	dangerMode: true 
				});
				
			}
		})
	/*=====================================================================*/	
	
	
	
		
		
	</script>
	
</body>
</html>
