<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공공데이터 검색엔진 - 끼니피그</title>
    <script src="https://code.jquery.com/jquery-3.6.3.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Jua&family=Lobster&family=Nanum+Pen+Script&family=Single+Day&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="/css/qnalist.css"/>
    <link rel="stylesheet" href="/css/qnafooter.css"/>
    <link rel="stylesheet" href="/css/header.css"/>
    <script src="/js/qnalist.js"></script>
    <script src="/js/qnafooter.js"></script>


    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Song+Myung&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Cute+Font&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Song+Myung&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">

    <style>
        body, body *{

        }
        .j_qna_content{
            display: none;
        }
        .j_alert_content{
            display: none;
        }
        .j_qna_logoo{
            width: 80px;
            height: 75px;
        }
        .qna_header{
            margin-top: 10px;
        }
        .j_qna_ul,.j_alert_ul{
            font-size: 14px;
            line-height: 1.8;
            color: #222;
            list-style: none;
            -webkit-padding-start: 0px;
        }

        .clear:after{    /* 자식이 모두 float 을 사용할때 부모가 높이를 갖게하기 위함 */
            content:"";
            display:block;
            clear:both;
        }

        .line-break {
            white-space: pre-wrap;
        }
        .hover-div {
            width: 300px;
            height: 200px;
            float: left;
            text-align: center;
        }

        .j_qna_logo {
            margin:10px 0;
            width: 200px;
            height: 200px;
            display: none;
            border-radius: 100px;
            opacity: 0.5;
        }

        .hover-div:hover .j_qna_logo {
            display: inline-block;
        }
    </style>
</head>
<body>
<header>
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
    <div class="m_realheader">
        <div class="m_realheader-container">
            <div class="m_headerlogo-container">
                <img src="/photo/pastachul/chul01.png" alt="로고출력" style="width: 100%; border-radius: 100px;">
            </div>
            <div id="m_headertop-panel" class="m_headeraction-panel">
                <ul class="m_headermain-navigation">
                    <li>
                        <a href="/search" class="m_cover">
                            <span class="text-effect">맛집리스트</span>
                        </a>
                    </li>
                    <li>
                        <a href="/business" class="m_cover">
                            <span class="text-effect">끼니비지니스</span>
                        </a>
                    </li>
                    <li>
                        <a href="/qna/list" class="m_cover">
                            <span class="text-effect" >질문게시판</span>
                        </a>
                    </li>
                    <li>
                        <a href="/userpage" class="m_cover">
                            <span class="text-effect">마이페이지</span>
                        </a>
                    </li>
                </ul>
                <div class="m_headeruser-control">
                    <a href="#" class="m_cover" data-bs-toggle="modal" data-bs-target="#loginModal">Logout</a>
                </div>
            </div>

            <span id="m_headerform-open" class="m_headersearch-toggle">
                    <i class="fa fa-search"></i>
                </span>
            <div class="m_headersearch-holder">
                <form id="m_headeridsearch-form" class="m_headersearch-form">
                    <input type="text" name="qwrd" placeholder="검색어를 입력하세요." class="m_headersearch-input">
                    <button type="submit" id="form-submit" class="m_headersearch-toggle">
                        <i class="fa fa-search"></i>
                    </button>
                    <button type="reset" id="m_headerform-close" class="m_search-close">
                        <i class="fa fa-times"></i>
                    </button>
                </form>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="/js/header.js"></script>
