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
<section style="width: 100%">
    <div class="enter_section">
        <audio class="j_enter_audio" id="audio">
            <source src="/audio/entersound.mp3" type="audio/mpeg">
        </audio>

        <div class="j_enter_logo">
            <a onclick="playAudio()" style="cursor: grab">
                <img src="/photo/gguineapig.png" style="width: 95px; height: 100px;" >
            </a>
        </div>

        <div class="j_bg_box">
            <video id="entervideo" autoplay muted>
                <source src="/video/enterfoodinfo.mp4" type="video/mp4">
            </video>
            <div style="float: left; width: 50%; height: 100%">
                <img id="bg_l_img" src="/photo/j_enter_user_0.png" style="width: 710px; height: 100%; left: 25%; ">
            </div>
            <div style="width: 50%; margin-left: 710px; height: 100% ">
                <img id="bg_r_img" src="/photo/j_enter_oner_0.jpg" style="width: 710px; height: 100%; right: 25%; ">
            </div>
            <button type="button" class="btn btn-secondary btn-sm j_enter_welcome_btn"
                    onclick="location.href='/realmain'">Welcome GGuineapig</button>
            <button type="button" class="btn btn-secondary btn-sm j_enter_ownermenual_btn"
                    onclick="location.href='/business'">Oner Page</button>
        </div>
    </div>
</section>
</body>
</html>