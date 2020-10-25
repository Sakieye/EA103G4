<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.admins.model.*"%>
<html>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="0">
<meta charset="UTF-8">
<title>登入</title>
<!-- BOOSTRAP CSS-->
<link href="<%=request.getContextPath()%>/css/sb-admin-2.min.css" rel="stylesheet">
<style type="text/css">
        #login {
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
                            <div class="col-lg-6 d-none d-lg-block" style="background-color: #222222"><img src= "<%=request.getContextPath()%>/images/login/logo.png" width="456 px" height="500px"></div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">嘿! 部客俠</h1>
                                        <h6 class="h6 text-gray-700 mb-4">－歡迎回家－</h6>
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
                                        <div class="form-group">
                                            <input type="text" name="admin_id" class="form-control form-control-user" id="exampleInputAccount" aria-describedby="accountHelp" placeholder="請輸入帳號..." required>
                                        </div>
                                        <div class="form-group">
                                            <input type="password" name="admin_pswd" class="form-control form-control-user" id="exampleInputPassword" placeholder="密碼" required>
                                        </div>
                                        <input type="hidden" name="action" value="login">
                                        <input type="submit" value="登入" class="btn btn-user btn-block" id="login">
                                    </form>
                                    <hr>
                                    <div class="text-center">
                                        <p class="m-0">2020 &copy; Bookshop admin</p>
                                    </div>
                                    <div>
                                        <img style="cursor: pointer" id="button" src="<%=request.getContextPath()%>/images/login/8.png" height="60px" width="60px" align="right">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- js-->
    <script src="<%=request.getContextPath()%>/js/sb-admin-2.min.js"></script>
    <script type="text/javascript">
  
        var button = document.getElementById("button");
        var exampleInputAccount = document
            .getElementById("exampleInputAccount");
        var exampleInputPassword = document
            .getElementById("exampleInputPassword");
        button.addEventListener("click", function(e) {
            e.preventDefault();
            exampleInputAccount.value = "ADM0007";
            exampleInputPassword.value = "000000";
        });

    </script>
</body>

</html>