</header>
<section style="width: 100%;">
    <div class="j_qna_allbox" style="margin: 0 auto; width: 1400px;">

        <div class="qna_header clear" style=" width: 1400px;">
            <div style="width: 300px; height: 200px; float: left; text-align: center;" >
                <%--                <img class="j_qna_logo" src="/photo/pastachul/chul01.png" style="margin:10px 0 ; width: 180px; height: 180px; display: none; border-radius: 100px;">--%>
                <div class="hover-div" >
                    <img class="j_qna_logo" src="/photo/pastachul/chul01.png">
                </div>
            </div>
            <div style="width: 1100px; height: 200px; float: left; text-align: center;">
                <img class="j_qna_logoo" src="/photo/gguineapig01.png">
                <h2 style="margin-top: 8px;font-family: 'Song Myung', serif;">질문게시판</h2>
                <p style="font-size:20px;font-family: 'Cute Font', cursive;">끼니피그 서비스 사용 중 궁금한 문의사항을 확인하실 수 있습니다</p>
            </div>
        </div>

        <div class="hongbobox" style="width: 200px; height: 100%; float: left; text-align: center; margin-left: 50px; margin-top: 100px;">
            <div class="qna_banner_imgbox" style="height: 50%; width: 100%; white-space: nowrap; ">
                <img class="qna_banner_img" src="/photo/pastachul/mangata01.jpg" style="height: 440px; width: 100%; border-radius: 10px; ">
            </div>
            <div class="qna_banner_youtube" style="height: 100%; width: 200px; white-space: nowrap; margin-top: 40px;">
                <iframe style="position: relative; transition: all 0.5s ease-in-out; margin-left: 0px; object-fit: cover;" width="100%;" height="100%;" src="https://www.youtube.com/embed/xlseZaiKsTY?autoplay=1&mute=1"
                        title="YouTube video player" frameborder="0"
                        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen loop="1"></iframe>
            </div>
            <div class="banner_end" style="height: 50%; width: 200px; white-space: nowrap; margin-top: 40px;">
                <video autoplay loop muted width="100%" height="100%;" style="object-fit: cover;">
                    <source src="/video/eatingfood02.mp4" type="video/mp4">
                </video>
            </div>
        </div>

        <div class="j_qna_board" style="width: 1000px; height: 100%; margin-left: 320px;
        border: 1px solid whitesmoke; box-shadow: 1px 1px 2px rgba(0, 0, 0, 0.1); padding: 40px;">
            <%--            <section style=" margin: 20px auto;">--%>
            <%--                <form action="temp_login" method="post" style="position: relative;">--%>
            <%--                   확인용 <span> id: ${logindto.user_name} // user_idx: ${logindto.user_idx} // user_type: ${logindto.user_type}</span><br>--%>
            <%--                </form>--%>
            <%--            </section>--%>


            <div class="j_qna_write_link">
                <c:if test="${logindto.user_idx!=0}">
                    <button class="btn btn-sm " type="button" style="background-color:lightblue; color:black; cursor: pointer; margin-left: 91%;" onclick="location.href ='./writeform'">
                        <i class="bi bi-pencil"></i> 글쓰기
                    </button>
                </c:if>
                <hr class="hr-14">
            </div>

            <section id="qna_notice_list">
                <section class="j_alert">
                    <c:forEach var="dto" items="${adminlist}">
                        <c:if test="${dto.user_type==3}">
                            <ul class="j_alert_ul">
                            <li class="j_admin_alert" style="height:30px;">
                                <h4 style="color: black; cursor: pointer; display: flex;">
                                    <span style="max-width: 1000px; margin-left: 10px; color:rgba(247,34,82,1);font-weight: bold" >[공지]</span>
                                    <span style="text-overflow:ellipsis; overflow: hidden; white-space: nowrap;
                                                             max-width: 500px; margin-left: 35px; font-size:20px;font-weight: bold; ">
                                            ${dto.qna_subject}
                                    </span>
                                </h4>
                                <span style="margin-left: 9px;font-family: 'Cute Font', cursive;>by ${dto.writer}  |  <fmt:formatDate value="${dto.qna_writeday}" pattern="yyyy-MM-dd HH:mm"/></span>
                                        <hr class="hr-13">
                            </li>
                        </c:if>
                        <li class="j_alert_content">
                            <div style="width: 5%; height: 100%;" >
                                <img src="/photo/gguineapig02.png" style="width: 30px; height: 30px; margin-left: 10px;">
                            </div>
                            <div style="width: 88%; height: 50%; margin: 0 auto; left: 20%; text-align: center;">
                                <span style="font-size: 1.5em; margin-left: 15px; color: black;" class="line-break">${dto.qna_content}</span>
                                <c:if test="${logindto.user_type==3}">
                                    <i class="bi bi-trash2-fill admin_alertdel" qna_idx="${dto.qna_idx}"
                                       style="cursor: pointer; margin-left: 20px;"></i>
                                </c:if>
                            </div>
                            <hr class="hr-133">
                        </li>
                        </ul>
                    </c:forEach>
                </section>
            </section>

            <section id="qna_question_list">
                <section class="j_question">
                    <c:forEach var="dto" items="${list}">
                        <%--                <c:if test="${dto.user_type!=3}">--%>
                        <ul class="j_qna_ul">
                            <li style="margin: 0px; padding: 0px; left: 0px;">
                                <h5 style="color: black; display: flex; font-size: 1.5em;">
                                <span style="max-width: 1000px; margin-left: 20px; color: rosybrown">Q${no}
                                <c:set var="no" value="${no-1}"/></span>
                                    <c:choose>
                                        <c:when test="${dto.qna_ispass == true}">
                                            <%-- 비밀글에 대한 접근 제어 로직 --%>
                                            <c:choose>
                                                <c:when test="${logindto.user_type == 3 or dto.user_idx ==  logindto.user_idx}">
                                                    <%-- 비밀글에 접근 가능한 사용자 --%>
                                                    <span style="text-overflow:ellipsis; overflow: hidden; white-space: nowrap; max-width: 1000px; margin-left: 35px; color: dimgrey; cursor: pointer;"
                                                          class="j_qna_user_question" onclick="answerread(${dto.qna_idx})">
                                                  <img src="/photo/pigrock.png" style="width: 18px; height: 18px;">
                                                    ${dto.qna_subject}
                                                  <img src="/photo/pigrock.png" style="width: 18px; height: 18px;">
                                            </span>
                                                </c:when>
                                                <c:otherwise>
                                                    <%-- 비밀글에 접근 불가능한 사용자 --%>
                                                    <span style="text-overflow:ellipsis; overflow: hidden; white-space: nowrap; max-width: 1000px; margin-left: 35px; color: dimgrey; cursor: pointer;">
                                             <img src="/photo/pigrock.png" style="width: 18px; height: 18px;">
                                                     관리자와 유저만의 비밀 글입니다
                                             <img src="/photo/pigrock.png" style="width: 18px; height: 18px;">
                                            </span>
                                                </c:otherwise>
                                            </c:choose> <%-- 수정: </c:choose> 추가 --%>
                                        </c:when>

                                        <c:otherwise>
                                    <span style="text-overflow:ellipsis; overflow: hidden; white-space: nowrap; max-width: 1000px; margin-left: 35px; color: dimgrey; cursor: pointer;"
                                          class="j_qna_user_question"  onclick="answerread(${dto.qna_idx})" >
                                            ${dto.qna_subject}
                                    </span>
                                        </c:otherwise>
                                    </c:choose>

                                    <c:if test="${dto.getAnswerCount!=0}">
                                        <img src="/photo/gguineapig.png" style="width: 20px; height: 20px; margin-left: 28px; margin-top: 7px;">
                                        <span style="font-size: 16px; margin-left: 8px; margin-top: 7px; font-family: 'Gamja Flower';">답변&nbsp;끼니
                                    <span style="color: red; font-size: 11px;">[ ${dto.getAnswerCount} ]</span></span><br>

                                    </c:if>
                                </h5>
                                <span style="margin-left: 9px;font-family:'Gamja Flower'">by ${dto.writer}  |  <fmt:formatDate value="${dto.qna_writeday}" pattern="yyyy-MM-dd HH:mm"/>  |
                            <c:if test="${dto.qna_ispass==true}">
                                <i class="bi bi-lock-fill" style="font-size: 13px;"> 비밀 </i>
                            </c:if>
                                <hr class="hr-177">
                        </span>
                            </li>
                                <%--                </c:if>--%>

                            <li class="j_qna_content">
                                <div style="width: 5%; height: 100%;" >
                                    <img src="/photo/gguineapig02.png" style="width: 30px; height: 30px; margin-left: 10px;">
                                </div>

                                <div style="width: 88%; height: 50%; margin: 0 auto; left: 20%;">
                                    <span style="font-size: 1.5em; margin-left: 15px; color: cornflowerblue;">${dto.qna_content}</span>
                                    <c:if test="${dto.user_idx==logindto.user_idx || logindto.user_type==3}">
                                        <i class="bi bi-trash2-fill uesr_qnadel" qna_idx="${dto.qna_idx}"
                                           style="cursor: pointer; margin-left: 20px;"></i>
                                    </c:if>
                                </div>
                                <img src="../photo/re.png" style="margin-left: 100px; margin-top: 10px;"><br>
                                <img src="/photo/gguineapig.png" style="width: 30px; height: 30px; margin-left: 130px; margin-top: 10px;">
                                <div class="j_answerPrint" style=" width: 75%; height: 20%; margin: 0 200px;">
                                </div>
                                <hr class="hr-177">
                                <c:if test="${logindto.user_type==3}">
                                    <div class="j_answer_InsertBox" style="width: 600px; height: 150px; margin-left: 200px; margin-top: 25px;" >
                                        <div name="j_aboardInsert">
                                            <h5>관리자는 위의 질문에 답변하라!</h5>

                                            <textarea class="form-control" id="j_aboardContent${dto.qna_idx}" name="answer_content"></textarea>

                                            <button type="button" class="btn btn-outline-dark" style="position: relative; right: -86%"
                                                    onclick="answerinsert(${dto.qna_idx})">답변 작성</button>
                                        </div>
                                    </div>
                                    <hr class="hr-133">
                                </c:if>
                            </li>
                        </ul>
                    </c:forEach>
                </section>
            </section>
            <!-- 페이징 처리 -->
            <div style="width: 400px; text-align: center;  font-size: 20px; margin: 0 auto;">
                <!-- 이전 -->
                <c:if test="${startPage > 1}">
                    <a style="color: black; text-decoration: none; cursor: pointer;" href="list?currentPage=${startPage-1}">이전</a>
                </c:if>
                <c:if test="${startPage <= 1}">
                    <a style="color: black; text-decoration: none; cursor: pointer; visibility: hidden;" href="list?currentPage=${startPage-1}">이전</a>
                </c:if>
                <!-- 페이지 번호 출력 -->
                <c:forEach var="pp" begin="${startPage}" end="${endPage}">
                    <c:if test="${currentPage == pp }">
                        <a style="color: green; text-decoration: none; cursor: pointer; margin-right: 25px;" href="list?currentPage=${pp}">${pp}</a>
                    </c:if>
                    <c:if test="${currentPage != pp }">
                        <a style="color: black; text-decoration: none; cursor: pointer; margin-right: 25px;" href="list?currentPage=${pp}">${pp}</a>
                    </c:if>
                </c:forEach>
                <!-- 다음 -->
                <c:if test="${endPage < totalPage}">
                    <a style="color: black; text-decoration: none; cursor: pointer;" href="list?currentPage=${endPage+1}">다음</a>
                </c:if>
                <c:if test="${endPage >= totalPage}">
                    <a style="color: black; text-decoration: none; cursor: pointer; visibility: hidden;" href="list?currentPage=${endPage+1}">다음</a>
                </c:if>
            </div>
        </div>
    </div>
    <div style="clear: both;"></div>
