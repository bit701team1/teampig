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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="css/business.css">
    <link rel="stylesheet" href="/css/login.css">
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>

    <style>

    </style>
</head>
<c:set var="root" value="<%=request.getContextPath() %>"/>
<script type="text/javascript">
    $(function(){
        $("#s_login").click(function(){
            let id=$("#s_id").val();
            let password=$("#s_password").val();

            var form=new FormData();
            form.append("id", id);
            form.append("password", password);

            $.ajax({
                type: "post",
                url: "./loginaction",
                processData:false,
                contentType:false,
                data: form,
                dataType:"text",
                success: function (res) {
                    if(res==1)
                    {
                        window.location.href="business";
                    }else{
                        document.querySelector("#s_alert").html("아이디 또는 비밀번호가 일치하지 않습니다.");
                    }
                }//success function 끝
            })//ajax 끝
        })//로그인버튼 끝
    });


    $(function (){
        $("#signup").click(function(){
            let email = $("#email").val();
            let id = $("#id").val();
            let password = $("#password").val();
            let user_name = $("#user_name").val();
            let user_type = $("#user_type").val();

            var formData = {
                "email": email,
                "id": id,
                "password": password,
                "user_name": user_name,
                "user_type": user_type
            };
            $.ajax({
                type: "GET",
                url: "/isIdAvailable",
                data: {id: id},
                success: function (isAvailable) {
                    if(isAvailable==1){
                        alert("이미 가입된 아이디입니다");
                        return false;
                    }else{
                        //Display confirmation dialog
                        if (confirm("회원가입하시겠습니까?")) {
                            // User clicked "OK" - proceed with form submission
                            $.ajax({
                                type: "post",
                                url: "./insert",
                                data: {"email":email,"id":id,"password":password,"user_name":user_name,"user_type":user_type},
                                dataType: "text",
                                success: function(res) {
                                    console.log("회원가입 완료");

                                    // 회원가입이 성공적으로 처리되면 원하는 작업을 수행할 수 있습니다.
                                    location.reload();
                                },
                                error: function(xhr, status, error) {
                                    console.log("회원가입 오류");
                                    console.log("Status:"+status);
                                    console.log("error:"+error);
                                    console.log(xhr.responseText);
                                }
                            });
                        } else {
                            // User clicked "Cancel" - refresh the page
                            location.reload();
                        }
                    }
                }
            });
            // Display confirmation dialog
            // if (confirm("Are you sure you want to submit the form?")) {
            //     // User clicked "OK" - proceed with form submission
            //     $.ajax({
            //         type: "post",
            //         url: "./insert",
            //         data: {"email":email,"id":id,"password":password,"user_name":user_name,"user_type":user_type},
            //         dataType: "text",
            //         success: function(res) {
            //             console.log("회원가입 완료");
            //
            //             // 회원가입이 성공적으로 처리되면 원하는 작업을 수행할 수 있습니다.
            //             location.reload();
            //         },
            //         error: function(xhr, status, error) {
            //             console.log("회원가입 오류");
            //             console.log("Status:"+status);
            //             console.log("error:"+error);
            //             console.log(xhr.responseText);
            //         }
            //     });
            // } else {
            //     // User clicked "Cancel" - refresh the page
            //     location.reload();
            // }
        });
    });

