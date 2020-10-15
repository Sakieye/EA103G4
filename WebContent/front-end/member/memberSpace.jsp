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
    
    <style>
    	table td{
    		font-size: 20px;
    		font-family: "Helvetica", "Arial","LiHei Pro","黑體-繁","微軟正黑體", sans-serif;
    		font-weight: 900;
    		border: 0;
    		color: black;
   		}
   		table input{
   			font-size: 20px;
    		font-family: "Helvetica", "Arial","LiHei Pro","黑體-繁","微軟正黑體", sans-serif;
    		font-weight: 900;
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
    <section id="two" class="wrapper style2">
        <div class="inner">
            <div class="box">
                <div class="content">
				    <div id="formdiv">
				    	<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/mem/mem.do" name="form1" enctype="multipart/form-data" onchange="loadImageFile(event)">
							<table>
								<tr>
									<td >姓名</td>
									<td>${memVO.mem_name}</td>
								</tr>
								<tr>
									<td>帳號</td>
									<td>${memVO.mem_account}</td>
								</tr>
								<tr>
									<td>E-MAIL</td>
									<td>${memVO.mem_email}</td>
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
									<td><input type="date" name="mem_birth" size="10" value="${memVO.mem_birth}" /></td>
								</tr>
								<tr>
									<td>地址</td>
									<td><input type="text" name="mem_addr" size="30" value="${memVO.mem_addr}" /></td>
								</tr>
								<tr>
									<td>電話</td>
									<td><input type="text" name="mem_tel" size="20" value="${memVO.mem_tel}" /></td>
								</tr>
								<% if(memVO.getMem_pic() != null) {%>
									<tr>
										<td></td>
										<td>
											<img src="<%=request.getContextPath()%>/mem/MemPic?mem_id=${memVO.mem_id}" style="width: 220px; height: 180px;" id="image">
											<input type="file" name="mem_pic" size="10" value="${memVO.mem_pic}" />
										</td>
									</tr>
								<%} else {%>
									<tr>
										<td></td>
										<td>
											<img src="<%=request.getContextPath()%>/BookShopLogo/3.png" style="width: 220px; height: 180px;" id="image">
											<input type="file" name="mem_pic" size="10" value="${memVO.mem_pic}" />								
										</td>
									</tr>
								<% } %>
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
							<input type="submit" value="送出修改">
						</FORM>
				    </div>
     			</div>
            </div>
        </div>
    </section>
    
   	<jsp:include page="/front-end/footer/footer.jsp"/>
    <!-- Scripts -->
    <script src='<%= request.getContextPath()%>/js/jquery.min.js'></script>
    <script src="<%= request.getContextPath()%>/js/jquery.scrollex.min.js"></script>
    <script src="<%= request.getContextPath()%>/js/skel.min.js"></script>
    <script src="<%= request.getContextPath()%>/js/util.js"></script>
    <script src="<%= request.getContextPath()%>/js/main.js"></script>
<script>
	function loadImageFile(event){ 
		var image = document.getElementById('image'); 
		image.src = URL.createObjectURL(event.target.files[0]); 
	};
</script>
    
</body>

</html>