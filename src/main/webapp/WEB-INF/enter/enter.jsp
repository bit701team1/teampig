<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공공데이터 검색엔진 - 끼니피그</title>
    <script src="https://code.jquery.com/jquery-3.6.3.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Jua&family=Lobster&family=Nanum+Pen+Script&family=Single+Day&display=swap"
          rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <link rel="stylesheet" type="text/css" href="style.css">
    <link rel="stylesheet" href="/css/enter.css" />
    <%--    <script src="/js/enter.js"> </script>--%>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <%--    <script src="/js/slideshow.js"></script>--%>

    <!--모달-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="/css/login.css">

    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>

    <style>
        body, body * {
            font-family: 'Jua';
        }
        .clear:after{
            content:"";
            display:block;
            clear:both;
        }
    </style>
</head>
<script>
    function playAudio() {
        var audio = document.getElementById("audio");
        audio.play();
        audio.controls = false;
    }
    $(function() {

        //login시 enter키 이벤트
        $(document).on('keyup',"#s_password", function (event){
            if (event.keyCode === 13) {  // Enter 키가 눌렸을 때
                event.preventDefault(); // 기본 동작 방지
                $(".btn_login").click(); // login button 클릭
            }
        });




        $("#s_login").click(function() {
            let id = $("#s_id").val();
            let password = $("#s_password").val();

            var form = new FormData();
            form.append("id", id);
            form.append("password", password);

            $.ajax({
                type: "post",
                url: "./loginaction",
                processData: false,
                contentType: false,
                data: form,
                dataType: "text",
                success: function(res) {
                    // 해당 user_idx가 food_list 테이블에 존재하는지 확인하는 AJAX 요청
                    if (res == 1) {
                        window.location.href = "business";
                    } else {
                        alert("아이디 또는 비밀번호가 일치하지 않습니다.")
                        // $("#s_alert").html("아이디 또는 비밀번호가 일치하지 않습니다.");
                    }
                }
            });
        });
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
                                    //location.reload();
                                    window.location.href="/enter";
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
                            window.location.href="/enter";
                        }
                    }
                }
            });
        });
    });

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

        <div class="j_bg_box clear">
            <video id="entervideo" autoplay loop muted>
                <source src="/video/enterfoodinfo.mp4" type="video/mp4">
            </video>
            <%--            <div style="float: left; width: 50%; height: 100%; float: left" >--%>
            <%--                <img id="bg_l_img" src="/photo/pastachul/j_enter_user_0.png" style="width: 100%; height: 100%; left: 25%; ">--%>
            <%--            </div>--%>
            <%--            <div style="width: 50%; margin-left: 710px; height: 100%; float: left">--%>
            <%--                <img id="bg_r_img" src="/photo/pastachul/j_enter_oner_0.jpg" style="width: 100%; height: 100%; right: 25%; ">--%>
            <%--            </div>--%>
            <button type="button" class="btn btn-secondary btn-sm j_enter_welcome_btn" data-bs-toggle="modal" data-bs-target="#loginModal">Welcome GGuineapig</button>

        </div>
    </div>
    <!-- The Modal -->
    <div class="modal fade" id="loginModal">
        <div class="modal-dialog" >
            <div class="modal-content" style="background-color: transparent; border:transparent;" >

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
        /* ----------Click on login and Sign Up to  changue and view the effect-------------*/
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
                                        $("#user_name").val(kakao_account.profile.nickname);
                                        $("#user_name").attr("readonly", true);
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

        var redirectUrl ; // Get the previous URL
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
            $("#user_name").val(n_name);
            $("#user_name").attr("readonly", true);
            change_to_sign_up();
        }
    </script>
    </script>

</section>


