<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.admins.model.*"%>
<%@ page import="com.adminpermission.model.*"%>
<%@ page import="com.permissiondelimit.model.*"%>

<%
    List<AdminPermissionVO> adminpermissionVO = (List<AdminPermissionVO>) request
            .getAttribute("adminpermissionVO"); 
%>

<%
    AdminsVO adminsVO = (AdminsVO) request.getAttribute("adminsVO"); 
%>

<%
    List<PermissionDelimitVO> permissiondelimitVO = (List<PermissionDelimitVO>) request
            .getAttribute("permissiondelimitVO"); 
%>

<%
    List<PermissionDelimitVO> permissiondelimitVO2 = (List<PermissionDelimitVO>) session
            .getAttribute("permissiondelimitVO2"); 
%>

<link rel="stylesheet"
    href="<%=request.getContextPath()%>/css/main-back.css" />
<link rel="stylesheet"
    href="<%=request.getContextPath()%>/css/bootstrap.min.css" />

<nav id="left" class="column">
    <div id="controlbar" class="position-fixed">
        <div>
            <br>
            <h5><b>&nbsp;書城<span>Bookshop</span></b></h5>
            <ul>
                <li>&nbsp;&nbsp;
                        <form style="margin: 0px; display: inline" method="GET"
                            action="<%=request.getContextPath()%>/BookManagementIndex">

                            <span class="auth2"><label style="cursor: pointer"><font
                                    color="blue">商品管理</font> <input type="submit" class="authlist"
                                    style="display: none"></label></span>
                        </form>
                    </li>
                
                <li>&nbsp;&nbsp;
                        <form style="margin: 0px; display: inline" method="GET"
                            action="">

                            <span class="auth2"><label style="cursor: pointer"><font
                                    color="blue">訂單管理</font> <input type="submit" class="authlist"
                                    style="display: none"></label></span>
                        </form>
                    </li>
               <li>&nbsp;&nbsp;
                        <form style="margin: 0px; display: inline" method="GET"
                            action="">

                            <span class="auth2"><label style="cursor: pointer"><font
                                    color="blue">二手書訂單管理</font> <input type="submit" class="authlist"
                                    style="display: none"></label></span>
                        </form>
                    </li>
            </ul>
        </div>
        <div>
            <h5><b>&nbsp;講座<span>Lecture</span></b></h5>
            <ul>
                <li>&nbsp;&nbsp;
                        <form style="margin: 0px; display: inline" method="GET"
                            action="">

                            <span class="auth2"><label style="cursor: pointer"><font
                                    color="blue">講座管理</font> <input type="submit" class="authlist"
                                    style="display: none"></label></span>
                        </form>
                    </li>
            </ul>
        </div>
        <div>
            <h5><b>&nbsp;討論區<span>Forum</span></b></h5>
            <ul>
                <li>&nbsp;&nbsp;
                        <form style="margin: 0px; display: inline" method="GET"
                            action="">

                            <span class="auth2"><label style="cursor: pointer"><font
                                    color="blue">討論區管理</font> <input type="submit" class="authlist"
                                    style="display: none"></label></span>
                        </form>
                    </li>
                <li>&nbsp;&nbsp;
                        <form style="margin: 0px; display: inline" method="GET"
                            action="">

                            <span class="auth2"><label style="cursor: pointer"><font
                                    color="blue">討論區檢舉管理</font> <input type="submit"
                                    class="authlist" style="display: none"></label></span>
                        </form>
                    </li>
            </ul>
        </div>
        <div>
            <h5><b>&nbsp;讀書會<span>Book Club</span></b></h5>
            <ul>
                <li>&nbsp;&nbsp;
                        <form style="margin: 0px; display: inline" method="GET"
                            action="<%=request.getContextPath()%>/back-end/bookclub_report/listAllBookClub_Report.jsp">

                            <span class="auth2"><label style="cursor: pointer"><font
                                    color="blue">讀書會檢舉管理</font> <input type="submit"
                                    class="authlist" style="display: none"></label></span>
                        </form>
                    </li>
            </ul>
        </div>
        <div>
            <h5><b>&nbsp;管理<span>Manegement</span></b></h5>
            <ul>
                <li>&nbsp;&nbsp;
                        <form style="margin: 0px; display: inline" method="GET"
                            action="<%=request.getContextPath()%>/back-end/member/listAllMem.jsp">

                            <span class="auth2"><label style="cursor: pointer"><font
                                    color="blue">會員管理</font> <input type="submit" class="authlist"
                                    style="display: none"></label></span>
                        </form>
                    </li>
                <li>&nbsp;&nbsp;
                        <form style="margin: 0px; display: inline" method="post"
                            action="<%=request.getContextPath()%>/back-end/admins/listAllAdmins.jsp">

                            <span class="auth2"><label style="cursor: pointer"><font
                                    color="blue">員工管理</font> <input type="submit" class="authlist"
                                    style="display: none"></label></span>
                        </form>
                    </li>
                    <li>&nbsp;&nbsp;
                        <form style="margin: 0px; display: inline" method="GET"
                            action="<%=request.getContextPath()%>/MarketingManagementIndex">

                            <span class="auth2"><label style="cursor: pointer"><font
                                    color="blue">行銷管理</font> <input type="submit" class="authlist"
                                    style="display: none"></label></span>
                        </form>
                    </li>
            </ul>
        </div>
        <div>
            <h5><b>&nbsp;客服<span>Customer Service</span></b></h5>
            <ul>
                <li>&nbsp;&nbsp;
                        <form style="margin: 0px; display: inline" method="GET"
                            action="">

                            <span class="auth2"><label style="cursor: pointer"><font
                                    color="blue">
                                    客服回覆</font> <input type="submit" class="authlist"
                                    style="display: none"></label></span>
                        </form>
                    </li>
            </ul>
        </div>
    </div>
</nav>

<div id="auth" style="display:none">
        <c:forEach var="permissiondelimitVO2" items="${permissiondelimitVO2}">
            <span class="auth">${permissiondelimitVO2.per_name}</span>
            <br>
        </c:forEach>
    </div>

    <script>
        var auth = document.getElementsByClassName("auth");

        var arr1 = [];
        for (let i = 0; i < auth.length; i++) {
            var x = auth[i].innerText;
            arr1.push(x);
        }

        console.log(arr1);

        var auth2 = document.getElementsByClassName("auth2");

        var arr2 = [];
        for (let i = 0; i < auth2.length; i++) {
            var x = auth2[i].innerText;
            arr2.push(x);
        }

        console.log(arr2);

        var authlist = document.getElementsByClassName("authlist");

        for (let i = 0; i < arr2.length; i++) {
            var allow = true;
            for (let j = 0; j < arr1.length; j++) {
                if (arr2[i] === arr1[j]) {
                    allow = false;
                    break;
                }
            }
            if (allow) {
                authlist[i].disabled = true;
                auth2[i].style.background ='black';




            }
        }
    </script>
