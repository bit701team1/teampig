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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="path/to/font-awesome/css/all.min.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-*********" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-*********" crossorigin="anonymous" />


    <link rel="stylesheet" href="/css/realmain.css">
    <link rel="stylesheet" href="/css/footer.css">
    <link rel="stylesheet" href="/css/login.css">

    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>

    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
    <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    <style>
        #k_history_place{
            width: 1500px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        #k_hotplace{
            width: 1500px;
            display: flex;
            justify-content: center;
            align-items: center;
        }
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
                        window.location.href="realmain";
                    }else{
                        document.querySelector("#s_alert").html("아이디 또는 비밀번호가 일치하지 않습니다.");
                    }
                }//success function 끝
            })//ajax 끝
        })//로그인버튼 끝

        //history ajax
        $.ajax({
            type: "get",
            url: "./historyrecommand",
            dataType:"json",
            success: function (res) {
                var s="";
                $.each(res.recommandlist,function (idx, ele){
                    s+=`
                        <div class="col-lg-3 col-md-6 col-sm-6">
                                 <div class="card mb-3 scroll-page">
                                    <img class="card-img-top" src="http://pujmemyrqkys17181384.cdn.ntruss.com/foodphoto/\${ele.photoname}?type=f&w=200&h=200&ttype=png" alt="맛집">
                                        <div class="card-body">
                                            <h5 class="card-title">당신의 1순위 카테고리</h5>
                                            <p class="card-text">\${ele.restrt_NM}</p>
                                            <p class="card-type">#\${ele.food_type}</p>
                                            <div class="frame">
                                                <button class="custom-btn btn-2" onclick="window.location.href='/detail?food_idx='+\${ele.food_idx}">
                                                <a target="_blank"></a>방문하기</button>
                                            </div>
                                        </div>
                                </div>
                        </div>
                    `;
                }); //each1

                $.each(res.secondlist,function (idx, ele) {
                    s += `
                        <div class="col-lg-3 col-md-6 col-sm-6">
                                 <div class="card mb-3 scroll-page">
                                    <img class="card-img-top" src="http://pujmemyrqkys17181384.cdn.ntruss.com/foodphoto/\${ele.photoname}?type=f&w=200&h=200&ttype=png" alt="맛집">
                                        <div class="card-body">
                                            <h5 class="card-title">당신의 2순위 카테고리</h5>
                                            <p class="card-text">\${ele.restrt_NM}</p>
                                            <p class="card-type">#\${ele.food_type}</p>
                                            <div class="frame">
                                                <button class="custom-btn btn-2"><a href="#" target="_blank"></a>방문하기</button>
                                            </div>
                                        </div>
                                </div>
                        </div>
                    `;
                }); //each2

                $("#k_history_place").html(s);
            }//success function 끝
        })//ajax 끝

        $.ajax({
            type: "get",
            url: "./hotplace",
            dataType:"json",
            success: function (res) {
                console.log(res);
                var r="";
                $.each(res,function (idx, ele){
                    r += `
                        <div class="col-lg-3 col-md-6 col-sm-6">
                                 <div class="card mb-3 scroll-page">
                                    <img class="card-img-top" src="http://pujmemyrqkys17181384.cdn.ntruss.com/foodphoto/\${ele.photoname}?type=f&w=200&h=200&ttype=png" alt="맛집">
                                        <div class="card-body">
                                            <h5 class="card-title">`;

                            if(idx==0){
                                r+=`평점순`;
                            }else if(idx ==1){
                                r+=`리뷰순`;
                            } else if(idx ==2){
                                r+=`즐겨찾기순`;
                            } else {
                                r+=`무작위 추천`;
                            }

                    r+=`</h5>
                                            <p class="card-text">\${ele.restrt_NM}</p>
                                            <p class="card-type">#\${ele.food_type}</p>
                                            <div class="frame">
                                                <button class="custom-btn btn-2"><a href="#" target="_blank"></a>방문하기</button>
                                            </div>
                                        </div>
                                </div>
                        </div>
                    `;

                }); //each end

                $("#k_hotplace").html(r);
            }//success function 끝
        })//ajax 끝

        //login시 enter키 이벤트
        $(document).on('keyup',".inputsearch", function (event){
            if (event.keyCode === 13) {  // Enter 키가 눌렸을 때
                event.preventDefault(); // 기본 동작 방지
                $(".k_btnsearch").click(); // login button 클릭
            }
        });

        $(document).on('click',".k_btnsearch", function (event){
            var input = $(".inputsearch").val();

            event.preventDefault(); // 클릭 이벤트의 기본 동작을 중단합니다.
            $.ajax({
                url: "/setsearchsession",
                type: "get",
                dataType:"json",
                data: {"input": input},
                success: function (res) {
                    alert(res);
                },
                error: function (error) {
                    // 요청이 실패한 경우의 동작을 정의합니다.
                    // ...
                    alert("전송 실패");
                }
            });
        });

    }); //$func end


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
<nav class="navbar navbar-dark bg-dark sticky-top navbar-expand-lg fixed-top">
    <a class="navbar-brand" href="#section-a">
        <img src="/photo/mainpage/mainlogo.png" alt="로고 출력 페이지">
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
                <a class="nav-link  text-white" href="userpage">마이페이지</a>
            </li>
            <c:choose>
                <c:when test="${sessionScope.loginok=='yes'}">
                    <li><a href="#"  class="nav-link  text-white" onclick="location.href='./logout'">
                        <i class="fa-solid fa-user-slash fa-2xl"></i>
                        </a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li><a href="#" class="nav-link  text-white" data-bs-toggle="modal" data-bs-target="#loginModal">
                        <i class="fa-regular fa-user fa-2xl"></i>
                        </a>
                    </li>
                </c:otherwise>

            </c:choose>
        </ul>
    </div>
