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
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-*********" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <style>

    </style>
</head>
<body>
<div id="m_footer">
    <footer class="footer-section">
        <div class="m_foottainer">
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
                                <a href="index.html"><img src="photo/cilogo.png" class="img-fluid" alt="logo"></a>
                            </div>
                            <div class="footer-text">
                                <p>술 한잔 마셨습니다... 프로젝트가 미완성이어도 좋습니다. 하지만 '끼니 피그' 하나만 기억해 주세요. 진심을 다해 전합니다. 프로젝트가 별로일 수 있습니다. 밤낮으로 고민하고 코딩했습니다... 최선을 다했고, 열심히 했습니다. 저희 팀의 진심이 느껴지길 바랍니다. 고맙습니다...
                                </p>
                            </div>
                            <div class="footer-social-icon">
                                <span>서포터즈</span>
                                <a href="https://data.gg.go.kr"><img src="photo/ggd.png" class="ggd"></a>
                                <a href="https://openai.com/blog/chatgpt"><img src="photo/aigpt.png"></a>
                                <a href="https://www.data.go.kr"><img src="photo/publicdata.png"></a>
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
                                        <img src="photo/banner1.png" alt="광고">
                                        <img src="photo/banner5.png" alt="광고">
                                        <img src="photo/banner3.png" alt="광고">
                                        <img src="photo/banner4.png" alt="광고">
                                        <img src="photo/banner2.png" alt="광고">
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
                                <form action="#">
                                    <input type="text" placeholder="Email Address">
                                    <button><i class="fab fa-telegram-plane"></i></button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="copyright-area">
            <div class="m_foottainer">
                <div class="row">
                    <div class="col-xl-6 col-lg-6 text-center text-lg-left">
                        <div class="copyright-text">
                            <p>Copyright &copy; 2023, All Right Reserved <a href="main.jsp"><b>비트캠프 1조</b></a></p>
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
</div>
<script src="js/footer.js"></script>
</body>
</html>
