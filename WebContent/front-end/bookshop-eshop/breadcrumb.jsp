<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.category.model.*"%>
<%
	String fontSize = request.getParameter("breadcrumbFontSize");
	if (fontSize == null) {
		fontSize = "1.0em";
	}
%>
<c:if test="${not empty catLevelMap}">
	<nav aria-label="breadcrumb">
		<ol class="breadcrumb" style="padding: 0; background-color: #FFF; font-size: <%=fontSize%>;'">
			<c:forEach var="entry" varStatus="loop" items="${catLevelMap}" begin="0" end="${catLevelMap.size()-1}">
				<c:choose>
					<c:when test="${!loop.last}">
						<li class="breadcrumb-item" style="padding-left: 0;">
							<a href="${pageContext.request.contextPath}/Search?categoryID=${entry.key}">${entry.value}</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="breadcrumb-item active" aria-current="page">
							<a href="${pageContext.request.contextPath}/Search?categoryID=${entry.key}">${entry.value}</a>
						</li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</ol>
	</nav>
</c:if>