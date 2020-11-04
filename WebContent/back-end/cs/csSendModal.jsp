<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<FORM id="send${csVO.cs_ID}" METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/cs/CsSendGmail.do" style="margin-bottom: 0px;">
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
						<div>收件者信箱:<span>*</span></div>
						<div class="csinput">
							<input type="email" id="cs_Email" name="cs_Email" class="cs_Email" value="${csVO.cs_Email}" readonly="readonly" required>	
						</div>
						<br>
						<div>主旨:<span class="mailspan">*</span></div>
						<div class="csinput">
							<input type="text" id="Subject${csVO.cs_ID}" name="cs_Subject" maxlength="30" required placeholder="請輸入30字以內" >											                
						</div>
						<br>
						<div>留言:<span class="mailspan">*</span>
						</div>
						<div>  
							<textarea id="Message${csVO.cs_ID}" name="cs_Message" rows="10" cols="50" required></textarea>
						</div>            
					</div>
					<div  class="modal-footer">
						<button type="button" class="btn btn-primary doSendEmail " value="send${csVO.cs_ID}">寄送</button>											    											              
						<input type="hidden" name="cs_ID"  value="${csVO.cs_ID}">
						<input type="hidden" name="cs_isSend"  value="${csVO.cs_isSend}">
						<input type="hidden" name="action"	value="sendmail">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
					 </div>
				</div>
			</div>
		</div>									     
	 </FORM>
</body>
</html>