</nav>
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

<!--페이지 1번-->
<section id="section-a">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="about scroll-page">
                    <h1><span class="ityped"></span></h1>
                    <br>
                    <h4>
                        <i class="fa-sharp fa-solid fa-j fa-beat-fade" style="color: #2c4002;"></i>
                        <i class="fa-sharp fa-solid fa-u fa-beat-fade" style="color: #2c4002;"></i>
                        <i class="fa-sharp fa-solid fa-s fa-beat-fade" style="color: #2c4002;"></i>
                        <i class="fa-sharp fa-solid fa-t fa-beat-fade" style="color: #2c4002;"></i>
                        &nbsp;
                        <i class="fa-sharp fa-solid fa-d fa-beat-fade" style="color: #2c4002;"></i>
                        <i class="fa-sharp fa-solid fa-o fa-beat-fade" style="color: #2c4002;"></i>
                        &nbsp;
                        <i class="fa-sharp fa-solid fa-e fa-beat-fade" style="color: #2c4002;"></i>
                        <i class="fa-sharp fa-solid fa-a fa-beat-fade" style="color: #2c4002;"></i>
                        <i class="fa-sharp fa-solid fa-t fa-beat-fade" style="color: #2c4002;"></i>
                        &nbsp;
                        <i class="fa-regular fa-exclamation fa-beat-fade" style="color: #2c4002;"></i>
                        <i class="fa-regular fa-exclamation fa-beat-fade" style="color: #2c4002;"></i>
                        <i class="fa-regular fa-exclamation fa-beat-fade" style="color: #2c4002;"></i>
                    </h4>

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

                                <input type="search" placeholder="키워드 입력" class="search inputsearch" />
                                <button type="button" class="k_btnsearch" list_type="type_search" hidden></button>
                            </button>

                            <div class="close"></div>



                            <div class="nav-items items1">
                                <i class="fa-solid fa-house"><a href="http://localhost:9000/enter"></a></i>
                            </div>
                            <div class="nav-items items2">
                                <i class="fa-solid fa-location-dot"><a href="http://localhost:9000/search"></a></i>
                            </div>
                            <div class="nav-items items3">
                                <i class="fa-solid fa-star"><a href="http://localhost:9000/mypage/writeform"></a></i>
                            </div>
                            <div class="nav-items items4">
                                <i class="fa-solid fa-won-sign"><a href="http://localhost:9000/search"></a></i>
                            </div>

                            <div class="box">
                                <p style="margin-bottom: -5px;">추천검색어</p>
                                <div class="box-line box-line1">
                                    <a href="http://localhost:9000/detail?food_idx=3">#데이트 코스</a>
                                </div>
                                <div class="box-line box-line2">
                                    <a href="http://localhost:9000/detail?food_idx=1">#가성비 맛집</a>
                                </div>
                                <div class="box-line box-line3">
                                    <a href="http://localhost:9000/detail?food_idx=34">#노키즈 존</a>
                                </div>
                                <div class="box-line box-line4">
                                    <a href="http://localhost:9000/detail?food_idx=35">#가족 모임</a>
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

            <div id="k_history_place"></div>
        </div>

        <div class="row">
            <div class="col-lg-12">
                <h1 id="menu-2"><br>&nbsp;</h1>
                <h2 class="text-center pb-3 text-black scroll-page">인기맛집</h2>
            </div>

            <!-- 하단 컨텐츠 -->
            <div id="k_hotplace"></div>
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
                <h1 class="scroll-page text-center info">
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
                </div>





            </form> <!-- </form> 태그 추가 -->

        </div>
    </div>
