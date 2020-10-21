<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.adver.model.*"%>

<%
	String type = request.getParameter("type");
	List<AdVO> ads = (List<AdVO>) request.getAttribute(type);

	// ads.forEach(ad->System.out.println(ad.getAd_id()));

	int count = 1;
	pageContext.setAttribute("ads", ads);

	// ads長度為0，則會顯示預設的靜態廣告
%>


<c:choose>
	<c:when test="${ads.size() > 0}">
		<div id="${param.type}" class="carousel slide" data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#${param.type}" data-slide-to="0" class="active"></li>
				<c:forEach begin="1" end="${ads.size()-1}">
					<li data-target="#${param.type}" data-slide-to="<%=count++%>"></li>
				</c:forEach>
			</ol>
			<%
				count = 0;
						pageContext.setAttribute("count", count);
			%>
			<div class="carousel-inner">
				<c:forEach var="ad" items="${ads}">
					<div class='carousel-item ${count eq 0 ? "active" : ""}'>

						<a href="${ad.ad_url}">
							<img class="d-block w-100" src="${pageContext.request.contextPath}/ShowADPic?ad_id=${ad.ad_id}">
						</a>
						<div class="carousel-caption d-none d-md-block" id="advertisement">
							<p>${ad.ad_type}</p>
						</div>
					</div>
					<%
						count++;
									pageContext.setAttribute("count", count);
					%>
				</c:forEach>
			</div>
			<a class="carousel-control-prev" href="#${param.type}" role="button" data-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a>
			<a class="carousel-control-next" href="#${param.type}" role="button" data-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
	</c:when>
	<c:otherwise>
		<div id="advertisement-silder-1" class="carousel slide" data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#advertisement-silder-1" data-slide-to="0" class="active"></li>
				<li data-target="#advertisement-silder-1" data-slide-to="1"></li>
				<li data-target="#advertisement-silder-1" data-slide-to="2"></li>
				<li data-target="#advertisement-silder-1" data-slide-to="3"></li>
			</ol>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<a href="https://www.google.com/">
						<img class="d-block w-100" src="${pageContext.request.contextPath}/images/advertisement/showBanaerImage.jpg">
					</a>
					<div class="carousel-caption d-none d-md-block" id="advertisement">
						<p>預設廣告文字(資料庫中無廣告)</p>
					</div>
				</div>
				<div class="carousel-item">
					<a href="https://www.google.com/">
						<img class="d-block w-100" src="${pageContext.request.contextPath}/images/advertisement/showBanaerImage (1).jpg">
					</a>
					<div class="carousel-caption d-none d-md-block" id="advertisement">
						<p>預設廣告文字(資料庫中無廣告)</p>
					</div>
				</div>
				<div class="carousel-item">
					<a href="https://www.google.com/">
						<img class="d-block w-100" src="${pageContext.request.contextPath}/images/advertisement/showBanaerImage (2).jpg">
					</a>
					<div class="carousel-caption d-none d-md-block" id="advertisement">
						<p>預設廣告文字(資料庫中無廣告)</p>
					</div>
				</div>
				<div class="carousel-item">
					<a href="https://www.google.com/">
						<img class="d-block w-100" src="${pageContext.request.contextPath}/images/advertisement/showBanaerImage (3).jpg">
					</a>
					<div class="carousel-caption d-none d-md-block" id="advertisement">
						<p>預設廣告文字(資料庫中無廣告)</p>
					</div>
				</div>
			</div>
			<a class="carousel-control-prev" href="#advertisement-silder-1" role="button" data-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a>
			<a class="carousel-control-next" href="#advertisement-silder-1" role="button" data-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
	</c:otherwise>
</c:choose>


