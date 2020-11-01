<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.admins.model.*"%>


<%
	String admin_name_s = (String) session.getAttribute("admin_name_s");
    String admin_id_s = (String) session.getAttribute("admin_id_s");
%>

<html>
<head>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/main-back.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap.min.css" />

</head>
<body>
	<!-- header -->
	<header id="header">
		<div>
			<div id="logo">
				<a
					href="<%=request.getContextPath()%>/back-end/login/loginSuccess.jsp"><img src="<%=request.getContextPath()%>/images/login/logo.png" width="50px" height="50px">部客匣管理後台<span>
						Bookshop Management</span></a>
			</div>
			<div id="userbar">
<!-- 				<svg width="1em" height="1em" viewBox="0 0 16 16" -->
<!-- 					class="bi bi-person" fill="currentColor" -->
<!-- 					xmlns="http://www.w3.org/2000/svg"> -->
<!--                     <path fill-rule="evenodd" -->
<!-- 						d="M10 5a2 2 0 1 1-4 0 2 2 0 0 1 4 0zM8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm6 5c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z" /> -->
<!--                 </svg> -->



                   <form style="margin: 0px; display: inline" method="post"
					action="<%=request.getContextPath()%>/back-end/admin/admins.do">

					
					<label style="cursor: pointer"><img class="rounded-circle" width="45px" height="40px" src="${pageContext.request.contextPath}/ShowAdminPic?admin_id=<%=admin_id_s %>" id="img"/>&nbsp;               
				<b><%=admin_name_s%></b>
				<input type="hidden" name="action" value="getOne_For_Display"> 
					<input type="hidden" name="admin_id" value="<%=admin_id_s%>">
					<input type="submit" name="getOne_For_Display" style="display: none">	
				</label>&nbsp;您好!</form>
				
				<form style="margin: 0px; display: inline" method="post"
					action="<%=request.getContextPath()%>/back-end/admin/admins.do">

					<input type="hidden" name="action" value="logout"> <label
						style="cursor: pointer"><b>登出</b>&nbsp;<i class="fas fa-sign-out-alt"></i><input type="submit"
						name="logout" style="display: none"></label>
				</form>

<!-- 				<a href="#"><svg width="1em" height="1em" viewBox="0 0 16 16" -->
<!-- 						class="bi bi-gear" fill="currentColor" -->
<!-- 						xmlns="http://www.w3.org/2000/svg"> -->
<!--                         <path fill-rule="evenodd" -->
<!-- 							d="M8.837 1.626c-.246-.835-1.428-.835-1.674 0l-.094.319A1.873 1.873 0 0 1 4.377 3.06l-.292-.16c-.764-.415-1.6.42-1.184 1.185l.159.292a1.873 1.873 0 0 1-1.115 2.692l-.319.094c-.835.246-.835 1.428 0 1.674l.319.094a1.873 1.873 0 0 1 1.115 2.693l-.16.291c-.415.764.42 1.6 1.185 1.184l.292-.159a1.873 1.873 0 0 1 2.692 1.116l.094.318c.246.835 1.428.835 1.674 0l.094-.319a1.873 1.873 0 0 1 2.693-1.115l.291.16c.764.415 1.6-.42 1.184-1.185l-.159-.291a1.873 1.873 0 0 1 1.116-2.693l.318-.094c.835-.246.835-1.428 0-1.674l-.319-.094a1.873 1.873 0 0 1-1.115-2.692l.16-.292c.415-.764-.42-1.6-1.185-1.184l-.291.159A1.873 1.873 0 0 1 8.93 1.945l-.094-.319zm-2.633-.283c.527-1.79 3.065-1.79 3.592 0l.094.319a.873.873 0 0 0 1.255.52l.292-.16c1.64-.892 3.434.901 2.54 2.541l-.159.292a.873.873 0 0 0 .52 1.255l.319.094c1.79.527 1.79 3.065 0 3.592l-.319.094a.873.873 0 0 0-.52 1.255l.16.292c.893 1.64-.902 3.434-2.541 2.54l-.292-.159a.873.873 0 0 0-1.255.52l-.094.319c-.527 1.79-3.065 1.79-3.592 0l-.094-.319a.873.873 0 0 0-1.255-.52l-.292.16c-1.64.893-3.433-.902-2.54-2.541l.159-.292a.873.873 0 0 0-.52-1.255l-.319-.094c-1.79-.527-1.79-3.065 0-3.592l.319-.094a.873.873 0 0 0 .52-1.255l-.16-.292c-.892-1.64.902-3.433 2.541-2.54l.292.159a.873.873 0 0 0 1.255-.52l.094-.319z" /> -->
<!--                         <path fill-rule="evenodd" -->
<!-- 							d="M8 5.754a2.246 2.246 0 1 0 0 4.492 2.246 2.246 0 0 0 0-4.492zM4.754 8a3.246 3.246 0 1 1 6.492 0 3.246 3.246 0 0 1-6.492 0z" /> -->
<!--                     </svg></a> -->
			</div>
		</div>
	</header>
		    <script src="https://kit.fontawesome.com/d6c1e36c40.js" crossorigin="anonymous"></script>
	
</body>
</html>