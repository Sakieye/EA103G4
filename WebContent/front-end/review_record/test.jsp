<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.rev.model.*"%>
<%@ page import="java.util.*"%>

<% 
	RevService revSvc = new RevService();
    List<RevVO> list = revSvc.getByBookId("B00000000001");
    pageContext.setAttribute("list", list);
    String bookId = "B00000000001";
    pageContext.setAttribute("bookId", bookId);
%>
<jsp:useBean id="memSvc" scope="page" class="com.mem.model.MemService"/>
<jsp:useBean id="revSvc2" scope="page" class="com.rev.model.RevService"/>
<!DOCTYPE html>
<html>
<head>
<title>BOOKSHOP部客匣</title>

<link rel="stylesheet" href="<%= request.getContextPath()%>/css/main-front.css" />
<link rel="stylesheet" href="<%= request.getContextPath()%>/css/header.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/jquery.datetimepicker.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/rev.css">




</head>
<body>
	<h1>${revSvc2.getRatingAvg(bookId)}</h1>
	<div class="star-ratings-css">
	  <div class="star-ratings-css-top" style="width: ${revSvc2.getRatingAvg(bookId)*100}%"><span>★</span><span>★</span><span>★</span><span>★</span><span>★</span></div>
	  <div class="star-ratings-css-bottom"><span>★</span><span>★</span><span>★</span><span>★</span><span>★</span></div>
	</div>
	<div class="comments-app" ng-app="commentsApp" ng-controller="CommentsController as cmntCtrl">
	
        <!-- From -->
        <c:if test="${sessionScope.memVO.mem_id != null}">
	        <div class="comment-form" >
	            <!-- Comment Avatar -->
	            <div class="comment-avatar">
	                <img src="<%=request.getContextPath()%>/mem/MemPic?mem_id=${sessionScope.memVO.mem_id}">
	            </div>
	            <div class="form" id="form">  
