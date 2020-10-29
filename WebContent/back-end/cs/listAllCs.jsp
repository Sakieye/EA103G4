<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.cs.model.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<title>客服訊息</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<%--     <link rel="stylesheet" href="<%=request.getContextPath()%>/css/backcs.css"> --%>
<style>
	table th,td{
         font-size: 12px;
         font-family: "Helvetica", "Arial","LiHei Pro","黑體-繁","微軟正黑體", sans-serif;
         text-align: center;
      }
     
  label{
  	font-size: 12px;
    font-family: "Helvetica", "Arial","LiHei Pro","黑體-繁","微軟正黑體", sans-serif;
  }
  h4 {
    color: blue;
    display: inline;
  }

  table {
	width: 800px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
  }
  span {
  	color: red;
  	font-weight:bold;  	
  }
  .ellipsis {
	overflow:hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
  }
  .modal-body {
  	text-align: left;
  }
</style>
</head>
<body>
	
	<div class="mem-info">
				<div class="container">
					<div class="row">
								<c:if test="${not empty errorMsgs}">
									<font style="color: red">請修正以下錯誤:</font>
										<ul>
											<c:forEach var="messages" items="${errorMsgs}">
												<li style="color: red">${messages}</li>
											</c:forEach>
										</ul>
								</c:if>
								
								<table class="table table-hover ">
									<thead>
										<tr>
											<%
												CsService csSvc =new CsService();
												List<CsVO> list = csSvc.getAll();
												pageContext.setAttribute("list",list);
																			
											%>
											<th>編號</th>						
											<th>信箱</th>
											<th>電話</th>
											<th>主旨</th>
											<th>寄信時間</th>
											<th>狀態</th>
											<th>詳情</th>
											<th>回覆</th>
											<th>刪除</th>						
										</tr>
									</thead>
									
									<%@ include file="page1.file" %> 
									<tbody>
										<c:forEach var="csVO" items="${list}" varStatus="update" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
											<tr>																		
												<td>${csVO.cs_ID}</td>
												<td>${csVO.cs_Email}</td>
												<td>${csVO.cs_Tel}</td>
												<td class="ellipsis">${csVO.cs_Subject}</td>
												<td><fmt:formatDate value='${csVO.cs_Time}' pattern='yyyy-MM-dd HH:mm'/></td>
												<td>${csVO.cs_isSend eq 0 ? "尚未回覆":"已回覆"}</td>
												<td>
													<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#Test${update.index}">詳情</button>
													<!-- Modal -->
												      <div class="modal fade" id="Test${update.index}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
												        <div class="modal-dialog" role="document">
												          <div class="modal-content">
												            <div class="modal-header">
												              <h5 class="modal-title" id="exampleModalLabel">詳細資訊</h5>
												              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
												                <span aria-hidden="true">&times;</span>
												              </button>
												            </div>
												            <div class="modal-body">										           
												                <p>
												                  <label for="contact-name" class="conteac-names">信箱:<br><span>${csVO.cs_Email}</span></label>										                  
												                </p>
												                <p>
												                  <label for="contact-tel" class="conteac-names">電話:<br><span>${csVO.cs_Tel}</span></label>										                
												                </p>
												                <p>
												                  <label for="contact-tel" class="conteac-names">主旨:<br><span>${csVO.cs_Subject}</span></label>										                
												                </p>										                
												                <p>
												                  <label for="contace-message">留言:</label>
												                  <br>
												                  <textarea name="messages" rows="10" cols="60"  readonly="readonly">${csVO.cs_Message}</textarea>
												                </p>            
												            </div>
												            <div  class="modal-footer">
												              <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
												            </div>
												          </div>
												        </div>
												      </div>	
												</td>
												<td>
												  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/emp/emp.do" style="margin-bottom: 0px;">
												     <input type="submit" value="回復">
												     <input type="hidden" name="empno"  value="${empVO.empno}">
												     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
												</td>
												<td>
												  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/CsServlet" style="margin-bottom: 0px;">
												     <input type="submit" class="btn btn-secondary" value="刪除">
												     <input type="hidden" name="cs_ID"  value="${csVO.cs_ID}">
												     <input type="hidden" name="action" value="deleteCs"></FORM>
												</td>					
											</tr>
											 									
										</c:forEach>
									</tbody>								            
								</table>
							<%@ include file="page2.file" %>
				</div> 
			</div>
		 </div>
		    


	<script>
	$(function(){
	    var len = 10; // 超過10個字以"..."取代
	    $(".ellipsis").each(function(i){
	        if($(this).text().length>len){
	            $(this).attr("title",$(this).text());
	            var text=$(this).text().substring(0,len-1)+"...";
	            $(this).text(text);
	        }
	    });
	});
	</script>	
</body>
</html>