<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.Timestamp"%>
<%@ page import="com.promo.model.*"%>
<%
long current = System.currentTimeMillis(); //當前毫秒
long zero=current/(1000*3600*24)*(1000*3600*24)-TimeZone.getDefault().getRawOffset(); //今日0分0秒的毫秒數
Timestamp ts = new Timestamp(zero);
String promoTimeDefault = ts.toString();
promoTimeDefault = promoTimeDefault.substring(0, promoTimeDefault.lastIndexOf('.')); //去除秒後面的小數點
%>


<!DOCTYPE html>
<html>

<head>
    <!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- 自訂css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main-back.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bookManagement.css" />
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.css" integrity="sha512-bYPO5jmStZ9WI2602V2zaivdAnbAhtfzmxnEGh9RwtlI00I9s8ulGe4oBa5XxiC6tCITJH/QG70jswBhbLkxPw==" crossorigin="anonymous" />
<title>新增促銷事件</title>
</head>
<body>
    <!--表單內容-->
    <main class="col-md-12" style="margin:0 auto;">
        <h1 style="display: inline;">新增促銷事件</h1>
        <div style="position: relative; left:79em; display: inline;"><a href="${pageContext.request.contextPath}/PromoManagement">返回促銷事件管理</a></div>
        <form id="addPromo" role="form" action="${pageContext.request.contextPath}/AddPromo" method="post">
            <div class="form-row">
			    <div class="col-md-3">
			        <label for="promoName">促銷事件名稱</label>
			        <input type="text" class="form-control" name="promoName" id="promoName" value='${param.promoName}' required>
			    </div>
			    <div class="col-md-2">
			        <label for="promoStartTime">促銷事件起始時間(最早)</label>
			        <input type="text" id='promoStartTime' name='promoStartTime' class="form-control" required>
			    </div>
			    <div class="col-md-2" style="position: relative; left: 1em">
			        <label for="promoEndTime">促銷事件結束時間(最晚)</label> 
			            <input type="text" id='promoEndTime' name='promoEndTime' class="form-control" required>
			    </div>
			</div>
            <button type="submit" class="btn btn-danger btn-block" style="position: relative;top: 1em">確認送出</button>
        </form>
    </main>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js" integrity="sha512-AIOTidJAcHBH2G/oZv9viEGXRqDNmfdPVPYOYKGy3fti0xIplnlgMHUGfuNRzC6FkzIo0iIxgFnr9RikFxK+sw==" crossorigin="anonymous"></script>
    <script>
        $('#promoStartTime').datetimepicker({
            timepicker: true,
            datepicker: true,
            format: 'Y-m-d H:i',
            hours12: false,
            step: 30,
            value: '<%=promoTimeDefault%>',
        })
        
        $('#promoEndTime').datetimepicker({
            timepicker: true,
            datepicker: true,
            format: 'Y-m-d H:i',
            hours12: false,
            step: 30,
            value: '<%=promoTimeDefault%>',
        })
    </script>
</body>

</html>