<%-- 	            METHOD="post" ACTION="<%=request.getContextPath()%>/rev/rev.do" --%>
	                <div class="form-row">
	                    <textarea class="input" name="rev_content" placeholder="寫書評..." required></textarea>
	                </div>
	      			<div class="rate">
					    <div class="star-rating">
					      <input id="star-5" type="radio" name="rating" value="5" />
					      <label for="star-5" title="5 stars">
					        <i class="active fa fa-star" aria-hidden="true"></i>
					      </label>
					      <input id="star-4" type="radio" name="rating" value="4" />
					      <label for="star-4" title="4 stars">
					        <i class="active fa fa-star" aria-hidden="true"></i>
					      </label>
					      <input id="star-3" type="radio" name="rating" value="3" />
					      <label for="star-3" title="3 stars">
					        <i class="active fa fa-star" aria-hidden="true"></i>
					      </label>
					      <input id="star-2" type="radio" name="rating" value="2" />
					      <label for="star-2" title="2 stars">
					        <i class="active fa fa-star" aria-hidden="true"></i>
					      </label>
					      <input id="star-1" type="radio" name="rating" value="1" />
					      <label for="star-1" title="1 star">
					        <i class="active fa fa-star" aria-hidden="true"></i>
					      </label>
					    </div>
					</div>
	                <div class="form-row">
	                	<input type="hidden" name="book_id" value="B00000000001">
						<input type="hidden" name="mem_id" value="${sessionScope.memVO.mem_id}">
						<input type="hidden" name="action" value="insert">
	                    <input type="submit" id="pushRev" value="Add Comment">
	                </div>
	            </div>
	        </div>
        </c:if>
        <!-- Comments List -->
        <%@ include file="page1.file" %>
        <c:forEach var="revVO" items="${list}" varStatus="revNO" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
	        <div class="comments" style="width: 700px;">
	            <!-- Comment -->
	            <div class="comment">
	                <!-- Comment Avatar -->
	                <c:if test="${ revVO.rev_status == 0 }" >
		                <div class="comment-avatar">
		                    <img src="<%=request.getContextPath()%>/mem/MemPic?mem_id=${revVO.mem_id}">
		                </div>
	                </c:if>
	                <c:if test="${ revVO.rev_status == 1 }" >
	                	<div class="comment-avatar">
		                    <img src="<%=request.getContextPath()%>/BookShopLogo/3.png">
		                </div>
	                </c:if>
		                <!-- Comment Box -->
		            <c:if test="${ revVO.rev_status == 0 }" >
		                <div class="comment-box"> 
		                <c:if test="${ revVO.rating != 0 }" >
		                	<c:forEach var="i" begin="1" end="${revVO.rating}" varStatus="loop">
					            	<font  size="1">⭐</font>
					        </c:forEach>
		                </c:if>
		                    <div class="comment-text">${revVO.rev_content}</div>
		                    <div class="comment-footer">
		                        <div class="comment-info">
		                            <span class="comment-author">
		                                ${memSvc.getOneMem(revVO.mem_id).mem_name}       
		                            </span>
		                            <span class="comment-date"><fmt:formatDate value="${revVO.rev_date}" pattern="MMMM d, yyyy, HH:mm" /></span>
		                        </div>
		                    </div>
		                    <c:if test="${sessionScope.memVO.mem_id != null}">
		                    	<c:if test="${sessionScope.memVO.mem_id != revVO.mem_id}">
		                    		<button type="submit" class="btn btn-link myBtn" data-toggle="modal" data-target="#exampleModalCenter${revNO.index}">檢舉</button>
		                    	</c:if>
		                    </c:if>
		                </div>
	                </c:if>
	                <c:if test="${ revVO.rev_status == 1 }" >
	                	<div class="comment-box"> 
		                    <div class="comment-text">此評論因內容不妥，已被刪除</div>
		                    <div class="comment-footer">
		                        <div class="comment-info">
		                            <span class="comment-author">
		                               	 我愛BOOKSHOP       
		                            </span>
		                        </div>
		                    </div>
		                </div>
	                </c:if>
	            </div>
	        </div>
	         <!-- Modal -->
				<div class="modal fade" id="exampleModalCenter${revNO.index}" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
				  <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="exampleModalCenterTitle" style="font-weight: 700;">你看${memSvc.getOneMem(revVO.mem_id).mem_name}不爽嗎?</h5>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				      <form METHOD="post" ACTION="<%=request.getContextPath()%>/rev/revreport.do">
					      <div class="modal-body">
					      	<table class="table">
					      		<tr>
					      			<th scope="col" style="width: 270px;"><h3 style="width: 300px; margin-right:0;">你總該跟我說原因吧?</h3></th>
					      			<td><input type="text" name="rev_rep_reason" style="color: black; font-weight: 700; border-radius: 20px;"></td>
					      		</tr>
					      	</table>
					      </div>
					      <div class="modal-footer">
					      	<input type="hidden" name="mem_id" value="${revVO.mem_id}">
					      	<input type="hidden" name="rev_id" value="${revVO.rev_id}">
							<input type="hidden" name="action" value="insert">
							<button type="submit" class="btn btn-secondary">Submit</button>
					        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
					      </div>
					  </form>
				    </div>
				  </div>
				</div>
		<!-- madal -->
        </c:forEach>
        <%@ include file="page2.file" %>
    </div>
	
	
	<script src='<%= request.getContextPath()%>/js/jquery.min.js'></script>
    <script src="<%= request.getContextPath()%>/js/jquery.scrollex.min.js"></script>
    <script src="<%= request.getContextPath()%>/js/skel.min.js"></script>
    <script src="<%= request.getContextPath()%>/js/util.js"></script>
    <script src="<%= request.getContextPath()%>/js/main.js"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js"></script>
    
    <script>
    $(document).ready(function(){
//     	$.ajax({
// 			type:"POST",
<%-- 			url:"<%=request.getContextPath()%>/rev/rev.do?action=insert", --%>
// 			data:{
// 				"memId":$("#form").find('input[name = "mem_id"]').val(),
// 				"revContent" :$("#form").find('textarea[name = "rev_content"]').text(),
// 				"bookId" :$("#form").find('input[name = "book_id"]').val(),
// 				"rating" :$("#form").find('input[name = "rating"]').val()
// 			},
// 			success:function(){
// 				alert("good");
// 			}
// 		})
		
		$("#pushRev").click(function(){
			$.post(
					"<%=request.getContextPath()%>/rev/rev.do?action=insert", 
					{
						"memId":$("#form").find('input[name = "mem_id"]').val(),
						"revContent" :$("#form").find('textarea').val(),
						"bookId" :$("#form").find('input[name = "book_id"]').val(),
						"rating" :$("#form").find('input[name = "rating"]').val(),		
					}
					
			)
			
		})
    })
    </script>
	
</body>
</html>