<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.mem.model.*"%>
<%@ page import="com.bookclub.model.*"%>
<%@ page import="com.bookclub_regis_detail.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice Page</title>

<%	
	MemVO memVO = (MemVO) session.getAttribute("memVO");
	if(session.getAttribute("memVO") != null){
		BookClubService bookClubSvc = new BookClubService();
		List<BookClubVO> listBook = bookClubSvc.getByMyself(memVO.getMem_id());
		pageContext.setAttribute("listBook", listBook);
		BookClub_Regis_DetailService bcdSvc = new BookClub_Regis_DetailService();
		List<BookClub_Regis_DetailVO> listBookDetail = bcdSvc.getByMyself(memVO.getMem_id());
		pageContext.setAttribute("listBookDetail", listBookDetail);
	}
%>

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/naranja.min.css">

</head>
<body onload="connect();" onunload="disconnect();">

	<c:forEach var="bookClubVO" items="${listBook}">
		<input class="bcGroup" type="hidden" value="${bookClubVO.bc_id}">
	</c:forEach>
	<c:forEach var="bookClub_Regis_DetailVO" items="${listBookDetail}">
		<input class="bcGroupIn" type="hidden" value="${bookClub_Regis_DetailVO.bc_id}">
	</c:forEach>


<script src="<%=request.getContextPath()%>/js/naranja.min.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<script>
		var bcGroup = document.getElementsByClassName("bcGroup");
		var bcGroupIn = document.getElementsByClassName("bcGroupIn");
		
		var MyPointNotice = "/NoticeWS/${memVO.mem_id}/${listOneBookClub.bc_id}";
		var hostNotice = window.location.host;
		var pathNotice = window.location.pathname;
		var webCtxNotice = pathNotice.substring(0, pathNotice.indexOf('/', 1));
		var endPointURLNotice = "ws://" + window.location.host + webCtxNotice;

		var webSocketNotice;

		
			 
			function connect() {
				
				for(var i = 0; i < bcGroup.length ; i++){
		        	webSocketNotice = new WebSocket(endPointURLNotice + "/NoticeWS/${memVO.mem_id}/" + bcGroup[i].value);
		       		webSocketNotice.onopen = (e) => {
		        	}
		       		webSocketNotice.onmessage = (e) => {
		        	}
		        	webSocketNotice.onclose = (e) => {
		        	}
				}
				for(var i = 0; i < bcGroupIn.length ; i++){
		        	webSocketNotice = new WebSocket(endPointURLNotice + "/NoticeWS/${memVO.mem_id}/" + bcGroupIn[i].value);
		       		webSocketNotice.onopen = (e) => {
		        	}
		       		webSocketNotice.onmessage = (e) => {
		       			var jobj = JSON.parse(e.data);
		       			if("all" === jobj.type){
		       				forAll(jobj);
		       			}
		       			if("successVerify" === jobj.situtaion){
		       				successNotice(jobj);
		       			}
		       			if("failVerify" === jobj.situtaion){
		       				failNotice(jobj);
		       			}
		        	}
		        	webSocketNotice.onclose = (e) => {
		        	}
				}
		    }

		    function disconnect() {
		        webSocketNotice.close();
		    }
		    function sendBookClubMessage() {
		    	
		    	var jobj = {
		                bc_id: '${bookClubVO.bc_id}',
		                bc_name: '${bookClubVO.bc_name}',
		                message: "讀書會修改",
		                type: "all"
		            };
		        webSocketNotice.send(JSON.stringify(jobj));
		        alert("安安");
	   		}
			function successVerify(e){
				var jobj = {
		                bc_id: '${listOneBookClub.bc_id}',
		                bc_name: '${listOneBookClub.bc_name}',
		                message: "恭喜你審核通過",
		                received: $(e).prev().val(),
		                situtaion: "successVerify",
		                type: "private"
		            };
		        webSocketNotice.send(JSON.stringify(jobj));
			}
			function failVerify(e){
				var jobj = {
		                bc_id: '${listOneBookClub.bc_id}',
		                bc_name: '${listOneBookClub.bc_name}',
		                message: "不好意思 您的審核沒通過",
		                received: $(e).prev().val(),
		                situtaion: "failVerify",
		                type: "private"
		            };
		        webSocketNotice.send(JSON.stringify(jobj));
			}
		    function successNotice (e){
		    	naranja()['success']({
	       		      title: e.bc_name + '審核通知',
	       		      text: e.message,
	       		      timeout: 'keep',
	       		    })
		    }
		    function failNotice (e){
		    	naranja()['error']({
	       		      title: e.bc_name + '審核通知',
	       		      text: e.message,
	       		      timeout: 'keep',
	       		    })
		    }
		    function forAll (e){
		    	naranja()['log']({
	       		      title: e.bc_name + '修改通知',
	       		      text: "主辦人有對內容做修正，請盡快查看",
	       		      timeout: 'keep',
	       		    })
		    }
	</script>
</body>
</html>