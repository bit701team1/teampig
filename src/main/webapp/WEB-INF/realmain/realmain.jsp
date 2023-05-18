<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공공데이터 검색엔진 - 끼니피그에 오신걸 환영합니다</title>
    <script src="https://code.jquery.com/jquery-3.6.3.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Jua&family=Lobster&family=Nanum+Pen+Script&family=Single+Day&display=swap"
          rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">

    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <link rel="stylesheet" href="path/to/font-awesome/css/all.min.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <link rel="stylesheet" href="css/realmain.css">
    <link rel="stylesheet" href="css/footer.css">
    <style>
    </style>
</head>
<body>
<nav class="navbar navbar-dark bg-dark sticky-top navbar-expand-lg fixed-top">
    <a class="navbar-brand" href="#section-a">
        <img src="images/logo4.png" width="50" height="50" alt="로고 출력 페이지">
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
            aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
        <ul class="navbar-nav  ml-auto">
            <li class="nav-item active">
                <a class="nav-link  text-white" href="#section-a"><i class="bi bi-search-heart"></i>검색
                    <span class="sr-only">(current)</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link  text-white" href="#menu-1">추천맛집</a>
            </li>
            <li class="nav-item">
                <a class="nav-link  text-white" href="#menu-2">히스토리</a>
            </li>
            <li class="nav-item">
                <a class="nav-link  text-white" href="#menu-3">끼니피그소개</a>
            </li>
            <li class="nav-item">
                <a class="nav-link  text-white" href="#">마이페이지</a>
            </li>
            <li class="nav-item">
                <a class="nav-link  text-white" href="#">로그인</a>
            </li>
        </ul>
    </div>
</nav>


<!--페이지 1번-->
<section id="section-a">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="about scroll-page">
                    <h1><span class="ityped"></span></h1>
                    <h4>끼니피그 맛집검색</h4>

                    <div id="m_searchbar">
                        <div class="wrapper">
                            <div class="item menu" style="margin-left: 20px;">
                                <div class="linee linee1"></div>
                                <div class="linee linee2"></div>
                                <div class="linee linee3"></div>
                            </div>

                            <div class="item gallery" style="margin-left: -40px;">
                                <div class="dot dot1"></div>
                                <div class="dot dot2"></div>
                                <div class="dot dot3"></div>
                                <div class="dot dot4"></div>
                                <div class="dot dot5"></div>
                                <div class="dot dot6"></div>
                            </div>

                            <button class="item add" style="margin-left: 150px;">

                                <div class="circle">
                                    <i class="fa fa-hashtag"></i>
                                    <div class="line line1"></div>
                                    <div class="line line2"></div>
                                </div>

                                <input type="search" placeholder="키워드 입력" class="search" />
                            </button>

                            <div class="close"></div>



                            <div class="nav-items items1">
                                <i class="fa-solid fa-house"><a href="#"></a></i>
                            </div>
                            <div class="nav-items items2">
                                <i class="fa-solid fa-location-dot"><a href="#"></a></i>
                            </div>
                            <div class="nav-items items3">
                                <i class="fa-solid fa-star"><a href="#"></a></i>
                            </div>
                            <div class="nav-items items4">
                                <i class="fa-solid fa-won-sign"><a href="#"></a></i>
                            </div>

                            <div class="box">
                                <p style="margin-bottom: -5px;">추천검색어</p>
                                <div class="box-line box-line1">
                                    <a href="#">#데이트 코스</a>
                                </div>
                                <div class="box-line box-line2">
                                    <a href="#">#가성비 맛집</a>
                                </div>
                                <div class="box-line box-line3">
                                    <a href="#">#노키즈 존</a>
                                </div>
                                <div class="box-line box-line4">
                                    <a href="#">#가족 모임</a>
                                </div>
                            </div>
                        </div>
                        <div class="effect"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>



<!--페이지 2번-->

