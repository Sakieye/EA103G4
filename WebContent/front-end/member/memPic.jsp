<%@ page contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.io.*"%>
<%@ page import="com.mem.model.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>memPic</title>
</head>
<body>
	<% 
		MemService memSvc = new MemService();
		MemVO memVO = memSvc.getOneMem((String)session.getAttribute("mem_id"));
		byte[] pic = memVO.getMem_pic();
		response.setContentType("image/jpeg");
		OutputStream outs = response.getOutputStream();
		outs.write(pic);
		outs.flush();
	%>
</body>
</html>