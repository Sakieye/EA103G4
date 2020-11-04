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
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<title>客服信箱</title>
<style type="text/css">
	table th,td{
         font-size: 14px;
         font-family: "Helvetica", "Arial","LiHei Pro","黑體-繁","微軟正黑體", sans-serif;
         text-align: center;
      }
  h4 {
    color: blue;
    display: inline;
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
  
  .thcss{
  	background-color:rgba(255,255,0,0.3);
  }
  .csinput input{
		
		height: 2rem;
        width: 100%;
        background: rgba(144, 144, 144, 0.075);
        border:1px;
	}
</style>
</head>

<body>
	<%@include file="/back-end/header/header.jsp"%>
	<div id="container">
		<main id="center" class="column">
			<h1>客服信箱</h1>
			<div class="mailbutton">
				
			</div>
			<p></p>
			<hr color="black" size="3" />
			<div class="mem-info">
				<div class="container">
					    <form action="<%=request.getContextPath()%>/back-end/cs/cs.do" method="post">
					        <div class="row">
					            <div class="col-lg-6">
					                <div class="input-group">
					                    <input type="text" name="cssearch" placeholder="search Email...">
					                    <button type="submit"class="btn btn-default" id="doSearch" >OK</button>
										<input type="hidden" name="action" value="CSsearch" >
					                </div><!-- /input-group -->
					            </div><!-- /.col-lg-6 -->
					        </div><!-- /.row -->
					    </form>
					<hr>
					<div class="rowcs">
					
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
										<tr class="thcss">
											<%
												CsService csSvc =new CsService();
												List<CsVO> list = (List) session.getAttribute("list");
																	
											%>
											<th><input type="checkbox" id="checkall" name="checkall" onclick="checkAll()"></th>
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
									<h3>${title}
										<%@ include file="searchpage1.file" %> 
									</h3>
									<c:if test="${empty list }">
										<h1 style="text-align:center;color:red;">查無資訊!請重新查詢</h1>
									</c:if>
									<tbody>
										<c:forEach var="csVO" items="${list}" varStatus="update" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
											
											<tr class="${csVO.cs_ID}">
												<%
													CsVO csVO = (CsVO) pageContext.getAttribute("csVO");
													String email[] = csVO.getCs_Email().split("@");
													String emails = email[0];
												%>
												
												<td><input type="checkbox" name="checkDelete" value="${csVO.cs_ID}"></td>																	
												<td>${csVO.cs_ID}</td>
												<td><%=emails %></td>
												<td>${csVO.cs_Tel}</td>
												<td class="ellipsis">${csVO.cs_Subject}</td>
												<td><fmt:formatDate value='${csVO.cs_Time}' pattern='yyyy-MM-dd HH:mm'/></td>
												<c:if test="${csVO.cs_isSend ==0}">
													<td><span class="mailspan" style="font-size:30px;">&times;</span></td>
												</c:if>
												<c:if test="${csVO.cs_isSend ==1}">
													<td style="color:blue;font-size:30px;">✓ </td>
												</c:if>
												<td>
													<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#csDetails${update.index}">詳情</button>
													<!-- DetailsModal -->
													<%@ include file="csDetailsModal.jsp" %>
												</td>
												<td>
													<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#csGmail${update.index}">回覆</button>
													<!-- SendModal -->
													<%@ include file="csSendModal.jsp" %>
												</td>
												<td>
												  <FORM id="${csVO.cs_ID}" METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/cs/cs.do" style="margin-bottom: 0px;">
												     <button type="button" class="btn btn-secondary doDelete " value="${csVO.cs_ID}">刪除</button>
												     <input type="hidden" name="cs_ID"  value="${csVO.cs_ID}">
												     <input type="hidden" name="action" value="deleteCs">
												     <input type="hidden" name="cs_issend" value="${csVO.cs_isSend}">
												  </FORM>
												</td>						
											</tr>
											 									
										</c:forEach>
									</tbody>								            
								</table>
								<hr>
								<div><input type="button" class="btn btn-primary" name="checkall" id="checkall" onclick="checkAll()" value="全選">
								<button type="button" class="btn btn-danger" id="delAll" name="delAll"  onclick="delAllBooks()">刪除</button>
								</div>
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
	<script src="https://code.jquery.com/jquery-3.2.1.min.js" type="text/javascript"></script>
    <!--引用SweetAlert2.js-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.0.0/sweetalert2.all.js"></script>
	<!--針對主旨 限縮字數 -->	
	<script>
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
	</script>
	
	<script>
	//刪除前 確認是否回覆進行提示
	$(document).ready(function(){
	   $(".doDelete").click(function(){
		var theone="[id='"+$(this).val()+"']";
		var thetwo="[class='"+$(this).val()+"']";
 		var issend = $(this).next().next().next().val();	
		if( issend == 1){
		   	swal({
	        	title: "確定刪除？",
	        	html: "按下確定後資料會永久刪除",
	        	type: "question",
	        	showCancelButton: true
	    	}).then(
	        	function (result) {
	            	if (result.value) {    
	                	$.ajax({
				         type:"POST",                   
				         url: "${pageContext.request.contextPath}/back-end/cs/cs.do",        
				         data: $(theone).serialize(), 
						 success : function(){
							 swal({
								title: "成功刪除", 
								text: "請點選OK!", 
								type:"success"}).then(function(){ 
								   //$(thetwo).remove();
								   location.reload();
								 }
							 );
					      },
						 error:function(err){
						 	swal("系統異常", "資料未被刪除", "error");
						  }	 
					});
            	} else if (result.dismiss === "cancel"){                
                	swal("取消", "資料未被刪除", "error");
            	}  
        	}); 			 
		}else{
			swal({
	        	title: "尚未回覆,確定刪除?",
	        	html: "按下確定後資料會永久刪除",
	        	type: "warning",
	        	showCancelButton: true
	    	}).then(
	        	function (result) {
	            	if (result.value) {    
	                	$.ajax({
				         type:"POST",                   
				         url: "${pageContext.request.contextPath}/back-end/cs/cs.do",        
				         data: $(theone).serialize(), 
						 success : function(){
							 swal({
								title: "成功刪除", 
								text: "請點選OK!", 
								type:"success"}).then(function(){ 
									location.reload();
								 }
							 );
					      },
						 error:function(err){
						 	swal("系統異常", "資料未被刪除", "error");
						  }	 
					});
            	} else if (result.dismiss === "cancel"){                
                	swal("取消", "資料未被刪除", "error");
            	}  
        	}); 			
		}});
		
	});
	
	
	//全選按鈕
	function checkAll() {
		arr = document.getElementsByName("checkDelete");
		if (checkall.checked == true) {
			for (var i = 0; i < arr.length; i++) {
				arr[i].checked = true;
			}
		} else {
			for (var i = 0; i < arr.length; i++) {
				if ((arr[i]).checked == false) {
					arr[i].checked = true;
				} else {
					arr[i].checked = false;
				}
			}
		}
	}
	
	//寄送信件AJAX
	$(document).ready(function(){
		$(".doSendEmail").click(function(){
			var sendform = "[id='"+$(this).val()+"']";
			var Subs = "[id='Subject"+$(this).next().val()+"']";
			var Msgs = "[id='Message"+$(this).next().val()+"']";
			if($(Subs).val().trim()==""||$(Subs).val().trim()== null){
				swal("主旨錯誤","請確認後再重新送出","error");
	            return;
	         }
			if($(Msgs).val().trim()==""||$(Msgs).val().trim()== null){
				swal("留言錯誤","請確認後再重新送出","error");
	            return;
	         }
			
			$.ajax({
				type:"POST",
				url:"${pageContext.request.contextPath}/back-end/cs/CsSendGmail.do",
				data:$(sendform).serialize(),
				
				success : function(){
					swal({
						title: "成功寄出", 
						text: "請點選OK!", 
						type:"success"}).then(function(){ 
						   location.reload();
						 }
					 );					
				},
				error : function(err){
					swal("系統異常", "檢查網路或是否登入", "error");
				}
			})
		})
	})
	
	//刪除全部
	$("#delAll").click(function(){
		var csid = $("input[type=checkbox]:checked");
		if(csid.length==0){
			swal("未選取","請至少選一個","info");
			return;
		}
		var delAll = new Array();
		for(var i=0;i<csid.length;i++){
			delAll.push(csid[i].value);
		}
		swal({
        	title: "確定刪除？",
        	html: "按下確定後資料會永久刪除",
        	type: "question",
        	showCancelButton: true
    	}).then(
        	function (result) {
            	if (result.value) {    
                	$.ajax({
			         type:"POST",                   
			         url: "${pageContext.request.contextPath}/back-end/cs/cs.do?action=delAllCs",        
			         data: {
						delAll:delAll,
					 }, 
					 success : function(){
						 swal({
							title: "成功刪除", 
							text: "請點選OK!", 
							type:"success"}).then(function(){ 
							   //$(thetwo).remove();
							   location.reload();
							 }
						 );
				      },
					 error:function(err){
					 	swal("系統異常", "資料未被刪除", "error");
					  }	 
				});
        	} else if (result.dismiss === "cancel"){                
            	swal("取消", "資料未被刪除", "error");
        	}  
    	}); 		
	})
	
	</script>
	

</body>

</html>