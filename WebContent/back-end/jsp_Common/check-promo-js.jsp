<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
    $("#promoName, #promoStartTime, #promoEndTime").on('change keyup paste click', function() {
        $.ajax({
            type : 'post',
            url : '${pageContext.request.contextPath}/AddPromo',
            data : {
            	promoID: '${promoID}',
                checkPromoName: $("#promoName").val(),
                checkPromoStartTime: $("#promoStartTime").val(),
                checkPromoEndTime: $("#promoEndTime").val()
            },
            success : function(msg) {
                $('.btn').attr("disabled", false);
                $('#msgDiv').css('color', 'green');
                $('#msgDiv').text(msg);
            },
            error : function(msg) {
                $('.btn').attr("disabled", true);
                $('#msgDiv').css('color', 'red')
                $('#msgDiv').text(msg.responseText);
            }
        });
    });
</script>