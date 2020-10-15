<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.mem.model.*"%>
<%@ page import="com.payme.model.*"%>
<%@ page import="java.util.*"%>

<% 
	PayService paySvc = new PayService();
	MemVO memVO = (MemVO)session.getAttribute("memVO");
	List<PayVO> list = paySvc.getOneMemPay(memVO.getMem_id());
	pageContext.setAttribute("list", list);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BOOKSHOP部客匣</title>

<link rel="stylesheet" href="<%= request.getContextPath()%>/css/main-front.css" />
<link rel="stylesheet" href="<%= request.getContextPath()%>/css/header.css" />
<link rel="stylesheet" href="<%= request.getContextPath()%>/css/payMethod.css" />

</head>
<body>
	<jsp:include page="/front-end/header/header.jsp" />
	
	<section id="One" class="wrapper style3">
		<div class="inner">
			<header class="align-center">
				<p>部客匣BookShop</p>
				<h2>支付方式</h2>
			</header>
		</div>
	</section>
	<div class="content">
		<div class="menuDiv">
			<ul class="myMenu">
				<li class="itembox drop-down"><a class="item">會員資料管理</a>
					<div class="submenu">
						<a class="submenu-item" href="<%= request.getContextPath()%>/front-end/member/updatePwd.jsp">修改密碼</a> <a class="submenu-item"
							href="<%=request.getContextPath()%>/front-end/member/memberSpace.jsp">會員資料更新</a>
						<a class="submenu-item" href="<%=request.getContextPath()%>/front-end/member/payMethod.jsp">支付管理</a>
					</div></li>
				<li class="itembox drop-down"><a class="item">訂單管理</a>
					<div class="submenu">
						<a class="submenu-item" href="#">訂單修改/取消</a> <a
							class="submenu-item" href="#">訂單查詢</a>
					</div></li>
				<li class="itembox drop-down"><a class="item">二手書訂單管理</a>
					<div class="submenu">
						<a class="submenu-item" href="#">二手書訂單修改/取消</a> <a
							class="submenu-item" href="#">二手書訂單查詢</a>
					</div></li>
				<li class="itembox drop-down"><a class="item">互動紀錄</a>
					<div class="submenu">
						<a class="submenu-item" href="#">討論區發文紀錄</a> <a
							class="submenu-item" href="#">討論區留言紀錄</a> <a class="submenu-item"
							href="#">書評發表紀錄</a>
					</div></li>
				<li class="itembox drop-down"><a class="item">讀書會管理</a>
					<div class="submenu">
						<a class="submenu-item" href="#">我的讀書會</a> <a class="submenu-item"
							href="#">讀書會報名紀錄</a>
					</div></li>
				<li class="itembox drop-down"><a class="item">講座</a>
					<div class="submenu">
						<a class="submenu-item" href="#">講座報名紀錄</a>
					</div></li>
				<li class="itembox drop-down"><a class="item">收藏的書單管理</a>
					<div class="submenu">
						<a class="submenu-item" href="#">已收藏書單</a> <a class="submenu-item"
							href="#">收藏書單分享</a>
					</div></li>
			</ul>
				<div class="container" id="myContainer">
					<div class="title">新增信用卡</div>
					<form METHOD="post" ACTION="<%=request.getContextPath()%>/mem/mem.do">
					<div class="row " id="inputCard">
						<div class="col-6">
							<input type="text" name="cardNum1" placeholder="1234" maxlength="4" />
							-
							<input type="text" name="cardNum2" placeholder="5678" maxlength="4" />
							-
							<input type="text" name="cardNum3" placeholder="9012" maxlength="4" />
							-
							<input type="text" name="cardNum4" placeholder="3456" maxlength="4" />
						</div>
						<div class="col-1 mmdd">
							<input type="text" name="mm" placeholder="MM" maxlength="2"/>
							/
							<input type="text" name="yy" placeholder="YY" maxlength="2"/>
						</div>
						<c:if test="${not empty errorMsgs.cardError}">
							<div class="errorMsg" id="msg">${errorMsgs.cardError}</div>
						</c:if>
						<c:if test="${not empty errorMsgs.monthError}">
							<div class="errorMsg" id="msg">${errorMsgs.monthError}</div>
						</c:if>
					</div>
						<input type="hidden" name="action" value="insertCreditCard" />
						<input type="hidden" name="mem_id" value="${memVO.mem_id}" />
						<button type="submit" class="btn">新增</button>
					</form>
					<c:if test="${not empty list}">
						<div class="selectBlock">
							<table>
								<tr>
									<th>信用卡卡號</th>
									<th>到期月</th>
									<th>到期年</th>
									<th></th>
								<%@ include file="page1.file" %>
								</tr>
								<c:forEach var="payVO" items="${list}">
								<tr>
									<td>${payVO.credit_card_num}</td>
									<c:if test="${payVO.credit_card_mon < 10}">
										<td>0${payVO.credit_card_mon}</td>
									</c:if>
									<c:if test="${payVO.credit_card_mon >= 10}">
										<td>${payVO.credit_card_mon}</td>
									</c:if>
									<td>${payVO.credit_card_year}</td>
									<td>
										<form id="myForm" METHOD="post" ACTION="<%=request.getContextPath()%>/mem/mem.do">
											<input type="hidden" name="credit_card_num"  value="${payVO.credit_card_num}" />
							    			<input type="hidden" name="action"	value="deleteCreditCard" />	
											<button type="submit" id="deleteBtn">刪除</button>
										</form>
									</td>
								</tr>
								</c:forEach>
							</table>
							<%@ include file="page2.file" %>
						</div>
					</c:if>
				</div> 	
			</div>
			
			
			
<!-- 			<div class="rightBlock"> -->
<!-- 				<div class="insertBlock"> -->
<!-- 				<div class="container"> -->
<!-- 					<div class="row"> -->
<!-- 						<div class="col-md-2"><input type="text" id="" name="" /></div> -->
<!-- 						<div class="col-md-1">-</div> -->
<!-- 						<div class="col-md-2"><input type="text" id="" name="" /></div> -->
<!-- 						<div class="col-md-1">-</div> -->
<!-- 						<div class="col-md-2"><input type="text" id="" name="" /></div> -->
<!-- 						<div class="col-md-1">-</div> -->
<!-- 						<div class="col-md-2"><input type="text" id="" name="" /></div> -->
<!-- 					</div> -->
<!-- 				</div> -->
					
					
<!-- 				</div> -->
<!-- 				<div class="selectBlock"> -->
<!-- 				</div> -->
<!-- 			</div> -->
		</div>
	
	<jsp:include page="/front-end/footer/footer.jsp" />
	
	<script src='<%= request.getContextPath()%>/js/jquery.min.js'></script>
    <script src="<%= request.getContextPath()%>/js/jquery.scrollex.min.js"></script>
    <script src="<%= request.getContextPath()%>/js/skel.min.js"></script>
    <script src="<%= request.getContextPath()%>/js/util.js"></script>
    <script src="<%= request.getContextPath()%>/js/main.js"></script>
	
</body>
</html>