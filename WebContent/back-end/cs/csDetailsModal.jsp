<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="modal fade" id="csDetails${update.index}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
												                  <label for="contact-name" class="conteac-names">信箱:<br><span class="mailspan">${csVO.cs_Email}</span></label>										                  
												                </p>
												                <p>
												                  <label for="contact-tel" class="conteac-names">電話:<br><span class="mailspan">${csVO.cs_Tel}</span></label>										                
												                </p>
												                <p>
												                  <label for="contact-tel" class="conteac-names">主旨:<br><span class="mailspan">${csVO.cs_Subject}</span></label>										                
												                </p>										                
												                <p>
												                  <label for="contace-message">留言:</label>
												                  <br>
												                  <textarea name="messages" rows="10" cols="50"  readonly="readonly">${csVO.cs_Message}</textarea>
												                </p>            
												            </div>
												            <div  class="modal-footer">
												              <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
												            </div>
												          </div>
												        </div>
												      </div>
												      	
</body>
</html>