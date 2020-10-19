<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<form>
	<div class="form-row">
		<div class="col-md-4">
			<label for="promoName">促銷事件名稱</label>
			<h3 id="promoName">
				<a href="${pageContext.request.contextPath}/ShowPromoDetails?promoID=${promoID}">${promo.promoName}</a>
			</h3>
			<c:if test="${promo.isValid()}">
				<p>effective</p>
			</c:if>
		</div>
		<div class="col-md-4">
			<label for="promoStartTime">促銷事件起始時間</label>
			<h3 id="promoStartTime">
				<fmt:formatDate value="${promo.promoStartTime}" pattern="yyyy-MM-dd HH:mm" />
			</h3>
		</div>
		<div class="col-md-4">
			<label for="promoEndTime">促銷事件終止時間</label>
			<h3 id="promoEndTime">
				<fmt:formatDate value="${promo.promoEndTime}" pattern="yyyy-MM-dd HH:mm" />
			</h3>
		</div>
	</div>
</form>