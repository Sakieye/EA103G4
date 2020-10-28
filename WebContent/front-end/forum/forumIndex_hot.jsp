<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.Fa.model.*"%>
<%@ page import="redis.clients.jedis.Jedis"%>
<%@ page import="redis.clients.jedis.exceptions.*" %>
<%@ page import="java.util.*"%>

<%	
	Jedis jedis= null;
	Set<String> searchHotKeys = null;
	try{
		jedis = new Jedis("localhost", 6379);
		jedis.auth("123456");
		searchHotKeys = jedis.zrevrange("searchKeywords", 0 ,7);
	}catch(JedisException e){
		jedis.close();
		e.printStackTrace();
	}
	FaService faSvc = new FaService();
	List<FaVO> list = faSvc.getAllHot();
	pageContext.setAttribute("list", list);
	pageContext.setAttribute("searchHotKeys",searchHotKeys);
%>

<!DOCTYPE HTML>
<html>

<head>
<title>BookShop討論區</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/main-front.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/forumIndex_hot.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/header.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.1.4/toastr.min.css" rel="stylesheet"  />
</head>

<body class="subpage">
	<!-- Header -->
	<jsp:include page="/front-end/header/header.jsp"/>
	<!-- One -->
	<section id="One" class="wrapper style3">
		<div class="inner">
			<header class="align-center">
				<p><b>share your passion for reading</b></p>
				<h2>BookShop 討論區</h2>
			</header>
		</div>
	</section>
	<!-- Two -->
	<section id="two" class="wrapper style2">
		<div class="inner">
			<div class="box">
				<div class="content">
					<header class="align-center">
						<c:if test="${not empty errorMsgs}">
							<font style="color: red">請修正以下錯誤:</font>
							<ul>
								<c:forEach var="message" items="${errorMsgs}">
									<li style="color: red">${message}</li>
								</c:forEach>
							</ul>
						</c:if>
					</header>
					<div class="container">
						<div class="row">
							<div class="col-md-3">
								<div id="heading1">
									<a href="forumIndex.jsp"><b>最新文章</b><i class="fas fa-book"></i></a>
								</div>
							</div>
							<div class="col-md-3">
								<div id="heading2">
									<b>熱門文章</b><i class="fas fa-fire-alt"></i>
								</div>
							</div>
							
							<div class="col-md-4">
								<form method="post" id="searcForm" action="<%=request.getContextPath()%>/front-end/forum/fa.do">
									<input type="text" name="faTopic" id="searchText" > 
									<input type="hidden" name="action" value="search">
									<button type="submit">
										<i class="fa fa-search"></i>
									</button>
								</form>
							</div>
							<div class="col-md-2">
								<input type="submit" value="我要發佈" onclick="location.href='addFaPage.jsp'">
							</div>
						</div>
						<div class="row search_hot">
						<div><i class="fab fa-searchengin"></i>熱門搜尋:</div>
						<c:forEach var="hotKeyWords" items="${searchHotKeys}">
							<span>♯${hotKeyWords}</span>
						</c:forEach>
						</div>
					</div>
				<hr>
					<div class="container">
						<div class="row">
							<div class="col-md-8" id="title" style="font-weight:bold;"><i class="fas fa-newspaper"></i>主題</div>
							<div class="col-md-2" style="font-weight:900;"><i class="fas fa-calendar-alt"></i>發佈時間</div>
							<div class="col-md-2" style="font-weight:900;"><i class="far fa-eye"></i>觀看數</div>
						</div>
						<hr>
						<%@ include file="page1.file" %> 
						<c:forEach var="faVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
								<div class="row">
									<div class="col-md-8" id="aTopic">
										<a href="<%=request.getContextPath() %>/front-end/forum/fa.do?action=getOne_For_Display&faId=${faVO.faId}">${faVO.faTopic}</a>
									</div>
									<div class="col-md-2">
										<fmt:formatDate value="${faVO.faDate}"
											pattern="yyyy-MM-dd HH:mm:ss" />
									</div>
									<div class="col-md-2">${faVO.faViews}</div>
								</div>
								<hr>
						</c:forEach>
						
						<%@ include file="page2.file" %>
					</div>
					
				</div>
				
			</div>
		</div>
		
	</section>
	<!-- Footer -->
	<jsp:include page="/front-end/footer/footer.jsp"/>
	<!-- Footer -->
	<script src='<%= request.getContextPath()%>/js/jquery.min.js'></script>
    <script src="<%= request.getContextPath()%>/js/jquery.scrollex.min.js"></script>
    <script src="<%= request.getContextPath()%>/js/skel.min.js"></script>
    <script src="<%= request.getContextPath()%>/js/util.js"></script>
    <script src="<%= request.getContextPath()%>/js/main.js"></script>
	
	<script src="https://kit.fontawesome.com/21e3918c11.js"></script>
	<!-- jQuery v1.9.1 -->
  	<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
	<!-- toastr v2.1.4 -->
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.1.4/toastr.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
	<script>
	$(document).ready(function(){
		  var MyPoint = "/SubscribeNotifyWs/${memVO.mem_id}";
	        var host = window.location.host;
	        var path = window.location.pathname;
	        var webCtx = path.substring(0, path.indexOf('/', 1));
	        var endPointURL = "ws://" + window.location.host + webCtx + MyPoint;
	        var webSocket;

	        if (`${memVO}` !== "") {
	            connect();
	        }

	        function connect() {

	            webSocket = new WebSocket(endPointURL);

	            webSocket.onopen = function(event) {
	                console.log(endPointURL);
	                console.log("Connect Success!");
	            }

	            webSocket.onmessage = function(event) {
	            	var jsonObj = JSON.parse(event.data);
	                if(jsonObj.type === "addFaNotify"){
	                   	 console.log(jsonObj);
	                     toastr['success'](jsonObj.message, '追蹤通知');
	                }
	                if(jsonObj.type === "notifyAuthor"){
	                   	console.log(jsonObj);
	                   	toastr['success'](jsonObj.message, '被追蹤通知');
	                }
	            }

	            webSocket.onclose = function(event) {
	                console.log("Disconnected")
	            }

	        }
	        if (`${exp}` !== "") {
	            toastr['success']('新增文章成功啦！', '${exp}');
	        }
		if(location.href.indexOf("forumIndex.jsp") !== -1){
			$("#heading2>a>b").css("color","red");
		}else if(location.href.indexOf("forumIndex_hot.jsp") !== -1){
			$("#heading1>a>b").css("color","green");
		}else{
			$("#heading2>a>b").css("color","red");
			$("#heading1>a>b").css("color","green");
		}
		$(".row.search_hot > span").click(function(){
			var searchKey = $(this).text();		
			$("#searchText").val(searchKey.substring(1));
			$("#searcForm").submit();
		})
		
	})
	
	</script> 
</body>

</html>