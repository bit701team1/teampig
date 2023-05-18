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

    <link rel="stylesheet" href="css/header.css">

    <script src="https://code.jquery.com/jquery-3.6.3.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Jua&family=Lobster&family=Nanum+Pen+Script&family=Single+Day&display=swap"
          rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">

    <link rel="stylesheet" href="css/login.css">

    <script src="https://code.jquery.com/jquery-3.6.3.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&family=Gothic+A1&family=Gowun+Batang&family=Hahmlet&family=Song+Myung&display=swap"
          rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <style>

    </style>
</head>
<body>
<c:set var="root" value="<%=request.getContextPath() %>"/>
<%--<button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#loginModal">로그인</button>--%>
<!-- The Modal -->
<div class="modal fade" id="loginModal">
    <div class="modal-dialog" >
        <div class="modal-content" style="background-color: transparent; border:transparent; " >

            <!-- Modal Header -->
            <%--            <div class="modal-header" style="opacity: 0.9">--%>
            <%--                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>--%>
            <%--            </div>--%>

            <!-- Modal body -->
            <div class="modal-body" >
                <div class="position">
                    <div class="cont_principal">
                        <div class="cont_centrar">

                            <div class="cont_login">
                                <div class="cont_info_log_sign_up">
                                    <div class="col_md_login">
                                        <div class="cont_ba_opcitiy">

                                            <h2>LOGIN</h2>
                                            <p>로그인 해주세요!</p>
                                            <button class="btn_login" onclick="change_to_login()">LOGIN</button>
                                        </div>
                                    </div>
                                    <div class="col_md_sign_up">
                                        <div class="cont_ba_opcitiy">
                                            <h2>SIGN UP</h2>


                                            <p>계정이 없으신가요?</p>

                                            <button class="btn_sign_up" onclick="change_to_sign_up()">SIGN UP</button>
                                        </div>
                                    </div>
                                </div>

                                <div class="cont_back_info">
                                    <div class="cont_img_back_grey">
                                        <img src='${root}/photo/login.png' />
                                    </div>
                                </div>

                                <div class="modal-body"> <!-- Add this container -->
                                    <div class="cont_forms">
                                        <div class="cont_img_back_">
                                            <img src='${root}/photo/signup.png'/>
                                        </div>
                                        <div class="cont_form_login">
                                            <a href="#" onclick="hidden_login_and_sign_up()" ><i class="bi bi-x-lg"></i></a>
                                            <h2>LOGIN</h2>
                                            <input type="text" placeholder="id" />
                                            <input type="password" placeholder="Password" />
                                            <button class="btn_login" onclick="change_to_login()">LOGIN</button><br>
                                            <img src="${root}/photo/naver.png" width="100px" style="margin-top: 5px; cursor: pointer;" onclick="initNaverLogin()">
                                            <img src='${root}/photo/kakao.png' width="100px" height="37px" style="margin-top: 5px; cursor: pointer;">
                                        </div>

                                        <div class="cont_form_sign_up">
                                            <a href="#" onclick="hidden_login_and_sign_up()"><i class="bi bi-x-lg" style=
                                                    "position: relative; bottom:50px;"></i></a>
                                            <h2>SIGN UP</h2>
                                            <input type="text" placeholder="Email" />
                                            <input type="text" placeholder="id" />
                                            <input type="password" placeholder="Password" /><br>
                                            <select class="form-select">
                                                <option value="일반사용자">일반 사용자</option>
                                                <option value="사장님">사장님</option>
                                            </select>
                                            <button class="btn_sign_up" onclick="change_to_sign_up()">SIGN UP</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    /* ------------------------------------ Click on login and Sign Up to  changue and view the effect
  ---------------------------------------
  */


    const time_to_show_login = 400;
    const time_to_hidden_login = 200;

    function change_to_login() {
        document.querySelector('.cont_forms').className = "cont_forms cont_forms_active_login";
        document.querySelector('.cont_form_login').style.display = "block";
        document.querySelector('.cont_form_sign_up').style.opacity = "0";

        setTimeout(function(){  document.querySelector('.cont_form_login').style.opacity = "1"; },time_to_show_login);

        setTimeout(function(){
            document.querySelector('.cont_form_sign_up').style.display = "none";
        },time_to_hidden_login);
    }

    const time_to_show_sign_up = 100;
    const time_to_hidden_sign_up = 400;

    function change_to_sign_up(at) {
        document.querySelector('.cont_forms').className = "cont_forms cont_forms_active_sign_up";
        document.querySelector('.cont_form_sign_up').style.display = "block";
        document.querySelector('.cont_form_login').style.opacity = "0";

        setTimeout(function(){  document.querySelector('.cont_form_sign_up').style.opacity = "1";
        },time_to_show_sign_up);

        setTimeout(function(){   document.querySelector('.cont_form_login').style.display = "none";
        },time_to_hidden_sign_up);


    }

    const time_to_hidden_all = 500;

    function hidden_login_and_sign_up() {

        document.querySelector('.cont_forms').className = "cont_forms";
        document.querySelector('.cont_form_sign_up').style.opacity = "0";
        document.querySelector('.cont_form_login').style.opacity = "0";

        setTimeout(function(){
            document.querySelector('.cont_form_sign_up').style.display = "none";
            document.querySelector('.cont_form_login').style.display = "none";
        },time_to_hidden_all);

    }
</script>

<script>
    function initNaverLogin() {
        var naverLogin = new naver.LoginWithNaverId({
            clientId: "KMw1CKJNqR_tTHgOY5np",
            callbackUrl: "http://localhost:9000/auth/naver/callback",
            loginButton: { color: "green", type: 10, height: 60 },
            callbackHandle: true
        });

        naverLogin.init();
    }
</script>



<%--HTML 영역--%>
<div id="m_header">
    <!-- 1.상단 메뉴바 영역 - 아마 tiles 쓸 수도 있음 -->
    <header>
        <div id="m_logo">
            <a href="main.jsp">
                <img src="photo/logo4.png">
            </a>
        </div>

        <div id="m_topMenu">
            <ul>
                <li><a href="#">공지사항</a></li>
                <li><a href="#">고객센터</a></li>
                <li><a href="#">마이페이지</a></li>
                <li><a href="#" data-bs-toggle="modal" data-bs-target="#loginModal">로그인</a></li>
            </ul>
        </div>
        <nav>f
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
    <script src="js/header.js"></script>
</body>
</html>