</script>
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
                <li><a href="${root}/home2">마이페이지</a></li>
                <c:choose>
                    <c:when test="${sessionScope.loginok=='yes'}">
                        <li><a href="#"   onclick="location.href='./logout'">로그아웃</a></li>

                    </c:when>
                    <c:otherwise>
                        <li><a href="#"  data-bs-toggle="modal" data-bs-target="#loginModal">로그인</a></li>
                    </c:otherwise>

                </c:choose>
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
                                            <input type="text" placeholder="id" id="s_id"/>
                                            <input type="password" placeholder="Password" id="s_password"/>
                                            <button class="btn_login" onclick="change_to_login()" id="s_login">LOGIN</button><br>

                                            <a id="naver-login-btn" href="#" role="button" class="naverLogin">
                                                <div id="naverIdLogin" ></div><!--naver button 영역-->
                                            </a>
                                            <a href="javascript:kakaoLogin();"><img src='${root}/photo/kakao.png' width="100px" height="37px" style="margin-top: 5px;"></a>

                                            <form id="form-kakao-login" method="post" action="kakao-login">
                                                <input type="hidden" name="email"/>
                                                <input type="hidden" name="name"/>
                                                <input type="hidden" name="img"/>
                                            </form>
                                        </div>
                                        <div class="cont_form_sign_up">
                                            <a href="#" onclick="hidden_login_and_sign_up()"><i class="bi bi-x-lg" style=
                                                    "position: relative; bottom:50px;"></i></a>

                                            <h2>SIGN UP</h2>
                                            <input type="text" name="email" id="email" placeholder="Email"/>
                                            <input type="text" name="id" id="id" placeholder="id" />
                                            <input type="password" name="password" id="password" placeholder="Password" />
                                            <input type="text" name="user_name" id="user_name" placeholder="name" />

                                            <br>
                                            <select class="form-select" name="user_type" id="user_type">
                                                <option value="" selected disabled>선택</option>
                                                <option value="1">일반 사용자</option>
                                                <option value="2">사장님</option>
                                                <option value="3">관리자</option>
                                            </select>
                                            <button class="btn_sign_up" type="button" id="signup">SIGN UP</button>
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

    //카카오 관련
    window.Kakao.init("4d6b82467bdefbaaed27526fdc7aecbe");// 어떤 웹앱으로 연결될지

    function kakaoLogin() {
        window.Kakao.Auth.login({
            scope: 'profile_nickname, account_email',//카카오로부터 받아올 정보
            //로그인에 성공할 경우 콜백함수 작동, authObj: 받아온 오브젝트 데이터
            success: function (authObj) {
                console.log(authObj);
                window.Kakao.API.request({
                    url: '/v2/user/me',//혅재 로그인한 사용자의 정보를 가지고 옴.
                    success: res => {
                        var kakao_account = res.kakao_account;//account정보 가져옴
                        console.log(kakao_account);
                        console.log(kakao_account.email);
                        console.log(kakao_account.profile.nickname);

                        $.ajax({
                            type: "post",
                            url: "/emailcheck",
                            dataType: "text",
                            data: {"email": kakao_account.email, "name": kakao_account.profile.nickname},
                            success: function (res) {
                                if(res==0)
                                {
                                    alert("회원이 아닙니다. 회원가입해주세요!");

                                    $("#s_signup").html("추가정보를 입력해주세요");
                                    $("#email").val(kakao_account.email);
                                    $("#email").attr("readonly", true);
                                    console.log(kakao_account.profile.nickname);
                                    $("#name").val(kakao_account.profile.nickname);
                                    $("#name").attr("readonly", true);
                                    change_to_sign_up();

                                }
                                else{
                                    window.location.href='snsloginaction?email='+kakao_account.email;
                                }

                            }//success function 끝
                        });//ajax 끝
                    }//success 끝
                })
            }
        })
    }

    //네이버 관련
    //네이버 아이디로그인 초기화 script
    var naverLogin =new naver.LoginWithNaverId({
        clientId:"KMw1CKJNqR_tTHgOY5np",
        callbackUrl: "http://localhost:9000/auth/naver/callback", //callback ur
        loginButton: {color: "green", type:2, height: 40},//로그인 버튼의 타입 지정
        //isPopup: true,
        callbackHandle: true//callback 페이지가 분리되었을 경우 콜백 페이지에서는 콜백 처리를 바꿀 수있도록 설정
    });

    naverLogin.init();//설정정보 초기화 연ㄷ동 준비

    //이 페이지가 정상적으로 다 로드되었을 때 해당 함수를 실행할 것.


    // 모달 표시 함수
    function showLoginModal() {
        const modal = new bootstrap.Modal(document.getElementById('loginModal'));
        modal.show();
    }
    var urlParams=new URLSearchParams(window.location.search);
    var n_email=urlParams.get('n_email');
    var n_name=urlParams.get('n_name');
    //받아온 이메일과 네임 값이 존재할 경우 모달을 띄우고 change to sign up 함수 호출
    if(n_email&&n_name){
        //모달 띄우기
        showLoginModal();
        change_to_sign_up();
        $("#s_signup").html("추가정보를 입력해주세요");
        $("#email").val(n_email);
        $("#email").attr("readonly", true);
        $("#name").val(n_name);
        $("#name").attr("readonly", true);
        change_to_sign_up();
    }
</script>
</body>
</html>