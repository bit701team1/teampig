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
    <link rel="stylesheet" href="css/mainlayout.css">
    <style>

    </style>
</head>
<body>
<div id="m_container">
    <!-- 1.상단 메뉴바 영역 - 아마 tiles 쓸 수도 있음 -->
    <header>
        <div id="m_logo">
            <a href="main.jsp">
                <img src="photo/logo4.png">
            </a>
        </div>

        <div id="m_topMenu">
            <ul>
                <li><a href="#">avis</a></li>
                <li><a href="#">clientèle</a></li>
                <li><a href="#">adhésion</a></li>
                <li><a href="#">connexion</a></li>
            </ul>
        </div>
        <nav>
            <div class="container">
                <form autocomplete="off">
                    <div class="finder">
                        <div class="finder__outer">
                            <div class="finder__inner">
                                <div class="finder__icon" ref="icon"></div>
                                <input class="finder__input" type="text" name="q" />
                            </div>
                        </div>
                    </div>
                </form>

                <div id="m_status">
                    <h3>로그인 여부 영역</h3>
                </div>
            </div>
        </nav>
    </header>
</div>
    <script src="js/mainlayout.js"></script>
</body>
</html>