<section id="section-b">

    <div class="container-fluid pt-5 pb-5">

        <div class="row">
            <div class="col-lg-12">
                <h1 id="menu-1"><br>&nbsp;</h1>
                <h2 class="text-center pb-3 text-black scroll-page">추천맛집</h2>
            </div>

            <!-- 상단 컨텐츠 -->
            <div class="col-lg-3 col-md-6 col-sm-6">
                <div class="card mb-3 scroll-page">
                    <img class="card-img-top" src="images/food1.jpg" alt="맛집">
                    <div class="card-body">
                        <h5 class="card-title">가장 많이 방문한 맛집</h5>
                        <p class="card-text">당신이 가장 많이 방문한 맛집입니다.</p>
                        <div class="frame">
                            <button class="custom-btn btn-2"><a href="#" target="_blank"></a>방문하기</button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-3 col-md-6  col-sm-6">
                <div class="card mb-3 scroll-page">
                    <img class="card-img-top" src="images/food2.jpg" alt="맛집">
                    <div class="card-body">
                        <h5 class="card-title">최근에 방문한 맛집</h5>
                        <p class="card-text">가장 최근에 방문한 맛집입니다.</p>
                        <div class="frame">
                            <button class="custom-btn btn-2"><a href="#" target="_blank"></a>방문하기</button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-3 col-md-6  col-sm-6">
                <div class="card mb-3 scroll-page">
                    <img class="card-img-top" src="images/food3.jpg" alt="맛집">
                    <div class="card-body">
                        <h5 class="card-title">리뷰가 많은 맛집</h5>
                        <p class="card-text">당신이 관심 있는 맛집</p>
                        <div class="frame">
                            <button class="custom-btn btn-2"><a href="#" target="_blank"></a>방문하기</button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-3 col-md-6  col-sm-6">
                <div class="card mb-3 scroll-page">
                    <img class="card-img-top" src="images/food4.jpg" alt="맛집">
                    <div class="card-body">
                        <h5 class="card-title">인기 많은 맛집</h5>
                        <p class="card-text">끼니피그 인증 맛집</p>
                        <div class="frame">
                            <button class="custom-btn btn-2"><a href="#" target="_blank"></a>방문하기</button>
                        </div>
                    </div>
                </div>
            </div>


            <div class="col-lg-12 mt-5">
                <h1 id="menu-2"><br>&nbsp;</h1>
                <h2 class="text-center pb-3 text-black">히스토리</h2>
            </div>

            <!-- 하단 컨텐츠 -->
            <div class="col-lg-3 col-md-6 col-sm-6">
                <div class="card mb-3 scroll-page">
                    <img class="card-img-top" src="images/food5.jpg" alt="">
                    <div class="card-body">
                        <h5 class="card-title">1만원 맛집</h5>
                        <p class="card-text">1만원으로 즐기는 식당</p>
                        <div class="frame">
                            <button class="custom-btn btn-12"><span>1만원</span><span><a href="#" target="_blank"></a>방문하기</span></button>
                        </div>

                    </div>
                </div>
            </div>

            <div class="col-lg-3 col-md-6  col-sm-6">
                <div class="card mb-3 scroll-page">
                    <img class="card-img-top" src="images/food6.jpg" alt="">
                    <div class="card-body">
                        <h5 class="card-title">2만원 맛집</h5>
                        <p class="card-text">2만원으로 즐기는 식당</p>
                        <div class="frame">
                            <button class="custom-btn btn-12"><span>2만원</span><span><a href="#" target="_blank"></a>방문하기</span></button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-3 col-md-6  col-sm-6">
                <div class="card mb-3 scroll-page">
                    <img class="card-img-top" src="images/food7.jpg" alt="">
                    <div class="card-body">
                        <h5 class="card-title">3만원 맛집</h5>
                        <p class="card-text">3만원에 즐기는 식당</p>
                        <div class="frame">
                            <button class="custom-btn btn-12"><span>3만원</span><span><a href="#" target="_blank"></a>방문하기</span></button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-3 col-md-6  col-sm-6">
                <div class="card mb-3 scroll-page">
                    <img class="card-img-top" src="images/food8.jpg" alt="">
                    <div class="card-body">
                        <h5 class="card-title">4만원 맛집</h5>
                        <p class="card-text">4만원에 즐기는 식당</p>
                        <div class="frame">
                            <button class="custom-btn btn-12"><span>4만원</span><span><a href="#" target="_blank"></a>방문하기</span></button>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</section>


<!--페이지 3번-->

