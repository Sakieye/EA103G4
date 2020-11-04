<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.shping.model.*"%>
<%@ page import="com.mem.model.*"%>
<%@ page import="com.payme.model.*"%>

<%
	if(session.getAttribute("memVO")!=null && session.getAttribute("shpingcart")!=null){
		
		@SuppressWarnings("unchecked")
		List<Cart> cartlist = (Vector<Cart>) session.getAttribute("shpingcart");
		pageContext.setAttribute("cartlist", cartlist);
		
		String[] totalPrice = (String[]) session.getAttribute("getTotal");
		pageContext.setAttribute("totalPrice", totalPrice);
		
		MemVO memVO = (MemVO) session.getAttribute("memVO");
		pageContext.setAttribute("memVO", memVO);

		MemService memSvc = new MemService();
		MemVO memSvcVO = memSvc.getOneMem(memVO.getMem_id());
		pageContext.setAttribute("memSvcVO", memSvcVO);

		PayService paySvc = new PayService();
		List<PayVO> payVO = paySvc.getOneMemPay(memVO.getMem_id());
		pageContext.setAttribute("payVO", payVO);
		
		String odprice=null;
%>


<!DOCTYPE html>
<html>
<head>
<title>部客匣-結帳流程</title>
<meta charset="UTF-8">


<link rel="stylesheet" href="<%= request.getContextPath()%>/css/main-front.css" />
<link rel="stylesheet" href="<%= request.getContextPath()%>/css/header.css" />
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<!--Header購物車、次Header搜尋欄-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header-front-with-cart-and-search.css">
<!-- jQuery AutoCompelete -->
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-ui.css">
<script src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.auto-complete.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery.auto-complete.css" />
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/vendor/shop/animate/animate.css">
<!--=============================================================================================== -->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/vendor/shop/perfect-scrollbar/perfect-scrollbar.css">
<!--=============================================================================================== -->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/shoputil.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/shopmain.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bookshop_index.css" />
<!--===============================================================================================-->
</head>

<body>
<body class="animsition">
<!-- Header -->
	<header class="header-v4">
		<!-- Header desktop -->
			<!-- Topbar -->
			<div class="top-bar">
				<jsp:include page="/front-end/header/header-with-cart.jsp"/>
		</div>
		
	</header>

	<!-- Title page -->
	<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('<%=request.getContextPath() %>/images/cliff/bg-01.jpg');margin: 48px 0px 0px 0px;">
		<h2 class="ltext-105 cl0 txt-center">
			付款流程
		</h2>
	</section>	


	<!-- Content page -->
	<section class="bg0 p-t-75 p-b-120">
		<div class="container">
			<div class="row p-b-148">
				<div class="col-md-7 col-lg-12">
					<FORM class="form-inline" name="checkFrom" method="POST"
							action="<%=request.getContextPath()%>/order/order.do">

							<div class="accordion" id="accordionExample" style="width: 100%;">
								<!-- 購物清單 -->

								<div class="card" id="cardpay">
									<div class="card-header-pay" id="headingOne">
										<h2 class="mb-0">
											<button class="btn btn-link btn-block text-left"
												type="button" data-toggle="collapse"
												data-target="#collapseOne" aria-expanded="true"
												aria-controls="collapseOne" onClick="listBtn()" id="cardBtn">
												>購物車商品明細</button>
										</h2>
									</div>

									<div id="collapseOne" class="collapse show"
										aria-labelledby="headingOne" data-parent="#accordionExample">
										<div class="card-body">
											<table class="cartprd table-shopping-cart">
												<tr class="table_head">
													<th class="column-1">項目</th>
													<th class="column-1">參考圖</th>
													<th class="column-2">書名</th>
													<th class="column-3">數量</th>
													<th class="column-4">小計</th>
													<th class="column-5" style="text-align: center;">Point</th>
												</tr>
												<c:set var="count" scope="session" />

												<c:forEach var="cart" items="${cartlist}"
													varStatus="cartstatus">

													<tr class="table_row">
														<!--項目 -->
														<td class="column-1" style="vertical-align: middle;"><h5>${count=count+1}</h5></td>
														<!--商品圖 -->
														<td class="column-1" id="imgTd" style="vertical-align: middle;"><img
															class="prdimgTd" alt="404 NOT FOUND"
															src="${pageContext.request.contextPath}/ShowBookPic?bookID=${cart.book_Id}">
														</td>
														<td class="column-2" style="vertical-align: middle;width:100px;">
														<!--ISBN -->
															<h6>ISBN：${cart.isbn}</h6> 
														<!--商品名稱  -->
															<h4 style="width:100%;white-space:normal;word-wrap:break-word;word-break:break-all;" >${cart.book_Name}</h4> 
														</td>
														<!--購買數量  -->
														<td class="column-3" style="vertical-align: middle;"><h5>${cart.comm_Qty}個</h5></td>
														<!--價錢小計  -->
														<td style="vertical-align: middle;">
															<h5>TWD$
																<fmt:formatNumber type="number" value="${cart.price*cart.comm_Qty}" maxFractionDigits="0" />
															</h5></td>
														<!--單項獲得紅利  -->
														<td style="vertical-align: middle; text-align: center;"><h5>
																<fmt:formatNumber type="number" value="${cart.book_BP*cart.comm_Qty}" maxFractionDigits="0" />
																點
															</h5> 
															<!-- input 商品資料 --> 
															<input type="hidden" name="book_Id" value="${cart.book_Id}"> 
															<input type="hidden" name="book_Name" value="${cart.book_Name}"> 
															<input type="hidden" name="price" value="${cart.price*cart.comm_Qty}"> 
															<input type="hidden" name="comm_Qty" value="${cart.comm_Qty}">
															<input type="hidden" name="book_BP" value="<fmt:formatNumber type="number" value="${cart.book_BP*cart.comm_Qty}" maxFractionDigits="0" />">
														</td>
												</c:forEach>
											</table>
											<div class="alert alert-info">
												<b>POINT： + <span id="prdtotal">${totalPrice[1]}</span></b><br>
												<b>小計(優惠已折)： TWD$ <span id="prdtotal">${totalPrice[0]}</span></b>
											</div>
										</div>
									</div>
								</div>

								<!-- 收件資訊 -->
								<div class="card">
									<div class="card-header-pay" id="headingTwo">
										<h2 class="mb-0">
											<button class="btn btn-link btn-block text-left collapsed"
												type="button" data-toggle="collapse"
												data-target="#collapseTwo" aria-expanded="false"
												aria-controls="collapseTwo" onClick="listBtn2()"
												id="cardBtn2">＞ 收件資訊</button>
										</h2>
									</div>
									<div id="collapseTwo" class="collapse"
										aria-labelledby="headingTwo" data-parent="#accordionExample">
										<div class="card-body">
											<div class="form-row">
												<div class="form-group col-md-6">
												
													<label for="inputEmail4">收&nbsp;件&nbsp;人&nbsp;：&nbsp;</label><input
														type="text" class="form-control" id="rec_Name"
														name="rec_Name" size="10" value="${memSvcVO.mem_name}"
														placeholder="請填寫正確全名" required>
												</div>
												<div class="form-group col-md-6">
													<label for="inputPassword4">連絡電話：&nbsp;</label> <input
														type="Text" class="form-control" id="rec_Tel"
														name="rec_Tel" size="10" value="${memSvcVO.mem_tel}"
														placeholder="請填寫正確號碼" required>
												</div>

												<label for="inputAddress">收件地址：&nbsp;</label> <input
													type="text" class="form-control" id="rec_Add"
													name="rec_Add" size="50" value="${memSvcVO.mem_addr}"
													placeholder="請填寫正確地址" required>
											</div>
										</div>
									</div>
								</div>
								<!-- 付款資訊 -->
								<div class="card">
									<div class="card-header-pay" id="headingThree">
										<h2 class="mb-0">
											<button class="btn btn-link btn-block text-left collapsed"
												type="button" data-toggle="collapse"
												data-target="#collapseThree" aria-expanded="false"
												aria-controls="collapseThree" onClick="listBtn3()"
												id="cardBtn3">＞ 付款資訊</button>
										</h2>
									</div>
									<div id="collapseThree" class="collapse"
										aria-labelledby="headingThree" data-parent="#accordionExample">
										<div class="card-body">

											<div class="input-group mb-3">
												<div class="input-group-prepend">
													<label class="input-group-text" for="inputGroupSelect01">收貨方式</label>
												</div>
												<select class="custom-select" name="delivery" id="delivery" required placeholder="請填寫正確全名">
													<option selected value="">請選擇...</option>
													<option value="1">宅配</option>
													<option value="2">超商取貨</option>
												</select>
											</div>

											<div class="input-group mb-3">
												<div class="input-group-prepend">
													<label class="input-group-text" for="inputGroupSelect01">付款方式</label>
												</div>
												<select class="custom-select" name="order_Pay" id="order_Pay" required>
													<option selected value="">請選擇...</option>
													<option value="1">信用卡(一次付清)</option>
													<option value="2">貨到付款(運費100)</option>
												</select>
											</div>
											<!-- 信用卡彈出視窗 -->
											<div class="form-row">
												<hr size="10px" align="center" width="100%">
												<div class="form-group col-md-12">
													<label>信用卡資料</label> 
						<div class="col-6" style="display:flex;">
							<input type="text" name="cardNum1" placeholder="1234" maxlength="4">
							-
							<input type="text" name="cardNum2" placeholder="5678" maxlength="4">
							-
							<input type="text" name="cardNum3" placeholder="9012" maxlength="4">
							-
							<input type="text" name="cardNum4" placeholder="3456" maxlength="4">
						</div>
						<div class="col-1 mmdd" style="display:flex;">
							<span for="pro">有效日期：</span> 
							<input id="mm" type="text" list="MM" name="mm" placeholder="MM" maxlength="2">
							 / <input id="yy" type="text" list="YY" name="yy" placeholder="YY" maxlength="2">
							<datalist id="MM">
								<option value="1">01</option>
								<option value="2">02</option>
								<option value="3">03</option>
								<option value="4">04</option>
								<option value="5">05</option>
								<option value="6">06</option>
								<option value="7">07</option>
								<option value="8">08</option>
								<option value="9">09</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option>
							</datalist>
							<datalist id="YY">
								<option value="20"></option>
								<option value="21"></option>
								<option value="22"></option>
								<option value="23"></option>
								<option value="24"></option>
								<option value="25"></option>
								<option value="26"></option>
								<option value="27"></option>
								<option value="28"></option>
								<option value="29"></option>
							</datalist>
						</div>
												</div>
											</div>


											<!-- 紅利點數 -->
											<hr size="10px" align="center" width="100%">
											<div class="price" data-price="${totalPrice[0]}" id=chelisInf>
												<span style="display:flex;"> ◎您累計的紅利點數：<span>
												<b><fmt:formatNumber type="number" value="${memSvcVO.mem_bonus}" />
												</b> 點</span> 
												<c:if test="${memSvcVO.mem_bonus >=1}">
													, 使用：<b><input required class="use_Bonus" type="number" name="use_Bonus" step="1" min="0" max="${memSvcVO.mem_bonus}" value="0" 
													style="width: 50px; height: 21px; display:flex; text-align: center; 
													border-width:3px;border-style:dashed;border-color:#9d1e31ab;padding:5px;"></b>
													<p style="display:flex;">點</p>
													<p style="color:red; font-size:12px; margin-top: 0.1%;">（註： 1 Point = TWD $1）</p>
												</c:if>
												<c:if test="${memSvcVO.mem_bonus == 0}">
													<input class="use_Bonus" type="hidden" name="use_Bonus" value="0"/>
												</c:if>
												</span>
											</div>

											<!-- 發票資料 -->
											<hr size="10px" align="center" width="100%">
											<div id=vehicle>
												<span> ◎電子載具歸戶：</span> <input type="text" id="use_Bonus"
													max="8" size="8" value="/HBHNTYT">
											</div>

											<!-- 備註 -->
											<hr size="10px" align="center" width="100%">
											<div id=mem_Note>
												<span> 備註</span> <input type="text" id="mem_Note"
													name="mem_Note" max="10000" style="height: 80px;">

											</div>

										</div>
									</div>
								</div>

								<!-- 帳務資訊 -->
								<hr size="10px" align="center" width="100%">
								<div class="alert alert-secondary" align="center">
									<div class="container"></div>
									<div class="alert">
										<h3 class="display-5">本次訂單金額：<b class="totalprice">${totalPrice[0]}</b></h3>
									</div>

									<div class="alert">
										<!-- input 訂單資料 -->
										<input type="hidden" name="mem_Id" value="${memVO.mem_id}">
										<input type="hidden" name="order_Total" id="order_Total" value="${totalPrice[0]}"> 
										<input type="hidden" name="get_Bonus" value="${totalPrice[1]}"> 
										<input type="hidden" name="order_Qty" value="${count}"> 
										<input type="hidden" name="action" value="PAY">
										<button type="submit" class="flex-c-m stext-101 cl0 size-116-pay bg3 bor14 hov-btn3 p-lr-15 trans-04 pointer js-btn-submit">
										<b><font color=#000>確認結帳</font></b></button>

									</div>
							</div>
						</div>
					</FORM>
				</div>
			</div>
		</div>
	</section>	
	<%
	}else{
	%>
	<jsp:forward page="/front-end/bookshop-eshop/index.jsp" />
	<% 
	}
	%>
	
	
	<jsp:include page="/front-end/footer/footer.jsp" />
	<!-- Scripts -->
	<script src="<%=request.getContextPath()%>/js/skel.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/util.js"></script>
	<script src="<%=request.getContextPath()%>/js/main.js"></script>
	<script src="<%=request.getContextPath()%>/js/stopExecutionOnTimeout.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.easing.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.datetimepicker.full.js"></script>
