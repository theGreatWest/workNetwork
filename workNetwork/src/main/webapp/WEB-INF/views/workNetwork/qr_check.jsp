<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
 
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>workNetwork</title>
    <script src="${path}/resources/js/jsQR.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Ropa+Sans" rel="stylesheet">
    <style>
        body {
            font-family: 'Ropa Sans', sans-serif;
            color: #333;
            max-width: 640px;
            margin: 0 auto;
            position: relative;
        }

        #githubLink {
            position: absolute;
            right: 0;
            top: 12px;
            color: #2D99FF;
        }

        h1 {
            margin: 10px 0;
            font-size: 40px;
        }

        #loadingMessage {
            text-align: center;
            padding: 40px;
            background-color: #eee;
        }

        #canvas {
            width: 100%;
        }

        #output {
            margin-top: 20px;
            background: #eee;
            padding: 10px;
            padding-bottom: 0;
        }

        #output div {
            padding-bottom: 10px;
            word-wrap: break-word;
        }

        #noQRFound {
            text-align: center;
        }
    </style>
</head>

<body>
    <h1 style="text-align: center;">QR 체크</h1>
    <p style="text-align: center;">QR 코드를 스캔하여 본인 인증을 진행합니다.</p>
    <div id="loadingMessage" style="text-align: center;">🎥 비디오를 켤 수 없습니다 ( 카메라 사용 권한을 변경해주세요 )</div>
    <canvas id="canvas" hidden></canvas>
    <div id="output" hidden style="text-align: center;">
        <div id="outputMessage" style="text-align: center;">QR 코드를 인식하지 못하였습니다.</div>
        <div hidden><b>Data:</b> <span id="outputData"></span></div>
        <div id="id" style="display: none;" value=""></div>
        <div id="pwd" style="display: none;" value=""></div>
        <div id="select" style="display: none;" value=""></div>
    </div>
    <script>
        var video = document.createElement("video");
        var canvasElement = document.getElementById("canvas");
        var canvas = canvasElement.getContext("2d");
        var loadingMessage = document.getElementById("loadingMessage");
        var outputContainer = document.getElementById("output");
        var outputMessage = document.getElementById("outputMessage");
        var outputData = document.getElementById("outputData");
        var tid;
        var tpwd;

        function drawLine(begin, end, color) {
            canvas.beginPath();
            canvas.moveTo(begin.x, begin.y);
            canvas.lineTo(end.x, end.y);
            canvas.lineWidth = 4;
            canvas.strokeStyle = color;
            canvas.stroke();
        }

        navigator.mediaDevices.getUserMedia({ video: { facingMode: "environment" } }).then(function (stream) {
            video.srcObject = stream;
            video.setAttribute("playsinline", true);
            video.play();
            requestAnimationFrame(tick);
        });

        var cnt=0;
        function tick() {

            loadingMessage.innerText = "⌛ 로딩 중..."
            if(video.readyState === video.HAVE_ENOUGH_DATA) {
                loadingMessage.hidden = true;
                canvasElement.hidden = false;
                outputContainer.hidden = false;

                canvasElement.height = video.videoHeight;
                canvasElement.width = video.videoWidth;
                canvas.drawImage(video, 0, 0, canvasElement.width, canvasElement.height);
                var imageData = canvas.getImageData(0, 0, canvasElement.width, canvasElement.height);
                var code = jsQR(imageData.data, imageData.width, imageData.height, {
                    inversionAttempts: "dontInvert",
                });
                if(code) {
                    drawLine(code.location.topLeftCorner, code.location.topRightCorner, "#FF3B58");
                    drawLine(code.location.topRightCorner, code.location.bottomRightCorner, "#FF3B58");
                    drawLine(code.location.bottomRightCorner, code.location.bottomLeftCorner, "#FF3B58");
                    drawLine(code.location.bottomLeftCorner, code.location.topLeftCorner, "#FF3B58");
                    outputMessage.hidden = true;
                    outputData.parentElement.hidden = false;
                    outputData.innerText = code.data;

                    var tid = code.data.split("%0A")[0];
                    var tpwd = code.data.split("%0A")[1];

                    if(tid == localStorage.getItem('id') && tpwd == localStorage.getItem('pwd') ) {
                        alert("본인 인증 성공");
                        window.close();
                    } else {
                        cnt++;
                        alert("일치하지 않습니다. 다시 시도해주세요...");
                        if(cnt>=4){
                            alert("인증 시도 3회 초과. 로그아웃합니다.");
                            // 호출 페이지를 main 페이지로 이동하는 코드 삽입 부탁드립니다
                            window.close(); // 현재 창 닫기
                        }else{
                            alert('인증 실패 : '+cnt+"/3회");
                            tick();
                        }
                    }

                } else {
                    outputMessage.hidden = false;
                    outputData.parentElement.hidden = true;
                }
            }
            requestAnimationFrame(tick);
        }
    </script>

</body>

</html>