<section id="section-c">
    <div class="container scroll-page">
        <div class="row">
            <div class="col-lg-12 text-center pt-5 pb-5">
                <h1 id="menu-3">&nbsp;</h1>
                <h2 class="scroll-page">끼니비지니스</h2>

            </div>
        </div>

        <div class="row pb-5 tools-wrapper">

            <div class="col-lg-2 col-md-2 col-sm-4">
                <i class="fa-brands fa-facebook fa-bounce fa-5x" style="color: #5C732C;"></i>
            </div>

            <div class=" col-lg-2 col-md-2 col-sm-4">
                <i class="fa-brands fa-twitter fa-bounce fa-5x" style="color: #5C732C;"></i>
            </div>

            <div class="col-lg-2 col-md-2 col-sm-4">
                <i class="fa-brands fa-instagram fa-bounce fa-5x" style="color: #5C732C;"></i>
            </div>

            <div class="col-lg-2 col-md-2 col-sm-4">
                <i class="fa-brands fa-tiktok fa-bounce fa-5x" style="color: #5C732C;"></i>
            </div>

            <div class="col-lg-2 col-md-2 col-sm-4">
                <i class="fa-brands fa-line fa-bounce fa-5x" style="color: #5C732C;"></i>
            </div>

            <div class="col-lg-2 col-md-2 col-sm-4">
                <i class="fa-brands fa-youtube fa-bounce fa-5x" style="color: #5C732C;"></i>
            </div>
        </div>


    </div>

</section>

<!-- 페이지 4번 -->
<section id="menu-4">

    <div class="container pb-3">
        <div class="row">
            <div class="col-lg-12 pt-5 pb-5">

                <h1 class=" scroll-page text-center info">
                    당신의 맛집을 세계인과 나눠요!
                </h1>

            </div>
        </div>

        <div class="jumbotron jumbo scroll-page">
            <form action="">

                <div class="row">
                    <div class="col-lg-12">
                        <input type="text" class="form-control" placeholder="이름을 입력해주세요">
                    </div>
                    <div class="form-group col-lg-12">
                        <label for="exampleInputEmail1"></label>
                        <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="이메일을 입력해주세요">
                        <small id="emailHelp" class="form-text text-muted">당신의 이메일을 기반으로 회원가입을 진행합니다.</small>
                    </div>

                    <div class="form-group col-lg-12">
                        <label for="exampleFormControlTextarea1"></label>
                        <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" placeholder="당신의 의견을 들려주세요"></textarea>
                    </div>

                    <div class="container">
                        <div class="row justify-content-center">
                            <button class="custom-btn btn-6"><span>가입하기</span></button>
                        </div>
                    </div>

            </form>


        </div>

    </div>

</section>


