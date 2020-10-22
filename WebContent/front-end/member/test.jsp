<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.rev.model.*"%>
<%@ page import="java.util.*"%>

<% 
	RevService revSvc = new RevService();
    List<RevVO> list = revSvc.getByBookId("B00000000001");
    pageContext.setAttribute("list", list);
%>
<jsp:useBean id="memSvc" scope="page" class="com.mem.model.MemService"/>
<!DOCTYPE html>
<html>
<head>
<title>BOOKSHOP部客匣</title>

<%-- <link rel="stylesheet" href="<%= request.getContextPath()%>/css/main-front.css" /> --%>
<link rel="stylesheet" href="<%= request.getContextPath()%>/css/header.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/jquery.datetimepicker.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/rev.css">


</head>
<body>
<%--       <c:forEach var="revVO" items="${list}" varStatus="revNO"> --%>
<!--       	<div class="accordion" id="accordionExample"> -->
<!-- 		  <div class="card"> -->
<!-- 		    <div class="card-header" id="headingOne"> -->
<!-- 		      <h2 class="mb-0"> -->
<%-- 		        <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseOne${revNO.index}" aria-expanded="true" aria-controls="collapseOne"> --%>
<%-- 		           ${memSvc.getOneMem(revVO.mem_id).mem_name} --%>
<%-- 		           <fmt:formatDate value="${revVO.rev_date}" pattern="yyyy-MM-dd"/> --%>
<!-- 		        </button> -->
<!-- 		      </h2> -->
<!-- 		    </div> --> 
		
<%-- 		    <div id="collapseOne${revNO.index}" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample"> --%>
<!-- 		      <div class="card-body"> -->
<%-- 		      	${revVO.rev_content} --%>
<!-- 		      </div> -->
<!-- 		    </div> -->
<!-- 		   </div> -->
<!-- 		  </div> -->
<%--       </c:forEach> --%>
	
<!-- 	<!-- Contenedor Principal --> -->
<!-- 	<div class="comments-container"> -->
<!-- 		<h1>Comentarios <a href="http://creaticode.com">creaticode.com</a></h1> -->

<!-- 		<ul id="comments-list" class="comments-list"> -->
<%-- 			<c:forEach var="revVO" items="${list}" varStatus="revNO"> --%>
<!-- 				<li> -->
<!-- 					<div class="comment-main-level"> -->
<!-- 						Avatar -->
<%-- 						<div class="comment-avatar"><img src="<%=request.getContextPath()%>/mem/MemPic?mem_id=${revVO.mem_id}" alt=""></div> --%>
<!-- 						Contenedor del Comentario -->
<!-- 						<div class="comment-box"> -->
<!-- 							<div class="comment-head"> -->
<%-- 								<h6 class="comment-name">${memSvc.getOneMem(revVO.mem_id).mem_name}</h6> --%>
<%-- 								<span><fmt:formatDate value="${revVO.rev_date}" pattern="yyyy-MM-dd"/></span> --%>
<!-- 							</div> -->
<!-- 							<div class="comment-content"> -->
<%-- 								${revVO.rev_content} --%>
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</li> -->
<%-- 			</c:forEach> --%>
<!-- 		</ul> -->
<!-- 	</div> -->

	
	<div class="comments-app" ng-app="commentsApp" ng-controller="CommentsController as cmntCtrl">
        <!-- From -->
        <div class="comment-form">
            <!-- Comment Avatar -->
            <div class="comment-avatar">
                <img src="<%=request.getContextPath()%>/mem/MemPic?mem_id=M0003">
            </div>
            <form class="form" METHOD="post" ACTION="<%=request.getContextPath()%>/rev/rev.do">
                <div class="form-row">
                    <textarea class="input" name="rev_content" placeholder="寫書評..." required></textarea>
                </div>
                <div class="form-row">
                	<input type="hidden" name="book_id" value="B00000000001">
					<input type="hidden" name="mem_id" value="${sessionScope.memVO.mem_id}">
                    <input type="submit" value="Add Comment">
                </div>
            </form>
        </div>
        <!-- Comments List -->
        <c:forEach var="revVO" items="${list}" varStatus="revNO">
	        <div class="comments">
	            <!-- Comment -->
	            <div class="comment" ng-repeat="comment in cmntCtrl.comments | orderBy: '-date'">
	                <!-- Comment Avatar -->
	                <div class="comment-avatar">
	                    <img src="<%=request.getContextPath()%>/mem/MemPic?mem_id=${revVO.mem_id}">
	                </div>
	                <!-- Comment Box -->
	                <div class="comment-box">
	                    <div class="comment-text">${revVO.rev_content}</div>
	                    <div class="comment-footer">
	                        <div class="comment-info">
	                            <span class="comment-author">
	                                ${memSvc.getOneMem(revVO.mem_id).mem_name}       
	                            </span>
	                            <span class="comment-date"><fmt:formatDate value="${revVO.rev_date}" pattern="EEEE  MMMM d  yyyy HH:mm"/></span>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
        </c:forEach>
    </div>
		
	
	
	<script src='<%= request.getContextPath()%>/js/rev.js'></script>
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
	  
    </script>
	
</body>
</html>