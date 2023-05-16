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
    <style>
        body, body * {
            font-family: 'Jua'
        }
    </style>
</head>
<body>

<h1>home</h1>
<form action="/temp_login" method="post">
    <input type="text" name="id" value="test">
    <input type="int" name="user_idx" value="4">
    <input type="submit" value="임시로그인"> &nbsp;
    <button type="button" onclick="location.href='/temp_logout'">로그아웃</button>
</form>
<span><b>세션id: ${sessionScope.id}</b></span><br>
<span><b>세션 user_idx: ${sessionScope.user_idx}</b></span><br>
<form>
    <label for="photo">사진 넣기</label>
    <input type="file" id="photo" name="photo" accept="image/*">
</form>
<div id="preview"></div>

<script>
    document.querySelector('#photo').addEventListener('change', function() {
        var reader = new FileReader();
        reader.onload = function(e) {
            var img = new Image();
            img.src = e.target.result;
            img.width = 200;
            document.querySelector('#preview').appendChild(img);
        };
        reader.readAsDataURL(this.files[0]);
    });
</script>
<div class="video-wrapper">
    <video id="videoPlayer" controls style="width: 400px" autoplay>
        <source src="../ad/ad.mp4" type="video/mp4">
    </video>
    <img src="../">
</div>
</body>
</html>