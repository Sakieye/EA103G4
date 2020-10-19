        // 註冊carousel slider contorls
        $(".slide").mouseover(
            function() {
                $(this).children(".carousel-control-prev, .carousel-control-next").css("visibility", "visible");
            }
        );

        $(".slide").mouseleave(
            function() {
                $(this).children(".carousel-control-prev, .carousel-control-next").css("visibility", "hidden");
            }
        );