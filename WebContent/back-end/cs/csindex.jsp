<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.cs.model.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- 自訂css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main-back.css" />
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<title>客服信箱</title>
<style type="text/css">
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
  .mailspan {
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
  .mailbutton {
  	text-align:right;
  }	
  input[type="text"],  input[type="email"] {
    background: rgba(144, 144, 144, 0.075);
    border-color: rgba(144, 144, 144, 0.25);
    height: 2rem;
    width: 80%;
    text-align:left;
  } 
</style>
</head>

<body>
	<%@include file="/back-end/header/header.jsp"%>
	<div id="container">
		<main id="center" class="column">
			<h1>客服信箱</h1>
			<div class="mailbutton">
				<input type ="button" class="btn btn-primary" onclick="javascript:location.href='<%=request.getContextPath()%>/back-end/cs/csindex.jsp'" value="收件匣"></input>
				<input type ="button" class="btn btn-primary" onclick="javascript:location.href='<%=request.getContextPath()%>/back-end/cs/csindex.jsp'" value="寄信備份"></input>
			</div>
			<p></p>
			<hr color="black" size="3" />
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
												<%
													CsVO csVO = (CsVO) pageContext.getAttribute("csVO");
													String email[] = csVO.getCs_Email().split("@");
													String emails = email[0];
												%>
																													
												<td>${csVO.cs_ID}</td>
												<td><%=emails %></td>
												<td>${csVO.cs_Tel}</td>
												<td class="ellipsis">${csVO.cs_Subject}</td>
												<td><fmt:formatDate value='${csVO.cs_Time}' pattern='yyyy-MM-dd HH:mm'/></td>
												<td>${csVO.cs_isSend eq 0 ? "尚未回覆":"已回覆"}</td>
												<td>
													<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#csDetails${update.index}">詳情</button>
													<!-- Modal -->
													<%@ include file="csDetailsModal.jsp" %>
												</td>
												<td>
													<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#csGmail${update.index}">回覆</button>
											
												  	<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/cs/CsSendGmail.do" style="margin-bottom: 0px;">
												     <div class="modal fade" id="csGmail${update.index}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
												        <div class="modal-dialog modal-dialog-centered" role="document">
												          <div class="modal-content">
												            <div class="modal-header">
												              <h5 class="modal-title" id="exampleModalLabel">詳細資訊</h5>
												              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
												                <span aria-hidden="true">&times;</span>
												              </button>
												            </div>
												            <div class="modal-body">										           
												                <p>
												                  <label for="contact-name" class="conteac-names">收件者信箱:</label>										                  
												                  <span>*</span>
                                                                  <br><input type="email" id="cs_Email" name="cs_Email" class="cs_Email" value="${csVO.cs_Email}" readonly="readonly" required>	
												                </p>
												                <p>
												                  <label for="contact-tel" class="conteac-names">主旨:</label>
												                  <span class="mailspan">*</span>
                                                                  <br><input type="text" id="cs_Subject" name="cs_Subject" maxlength="30" required placeholder="請輸入30字以內" >											                
												                </p>										                
												                <p>
												                  <label for="contace-message">留言:</label>
												                  <br>
												                  <textarea name="cs_Message" rows="10" cols="60" required></textarea>
												                </p>            
												            </div>
												            <div  class="modal-footer">
												              <input type="submit" class="btn btn-primary" value="回覆">
												     		  <input type="hidden" name="cs_ID"  value="${csVO.cs_ID}">
												     		  <input type="hidden" name="cs_isSend"  value="${csVO.cs_isSend}">
												              <input type="hidden" name="action"	value="sendmail">	
												              <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
												            </div>
												          </div>
												        </div>
												      </div>									     

												    </FORM>
												</td>
												<td>
												  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/cs/cs.do" style="margin-bottom: 0px;">
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
		</main>
		<%@include file="/back-end/sidebar/sidebar.jsp"%> 
	</div>
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
	
	<script>
	
	//針對主旨 限縮字數
	$(function(){
	    var len = 10; //10字以上 將以...代替
	    $(".ellipsis").each(function(i){
	        if($(this).text().length>len){
	            $(this).attr("title",$(this).text());
	            var text=$(this).text().substring(0,len-1)+"...";
	            $(this).text(text);
	        }
	    });
	});
	
	//刪除前 確認是否回覆進行提示
	</script>
	

</body>

</html>