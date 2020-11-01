<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
    $("#categoryName").on('change keyup paste', function() {
        $.ajax({
            type : 'post',
            url : '${pageContext.request.contextPath}/CategoryManagement',
            data : {
                checkCategoryName : $("#categoryName").val()
            },
            success : function(msg) {
                $('#submitBtn').attr("disabled", false);
                $('#msgDiv').css('color', 'green');
                $('#msgDiv').text(msg);
            },
            error : function(msg) {
                $('#submitBtn').attr("disabled", true);
                $('#msgDiv').css('color', 'red')
                $('#msgDiv').text(msg.responseText);
            }
        });
    });
</script>