<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.mem.model.*"%>
<%@ page import="com.order.model.*"%>

<%@ page import="java.util.*"%>

<% 
	List<OrderVO> list = (List<OrderVO>) request.getAttribute("list");
	pageContext.setAttribute("list", list);
%>
<jsp:useBean id="detailSvc" scope="page" class="com.detail.model.DetailService"/>
<!DOCTYPE html>
<html>
<head>
<title>BOOKSHOP部客匣</title>

<link rel="stylesheet" href="<%= request.getContextPath()%>/css/main-front.css" />
<link rel="stylesheet" href="<%= request.getContextPath()%>/css/header.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/jquery.datetimepicker.css" />
<link rel="stylesheet" href="<%= request.getContextPath()%>/css/selectOrder.css" />


</head>
<body>
	<jsp:include page="/front-end/header/header.jsp" />
	
	<section id="One" class="wrapper style3">
		<div class="inner">
			<header class="align-center">
				<p>部客匣BookShop</p>
				<h2>訂單查詢</h2>
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
					<a class="submenu-item" href="<%= request.getContextPath()%>/front-end/member/selectOrder.jsp">訂單查詢</a>
					</div></li>
				<li class="itembox drop-down"><a class="item">二手書訂單管理</a>
					<div class="submenu">
						<a class="submenu-item" href="#">二手書訂單修改/取消</a> <a
							class="submenu-item" href="#">二手書訂單查詢</a>
					</div></li>
				<li class="itembox drop-down"><a class="item">互動紀錄</a>
					<div class="submenu">
						<a class="submenu-item" href="<%= request.getContextPath()%>/front-end/forum/memberCenter_forum.jsp">討論區發文紀錄</a> <a
							class="submenu-item" href="<%=request.getContextPath()%>/front-end/forum/memberCenter_forum_collections.jsp">收藏文章</a>
					</div></li>
				<li class="itembox drop-down"><a class="item">讀書會管理</a>
					<div class="submenu">
						<a class="submenu-item" href="<%=request.getContextPath()%>/front-end/bookclub/myBookClub.jsp">我的讀書會</a> <a class="submenu-item"
							href="<%=request.getContextPath()%>/front-end/bookclub/review_BookClub.jsp">讀書會報名紀錄</a>
					</div></li>
				<li class="itembox drop-down"><a class="item">講座</a>
					<div class="submenu">
						<a class="submenu-item" href="#">講座報名紀錄</a>
					</div></li>
				<li class="itembox drop-down"><a class="item">收藏的書單管理</a>
					<div class="submenu">
						<a class="submenu-item" href="<%= request.getContextPath()%>/front-end/favorite_book/favoriteBook.jsp">已收藏書單</a> 
						<c:if test="${sessionScope.memVO.mem_iskol == 1}">
			            	<a class="submenu-item" href="<%= request.getContextPath()%>/front-end/celebrity_book/celebrityBook.jsp">收藏書單分享</a>
			        	</c:if>
					</div></li>
			</ul>
				<div class="container" id="myContainer">
					<div class="selectBlock">
						<form METHOD="post" ACTION="<%=request.getContextPath()%>/mem/mem.do">
							<div class="input-group" >
							  <select class="custom-select" id="inputGroupSelect04" name="order_status">
							    <option disabled selected hidden>訂單狀態</option>
							    <option value="1">未出貨</option>
							    <option value="2">已出貨</option>
							    <option value="3">已送達</option>
							    <option value="4">已取消</option>
							  </select>
							</div>
							 <div class="dateBlock">
							 	 <input type="hidden" name="action" value="listOrder">
							 	 <div class="dateDiv"><input name="order_date" class="form-control form-control-sm date" id="f_date1" type="text" placeholder="請輸入日期"></div>
								 <div class="btnDiv"><button class="btn btn-primary mybtn" type="submit">送出</button></div>
							 </div>
						</form>
						 <div class="table-responsive-sm">
							 <table class="table" style="width: 1000px;">
							  <thead>
							    <tr>
							      <th scope="col">訂單編號</th>
							      <th scope="col">日期</th>
							      
							      <th scope="col">付款方式</th>
							      <th scope="col">獲得紅利</th>
							      <th scope="col">折抵紅利</th>
							      <th scope="col">狀態</th>
							      <th scope="col">Total</th>
							      <th scope="col">明細</th>
							      <th scope="col">#</th>
							    </tr>
							  </thead>
							  <%@ include file="orderPage.file" %>
							  <c:forEach var="orderVO" items="${list}" varStatus="orderNO" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
								  <tbody>
								    <tr>
								      <th scope="row">${orderVO.order_id}</th>
								      <td><fmt:formatDate value="${orderVO.order_date}" pattern="yyyy-MM-dd"/></td>
								     						      
								      <c:if test="${orderVO.order_pay == 1}">
									  		<td>信用卡</td>
									  </c:if>
									  <c:if test="${orderVO.order_pay == 2}">
									  		<td>貨到付款</td>
									  </c:if>
								      <td>${orderVO.get_bonus}</td>
								      <td>${orderVO.use_bonus}</td>
								      <c:if test="${orderVO.order_status == 1}">
									  		<td style="color: green;">未出貨</td>
									  </c:if>
									  <c:if test="${orderVO.order_status == 2}">
									  		<td style="color: blue;">已出貨</td>
									  </c:if>
									  <c:if test="${orderVO.order_status == 3}">
									  		<td>已抵達</td>
									  </c:if>
									  <c:if test="${orderVO.order_status == 4}">
									  		<td style="color: red;">取消</td>
									  </c:if>
								      <td>$${orderVO.order_total}</td>
								      <td>
										  <button type="submit" class="btn btn-primary mybtn2" data-toggle="modal" data-target="#exampleModalCenter${orderNO.index}">
  											 點我
										  </button>
										  
										  <!-- Modal -->								   
										  
											<div class="modal fade" id="exampleModalCenter${orderNO.index}" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
											  <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
											    <div class="modal-content">
											      <div class="modal-header">
											        <h5 class="modal-title" id="exampleModalCenterTitle" style="font-weight: 700;">訂單明細</h5>
											        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
											          <span aria-hidden="true">&times;</span>
											        </button>
											      </div>
											      <div class="modal-body">
											        <table class="table">
													  <thead>
													    <tr>
													      <th scope="col">商品名稱</th>
													      <th scope="col"></th>
													      <th scope="col">數量</th>
													      <th scope="col">商品金額</th>
													      <th scope="col">紅利</th>
													    </tr>
													  </thead>
													  <c:forEach var="detailVO" items="${detailSvc.getOneOd(orderVO.order_id)}">
														  <tbody>
														    <tr>
														      <th scope="row">
															       <a href="<%=request.getContextPath()%>/Shopping.html?book_id=${detailVO.book_id}" style="color:black;">
																      ${detailVO.items_name}
																   </a>
														      </th>
														      <td>
															      <a href="<%=request.getContextPath()%>/Shopping.html?book_id=${detailVO.book_id}">
															      	<img style="width: 120px;" src="${pageContext.request.contextPath}/ShowBookPic?bookID=${detailVO.book_id}" alt="Product">
															      </a>
														      </td>
														      <td>${detailVO.comm_qty}</td>
														      <td>$<fmt:formatNumber type="number" value="${detailVO.comm_price}" maxFractionDigits="0"/></td>
														      <td>${detailVO.comm_bonus}</td>
														    </tr>
														  </tbody>
													  </c:forEach>
													</table>
											      </div>
											      <div class="modal-footer">
											        <button type="button" class="btn btn-secondary mybtn2" data-dismiss="modal">Close</button>
											      </div>
											    </div>
											  </div>
											</div>
									<!-- madal -->	   
									  </td>
								      <td>
								      <c:if test="${orderVO.order_status == 1}">
									  		<form class="delForm" METHOD="post" ACTION="<%=request.getContextPath()%>/mem/mem.do">
									      		<input type="hidden" name="action" value="delOrder">
									      		<input type="hidden" name="order_id" value="${orderVO.order_id}">
									      		<input type="hidden" name="use_bonus" value="${orderVO.use_bonus}">
									      		<input type="hidden" name="get_bonus" value="${orderVO.get_bonus}">
									      		<button class="btn btn-danger mybtn2" type="submit">取消</button>
									      	</form>
									  </c:if>      
								      </td>   
								    </tr>
								  </tbody>
							  </c:forEach>
							</table>
							<%@ include file="page2_ByCompositeQuery.file" %>
						</div>
					</div>
				</div> 	
			</div>
		</div>
	
	<jsp:include page="/front-end/footer/footer.jsp" />
	
	<script src='<%= request.getContextPath()%>/js/jquery.min.js'></script>
    <script src="<%= request.getContextPath()%>/js/jquery.scrollex.min.js"></script>
    <script src="<%= request.getContextPath()%>/js/skel.min.js"></script>
    <script src="<%= request.getContextPath()%>/js/util.js"></script>
    <script src="<%= request.getContextPath()%>/js/main.js"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js"></script>
    
    <script>
	    $.datetimepicker.setLocale('zh');
	    $('#f_date1').datetimepicker({
	       theme: '',              //theme: 'dark',
	       timepicker:false,       //timepicker:true,
	       step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
	       format:'Y-m-d',         //format:'Y-m-d H:i:s',
		   //value: new Date() 
		   // value:   new Date(),
	       //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
	       //startDate:	            '2017/07/10',  // 起始日
	       //minDate:               '-1970-01-01', // 去除今日(不含)之前
	       //maxDate:               '+1970-01-01'  // 去除今日(不含)之後
	    });
		
		 var somedate2 = new Date();
	     $('#f_date1').datetimepicker({
	     	beforeShowDay: function(date) {
	        	if (  date.getYear() >  somedate2.getYear() || 
	     			(date.getYear() == somedate2.getYear() && date.getMonth() >  somedate2.getMonth()) || 
	     			(date.getYear() == somedate2.getYear() && date.getMonth() == somedate2.getMonth() && date.getDate() > somedate2.getDate())
	            ) {
	            	return [false, ""]
	              }
	                return [true, ""];
	     }});
    </script>
	
</body>
</html>