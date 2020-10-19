<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.admins.model.*"%>

<%
String admin_id_s = (String)session.getAttribute("admin_id_s");
%>

<html>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<meta charset="UTF-8">
<title>修改密碼</title>
<!-- BOOSTRAP CSS-->
<link href="<%=request.getContextPath()%>/css/sb-admin-2.min.css" rel="stylesheet">
<style type="text/css">
        #confirm {
            color: #fff;
            background-color: #8dc9cc;
            border-color: #8dc9cc;
        }

        #login:hover {
            color: #fff;
            background-color: #2ab1b8;
            border-color: ##22c1c9;
        }

        . #login:focus, #login.focus {
            color: #fff;
            background-color: #2ab1b8;
            border-color: #22c1c9;
            box-shadow: 0 0 0 0.2rem rgba(78, 115, 223, 0.25);
        }

        #login.disabled, #login:disabled {
            color: #fff;
            background-color: #8dc9cc;
            border-color: #8dc9cc;
        }

        #login:not (:disabled):not (.disabled):active, #login:not (:disabled):not (.disabled).active, .show>#login.dropdown-toggle {
            color: #fff;
            background-color: #2ab1b8;
            border-color: #22c1c9;
        }

        #login:not (:disabled):not (.disabled):active:focus, #login:not (:disabled):not (.disabled).active:focus, .show>#login.dropdown-toggle:focus {
            box-shadow: 0 0 0 0.2rem rgba(78, 115, 223, 0.25);
        }
</style>
</head>

<body style="background-color: #222222">
    <div class="container">
        <!-- Outer Row -->
        <div class="row justify-content-center">
            <div class="col-xl-10 col-lg-12 col-md-9">
                <div class="card  border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">嘿！你來了</h1>
                                        <h5 class="h5 text-gray-700 mb-4">一修改密碼 保護你我 一</h5>
                                    </div>
                                    <form method="post" action="<%=request.getContextPath()%>/back-end/admin/admins.do" class="user">
                                        <%-- 錯誤表列 --%>
                                        <c:if test="${not empty errorMsgs}">
                                            <font style="color: red">請修正以下錯誤:</font>
                                            <ul>
                                                <c:forEach var="message" items="${errorMsgs}">
                                                    <li style="color: red">${message}</li>
                                                </c:forEach>
                                            </ul>
                                        </c:if>
                                        
                                        <%-- 正確表列 --%>
                                        <c:if test="${not empty rightMsgs}">
                                            <ul>
                                                <c:forEach var="r_message" items="${rightMsgs}">
                                                    <li style="color: blue">${r_message}</li>
                                                </c:forEach>
                                            </ul>
                                        </c:if>
                                        <span id="word"></span>
                                        <div class="form-group">
                                            <input type="text" name="pswd" class="form-control form-control-user" id="exampleInputAccount" aria-describedby="accountHelp" placeholder="請輸入新密碼...">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" name="pswd_again" class="form-control form-control-user" id="exampleInputPassword" placeholder="確認密碼">
                                        </div>       
                                        <input type="hidden" name="action" value="update_pswd"> 
                                        <input type="hidden" name="admin_id" value="<%=admin_id_s%>">
                                        <input type="submit" value="確認" class="btn btn-user btn-block" id="confirm" />
                                    </form>                                    
                                    <hr>
                                    <div class="text-center">
                                        <a href="<%=request.getContextPath()%>/back-end/login/login.jsp"><img src="<%=request.getContextPath()%>/images/login/logo2.png" width="150 px" height="50px"></a>
                                    </div>                                   
                                </div>
                            </div>
                            <div class="col-lg-6 d-none d-lg-block" style="background-color: #222222"><img src= "<%=request.getContextPath()%>/images/login/logo.png" width="456 px" height="500px"></div>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- js-->
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>    
</body>

</html>