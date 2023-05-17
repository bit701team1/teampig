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
<header style="position: relative; height: 1000px;">
    <audio class="j_enter_audio" id="audio">
        <source src="/audio/entersound.mp3" type="audio/mpeg">
    </audio>
    <div class="j_enter_logo">
        <a onclick="playAudio()" style="cursor: grab">
        <img src="/photo/gguineapig.png" style="width: 100px; height: 100px;" >
        </a>
    </div>
    <div class="j_enter_bg_r_img">
        <video autoplay loop muted width="100%" height="100%" style="object-fit: cover;">
            <source src="/video/makingfood02.mp4" type="video/mp4">
        </video>
        <img class="bg_r_img" src="/photo/j_enter_oner_0.jpg">
        <img class="bg_r_img" src="/photo/j_enter_oner_1.jpg">
        <img class="bg_r_img" src="/photo/j_enter_oner_2.png">
        <img class="bg_r_img" src="/photo/j_enter_oner_3.png">
        <img class="bg_r_img" src="/photo/j_enter_oner_4.png">
        <button type="button" class="btn btn-secondary btn-sm j_enter_welcome_btn"
                onclick="location.href='ownermenual'">싸좡님은 요기 클릭해</button>
    </div>

    <div class="j_enter_bg_l_img">
        <video autoplay loop muted width="100%" height="100%" style="object-fit: cover;">
            <source src="/video/eatingfood02.mp4" type="video/mp4">
        </video>
        <img class="bg_l_img" src="/photo/j_enter_user_0.png">
        <img class="bg_l_img" src="/photo/j_enter_user_1.png">
        <img class="bg_l_img" src="/photo/j_enter_user_2.png">
        <img class="bg_l_img" src="/photo/j_enter_user_3.png">
        <img class="bg_l_img" src="/photo/j_enter_user_4.png">
        <button type="button" class="btn btn-secondary btn-sm j_enter_ownermenual_btn"
                onclick="location.href='qnalist'">Welcome Koera Food</button>
    </div>
</header>

</body>
</html>