<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="form-row">
	<div class="col-md-3">
		<label for="promoName">促銷事件名稱</label>
		<input type="text" class="form-control" name="promoName" id="promoName" value='${param.promoName}'>
	</div>
	<div class="col-md-2">
		<label for="promoStartTime">促銷事件起始時間(最早)</label>
		<input type="text" id='promoStartTime' name='promoStartTime' class="form-control">
	</div>
	<div class="col-md-2" style="position: relative; left: 0.5em">
		<label for="promoEndTime">促銷事件結束時間(最晚)</label>
		<input type="text" id='promoEndTime' name='promoEndTime' class="form-control">
	</div>
	<div class="col-md-2" style="position: relative; left: 1em">
		<label for="isValid">促銷事件狀態</label>
		<select name="isValid" id="isValid" class="form-control" name="isValid">
			<option value="-1"></option>
			<option value="1">作用中</option>
			<option value="0">目前無效</option>
		</select>
	</div>
</div>