<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

		$(document).ready(function() {

            // 註冊進階搜尋toggle
            $("#search-toggle").click(
                function() {
                    $(".advanced-search-form").toggle();
                }
            );

            // 註冊一般搜尋icon
            $("#normal-search-icon").click(
                function() {
                    let bookName = $("#normal-search-bookName").val();

                    $.post("${pageContext.request.contextPath}/front-end/shopping/bookindex.jsp", { bookName: bookName }, function() {
                        window.location.replace("${pageContext.request.contextPath}/front-end/shopping/bookindex.jsp");
                    });
                })

            // 註冊下拉式商品類別選單
            $('.smart-menu').smartmenus({
                showFunction: function($ul, complete) {
                    $ul.slideDown(250, complete);
                },
                hideFunction: function($ul, complete) {
                    $ul.slideUp(250, complete);
                }
            });
        });