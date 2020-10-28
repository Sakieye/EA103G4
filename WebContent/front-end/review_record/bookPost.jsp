<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.rev.model.*"%>
<%@ page import="java.util.*"%>

<% 
RevService revSvc = new RevService();
String bookId = (String)request.getAttribute("bookID");
// String bookId = "B00000000001";
List<RevVO> list = revSvc.getByBookId(bookId);
pageContext.setAttribute("list", list);

pageContext.setAttribute("bookId", bookId);
%>
<jsp:useBean id="memSvc" scope="page" class="com.mem.model.MemService"/>

<!DOCTYPE html>
<html lang="zh-Hant">
<head>


<!-- <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> -->

<meta charset="UTF-8">
<title>BOOKSHOP部客匣</title>

<style>
 #pushRev:hover{
 	background-color: black;
 }
 .myBtn2{
 	color: white !important;
 }
</style>



</head>
<body>
<!-- 	<div class="star-ratings-css"> -->
<%-- 	  <div class="star-ratings-css-top" style="width: ${revSvc2.getRatingAvg(bookId)*100}%"><span>★</span><span>★</span><span>★</span><span>★</span><span>★</span></div> --%>
<%-- 	  <div class="star-ratings-css-bottom"><span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>&nbsp;&nbsp;<fmt:formatNumber type="number" value="${revSvc2.getRatingAvg(bookId)*5}" maxFractionDigits="1"/>/5</div> --%>
<!-- 	</div> -->
	 <!-- From -->
	 <div class="comments-app" ng-app="commentsApp" ng-controller="CommentsController as cmntCtrl">
        <c:if test="${sessionScope.memVO.mem_id != null}">
	        <div class="comment-form" >
	            <!-- Comment Avatar -->
	            <div class="comment-avatar">
	                <img src="<%=request.getContextPath()%>/mem/MemPic?mem_id=${sessionScope.memVO.mem_id}">
	            </div>
	            <div  class="form" id="form">  
<%-- 	           <form class="form" METHOD="post" ACTION="<%=request.getContextPath()%>/rev/rev.do" > --%>
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
	                	<input type="hidden" name="book_id" value="${bookId}">
						<input type="hidden" id="memId" name="mem_id" value="${sessionScope.memVO.mem_id}">
						<input type="hidden" name="action" value="insert">
	                    <input type="submit" id="pushRev" value="Add Comment">
	                </div>
	             </div>
    			</div>
    			
	          </c:if>
	        </div>
	<div class="comments-app appdiv" ng-app="commentsApp" ng-controller="CommentsController as cmntCtrl">
       
<!-- 	            </form> -->
					<c:forEach var="revVO" items="${list}" varStatus="revNO">
				        <div class="comments">
			<!-- 	            Comment -->
				            <div class="comment">
			<!-- 	                Comment Avatar -->
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
			<!-- 		                Comment Box -->
					            <c:if test="${ revVO.rev_status == 0 }" >
					                <div class="comment-box" id="box${revNO.index}"> 
					                <c:if test="${ revVO.rating != 0 }" >
					                	<c:forEach var="i" begin="1" end="${revVO.rating}" varStatus="loop">
								           		⭐
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
					                    		<input type="hidden" name="mem_id" value="${revVO.mem_id}">
								      			<input type="hidden" name="rev_id" value="${revVO.rev_id}">
					                    		<button type="button" class="btn btn-link myBtn" id="btn${revNO.index}">檢舉</button>
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
<%-- 							<div class="modal fade" id="exampleModalCenter${revNO.index}" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true"> --%>
<!-- 							  <div class="modal-dialog modal-dialog-centered modal-lg" role="document"> -->
<!-- 							    <div class="modal-content"> -->
<!-- 							      <div class="modal-header"> -->
<%-- 							        <h5 class="modal-title" id="exampleModalCenterTitle" style="font-weight: 700;">你跟${memSvc.getOneMem(revVO.mem_id).mem_name}不對盤嗎?有話好好說</h5> --%>
<!-- 							        <button type="button" class="close" data-dismiss="modal" aria-label="Close"> -->
<!-- 							          <span aria-hidden="true">&times;</span> -->
<!-- 							        </button> -->
<!-- 							      </div> -->
<%-- <%-- 							      <form METHOD="post" ACTION="<%=request.getContextPath()%>/rev/revreport.do"> --%> 
<!-- 									<div id="reportForm"> -->
<!-- 								      <div class="modal-body"> -->
<!-- 								      	<table class="table"> -->
<!-- 								      		<tr> -->
<!-- 								      			<th scope="col" style="width: 270px;"><h5 style="width: 300px; margin-right:0;">你可以偷偷跟我說</h5></th> -->
<!-- 								      			<td><input type="text" name="rev_rep_reason" style="color: black; font-weight: 700; border-radius: 20px;"></td>      			 -->
<!-- 								      		</tr> -->
<!-- 								      	</table> -->
<!-- 								      </div> -->
<!-- 								      <div class="modal-footer"> -->
								      
