<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>




<nav id="left" class="column">
    <div id="controlbar" class="position-fixed">
        <div>
            <br>
            <h5><b>&nbsp;書城<span>Bookshop</span></b></h5>
            <ul>
                <li>&nbsp;&nbsp;<a href="<%=request.getContextPath()%>/BookManagementIndex" class="service">商品管理</a></li>
                <li>&nbsp;&nbsp;<a href="" class="service">訂單管理</a></li>
            </ul>
        </div>
        <div>
            <h5><b>&nbsp;講座<span>Lecture</span></b></h5>
            <ul>
                <li>&nbsp;&nbsp;<a href="" class="service">講座管理</a></li>
            </ul>
        </div>
        <div>
            <h5><b>&nbsp;討論區<span>Forum</span></b></h5>
            <ul>
                <li>&nbsp;&nbsp;<a href="<%=request.getContextPath()%>/back-end/forum/forumBack_forums.jsp" class="service">討論區檢舉管理</a></li>
            </ul>
        </div>
        <div>
            <h5><b>&nbsp;讀書會<span>Book Club</span></b></h5>
            <ul>
                <li>&nbsp;&nbsp;<a href="<%=request.getContextPath()%>/back-end/bookclub_report/listAllBookClub_Report.jsp" class="service">讀書會檢舉管理</a></li>
            </ul>
        </div>
        <div>
            <h5><b>&nbsp;管理<span>Manegement</span></b></h5>
            <ul>
                <li>&nbsp;&nbsp;<a href="<%=request.getContextPath()%>/back-end/member/listAllMem.jsp" class="service">會員管理</a></li>
                <li>&nbsp;&nbsp;<a href="<%=request.getContextPath()%>/back-end/admins/listAllAdmins.jsp" class="service">員工管理</a></li>
                <li>&nbsp;&nbsp;<a href="<%=request.getContextPath()%>/MarketingManagementIndex" class="service">行銷管理</a></li>
            </ul>
        </div>
        <div>
            <h5><b>&nbsp;客服<span>Customer Service</span></b></h5>
            <ul>
                <li>&nbsp;&nbsp;<a href="" class="service">客服回覆</a></li>
            </ul>
        </div>
    </div>
</nav>