<!-- ======================================================================================= -->
	<!-- 下拉式選單 -->
	<script>
		function listBtn() {
			var listBtn = document.getElementById('cardBtn');
			var listext = document.getElementById('collapseOne');
			if (listext.style.display !== 'block') {
				listext.style.display = 'block';
			} else {
				listext.style.display = 'none';
			}
		}
		function listBtn2() {
			var listBtn2 = document.getElementById('cardBtn2');
			var listext2 = document.getElementById('collapseTwo');
			if (listext2.style.display !== 'block') {
				listext2.style.display = 'block';
			} else {
				listext2.style.display = 'none';
			}
		}
		function listBtn3() {
			var listBtn3 = document.getElementById('cardBtn3');
			var listext3 = document.getElementById('collapseThree');
			if (listext3.style.display !== 'block') {
				listext3.style.display = 'block';
			} else {
				listext3.style.display = 'none';
			}
		}
	</script>
<!-- ======================================================================================= -->
<script src="<%=request.getContextPath()%>/vendor/shop/sweetalert/sweetalert.min.js"></script>
	<!-- 計算總金額 -->
	<script>
		$(function(){
		  $('.price').on('keyup','.use_Bonus',function(){
			var price = +$(this).closest('.price').data('price');
			if(+$(this).val()<=price){
				var use_Bonus = +$(this).val();
				var total_price = price - use_Bonus;
	            if(total_price>=0){
	           		 $('.totalprice').text(total_price);
	           		 $('#order_Total').val(total_price);
	            }else{
	           		 $('.totalprice').text(0);
	            	$('#order_Total').val(0);
	            }}else{
	            	swal({title: "使用點數已超過本次訂單金額，請重新輸入！",type: "error",buttons: true})
					$('.use_Bonus').val(0);
	            }
	          });

		  $('.price').on( 'click','.use_Bonus',function(){
			var price = +$(this).closest('.price').data('price');
			if(+$(this).val()<=price){
				var use_Bonus = +$(this).val();
				var total_price = price - use_Bonus;
           		 if(total_price>=0){
           			 $('.totalprice').text(total_price);
           			 $('#order_Total').val(total_price);
           		 }else{
           			 $('.totalprice').text(0);
           			 $('#order_Total').val(0);
            }}else{
            	swal({title: "使用點數已超過本次訂單金額，請重新輸入！",type: "error",buttons: true})
				$('.use_Bonus').val(0);
            }
          });

		});
	</script>
<!-- ======================================================================================= -->

</body>
</html>