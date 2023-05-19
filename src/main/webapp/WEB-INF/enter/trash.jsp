<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-3.6.3.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Jua&family=Lobster&family=Nanum+Pen+Script&family=Single+Day&display=swap"
          rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <link rel="stylesheet" type="text/css" href="style.css">
    <link rel="stylesheet" href="/css/enter.css" />
    <script src="/js/enter.js"> </script>

    <style>
        body, body * {
            font-family: 'Jua'
        }

        .j_enter_welcome_btn {
            position: absolute;
            width: 100px;
            height: 80px;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }

        .j_enter_ownermenual_btn {
            position: absolute;
            width: 100px;
            height: 80px;
            top: 50%;
            right: 50%;
            transform: translate(50%, -50%);
        }

        .j_enter_welcome_btn {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            z-index: 10; /* 버튼이 최상위 레이어에 있도록 z-index 값을 높게 설정 */
        }

        .j_enter_ownermenual_btn {
            position: absolute;
            top: 50%;
            right: 50%;
            transform: translate(50%, -50%);
            z-index: 10; /* 버튼이 최상위 레이어에 있도록 z-index 값을 높게 설정 */
        }

        video {
            position: absolute;
            top: 0;
            left: 0;
            width: 200%;
            height: 100%;
            object-fit: cover;
            opacity: 0; /* 영상의 초기 투명도를 0으로 설정 */
            z-index: 0; /* 이미지와 동일한 z-index 값으로 설정 */
        }

        video.active {
            opacity: 1; /* 영상이 활성화되면 투명도를 1로 변경 */
        }


        #rvideo{
            right: 0;
        }
        #lvideo{
            left: 0;
        }

        .j_leftVideo {
            left: 0;
            clip-path: polygon(0 0, 50% 0, 50% 100%, 0 100%);
            position: absolute;
            top: 0;
            bottom: 0;
            width: 100%;
            height: 100%;
            overflow: hidden;
        }

        .j_rightVideo {
            right: 0;
            clip-path: polygon(50% 0, 100% 0, 100% 100%, 50% 100%);
            position: absolute;
            top: 0;
            bottom: 0;
            width: 100%;
            height: 100%;
            overflow: hidden;
        }

    </style>
</head>
<script>
    function playAudio() {
        var audio = document.getElementById("audio");
        audio.play();
        audio.controls = false;
    }
</script>
<body>
<section class="enter_section">
    <audio class="j_enter_audio" id="audio">
        <source src="/audio/entersound.mp3" type="audio/mpeg">
    </audio>
    <div class="j_enter_logo">
        <a onclick="playAudio()" style="cursor: grab">
            <img src="/photo/gguineapig.png" style="width: 100px; height: 100px;" >
        </a>
    </div>

    <div class="j_bg_l_box">
        <div class="j_leftVideo">
            <video id="lvideo" autoplay loop muted>
                <source src="/video/eatingfood02.mp4" type="video/mp4">
            </video>
        </div>
                <img class="bg_l_img" src="/photo/j_enter_user_0.png">
        <%--        <img class="bg_l_img" src="/photo/j_enter_user_1.png">--%>
        <%--        <img class="bg_l_img" src="/photo/j_enter_user_2.png">--%>
        <%--        <img class="bg_l_img" src="/photo/j_enter_user_3.png">--%>
        <%--        <img class="bg_l_img" src="/photo/j_enter_user_4.png">--%>
                <button type="button" class="btn btn-secondary btn-sm j_enter_ownermenual_btn"
                        onclick="location.href='/home1'">Welcome Koera Food</button>
    </div>

    <div class="j_bg_r_box">
        <div class="j_rightVideo">
            <video id="rvideo" autoplay loop muted >
                <source src="/video/entersiteinfo.mp4" type="video/mp4">
            </video>
        </div>
                <img class="bg_r_img" src="/photo/j_enter_oner_0.jpg">
        <%--        <img class="bg_r_img" src="/photo/j_enter_oner_1.jpg">--%>
        <%--        <img class="bg_r_img" src="/photo/j_enter_oner_2.png">--%>
        <%--        <img class="bg_r_img" src="/photo/j_enter_oner_3.png">--%>
        <%--        <img class="bg_r_img" src="/photo/j_enter_oner_4.png">--%>
                <button type="button" class="btn btn-secondary btn-sm j_enter_welcome_btn"
                        onclick="location.href='/business'">싸좡님은 요기 클릭해</button>
    </div>
</section>
</body>
</html>