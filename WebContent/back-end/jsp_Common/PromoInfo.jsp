<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<form>
	<div class="form-row">
		<div class="col-md-4">
			<label for="promoName">促銷事件名稱</label>
			<h3 id="promoName">
				<a href="${pageContext.request.contextPath}/ShowPromoDetails?promoID=${promoID}">${promo.promoName}</a>
			</h3>
		</div>
		<div class="col-md-4">
			<label for="promoStartTime">促銷事件起始時間</label>
			<h3 id="promoStartTime">${promo.promoStartTime}</h3>
		</div>
		<div class="col-md-4">
			<label for="promoEndTime">促銷事件終止時間</label>
			<h3 id="promoEndTime">${promo.promoEndTime}</h3>
		</div>
	</div>
</form>