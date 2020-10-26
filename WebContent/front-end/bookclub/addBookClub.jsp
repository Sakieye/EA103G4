<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Create a BookClub</title>
<script>
        window.console = window.console || function(t) {
	};
</script>
<script>
        if (document.location.search.match(/type=embed/gi)) {
		window.parent.postMessage("resize", "*");
	}
</script>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/main-front.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/reset.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/jquery.datetimepicker.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/header.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bookclub_insert.css" />


</style>
</head>

<body class="subpage">
	<jsp:include page="/front-end/header/header.jsp" />

	<!-- 點擊置頂按鈕 -->
	<button type="button" id="BackTop" class="toTop-arrow"></button>
	<div class="container">
		<div class="row">
			<!-- multistep form -->

			<div class=" col-md-12" id="main_in">
				<div class="spot" style="display: none">
					<input type="text" class="spot" id="spot" name="q_data"
						placeholder="question"> <img
						src="<%=request.getContextPath()%>/images/bookclub/delete_question.png"
						class="trash">
				</div>
				<form method="post" action="bookclub.do"
					enctype="multipart/form-data" id="msform">
					<ul id="progressbar">
						<li class="active">基本資料</li>
						<li>時間</li>
						<li>地點</li>
					</ul>
					<fieldset>
						<h2 class="fs-title">舉辦讀書會</h2>
						<h3 class="fs-subtitle">基本資料</h3>
						<div class="erroMsgs">${errorMsgs.bc_name}</div>
						<input type="text" name="bc_name" placeholder="讀書會名稱"
							value="${param.bc_name}" />
						<div class="erroMsgs">${errorMsgs.bc_peo_upper_limit}</div>
						<input type="text" name="bc_peo_upper_limit" placeholder="人數上限"
							value="${param.bc_peo_upper_limit}" />
						<div class="erroMsgs">${errorMsgs.bc_peo_lower_limit}</div>
						<input type="text" name="bc_peo_lower_limit" placeholder="人數下限"
							value="${param.bc_peo_lower_limit}" />
						<div class="erroMsgs">${errorMsgs.bc_intro}</div>
						<textarea name="bc_intro" placeholder="讀書會介紹">${param.bc_intro}</textarea>
						<div class="erroMsgs">${errorMsgs.bc_cover_pic}</div>
						<label id="fileInput" for="inputF">
							<div id="wrapperBackground">
								<div id="wrapper">
									<input type="file" id="inputF" name="bc_cover_pic">
									讀書會封面
								</div>
							</div>
						</label>
						<div id="uploadContent"></div>
						<input type="button" id="del" class="action-button-del"
							value="Delete" /> <input type="button" name="next"
							class="next action-button" value="Next" id="btnSend" />
					</fieldset>
					<fieldset>
						<h2 class="fs-title">時間</h2>
						<h3 class="fs-subtitle">讀書會活動時間，讀書會報名時間</h3>
						<div class="erroMsgs">${errorMsgs.bc_time_start}</div>
						<input type="text" name="bc_time_start" id="bc_time_start"
							placeholder="活動開始時間" autocomplete="off"
							value="${param.bc_time_start}" />
						<div class="erroMsgs">${errorMsgs.bc_time_end}</div>
						<input type="text" name="bc_time_end" id="bc_time_end"
							placeholder="活動結束時間" autocomplete="off"
							value="${param.bc_time_end}" />
						<div class="erroMsgs">${errorMsgs.bc_init}</div>
						<input type="text" name="bc_init" id="bc_init"
							placeholder="報名開始時間" autocomplete="off" value="${param.bc_init}" />
						<div class="erroMsgs">${errorMsgs.bc_deadline}</div>
						<input type="text" name="bc_deadline" id="bc_deadline"
							placeholder="報名結束時間" autocomplete="off"
							value="${param.bc_deadline}" /> <input type="button"
							name="previous" class="previous action-button" value="Previous" />
						<input type="button" name="next" class="next action-button"
							value="Next" />
					</fieldset>
					<fieldset>
						<h2 class="fs-title">地點,問題</h2>
						<h3 class="fs-subtitle">活動地點,報名必填問題</h3>
						<div class="erroMsgs">${errorMsgs.bc_place}</div>
						
							<button type="button" class="style-6e8fa4a0-register-button" style="display:none"
							data-toggle="modal" data-target="#address-map">選擇地點</button>
							<input type="text" class="form-control in" placeholder="請輸入地點 例: 屏東縣枋山鄉金龍二街六段707巷395弄451號" maxlength="30"
							name="bc_place" value="${param.bc_place}" id="address_out" >
						
						<div id="myForm">
							<div class="spot">新增問題</div>
							
							<label id="spot_text" > 
							
							<img
								src="<%=request.getContextPath()%>/images/bookclub/plus_question.png"
								id="btnAddSpot">
							</label>
						</div>
						<input type="button" name="previous"
							class="previous action-button" value="Previous" /> <input
							type="hidden" name="action" value="insert"> <input
							type="submit" name="submit" class="action-button" value="Submit">
					</fieldset>
				</form>
			</div>
		</div>
	</div>
	<!---------------------------------------------------地址地圖跳窗 --------------------------------------------------->
	<div class="modal" id="address-map" tabindex="-1" role="dialog"
		aria-labelledby="mySmallModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">地址</h4>
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<label for="address" style="z-index:1000"></label>
					<div id="twzipcode"></div>
					<input type="text" class="form-control in" id="address"	placeholder="例: 屏東縣枋山鄉金龍二街六段707巷395弄451號" maxlength="30" >
					<div id="map"></div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">
						關閉</button>
					<button type="submit" class="btn btn-primary" data-dismiss="modal" onclick="get_address()">選擇</button>
				</div>
			</div>
		</div>
	</div>
	<!--------------------------------------------------- 檢舉讀書會跳窗 --------------------------------------------------->
	<jsp:include page="/front-end/footer/footer.jsp" />
	
	<%
		ServletContext context = getServletContext();
		String key = context.getInitParameter("key");
		String key2 = context.getInitParameter("key2");
		StringBuffer magicKey = new StringBuffer("https://maps.googleapis.com/maps/api/js?key=").append(key).append("B").append(key2).append("&libraries=places&callback=initMap");
	%>
	
	<script	src="<%=request.getContextPath()%>/js/stopExecutionOnTimeout.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/popper.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.easing.min.js"></script>
	<script	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.scrollex.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/skel.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/util.js"></script>
	<script src="<%=request.getContextPath()%>/js/main.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery-twzipcode@1.7.14/jquery.twzipcode.min.js"></script>
	<!-- 下一步跳轉script -->
	<script id="rendered-js">
        //jQuery time
        var current_fs, next_fs, previous_fs; //fieldsets
        var left, opacity, scale; //fieldset properties which we will animate
        var animating; //flag to prevent quick multi-click glitches

        $(".next").click(
            function() {
                if (animating)
                    return false;
                animating = true;

                current_fs = $(this).parent();
                next_fs = $(this).parent().next();

                //activate next step on progressbar using the index of next_fs
                $("#progressbar li").eq($("fieldset").index(next_fs))
                    .addClass("active");

                //show the next fieldset
                next_fs.show();
                //hide the current fieldset with style
                current_fs.animate({
                    opacity: 0
                }, {
                    step: function(now, mx) {
                        //as the opacity of current_fs reduces to 0 - stored in "now"
                        //1. scale current_fs down to 80%
                        scale = 1 - (1 - now) * 0.2;
                        //2. bring next_fs from the right(50%)
                        left = now * 50 + "%";
                        //3. increase opacity of next_fs to 1 as it moves in
                        opacity = 1 - now;
                        current_fs.css({
                            'transform': 'scale(' + scale + ')',
                            'position': 'absolute'
                        });

                        next_fs.css({
                            'left': left,
                            'opacity': opacity
                        });
                    },
                    duration: 800,
                    complete: function() {
                        current_fs.hide();
                        animating = false;
                    },
                    //this comes from the custom easing plugin
                    easing: 'easeInOutBack'
                });

            });

        $(".previous").click(
            function() {
                if (animating)
                    return false;
                animating = true;

                current_fs = $(this).parent();
                previous_fs = $(this).parent().prev();

                //de-activate current step on progressbar
                $("#progressbar li").eq($("fieldset").index(current_fs))
                    .removeClass("active");

                //show the previous fieldset
                previous_fs.show();
                //hide the current fieldset with style
                current_fs.animate({
                    opacity: 0
                }, {
                    step: function(now, mx) {
                        //as the opacity of current_fs reduces to 0 - stored in "now"
                        //1. scale previous_fs from 80% to 100%
                        scale = 0.8 + (1 - now) * 0.2;
                        //2. take current_fs to the right(50%) - from 0%
                        left = (1 - now) * 50 + "%";
                        //3. increase opacity of previous_fs to 1 as it moves in
                        opacity = 1 - now;
                        current_fs.css({
                            'left': left
                        });
                        previous_fs.css({
                            'transform': 'scale(' + scale + ')',
                            'opacity': opacity
                        });
                    },
                    duration: 800,
                    complete: function() {
                        current_fs.hide();
                        animating = false;
                    },
                    //this comes from the custom easing plugin
                    easing: 'easeInOutBack'
                });

            });

        $(".submit").click(function() {
            return false;
        });
        //# sourceURL=pen.js
    </script>
	<!-- 加問題script -->
	<script id="question_button">
        function $id(id) {
            return document.getElementById(id);
        }

        function addSpot() {
            let myForm = $id("myForm");
            let btnSend = $id("btnSend");
            let spot = document.querySelector(".spot");
            let newSpot = spot.cloneNode(true);
            newSpot.style.display = "";
            newSpot.getElementsByTagName("img")[0].onclick = removeSpot;
            myForm.insertBefore(newSpot, null);
        }

        function removeSpot(e) {
            $id("myForm").removeChild((e.target.parentNode));
        }
        window.addEventListener("load", function() {
            //------------------------
            //------------------------
            //------------------------註冊事件處理器
            $id('btnAddSpot').onclick = addSpot;
            // document.getElementsByClassName("trash")[0].onclick = removeSpot;
        });
    </script>
	<!-- 預覽圖片script -->
	<script id="picture">
        var img = document.createElement("img");
        var inputF = document.getElementById("inputF");
        var fileInput = document.getElementById("fileInput");

        inputF.addEventListener("change", fileUpload);

        function fileUpload(e) {
            var picture = inputF.files;
            fileUpload2(picture);
        }

        function fileUpload2(files) {
            for (var i = 0; i < files.length; i++) {
                if (files[i].type.indexOf("image") !== -1) { // or picture.type.includes("image");
                    var fileReader = new FileReader();

                    fileReader.readAsDataURL(files[i]); // readyState 1
                    // console.log(fileReader);
                    fileReader.addEventListener("load", function(e) { // readyState2
                        
                        var img = document.createElement("img");
                        var input = document.createElement("input");
                        var div = document.createElement("div");
                        img.setAttribute("src", this.result); // 只能用e.target 不能用 fileReader(readystate:1)
                        input.setAttribute("type", "checkbox");
                        //e.target 是在捕獲冒泡 
                        div.appendChild(img);
                        div.appendChild(input);
                        document.getElementById("uploadContent").append(div);

                        img.addEventListener("click", function(e) { // click pic to checked checkbox
                            e.currentTarget.nextSibling.click();
                        });
                        // console.log(this.result);

                    });

                } else {
                    alert("請上傳圖片");
                }
            }

        }
        deleteF();

        function deleteF() {
            var del = document.getElementById("del");
            del.addEventListener("click", function() {
                var checkbox = document
                    .querySelectorAll('div input[type="checkbox"]');
                var isChecked = false;
                for (var i = 0; i < checkbox.length; i++) {
                    if (checkbox[i].checked) {
                        isChecked = true;
                        checkbox[i].parentElement.remove();
                    }
                }
                if (isChecked === false) {
                    alert("請勾選刪除項目");
                }
            });
        }
    </script>
	<!-- 日曆script -->
	<script>
        $.datetimepicker.setLocale('zh');
        $(function() {
            $('#bc_time_start').datetimepicker({
                format: 'Y-m-d H:i',
                startDate:somedate1,
                onShow: function() {
                    this.setOptions({

                        maxDate: $('#bc_time_end').val() ? $(
                            '#bc_time_end').val() : false
                    })
                },
                timepicker: true
            });

            $('#bc_time_end').datetimepicker({
                format: 'Y-m-d H:i',
                startDate:somedate1,
                onShow: function() {
                    this.setOptions({
                        minDate: $('#bc_time_start').val() ? $(
                            '#bc_time_start').val() : false
                    })
                },
                timepicker: true
            });
            $('#bc_init').datetimepicker({
                format: 'Y-m-d ',
                onShow: function() {
                    this.setOptions({
                    	minDate: new Date() ? new Date() : false,
                        maxDate: $('#bc_time_start').val() ? $('#bc_time_start').val() : false
                    })
                },
                timepicker: false
            });
            $('#bc_deadline').datetimepicker({
                format: 'Y-m-d ',
                onShow: function() {
                    this.setOptions({
                        minDate: $('#bc_init').val() ? $('#bc_init').val() : false,
                        maxDate: $('#bc_time_start').val() ? $('#bc_time_start').val() : false
                    })
                },
                timepicker: false
            });
        });
     	//讀書會開始日期不能在兩個禮拜內
        var somedate1 = new Date(new Date().getTime() + 1209600000);
        $('#bc_time_start')
            .datetimepicker({
                beforeShowDay: function(date) {
                    if (date.getYear() < somedate1.getYear() ||
                        (date.getYear() == somedate1
                            .getYear() && date.getMonth() < somedate1
                            .getMonth()) ||
                        (date.getYear() == somedate1
                            .getYear() &&
                            date.getMonth() == somedate1
                            .getMonth() && date
                            .getDate() < somedate1
                            .getDate())) {
                        return [false, ""]
                    }
                    return [true, ""];
                }
            });
    </script>
	<!-- 點擊置頂按鈕script -->
	<script>
        console.log($('#BackTop'));
        $(function() {
            $('#BackTop').click(function() {
                $('html,body').animate({
                    scrollTop: 0
                }, 333);
            });
            $(window).scroll(function() {
                if ($(this).scrollTop() > 300) {
                    $('#BackTop').fadeIn(222);
                } else {
                    $('#BackTop').stop().fadeOut(222);
                }
            }).scroll();
        });
      //選單事件註冊
        $(document).ready(function () {
            $("#twzipcode select").change(function () {
                $("#address").val($('#twzipcode :selected').text()); //事件發生時把選單數值填入下方輸入盒
            });

        });

        //地址屬性設定
        $("#twzipcode").twzipcode({
            zipcodeIntoDistrict: true, // 郵遞區號自動顯示在地區
            countyName: "city", // 自訂城市 select 標籤的 name 值
            districtName: "town" // 自訂地區 select 標籤的 name 值
        });
    </script>
