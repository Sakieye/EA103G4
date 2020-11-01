<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript">
    $(function(){
        $("#author").autocomplete({
            source: function(request, response) {
                $.ajax({
                    url: "${pageContext.request.contextPath}/Search",
                    type: "POST",
                    data: {
                        author: request.term
                    },
                    dataType: "json",
                    success: function(data) {
                        response(data);
                    }
                });
            },
            select: function(event, ui) {
                $("#author").val(ui.item.value);
                return false;
            }
        });
    });
    
    $(function(){
        $("#publisherName").autocomplete({
            source: function(request, response) {
                $.ajax({
                    url: "${pageContext.request.contextPath}/Search",
                    type: "POST",
                    data: {
                        publisherName: request.term
                    },
                    dataType: "json",
                    success: function(data) {
                        response(data);
                    }
                });
            },
            select: function(event, ui) {
                $("#publisherName").val(ui.item.value);
                return false;
            }
        });
    });
</script>