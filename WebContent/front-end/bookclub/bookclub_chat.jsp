<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>聊天室</title>

<link rel="stylesheet" href="<%= request.getContextPath()%>/css/main-front.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/sweetalert.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/header.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bookclubChat.css">
</head>

<div class="bg"></div>
<div class="bg bg1"></div>
<div class="bg bg2"></div>

<body onload="connect();" onunload="disconnect();">
	<jsp:useBean id="bookclub_regis_detailsvc" class="com.bookclub_regis_detail.model.BookClub_Regis_DetailService" />
	<jsp:useBean id="memsvc" class="com.mem.model.MemService" />	
	<jsp:include page="/front-end/header/header.jsp" />
	
	<div class="container-fluid h-100 clear-top">
		<!--首頁包全部col-->
		<div class="row align-items-start justify-content-around">

			<div class="col-3" id="memberList">

				<div class="row align-items-center justify-content-center">


					<div class="col-12 text-center">
						<h1>成員列表</h1>
					</div>


					<div class="col-12">
						<hr style="border-color: #FFF; border-width: 5px">
					</div>

				</div>
				<div class="row align-items-start">
					<c:forEach var="bookclub_regis_detailVO"
						items="${bookclub_regis_detailsvc.getMember(param.bc_id)}">
						<div class="col-12">
							<c:if test="${!empty MyMemVO.mem_id}">
								<div id="${MyMemVO.mem_id}" class="private" data-on=''>
									<img
										src="<%=request.getContextPath() %>/mem/MemPic?mem_id=${MyMemVO.mem_id}">
										${MyMemVO.mem_nickname}
										</div>
							</c:if>
							<div id="${bookclub_regis_detailVO.mem_id}" class="private"
								data-on=''>
								<img
									src="<%=request.getContextPath() %>/mem/MemPic?mem_id=${bookclub_regis_detailVO.mem_id}">
								<c:forEach var="memVO" items="${memsvc.getAll()}">
									<c:if test="${bookclub_regis_detailVO.mem_id eq memVO.mem_id}">
                                    ${memVO.mem_nickname}
                                </c:if>
								</c:forEach>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>

			<div class="col-6" id="ChatRoom" ondragover='dragHandaler(event)'
				ondrop='dropImg(event)'>

				<div class="row">

					<div id="messagesArea" class="col-12 panel message-area"></div>

					<div class="col-12">
						<hr
							style="border: 2px solid #FFF; width: 100%; margin-bottom: 10px;">

						<div class="panel input-area">
							<span id="userName" class="text-field" style="display: none">${requestScope.name}</span>
							<select class="custom-select" id="type" style="width: 20%">
								<option value="all" id="all" selected>給所有人:</option>
								<option value="private" id="private">私訊:</option>
							</select>
							<textArea id="message" class="text-field form-control"
								placeholder="訊息"></textArea>
							<input type="submit" id="sendMessage" class="btn btn-primary"
								value="送出" />
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/front-end/footer/footer.jsp" />
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="<%=request.getContextPath()%>/js/sweetAlert2 9.5.2.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/popper.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
	<script src="<%= request.getContextPath()%>/js/jquery.scrollex.min.js"></script>
    <script src="<%= request.getContextPath()%>/js/skel.min.js"></script>
    <script src="<%= request.getContextPath()%>/js/util.js"></script>
    <script src="<%= request.getContextPath()%>/js/main.js"></script>
	<script>
		//========================================webSocket連線設定==========================================
		var MyPoint = "/BookClubServerEcho/${param.mem_id}/${param.bc_id}";
		var host = window.location.host;
		var path = window.location.pathname;
		var webCtx = path.substring(0, path.indexOf('/', 1));
		var endPointURL = "ws://" + window.location.host + webCtx + MyPoint;
		//========================================webSocket連線設定==========================================
		//=========================================需要用到的變數==========================================
		var files;
		var webSocket;
		var messageArea = document.getElementById("messagesArea");//聊天室窗
		var inputUserName = document.getElementById("userName");//使用者名稱
		var historyMsg = '';//歷史訊息
		var receive = '';//私訊接收者
		var receiveNo = '';//接收私訊者編號
		var inputMessage = document.getElementById("message");//輸入訊息
		//=========================================需要用到的變數==========================================
		//=========================================webSocket方法開始=========================================
    	function connect() {
        //webSocket物件
        webSocket = new WebSocket(endPointURL);

        //=========================================open===============================================
        webSocket.onopen = (e) => {

            //歷史訊息
            $.ajax({
                url: '<%=request.getContextPath()%>/front-end/bookclub/bookclub.do',
                type: 'post',
                data: {
                    action: 'chat',
                    bc_id: '${param.bc_id}'
                },
                success: (e) => {
                    historyMsg = JSON.parse(e);
                    var userName = inputUserName.innerText;
                    if (historyMsg != "") {
                        for (let i = 0; i < historyMsg.length; i++) {
                            var obj = JSON.parse(historyMsg[i]);
                            if (obj.userName == userName) {
                                (obj.img != undefined) ? message = senderImg(obj) : message = sender(obj);
//      	     						message = sender(obj);
                                showMessage(message);
                            } else {
                                (obj.img != undefined) ? message = receiverImg(obj) : message = receiver(obj);
//      	     						message = receiver(obj)
                                showMessage(message);
                            }
                        }
                    }
                },
                error: (e) => {
                    swal.fire({
                        icon: 'error',
                        text: '無法獲取歷史訊息 !'
                    });
                }
            });
            swal.fire({
               icon: 'success',
               text: '連線成功'
            });
            document.getElementById('sendMessage').disabled = false;
        };
        //=========================================open===============================================

        //========================================message=============================================
        webSocket.onmessage = (e) => {
            var jobj = JSON.parse(e.data);
            var userName = inputUserName.innerText;
            var message;

            //上線通知
            if (jobj.online != undefined) {
                message = '<div class="online">' + jobj.online + '</div>';
                showMessage(message);
            }

            //確認是否上線
            if (jobj.isOnline != undefined) {
                var online = jobj.isOnline;
                
                var list = document.getElementsByClassName('private');

                for (let i = 0; i < list.length; i++) {
                    for (let j = 0; j < online.length; j++) {
                        if (online[j] == list[i].id && list[i].on != true) {
                            list[i].on = true;
                            console.log(list[i]);
                            list[i].innerHTML = list[i].innerHTML + `<img src="<%=request.getContextPath()%>/images/bookclub/Online.png" id="OnlineIcon">`;
                        }
                    }
                }
            }

			
            //確認離線
            if (jobj.notOnline != undefined) {
                var online = jobj.notOnline;
                console.log(online);
                var list = document.getElementsByClassName('private');

                for (let i = 0; i < list.length; i++) {
                    for (let j = 0; j < online.length; j++) {
                        if (jobj.mem_no == list[i].id && list[i].on == true) {
                        	list[i].on = false;
                        	var name = list[i].innerText;
                        	list[i].innerHTML = '<img src="<%=request.getContextPath() %>/mem/MemPic?mem_id=' + jobj.mem_no + '">' + name;
                        }
                    }
                }
            }
            
            
            //左右方訊息分辨
            if (userName == jobj.userName && userName != undefined) {
                if (jobj.img != undefined)
                    message = senderImg(jobj);
                else {
                    message = sender(jobj);
                }
                showMessage(message);
            } else if (jobj.userName != undefined) {
                if (jobj.img != undefined)
                    message = receiverImg(jobj);
                else
                    message = receiver(jobj);
                showMessage(message);
            }
        };

            //不讓你按enter換行
            $("textarea").keydown(function(e){
                if (e.keyCode == 13 && !e.shiftKey) {
                    e.preventDefault();
                }
            });

        //========================================message=============================================

        //=========================================close==============================================
        webSocket.onclose = (e) => {
            document.getElementById('sendMessage').disabled = true;
        }
        //=========================================close==============================================
    }

    //=========================================webSocket方法結束========================================
    //===============================================關閉==============================================
    function disconnect() {
    	
        webSocket.close();
    }

    //===============================================關閉==============================================

    	//發送給全部
    function sendAllMessage(inputMessage) {
        var userName = inputUserName.innerText;
        var message = inputMessage.value;
        console.log(inputMessage.value);
        if (message.trim() === "") {
            swal.fire({
                icon: 'warning',
                text: '訊息不可為空 !'
            });
            inputMessage.focus();
        } else {
            var jobj = {
                userNo: '${param.mem_id}',
                userName: userName,
                message: message,
                type: 'all'
            };
            webSocket.send(JSON.stringify(jobj));
            inputMessage.value = "";
            inputMessage.focus();
        }
    }

    //發送給特定對象
    function sendPrivateMessage(inputMessage, memno) {
        var userName = inputUserName.innerText;
        console.log(inputMessage.value);
        var message = inputMessage.value;
        if (message.trim() === "") {
            swal.fire({
                icon: 'warning',
                text: '訊息不可為空 !'
            });
            inputMessage.focus();
        } else {
            var jobj = {
                userNo: '${param.mem_id}',
                userName: userName,
                received: memno,
                message: '私訊: ' + message,
                type: 'private'
            };
            webSocket.send(JSON.stringify(jobj));
            inputMessage.value = "";
            inputMessage.focus();
        }
    }


    //發送方文字
    function sender(jobj) {
        var message = '<div class="myMessageOut">'
            + '<div class="myName">'
            + ":"
            + jobj.userName
            + "&nbsp;&nbsp;"
            + '<img src="<%=request.getContextPath() %>/mem/MemPic?mem_id=' + jobj.userNo + '">'
            + '</div>'
            + '<div class="myMessage">'
            + jobj.message
            + '<img src="<%= request.getContextPath()%>/images/bookclub/BubbleArrow.png" class="arrowRight">'
            + '</div>'
            + '</div>'
            + '<br>';
        return message;
    }

    //發送方圖片
    function senderImg(jobj) {
        var message = '<div class="myMessageOut">'
            + '<div class="myName">'
            + ':'
            + jobj.userName
            + '&nbsp;&nbsp;'
            + '<img src="<%=request.getContextPath() %>/mem/MemPic?mem_id=' + jobj.userNo + '">'
            + '</div>'
            + '<div class="myMessage">'
            + '<img src="' + jobj.img + '" class="messageImage">'
            + '<img src="<%= request.getContextPath()%>/images/bookclub/BubbleArrow.png" class="arrowRight">'
            + '</div>'
            + '</div>'
            + '<br>';
        return message;
    }

    //接收方文字
    function receiver(jobj) {
        var message = '<div class="otherMessageOut">'
            + '<div class="otherName">'
            + '<img src="<%=request.getContextPath() %>/mem/MemPic?mem_id=' + jobj.userNo + '">'
            + jobj.userName
            + ":"
            + "&nbsp;&nbsp;"
            + '</div>'
            + '<div class="otherMessage">'
            + '<img src="<%= request.getContextPath()%>/images/bookclub/BubbleArrowOther.png" class="arrowLeft">'
            + jobj.message
            + '</div>'
            + '</div>'
            + '<br>';
        return message;
    }

    //接收方圖片
    function receiverImg(jobj) {

        var message = '<div class="otherMessageOut">'
            + '<div class="otherName">'
            + '<img src="<%=request.getContextPath() %>/mem/MemPic?mem_id=' + jobj.userNo + '">'
            + jobj.userName
            + ':'
            + "&nbsp;&nbsp;"
            + '</div>'
            + '<div class="otherMessage">'
            + '<img src="<%= request.getContextPath()%>/images/bookclub/BubbleArrowOther.png" class="arrowLeft">'
            + '<img src="' + jobj.img + '" class="messageImage">'
            + '</div>'
            + '</div>'
            + '<br>'
        return message;
    }

    //秀出訊息
    function showMessage(message) {
        messagesArea.innerHTML = messagesArea.innerHTML + message;
        messagesArea.scrollTop = messagesArea.scrollHeight;
    }

    //註冊事件處理
    $(document).ready(() => {

        //切換私訊
        $('.private').click((e) => {
            if (e.target.on == true && e.target.id != '${param.mem_id}') {
                receive = e.target.innerText;
                $('#private').text('私訊: ' + receive);
                $('#private').attr('selected', true);
                receiveNo = e.target.id;
            } else if(e.target.id == '${param.mem_id}'){
            	swal.fire({
                    icon: 'error',
                    text: '不可跟自己私訊'
                });
            } else {
                swal.fire({
                    icon: 'error',
                    text: '此人不在線上'
                });
            }
        });

        //enter鍵
        $('#message').keydown((e) => {
            if (event.keyCode == 13 && $('#type').val() == 'all')
                sendAllMessage(inputMessage);
            if (event.keyCode == 13 && $('#type').val() == 'private' && receive != '')
                sendPrivateMessage(inputMessage, receiveNo);
        });
        //發送鈕
        $('#sendMessage').click((e) => {
            if ($('#type').val() == 'all')
                sendAllMessage(inputMessage);
            if ($('#type').val() == 'private' && receive != '')
                sendPrivateMessage(inputMessage, receiveNo);
        });
    });


    //==========================================================傳圖======================================================

    //防止連覽器預設
    function dragHandaler(e) {
        e.preventDefault();//關閉預設功能
    }

    //擷取檔案(拖曳結束事件)
    function dropImg(e) {
        e.preventDefault();
        files = e.dataTransfer.files[0];//擷取檔案
        console.log(files);

        if (files) {
            var userName = inputUserName.innerText;
            var type = document.getElementById('type').value;

            var reader = new FileReader();
            reader.onload = (event) => {
                var base64 = event.target.result;
                //發送給全部
                if (type == 'all') {
                    var jobj = {
                        userNo: '${param.mem_id}',
                        userName: userName,
                        type: 'all',
                        img: base64
                    }
                    webSocket.send(JSON.stringify(jobj));
                }
                //發送給私人
                if (type == 'private' && receive != '') {
                    var jobj = {
                        userNo: '${param.mem_id}',
                        received: receiveNo,
                        userName: userName,
                        type: 'private',
                        img: base64
                    };
                    webSocket.send(JSON.stringify(jobj));
                }
            };
        }
        reader.readAsDataURL(files);
    }

	</script>
</body>
</html>