<!--     modal 置中script -->
    <script type="text/javascript">
		$(document).ready(
				function() {

					function alignModal() {

						var modalDialog = $(this).find(".modal-dialog");

						/* Applying the top margin on modal dialog to align it vertically center */

						modalDialog.css("margin-top", Math.max(0, ($(window)
								.height() - modalDialog.height()) / 2));

					}

					// Align modal when it is displayed

					$(".modal").on("shown.bs.modal", alignModal);

					// Align modal when user resize the window

					$(window).on("resize", function() {

						$(".modal:visible").each(alignModal);

					});

				});
	</script>
	<!-- 地圖script -->
	<script>
        var map;

        
        function init() {
            var keyword = document.getElementById('address');
            
            var options = {
                componentRestrictions: { country: 'tw' } // 限制在台灣範圍
            };
            var autocomplete = new google.maps.places.Autocomplete(keyword, options);
            console.log(autocomplete);
            // 地址的輸入框，值有變動時執行
            autocomplete.addListener('place_changed', function() {
                var place = autocomplete.getPlace(); // 地點資料存進place
                console.log("2" + place);
                // debugger;
                // 確認回來的資料有經緯度
                if (place.geometry) {
                    // 改變map的中心點
                    var searchCenter = place.geometry.location;
                    // panTo是平滑移動、setCenter是直接改變地圖中心
                    map.panTo(searchCenter);
                    // 在搜尋結果的地點上放置標記
                    var marker = new google.maps.Marker({
                        position: searchCenter,
                        map: map
                    });
                    // info window
                    var infowindow = new google.maps.InfoWindow({
                        content: `
                            <div class="info_title">` + place.name + `</div>
                            <div><span class="info_head">地址: </span>` + place.formatted_address + `</div>
                            <div><span class="info_head">經緯度: </span>(` + place.geometry.location.lat() + `, ` + place.geometry.location.lng() + `)</div> 
                            <div><img class="info_img" src="` + place.photos[0].getUrl() + `"></div>
                        `
                    });
                    infowindow.open(map, marker);
                }

            });
        }

        function initMap() {
            map = new google.maps.Map(document.getElementById('map'), {
                center: { lat: 24.9656967, lng: 121.1922173 },
                zoom: 15,
            });
        }

        window.onload = init;
        
        function get_address(){
        	var address_in = $("#address").val();
        	$("#address_out").attr("value",address_in);

        }
        
            $("#address_out").on("focus",function(){
            	
                $(this).prev().click();
                
            })
        
//         $("#address_out").click(function(event)
// 			{
//         	console.log("aa");
//     	//終止預設行為
//     		event.preventDefault();
// 			});
    </script>
	<script	src=<%=magicKey%> async defer></script>
</body>

</html>