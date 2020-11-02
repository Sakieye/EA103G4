<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.permissiondelimit.model.*"%>

<%
    List<PermissionDelimitVO> permissiondelimitVO_s = (List<PermissionDelimitVO>) session.getAttribute("permissiondelimitVO_s"); 
%>

<link rel="stylesheet"
    href="<%=request.getContextPath()%>/css/main-back.css" />
<link rel="stylesheet"
    href="<%=request.getContextPath()%>/css/bootstrap.min.css" />
 <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
 
 <head>
 <style>
 .unshow{
 display:none;
 }
 .a{
 	color: black;
 }
 .li{
	padding: 5px; 
 }
 </style>
 </head>   

<nav id="left" class="column">
    <div id="controlbar" class="position-fixed">
<!--         <div class="auth"> -->
        <div>
            <br>
           <h5><b>&nbsp;<span><i class="fas fa-book"></i>&nbsp;書城 Bookshop</span></b></h5>
            <ul>         
<<<<<<< HEAD
           <li>&nbsp;&nbsp;<span class="auth2"><a href="<%=request.getContextPath()%>/BookManagementIndex">商品管理</a></span></li>   
                     
           <li>&nbsp;&nbsp;<span class="auth2"><a href="<%=request.getContextPath()%>/back-end/order/listAll_order.jsp">訂單管理</a></span></li>                 
=======
           <li class="li">&nbsp;&nbsp;<span class="auth2"><a class="a" href="<%=request.getContextPath()%>/BookManagementIndex">商品管理</a></span></li>             
           <li class="li">&nbsp;&nbsp;<span class="auth2"><a class="a" href="<%=request.getContextPath()%>/back-end/order/select_order.jsp">訂單管理</a></span></li>                 
>>>>>>> refs/heads/Joel
            </ul>
        </div>
<!--         <div class="auth"> -->
        <div>
            <h5><b>&nbsp;<span><i class="fas fa-chalkboard-teacher"></i>&nbsp;講座 Lecture</span></b></h5>         
            <ul>
            <li class="li">&nbsp;&nbsp;<span class="auth2"><a class="a" href="<%=request.getContextPath()%>/back-end/lecture/listAllLecture.jsp">講座管理</a></span></li>            
            </ul>
        </div>
<!--         <div class="auth"> -->
        <div>
            <h5><b>&nbsp;<span><i class="fas fa-comments"></i>&nbsp;討論區 Forum</span></b></h5>
            <ul>
            <li class="li">&nbsp;&nbsp;<span class="auth2"><a class="a" href="<%=request.getContextPath()%>/back-end/forum/forumBack_forums.jsp">討論區檢舉管理</a></span></li>             
            </ul>
        </div>
<!--         <div class="auth"> -->
        <div>
            <h5><b>&nbsp;<span><i class="fas fa-book-reader"></i>&nbsp;讀書會 Book Club</span></b></h5>
            <ul>           
         <li class="li">&nbsp;&nbsp;<span class="auth2"><a class="a" href="<%=request.getContextPath()%>/back-end/bookclub_report/listAllBookClub_Report.jsp">讀書會檢舉管理</a></span></li>             
            </ul>
        </div>
<!--         <div class="auth"> -->
        <div>
            <h5><b>&nbsp;<span><i class="fas fa-user-cog"></i>&nbsp;管理 Manegement</span></b></h5>
            <ul>       
         <li class="li">&nbsp;&nbsp;<span class="auth2"><a class="a" href="<%=request.getContextPath()%>/back-end/member/listAllMem.jsp">會員管理</a></span></li>                      
         <li class="li">&nbsp;&nbsp;<span class="auth2"><a class="a" href="<%=request.getContextPath()%>/back-end/admins/listAllAdmins.jsp">員工管理</a></span></li>                                          
         <li class="li">&nbsp;&nbsp;<span class="auth2"><a class="a" href="<%=request.getContextPath()%>/MarketingManagementIndex">行銷管理</a></span></li>                                 
            </ul>
        </div>
<!--         <div class="auth"> -->
        <div>
            <font size="3.5px"><b>&nbsp;<span><i class="fas fa-headset"></i>&nbsp;客服 Customer Service</span></b></font>
            <ul>           
         <li class="li">&nbsp;&nbsp;<span class="auth2"><a class="a" href="<%=request.getContextPath()%>/back-end/cs/csindex.jsp">客服回覆</a></span></li>           
            </ul>
        </div>
    </div>
</nav>

<!-- 	<div id="auth" style="display:none"> -->
<%--         <c:forEach var="permissiondelimitVO_s" items="${permissiondelimitVO_s}"> --%>
<%--             <span class="auth">${permissiondelimitVO_s.per_name}</span> --%>
<!--             <br> -->
<%--         </c:forEach> --%>
<!--     </div> -->


    <script>
//        var auth = document.getElementsByClassName("auth");
		
       	var arr1 = [];
//         for (let i = 0; i < auth.length; i++) {
//             var x = auth[i].innerText;
//             arr1.push(x);
//         }
		 <c:forEach var="permissiondelimitVO_s" items="${permissiondelimitVO_s}">
			arr1.push(`${permissiondelimitVO_s.per_name}`);
		</c:forEach>
        
		console.log(arr1);

        var auth2 = document.getElementsByClassName("auth2");

        var arr2 = [];
        
        for (let i = 0; i < auth2.length; i++) {
            var x = auth2[i].innerText;
            arr2.push(x);
        }
        console.log(arr2);
        
        for (let i = 0; i < arr2.length; i++) {
            var allow = true;
            for (let j = 0; j < arr1.length; j++) {
                if (arr2[i] === arr1[j]) {
                    allow = false;
                    break;
                }
            }
            if (allow) {
            	 auth2[i].classList.add("unshow");
            	 console.log('auth2')
            }
// 				if (allow) {
//             	 auth2[i].closest('.auth').classList.add("unshow");
//             	 console.log('auth2')
//             }
        }
    </script>
