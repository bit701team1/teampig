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
    <link rel="stylesheet" href="css/mainlist.css">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Jua&family=Lobster&family=Nanum+Pen+Script&family=Single+Day&display=swap"
          rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <style>

    </style>
</head>
<body>
<div id="m_container">

    <!-- 1.상단 메뉴바 영역 - 아마 tiles 쓸 수도 있음 -->
<%--    <header>--%>
<%--        <div id="m_logo">--%>
<%--            <a href="index2.html">--%>
<%--                <img src="images/logo4.png">--%>
<%--            </a>--%>
<%--        </div>--%>

<%--        <div id="m_topMenu">--%>
<%--            <ul>--%>
<%--                <li><a href="#">avis</a></li>--%>
<%--                <li><a href="#">clientèle</a></li>--%>
<%--                <li><a href="#">adhésion</a></li>--%>
<%--                <li><a href="#">connexion</a></li>--%>
<%--            </ul>--%>
<%--        </div>--%>
<%--        <nav>--%>
<%--            <div class="container">--%>
<%--                <form autocomplete="off">--%>
<%--                    <div class="finder">--%>
<%--                        <div class="finder__outer">--%>
<%--                            <div class="finder__inner">--%>
<%--                                <div class="finder__icon" ref="icon"></div>--%>
<%--                                <input class="finder__input" type="text" name="q" />--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </form>--%>

<%--                <div id="m_status">--%>
<%--                    <h3>로그인 여부 영역</h3>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </nav>--%>
<%--    </header>--%>

    <!-- 2. 지도 출력 영역 -->
    <div id="m_apimap">
        <h3>지도가 출력될 영역</h3>
    </div>

    <!-- 3. 각 영역의 이름이 들어감 -->
    <div id="m_pagename">
        <h3>검색어 출력 영역</h3>
    </div>

    <!-- 4. 리스트 출력 영역 -->
    <div id="contents">
        <div id="m_tabMenu">
            <h3>
                검색 조건이 버튼이 들어감<br>
                플로팅으로 구현 예정
            </h3>
        </div>
        <div id="m_list">
            <h3>리스트가 출력됨</h3>
        </div>
    </div>

<%--    <!-- 5.푸터 영역 - 아마 tiles 쓸수도 있음 -->--%>
<%--    <footer>--%>
<%--        <div id="m_bottomMenu">--%>
<%--            <ul>--%>
<%--                <li><a href="#">présentation d'une entreprise</a></li>--%>
<%--                <li><a href="#">être surveillé</a></li>--%>
<%--                <li><a href="#">service publicitaire</a></li>--%>
<%--                <li><a href="#">carte du site</a></li>--%>
<%--            </ul>--%>
<%--            <div id="m_sns">--%>
<%--                <ul>--%>
<%--                    <li><a href="#"><img src="images/sns1.png"></a></li>--%>
<%--                    <li><a href="#"><img src="images/sns2.png"></a></li>--%>
<%--                    <li><a href="#"><img src="images/sns3.png"></a></li>--%>
<%--                </ul>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div id="m_company">--%>
<%--            <p>5e et 9e étages de l'immeuble Samo de 20 Samo-gil, Gangnam-gu, Séoul</p>--%>
<%--        </div>--%>
<%--    </footer>--%>
</div>

<%--<!-- 6. 채널톡 API 연결 -->--%>
<%--<script>--%>
<%--    (function(){var w=window;if(w.ChannelIO){return w.console.error("ChannelIO script included twice.");}var ch=function(){ch.c(arguments);};ch.q=[];ch.c=function(args){ch.q.push(args);};w.ChannelIO=ch;function l(){if(w.ChannelIOInitialized){return;}w.ChannelIOInitialized=true;var s=document.createElement("script");s.type="text/javascript";s.async=true;s.src="https://cdn.channel.io/plugin/ch-plugin-web.js";var x=document.getElementsByTagName("script")[0];if(x.parentNode){x.parentNode.insertBefore(s,x);}}if(document.readyState==="complete"){l();}else{w.addEventListener("DOMContentLoaded",l);w.addEventListener("load",l);}})();--%>

<%--    ChannelIO('boot', {--%>
<%--        "pluginKey": "b4df2af4-756d-46b8-b999-7ce37d50bfe2"--%>
<%--    });--%>
<%--</script>--%>
<%--<script src="js/main2.js"></script>--%>
</body>
</html>
