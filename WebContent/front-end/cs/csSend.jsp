<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.cs.model.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<title>聯絡我</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    
<style type="text/css">
	
	input[type="text"],  input[type="email"],input[type="tel"] {
    background: rgba(144, 144, 144, 0.075);
    border-color: rgba(144, 144, 144, 0.25);
    height: 2rem;
    width: 80%;
    text-align:left;
  } 
  
	span{
		color:red;
	}
</style>    
    
</head>
<body>
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#Test">
        聯絡我們
      </button>
      
      <!-- Modal -->
      <div class="modal fade" id="Test" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">聯絡我</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <form action="service" method="POST">
            <div class="modal-body">
              
                <p>
                  <label for="contact-name" class="conteac-names">信箱:</label>
                  <span>*</span>
                  <br><input type="email" id="email" class="email" required>
                </p>
                <p>
                  <label for="contact-tel" class="conteac-names">電話:</label>
                <span>*</span>
                <br><input type="tel" id="tel" class="tel" required>
                </p>
                <p>
                  <label for="contact-tel" class="conteac-names">主旨:</label>
                <span>*</span>
                <br><input type="text" id="tel" class="msg" required>
                </p>
                
                <p>
                  <label for="contace-message">留言:</label>
                  <span>*</span>
                  <br>
                  <textarea name="messages" rows="10" cols="60" placeholder="請在這留下你的建議或問題!"></textarea>
                </p>            
            	</div>
            	<div class="modal-footer">
              		<input type="submit" value="確認送出" class="btn btn-primary" onclick="alert">
              
              		<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            	</div>
          </form>
          </div>
        </div>
      </div>
</body>
</html>