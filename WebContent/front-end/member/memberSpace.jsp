<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.mem.model.*"%>

<% 
	MemVO memVO = (MemVO)session.getAttribute("memVO"); 
%>

<!DOCTYPE HTML>
<!--
	Hielo by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>

<head>
    <title>BOOKSHOP部客匣</title>
    
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    
    <link rel="stylesheet" href="<%= request.getContextPath()%>/css/main-front.css" />
    <link rel="stylesheet" href="<%= request.getContextPath()%>/css/header.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/jquery.datetimepicker.css" />
    <link rel="stylesheet" href="<%= request.getContextPath()%>/css/updatePwd.css" />
    
    <style>
    	table td{
    		font-size: 18px;
    		font-family: "Helvetica", "Arial","LiHei Pro","黑體-繁","微軟正黑體", sans-serif;
    		font-weight: 700;
    		border: 0;
    		color: black;
   		}
   		table input{
   			font-size: 18px;
    		font-family: "Helvetica", "Arial","LiHei Pro","黑體-繁","微軟正黑體", sans-serif;
    		font-weight: 700;
   		}
   		
   		#mytable td{
   			width: 100px;
   			padding: 0;
   		}
   		
   		#mytable tr{
   			height: 40px;
   		}
   		
   		#btn{
   			background-color: #6c757d;
   			color: white !important;
   			font-weight: 700;
   			letter-spacing: 1px;
   			font-family: "Helvetica", "Arial","LiHei Pro","黑體-繁","微軟正黑體", sans-serif;
   		}
   		#mytable input{
   			border:0;
   		}
   		
   		
   		
   		
    </style>
</head>