</section>
<footer style="margin-top: 50px;">
    <%@ include file="qnafooter.jsp" %>
</footer>
<script>
    //토글
    $(document).ready(function() {
        $(document).on('click', 'span.j_qna_user_question', function() {
            // 현재 클릭된 질문에 대한 답변 div를 슬라이드로 열거나 닫기
            $(this).closest('ul').find('.j_qna_content').slideToggle("fast");
            // 다른 질문의 답변은 닫기 (선택 사항)
            $(this).closest('ul').siblings().find('.j_qna_content').slideUp("fast");
        });

        $(document).on('click', 'li.j_admin_alert', function() {
            // 현재 클릭된 질문에 대한 답변 div를 슬라이드로 열거나 닫기
            $(this).siblings('.j_alert_content').slideToggle("fast");
            // 다른 질문의 답변은 닫기 (선택 사항)
            $('.j_alert_content').not($(this).siblings('.j_alert_content')).slideUp("fast");
        });

    });

    //유저 질문삭제
    $(document).on("click",".uesr_qnadel",function (e){
        let b=confirm("해당 질문을 삭제하시렵니까?");
        if(b){
            let qna_idx=$(this).attr("qna_idx");

            $.ajax({
                type:"get",
                url:"./delete",
                data: {"qna_idx":qna_idx},
                dataType: "text",
                success:function (){
                    alert("삭제되었습니다");
                    location.href='./list?currentPage='+${currentPage};
                }
            });
        }
    });

    // 공지삭제
    $(document).on("click",".admin_alertdel",function (e){
        let b=confirm("해당 질문을 삭제하시렵니까?");
        if(b){
            let qna_idx=$(this).attr("qna_idx");

            $.ajax({
                type:"get",
                url:"./delete",
                data: {"qna_idx":qna_idx},
                dataType: "text",
                success:function (){
                    alert("삭제되었습니다");
                    location.href='./list?currentPage='+${currentPage};
                }
            });
        }
    });

    //답변삭제
    $(document).on("click",".answerdel",function (e){
        e.preventDefault();
        let b=confirm("해당 답변을 삭제하시렵니까?");
        if(b){
            let qna_idx=$(this).attr("qna_idx");
            let answer_idx=$(this).attr("answer_idx");


            $.ajax({
                type:"post",
                url:"./ansdelete",
                data: {"qna_idx":qna_idx,"answer_idx":answer_idx},
                success:function (res){
                    alert("삭제되었습니다");
                    answerread(qna_idx);
                }
            });
        }
    });

    //답변 인서트
    function answerinsert(qna_idx){
        // let form = $("form[name=j_aboardInsert]")[0];
        let answerContent=$("#j_aboardContent"+qna_idx).val();
        let formData = new FormData();

        formData.append("qna_idx", qna_idx);
        formData.append("answer_content",answerContent);

        $.ajax({
            type: "post",
            url: "./insertanswer",
            data: formData,
            processData:false,
            contentType:false,
            success: function (res){
                console.log(qna_idx);
                $("#j_aboardContent"+qna_idx).val("");
                answerread(qna_idx); //답변 읽기
            },
            error: function (xhr, status, error){
            }
        });
    }

    //답변 읽기
    function answerread(qna_idx){
        $.ajax({
            type: "get",
            url: "./answerlist/"+qna_idx,
            dataType: "json",
            success: function (res){
                let s="";
                $.each(res,function (idx,ele){
                    s+=`
                              <div style="font-size: 20px; color: maroon;">
                                 \${ele.answer_content}
                                <c:if test="${dto.user_idx==logindto.user_idx || logindto.user_type==3}">
                                     <i class="bi bi-trash2-fill answerdel" qna_idx="\${ele.qna_idx}" answer_idx="\${ele.answer_idx}"
                                     style="cursor: pointer; margin-left: 20px;"></i>
                                </c:if>
                               </div>
                   `;
                });
                $("div.j_answerPrint").html(s);
            },
            error: function (xhr, status, error){
                console.log(error);
            }
        });
    }
</script>
</body>