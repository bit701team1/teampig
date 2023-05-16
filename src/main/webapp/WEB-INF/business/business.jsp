<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>끼니피그 비지니스</title>
    <script src="https://code.jquery.com/jquery-3.6.3.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Jua&family=Lobster&family=Nanum+Pen+Script&family=Single+Day&display=swap"
          rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="css/business.css">
    <style>

    </style>
</head>
<body>
<div id="container">
    <header>
        <div id="logo">
            <a href="./business.jsp">
                <img src="./photo/logo4.png" alt="로고">
            </a>
        </div>
        <div id="highMenu">
            <ul>
                <li><a href="#">공지사항</a></li>
                <li><a href="#">고객센터</a></li>
                <li><a href="#">로그인</a></li>
                <li><a href="#">회원가입</a></li>
            </ul>
        </div>

        <nav>
            <ul id="topMenu">
                <li><a href="#">끼니피그란 <span>▼</span></a>
                    <ul>
                        <li><a href="#">알고리즘</a></li>
                        <li><a href="#">번역서비스</a></li>
                    </ul>
                </li>
                <li><a href="#">끼니스토어 <span>▼</span></a>
                    <ul>
                        <li><a href="#">광고서비스</a></li>
                        <li><a href="#">리뷰관리</a></li>
                    </ul>
                </li>
                <li><a href="#">이용가이드</a></li>
                <li><a href="#">문의하기</a></li>
            </ul>
        </nav>
    </header>

    <div id="slideShow">
        <div id="slides">
            <img src="./photo/slide1.png" alt="사진1">
            <img src="./photo/slide2.png" alt="사진2">
            <img src="./photo/slide3.png" alt="사진3">
            <!-- <button id="prev">&lang;</button>
            <button id="next">&rang;</button> -->
        </div>
    </div>

    <!-- 텍스트 영역 1 -->
    <div id="mainTitle">
        <h1>
            끼니피그의
            <br>
            강력한 비즈니스 도구를 이용하여
            <br>
            서비스를 시작하세요</h1>
    </div>

    <!-- 흰색 영역 1 -->
    <div id="section1">
        <a href="#"><img src="./photo/adver.png" class="photo1"></a>
        <a href="#"><img src="./photo/review.png" class="photo1"></a>
    </div>

    <!-- 텍스트 영역 2 -->
    <div id="mainTitle2">
        <h1>
            끼니피그는
            <br>
            외국인 손님들을 위한
            <br>
            다양한 솔루션을 제공합니다.</h1>
    </div>

    <!-- 회색 영역 1 -->
    <div id="section2">
        <a href="#"><img src="./photo/ai.png" class="photo2"></a>
        <a href="#"><img src="./photo/gpt.png" class="photo2"></a>
    </div>

    <!-- 텍스트 영역 3 -->
    <div id="mainTitle3">
        <h1>
            끼니피그는
            <br>
            한식의 세계화를 위해
            <br>
            수많은 파트너들과 함께합니다.</h1>
    </div>

    <div id="contents">
        <div id="tabMenu">
            <input type="radio" id="tab1" name="tabs" checked>
            <label for="tab1">끼니피그 가입 현황</label>
            <input type="radio" id="tab2" name="tabs">
            <label for="tab2">우수 고객 리뷰</label>

            <div id="notice" class="tabContent">
                <!-- <h2>공지사항 내용입니다.</h2> -->
                <ul>
                    <li>고양시 - 청정바지락 칼국수</li>
                    <li>과천시 - 야구장 농원</li>
                    <li>광주시 - 고향매운탕</li>
                    <li>김포시 - 풀잎속의생명</li>
                    <li>남양주시 - 맷돌36 숫불갈비</li>
                </ul>
            </div>
            <div id="gallery" class="tabContent">
                <!-- <h2>갤러리 내용입니다.</h2> -->
                <ul>
                    <li><img src="./photo/image4.jpg"></li>
                    <li><img src="./photo/image5.jpg"></li>
                    <li><img src="./photo/image6.jpg"></li>
                    <li><img src="./photo/image4.jpg"></li>
                    <li><img src="./photo/image5.jpg"></li>
                    <li><img src="./photo/image6.jpg"></li>
                </ul>
            </div>
        </div>

        <div id="links">
            <ul>
                <li>
                    <a href="#">
                        <span id="quick-icon1"></span>
                        <p>Map</p>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <span id="quick-icon2"></span>
                        <p>챗봇</p>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <span id="quick-icon3"></span>
                        <p>예약시스템</p>
                    </a>
                </li>
            </ul>
        </div>
    </div>

    <div id="mainTitle4-container">
        <h2 id="mainTitle4">
            지금 끼니피그의 가족이 되어주세요 !
        </h2>
    </div>

    <div id="submit">
        <button class="custom-btn btn-3"><span><b>시작하기</b></span></button>
    </div>

    <footer>
        <div id="bottomMenu">
            <ul>
                <li><a href="#">회사 소개</a></li>
                <li><a href="#">개인정보처리방침</a></li>
                <li><a href="#">광고서비스운영</a></li>
                <li><a href="#">사이트맵</a></li>
            </ul>
            <div id="sns">
                <ul>
                    <li><a href="#"><img src="./photo/sns1.png"></a></li>
                    <li><a href="#"><img src="./photo/sns2.png"></a></li>
                    <li><a href="#"><img src="./photo/sns3.png"></a></li>
                </ul>
            </div>
        </div>
        <div id="company">
            <p>서울 강남구 강남대로94길 20 삼오빌딩 5-9층</p>
        </div>
    </footer>
</div>

<div class="remote">
    <button class="remote-btn" data-target="#mainTitle">비지니스</button>
    <button class="remote-btn" data-target="#mainTitle2">솔루션</button>
    <button class="remote-btn" data-target="#mainTitle3">파트너쉽</button>
</div>

<script src="js/slideshow.js"></script>
</body>
</html>