<footer class="footer-section">
    <div class="container">
        <div class="footer-cta pt-5 pb-5">
            <div class="row">
                <div class="col-xl-4 col-md-4 mb-30">
                    <div class="single-cta">
                        <i class="fas fa-map-marker-alt"></i>
                        <div class="cta-text">
                            <h4>회사주소</h4>
                            <span>서울 강남구 강남대로94길 20 삼오빌딩 5-9층</span>
                        </div>
                    </div>
                </div>
                <div class="col-xl-4 col-md-4 mb-30">
                    <div class="single-cta">
                        <i class="fas fa-phone"></i>
                        <div class="cta-text">
                            <h4>전화번호</h4>
                            <span>0507-1414-9601</span>
                        </div>
                    </div>
                </div>
                <div class="col-xl-4 col-md-4 mb-30">
                    <div class="single-cta">
                        <i class="far fa-envelope-open"></i>
                        <div class="cta-text">
                            <h4>메일주소</h4>
                            <span>bitcamp701@naver.com</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer-content pt-5 pb-5">
            <div class="row">
                <div class="col-xl-4 col-lg-4 mb-50">
                    <div class="footer-widget">
                        <div class="footer-logo">
                            <a href="index.html"><img src="images/cilogo.png" class="img-fluid" alt="logo"></a>
                        </div>
                        <div class="footer-text">
                            <p>술 한잔 마셨습니다... 프로젝트가 미완성이어도 좋습니다. 하지만 '끼니 피그' 하나만 기억해 주세요. 진심을 다해 전합니다. 프로젝트가 별로일 수 있습니다. 밤낮으로 고민하고 코딩했습니다... 최선을 다했고, 열심히 했습니다. 저희 팀의 진심이 느껴지길 바랍니다. 고맙습니다...
                            </p>
                        </div>
                        <div class="footer-social-icon">
                            <span>서포터즈</span>
                            <a href="https://data.gg.go.kr"><img src="images/ggd.png" class="ggd"></a>
                            <a href="https://openai.com/blog/chatgpt"><img src="images/aigpt.png"></a>
                            <a href="https://www.data.go.kr"><img src="images/publicdata.png"></a>
                        </div>
                    </div>
                </div>
                <div class="col-xl-4 col-lg-4 col-md-6 mb-30">
                    <div class="footer-widget">
                        <div class="footer-widget-heading">
                            <h3>전체서비스</h3>
                        </div>
                        <ul>
                            <li><a href="#">회사소개</a></li>
                            <li><a href="#">비지니스</a></li>
                            <li><a href="#">이용약관</a></li>
                            <li><a href="#">공지사항</a></li>
                            <li><a href="#">고객센터</a></li>
                            <li><a href="#">고객관리</a></li>
                            <li><a href="#">광고서비스운영</a></li>
                            <li><a href="#">문의내역</a></li>
                            <li><a href="#">개인정보처리방침</a></li>
                            <li><a href="#">채용공고</a></li>
                        </ul>
                    </div>
                    <div class="row">
                        <div class="col-xl-12">
                            <div id="slideShow">
                                <div id="slides">
                                    <img src="images/banner1.png" alt="광고">
                                    <img src="images/banner5.png" alt="광고">
                                    <img src="images/banner3.png" alt="광고">
                                    <img src="images/banner4.png" alt="광고">
                                    <img src="images/banner2.png" alt="광고">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-4 col-lg-4 col-md-6 mb-50">
                    <div class="footer-widget">
                        <div class="footer-widget-heading">
                            <h3>고객의 소리</h3>
                        </div>
                        <div class="footer-text mb-25">
                            <p>
                                서비스 개선사항, 공공데이터 수정, 잘못된 정보 제보등 끼니피그에 다양한 고객들의 의견을 들려주세요.
                            </p>
                        </div>
                        <div class="subscribe-form">
                            <div class="input-wrapper">
                                <input type="text" placeholder="메일주소를 입력하세요." />
                                <button type="submit"><i class="fab fa-telegram-plane"></i></button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="copyright-area">
        <div class="container">
            <div class="row">
                <div class="col-xl-6 col-lg-6 text-center text-lg-left">
                    <div class="copyright-text">
                        <p>Copyright &copy; 2023, All Right Reserved <a href="footer.html"><b>비트캠프 1조</b></a></p>
                    </div>
                </div>
                <div class="col-xl-6 col-lg-6 d-none d-lg-block text-right">
                    <div class="footer-menu">
                        <ul>
                            <li><a href="#">입장페이지</a></li>
                            <li><a href="#">검색서비스</a></li>
                            <li><a href="#">마이페이지</a></li>
                            <li><a href="#">관리페이지</a></li>
                            <li><a href="#">비지니스</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>


<!--플러그인 영역-->

<script src="https://cdn.jsdelivr.net/npm/particles.js@2.0.0/particles.min.js"></script>

<script>
    particlesJS.load('particles-js', 'particles.json', function () {
        console.log('particles.json loaded...')
    });
</script>

<!--제이쿼리, 부트스트랩 라이브러리 영역-->

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>


<!--페이지 애니메이션 영역-->

<script src="  https://cdn.jsdelivr.net/gh/cferdinandi/smooth-scroll@14.2.0/dist/smooth-scroll.min.js"></script>

<script type="text/javascript">
    $(function(){
        var scroll = new SmoothScroll('a[href*="#menu-1"],a[href*="#menu-2"],a[href*="#menu-3"],a[href*="#section-a"]');
    });
</script>

<!--스크롤 애니메이션 영역-->

<script src="https://unpkg.com/scrollreveal@4.0.7/dist/scrollreveal.min.js"></script>
<script>
    ScrollReveal().reveal(".scroll-page", {
        duration: 800, // 애니메이션 지속 시간
        distance: "20px", // 원점으로부터의 거리
        delay: 100, // 애니메이션 딜레이
        interval: 200, // 애니메이션 간격
        reset: true, // 반복 애니메이션 초기화
        easing: "cubic-bezier(0.5, 0, 0, 1)", // 애니메이션 이징
        mobile: false, // 모바일 장치에서 애니메이션 비활성화
        origin: "top", // 애니메이션 원점 (top에서 bottom으로 내려갈 때)
    });
</script>


<!--타이핑 애니메이션 영역 -->

<script src="https://unpkg.com/ityped@1.0.3/dist/index.min.js"></script>

<script type="text/javascript">
    window.ityped.init(document.querySelector('.ityped'),{
        strings : [`공공데이터를 활용한 맛집 검색`],
        loop: true,
        typeSpeed:100,
    });
</script>

<!-- 푸터 자바스크립트 연결 -->
<script src="js/footer.js"></script>

<!-- 메인페이지 자바스크립트 연결 -->
<script src="js/realmain.js"></script>
</body>
</html>