<%-- 								      	<input type="hidden" name="bookId" value="${bookId}"> --%>
<!-- 										<input type="hidden" name="action" value="insert"> -->
<!-- 										<button type="submit" class="btn btn-secondary myBtn2">Submit</button> -->
<!-- 								        <button type="button" class="btn btn-secondary myBtn2" data-dismiss="modal">Close</button> -->
<!-- 								      </div> -->
<!-- 								    </div> -->
<!-- <!-- 								  </form> --> 
<!-- 							    </div> -->
<!-- 							  </div> -->
<!-- 							</div> -->
					<!-- madal -->
			        </c:forEach>
	            </div>
    
    <script>
    $(document).ready(function() {
    	
    	$("#pushRev").click(function(){ 
    		  
    		swal({
      		    title: "確定要發佈嗎",
      		  	type: "warning",
		      	buttons: true,
		      	dangerMode: true

      		}).then(function(isConfirm) {
      			if(isConfirm){
           			$.ajax({
                         type: "POST",
                         url: '${pageContext.request.contextPath}/rev/rev.do?action=insert',
                         data : {
                             "memId": $("#form").find('input[name = "mem_id"]').val(),
                             "revContent": $("#form").find('textarea').val(),
                             "bookId": $("#form").find('input[name = "book_id"]').val(),
                             "rating": $("#form").find('input[name = "rating"]:checked').val()
                         },
                         success: function(data) {
                             var star;
                             
                             swal(
                             	'感謝您的發佈！'
                             ); 

                             var object = JSON.parse(data);
                             var comments = document.createElement('div');
                             comments.classList.add('comments');
                             var comment = document.createElement('div');
                             comments.classList.add('comment');
                             var str ='';
                             if (object.rating != 0) {
                                 for (let i = 0; i < object.rating; i++) {
                                 	str = str + "&#11088;";
                               }
                             }
                             comment.innerHTML = 
                            '<div class="comment-avatar">'
                            + ' <img src="${pageContext.request.contextPath}/mem/MemPic?mem_id=' + object.mem_id +'"/>'
                            + '</div>'
                            + '<div class="comment-box">'
                            
                            + str
                            + '<div class="comment-text">' + object.rev_content + '</div>'
                            + '<div class="comment-footer">'
                            + '<div class="comment-info">'
                            + '<span class="comment-author">' + object.mem_name + '</span>'
                            + '<span class="comment-date">' + object.timeForJson + '</span>'
                            + '</div>'
                            + '</div>'
                            + '</div>';                                                                      
                              
            	                comments.append(comment);
                             $('.appdiv').prepend(comments);
                         },
                         error:function(XMLHttpRequest, textStatus, errorThrown) {
                        	swal(
                            	'請確認填寫，並重新發佈！'
                           ); 
                         }
                     });
      			}
      			
      		}, function(dismiss) {
     
      		  if (dismiss === 'cancel') {
      		    swal(
      		      '已取消！',
      		      'error'
      		    ); 
      		  }
      		});
    	});
       	for(let i=0; i<${list.size()}; i++ ){
	    	$('#btn' + i).click(function(){
	    		console.log(i);
	       		swal({
	       		    title: "請輸入檢舉原因",
	       		    icon: 'info',
	       		  	content: "input",
	       		  	buttons: {
	       		  		cancel: {
	 	      		        text: "取消",
	 	      		        visible: true
	       		      	},
	       		      	confirm: {
	 	      		        text: "確定",
	 	      		        visible: true
	       		      	}
	       		  	}
	       		 
	       		}).then(function(reason) {
	       			if(reason == ""){
	 	      			swal(
	 	                	'請輸入檢舉原因'
	 	                );
	 	      			return;
	       			} else if (reason != "" && reason != null){
	       				$.ajax({
	                         type: "POST",
	                         url: '${pageContext.request.contextPath}/rev/revreport.do?action=insert',
	                         data : {
	                        	 "reason": reason,
	                             "memId": $('#box' + i).find('input[name = "mem_id"]').val(),
	                             "revId": $('#box' + i).find('input[name = "rev_id"]').val(),
	                         },
	                         success: function(data) {
	                        	 swal({
	                                tital:'檢舉成功,我們會盡快幫您審核',
	                                icon:'success'
	                             }); 
	                         },
	                         error:function(XMLHttpRequest, textStatus, errorThrown) {
	                        	swal(
	                        		'檢舉失敗',
	                        		'warning'
	                        	); 
	                         }
	                    });
	       			}
	       			
	       		});
	   		});  
       	}
    })
    </script>
	
</body>
</html>