<body class="subpage">
    <jsp:include page="/front-end/header/header.jsp"/>
	
    <section id="One" class="wrapper style3">
        <div class="inner">
            <header class="align-center">
                <p>部客匣BookShop</p>
                <h2>會員資料更改</h2>
            </header>
        </div>
    </section>
    <!-- Two -->
   <div class="content">
    		<div class="menuDiv">
			<ul class="myMenu">
			    <li class="itembox drop-down">
			        <a class="item">會員資料管理</a>
			        <div class="submenu">
			            <a class="submenu-item" href="<%= request.getContextPath()%>/front-end/member/updatePwd.jsp">修改密碼</a>
			            <a class="submenu-item" href="<%= request.getContextPath()%>/front-end/member/memberSpace.jsp">會員資料更新</a>
			            <a class="submenu-item" href="<%= request.getContextPath()%>/front-end/member/payMethod.jsp">支付管理</a>
			        </div>
			    </li>
			    <li class="itembox drop-down">
			        <a class="item">訂單管理</a>
			        <div class="submenu">
			            <a class="submenu-item" href="<%= request.getContextPath()%>/front-end/member/selectOrder.jsp">訂單查詢</a>
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
			            <a class="submenu-item" href="request.getContextPath()%>/front-end/forum/memberCenter_forum.jsp">討論區發文紀錄</a>
			            <a class="submenu-item" href="<%=request.getContextPath()%>/front-end/forum/memberCenter_forum_collections.jsp">收藏文章</a>
			        </div>
			    </li>
			    <li class="itembox drop-down">
			        <a class="item">讀書會管理</a>
			        <div class="submenu">
			            <a class="submenu-item" href="<%=request.getContextPath()%>/front-end/bookclub/myBookClub.jsp">我的讀書會</a>
			            <a class="submenu-item" href="<%=request.getContextPath()%>/front-end/bookclub/review_BookClub.jsp">讀書會報名紀錄</a>
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
			            <a class="submenu-item" href="<%= request.getContextPath()%>/front-end/favorite_book/favoriteBook.jsp">已收藏書單</a>
			            <c:if test="${sessionScope.memVO.mem_iskol == 1}">
			            	<a class="submenu-item" href="<%= request.getContextPath()%>/front-end/celebrity_book/celebrityBook.jsp">收藏書單分享</a>
			        	</c:if>
			        </div>
			    </li>
			</ul>
			<div class="updateBlock">
			    	<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/mem/mem.do" name="form1" enctype="multipart/form-data" id="form1">
						<table id="mytable" style="height:60%;">
							<tbody>
								<tr>
									<td>姓名</td>
									<td style="padding-top:7px;">&nbsp;&nbsp;&nbsp;&nbsp;${memVO.mem_name}</td>
								</tr>
								<tr>
									<td>帳號</td>
									<td style="padding-top:7px;">&nbsp;&nbsp;&nbsp;&nbsp;${memVO.mem_account}</td>
								</tr>
								<tr>
									<td>E-MAIL</td>
									<td style="padding-top:7px;">&nbsp;&nbsp;&nbsp;${memVO.mem_email}</td>
								</tr>
								<tr>
									<td>暱稱</td>
									<td><input type="text" name="mem_nickname" size="10" value="${memVO.mem_nickname}" />
								</tr>
								<tr>
									<td>性別</td>
									<td>
				                        <select id="sex" name="mem_sex" style=" font-size: 20px; font-weight: 900; font-family: Helvetica, Arial,LiHei Pro,黑體-繁,微軟正黑體, sans-serif;">
				                            <option value="1">男</option>
				                            <option value="0">女</option>
				                        </select>
									</td>
								</tr>
								<tr>
									<td>生日</td>
									<td><input type="text" name="mem_birth" size="10" value="${memVO.mem_birth}" id="f_date1" /></td>
								</tr>
								<tr>
									<td>地址</td>
									<td><input type="text" name="mem_addr" size="30" value="${memVO.mem_addr}" /></td>
								</tr>
								<tr>
									<td>電話</td>
									<td><input type="text" name="mem_tel" size="20" value="${memVO.mem_tel}" maxlength="10" oninput="value=value.replace(/[^\d]/g,'')"/></td>
								</tr>
								<% if(memVO.getMem_pic() != null) {%>
									<tr>
										<td></td>
										<td>
											<img src="<%=request.getContextPath()%>/mem/MemPic?mem_id=${memVO.mem_id}" style="width: 220px; height: 180px; border-radius: 10px; border: 3px dashed black;" id="image">
											<label class="btn btn-info" style="margin-left: 70px;">
												<input type="file" name="mem_pic" size="10" value="${memVO.mem_pic}" id="myfile" style="display:none;"/>
												<i class="fa fa-photo" ></i> 上傳圖片
											</label>
										</td>
									</tr>
								<%} else {%>
									<tr>
										<td></td>
										<td>
											<img src="<%=request.getContextPath()%>/BookShopLogo/3.png" style="width: 220px; height: 180px; border-radius: 10px; border: 3px dashed black;" id="image" >
											<label class="btn btn-info" style="margin-left: 70px;">
												<input type="file" name="mem_pic" size="10" value="${memVO.mem_pic}" id="myfile" style="display:none;"/>
												<i class="fa fa-photo"></i> 上傳圖片
											</label>								
										</td>
									</tr>
								<% } %>
								</tbody>
							</table>
						<input type="hidden" name="action" value="update_fromFront" />
						<input type="hidden" name="mem_account" value="${memVO.mem_account}" />
						<input type="hidden" name="mem_password" value="${memVO.mem_password}" />
						<input type="hidden" name="mem_name" value="${memVO.mem_name}" />
						<input type="hidden" name="mem_email" value="${memVO.mem_email}" />
						<input type="hidden" name="mem_bonus" value="${memVO.mem_bonus}" />
						<input type="hidden" name="mem_exp" value="${memVO.mem_exp}" />
						<input type="hidden" name="mem_iskol" value="${memVO.mem_iskol}" />
						<input type="hidden" name="mem_status" value="${memVO.mem_status}" />
						<input type="hidden" name="mem_id" value="${memVO.mem_id}" />
						<input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>">
						<input type="submit" value="送出修改" id="btn">
					</FORM>
				    </div>
				</div>
			</div>
    
   	<jsp:include page="/front-end/footer/footer.jsp"/>
    <!-- Scripts -->
   
    <script src='<%= request.getContextPath()%>/js/jquery.min.js'></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js"></script>
    
	<script>
	
	$(function() {

		$("#myfile").change(function() {
			var readFile = new FileReader();
			var mfile = $("#myfile")[0].files[0];  //注意這裡必須時$("#myfile")[0]，document.getElementById('file')等價與$("#myfile")[0]
			readFile.readAsDataURL(mfile);
			readFile.onload = function() {
				var img = $("#image");
				img.attr("src", this.result);
			}
		});

	})
	
	$.datetimepicker.setLocale('zh');
		$('#f_date1').datetimepicker({
			theme : '', //theme: 'dark',
			timepicker : false, //timepicker:true,
			step : 1, //step: 60 (這是timepicker的預設間隔60分鐘)
			format : 'Y-m-d', //format:'Y-m-d H:i:s',
			//value : new Date()
		// value:   new Date(),
		//disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
		//startDate:	            '2017/07/10',  // 起始日
		//minDate:               '-1970-01-01', // 去除今日(不含)之前
		//maxDate:               '+1970-01-01'  // 去除今日(不含)之後
		});
	
	var somedate2 = new Date();
		$('#f_date1')
				.datetimepicker(
						{
							beforeShowDay : function(date) {
								if (date.getYear() > somedate2.getYear()
										|| (date.getYear() == somedate2
												.getYear() && date.getMonth() > somedate2
												.getMonth())
										|| (date.getYear() == somedate2
												.getYear()
												&& date.getMonth() == somedate2
														.getMonth() && date
												.getDate() > somedate2
												.getDate())) {
									return [ false, "" ]
								}
				return [ true, "" ];
			}
		});
	
	
	</script>
	
	
    <script src="<%= request.getContextPath()%>/js/skel.min.js"></script>
    <script src="<%= request.getContextPath()%>/js/util.js"></script>
    <script src="<%= request.getContextPath()%>/js/main.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
    
</body>

</html>