</section>


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
                            <a href="/WEB-INF/enter/enter.jsp"><img src="photo/footer/cilogo.png" class="img-fluid" alt="logo"></a>
                        </div>
                        <div class="footer-text">
                            <p>술 한잔 마셨습니다... 프로젝트가 미완성이어도 좋습니다. 하지만 '끼니 피그' 하나만 기억해 주세요. 진심을 다해 전합니다. 프로젝트가 별로일 수 있습니다. 밤낮으로 고민하고 코딩했습니다... 최선을 다했고, 열심히 했습니다. 저희 팀의 진심이 느껴지길 바랍니다. 고맙습니다...
                            </p>
                        </div>
                        <div class="footer-social-icon">
                            <span>서포터즈</span>
                            <a href="https://data.gg.go.kr"><img src="photo/footer/ggd.png" class="ggd"></a>
                            <a href="https://openai.com/blog/chatgpt"><img src="photo/footer/aigpt.png"></a>
                            <a href="https://www.data.go.kr"><img src="photo/footer/publicdata.png"></a>
                        </div>
                    </div>
                </div>
                <div class="col-xl-4 col-lg-4 col-md-6 mb-30">
                    <div class="footer-widget">
                        <div class="footer-widget-heading">
                            <h3>전체서비스</h3>
                        </div>
                        <ul>
                            <li><a href="/WEB-INF/business/business.jsp">회사소개</a></li>
                            <li><a href="/WEB-INF/business/business.jsp">비지니스</a></li>
                            <li><a href="#">이용약관</a></li>
                            <li><a href="/WEB-INF/qna/qnalist.jsp">공지사항</a></li>
                            <li><a href="#">고객센터</a></li>
                            <li><a href="#">고객관리</a></li>
                            <li><a href="#">광고서비스운영</a></li>
                            <li><a href="/WEB-INF/qna/qnalist.jsp">문의내역</a></li>
                            <li><a href="#">개인정보처리방침</a></li>
                            <li><a href="#">채용공고</a></li>
                        </ul>
                    </div>
                    <div class="row">
                        <div class="col-xl-12">
                            <div id="slideShow">
                                <div id="slides">
                                    <img src="photo/footer/banner1.png" alt="광고">
                                    <img src="photo/footer/banner5.png" alt="광고">
                                    <img src="photo/footer/banner3.png" alt="광고">
                                    <img src="photo/footer/banner4.png" alt="광고">
                                    <img src="photo/footer/banner2.png" alt="광고">
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
                            <div class="m_input-wrapper">
                                <div class="m_input-group">
                                    <input type="text" placeholder="이메일 주소를 적어주세요">
                                    <button><i class="fab fa-telegram-plane"></i></button>
                                </div>
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
                        <p>Copyright &copy; 2023, All Right Reserved <a href="/WEB-INF/enter/enter.jsp"><b>비트캠프 1조</b></a></p>
                    </div>
                </div>
                <div class="col-xl-6 col-lg-6 d-none d-lg-block text-right">
                    <div class="footer-menu">
                        <ul>
                            <li><a href="/WEB-INF/enter/enter.jsp">입장페이지</a></li>
                            <li><a href="/WEB-INF/search/search.jsp">검색서비스</a></li>
                            <li><a href="/WEB-INF/userpage/myuserpage.jsp">마이페이지</a></li>
                            <li><a href="/WEB-INF/booking/main.jsp">관리페이지</a></li>
                            <li><a href="/WEB-INF/business/business.jsp">비지니스</a></li>
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

<%--
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
--%>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>


<!--페이지 애니메이션 영역-->

<script src="https://cdn.jsdelivr.net/gh/cferdinandi/smooth-scroll@14.2.0/dist/smooth-scroll.min.js"></script>

<script type="text/javascript">
    $(function(){
        var scroll = new SmoothScroll('a[href*="#menu-1"],a[href*="#menu-2"],a[href*="#menu-3"],a[href*="#section-a"]');
    });
</script>

<!--스크롤 애니메이션 영역-->

<script src="https://unpkg.com/scrollreveal@4.0.7/dist/scrollreveal.min.js"></script>
<script>
    ScrollReveal().reveal(".scroll-page", {
        duration: 400, // 애니메이션 지속 시간
        distance: "20px", // 원점으로부터의 거리
        delay: 100, // 애니메이션 딜레이
        interval: 100, // 애니메이션 간격
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
