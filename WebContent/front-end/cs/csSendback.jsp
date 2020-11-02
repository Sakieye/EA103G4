<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.celebrity_book.model.*,com.mem.model.*,com.book.model.*,com.bookpic.model.*"%>


<!DOCTYPE HTML>
<html>
<head>
	<title>bookshopCelebrity_Books</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	
	<link rel="stylesheet" href="<%= request.getContextPath()%>/css/main-front.css" />
    <link rel="stylesheet" href="<%= request.getContextPath()%>/css/header.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/memSpace_forum.css" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    
    
    <style>
     input[type="text"], input[type="password"], input[type="email"],input[type="tel"], select {
    
     appearance: none; 
     border-radius: 2px;  
     border: solid 1px; 
     color: inherit; 
     display: block; 
     outline: 0; 
     padding: 0 1rem; 
     text-align: center; 
     width: 40%;
     background: white;
     height: 2rem; 
	} 
	textarea{
		width:600px;
		height:200px;
		background: white;
		border: solid 1px;
	}
	.mainspan{
		color:red;
		font-size:20px;
	}
	.csinput{
		display:flex;
		justify-content:center;
		align-items:center;"
	}
   </style>
</head>
<body class="subpage">
    <jsp:include page="/front-end/header/header.jsp" />
	
    <section id="One" class="wrapper style3">
		<div class="inner">
			<header class="align-center">
				<p>部客匣BookShop</p>
				<h2>聯絡我</h2>
			</header>
		</div>
	</section>
	<div class="content">
		    <div class="mem-info">
				<div class="container">
					<div class="csrow" style="text-align:center;" >
						<c:if test="${not empty messages}">												
							<c:forEach var="messages" items="${messages}">
								<script>
									swal("${messages}","","success");
								</script>									
							</c:forEach>
						</c:if>
						<c:if test="${not empty errorMsgs}">			
							<c:forEach var="errorMsgs" items="${errorMsgs}">
								<script>
									swal("${errorMsgs}","分享書單已有此商品","error");
								</script>
							</c:forEach>
						</c:if>
						<h4>
							<p>感謝您對我們的支持，若有任何疑問或寶貴的意見，歡迎您隨時與我們聯繫，客服人員將竭誠為您服務!</p>
						</h4>
						<hr>		
						<form id="csAjaxform" action="<%=request.getContextPath()%>/back-end/cs/cs.do" method="post">            
			                <div>信箱:<span  class="mainspan">*</span></div>
			                <div class="csinput">
			                	<input type="email" id="cs_Email" name="cs_Email" required>
			                </div>
			                <br>
							<div>電話:<span  class="mainspan">*</span></div>
			                <div class="csinput">
			                	<input type="tel" id="cs_Tel" name="cs_Tel" required class="inputcs">
							</div>
							<br>
							<div>主旨:<span  class="mainspan">*</span></div>
			                <div class="csinput">
			                	<input type="text" id="cs_Subject" name="cs_Subject" class="inputcs" required placeholder="請填寫30字以內" maxlength="30">
			                </div>
			                <br>
							<div>留言:<span class="mainspan">*</span></div>
							<div class="csinput">
								<textarea name="cs_Message" rows="10" cols="60"  required placeholder="請在這留下你的建議或問題!" class="inputcs"></textarea>
			                </div >       
			      		    <button type="submit" class="btn btn-primary"  id="doSend">確認送出</button>
			              	<input type="hidden" name="action" value="insertCs">
			              	<button type="reset" value="Reset">清空</button>
			              	<input type="button" class="btn btn-danger" value="返回首頁" onclick="location.href='<%=request.getContextPath()%>/front-end/front-index.jsp'">
	          			</form>
				</div> 
			</div>
		  </div>
	 </div>
		    
		  
		
	<jsp:include page="/front-end/footer/footer.jsp" />
	<script src='<%=request.getContextPath()%>/js/jquery.min.js'></script>
	<script src="<%=request.getContextPath()%>/js/jquery.scrollex.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/skel.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/util.js"></script>
	<script src="<%=request.getContextPath()%>/js/main.js"></script>
		    
</body>
</html>