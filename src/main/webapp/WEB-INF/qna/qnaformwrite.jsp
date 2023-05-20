<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--<%@ include file="../mainlayout/header.jsp"%>--%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <%-- <meta http-equiv="Refresh" content="10;url=./list"> <!-- 10초에 한 번씩  -->--%>
    <title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-3.6.3.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Jua&family=Lobster&family=Nanum+Pen+Script&family=Single+Day&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="/css/qnawriteform.css" />
    <link rel="stylesheet" href="/css/footer.css" />
    <link rel="stylesheet" href="/css/header.css" />
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    <script src="/js/qnawriteform.js"> </script>
    <script src="/js/qnafooter.js"></script>
    <script src="/js/header.js"></script>
    <style>
        body, body *{
            font-family: 'Jua';
        }
        .j_qna_header{
            margin: 0 auto;
        }
        .j_qna_logo{
            width: 80px;
            height: 75px;
        }
        .qna_write_header{
            margin-top: 10px;
        }
    </style>
</head>
<body style="overflow: auto;">
<c:if test="${sessionScope.user_idx==null}">
    <script>
        alert("로그인 먼저 해주세요")
    </script>
</c:if>
<header class="j_qna_header" style="height: 90px;">
    <%@ include file="../mainlayout/header.jsp" %>
</header>
<%--border: 2px solid red;--%>
<section style="width: 100%;">
    <div class="j_qna_write_box" style="margin: 0 auto; width: 1400px; border: 5px solid orange;">

        <div class="qna_write_header text-center" style=" width: 100%; margin-top: 10px;">
            <img class="j_qna_logo" src="/photo/gguineapig01.png">
            <h2 style="margin-top: 8px; ">뭐든지 물어보아요! 질문 들어와 들어와</h2>
            <p>끼니피그 서비스 사용 중 궁금한 문의사항을 확인하실 수 있습니다</p>
            <hr class="hr-14">
        </div>

        <div class="hongbobox" style="width: 200px; height: 100%; margin-left: 45px; float: left">
            <section style="width: 95%; height: 100%; float: left; text-align: center; margin-left: 5px; margin-top: 20px;">
                <div class="qna_banner_imgbox" style="height: 50%; width: 100%; white-space: nowrap; ">
                    <img class="qna_banner_img" src="/photo/mangata01.jpg" style="height: 440px; width: 100%; border-radius: 10px; ">
                </div>
                <div class="qna_banner_youtube" style="height: 100%; width: 100%; white-space: nowrap; margin-top: 40px;">
                    <iframe style="position: relative; transition: all 0.5s ease-in-out; margin-left: 0px; object-fit: cover;" width="100%;" height="100%;" src="https://www.youtube.com/embed/xlseZaiKsTY?autoplay=1&mute=1"
                            title="YouTube video player" frameborder="0"
                            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen loop="1"></iframe>
                </div>
                <div class="banner_end" style="height: 50%; width: 100%; white-space: nowrap; margin-top: 40px;">
                    <video autoplay loop muted width="100%" height="100%;" style="object-fit: cover;">
                        <source src="/video/eatingfood02.mp4" type="video/mp4">
                    </video>
                </div>
            </section>
        </div>

        <div class="j_qna_writeboard" style="width: 1000px; height: 100%; margin-left: 300px;">
            <section class="j_write_form">
                <div style="width: 98%; margin: 10px auto">
                    <div type="hidden" action="insert" method="post">
                        <%-- hidden --%>
                        <input type="hidden" name="qna_idx" value="${qna_idx}">
                        <input type="hidden" name="qna_ref" value="${qna_ref}">
                        <input type="hidden" name="qna_step" value="${qna_step}">
                        <input type="hidden" name="qna_depth" value="${qna_depth}">
                        <input type="hidden" name="currentPage" value="${currentPage}">
                        <input type="hidden" name="is_pass" value="">

                        <%--      --%>
                        <div id="j_write_alert" style="text-align: center; margin-top: 30px;">
                            <c:if test="${qna_idx==0}">
                                <h2>손 들고 질문하기</h2>
                                <hr class="hr-133">
                            </c:if>
                        </div>

                        <div class="j_write_from j_nickname_form" style=" width: 100%; margin: 10px auto; float: left;">
                            <div class="row" style="; width: 100%; margin: 10px auto; ">
                                <label style="float: left; width: 15%; margin-left: 15px; margin-top: 10px; margin-bottom: 10px; font-size: 20px; line-height: 50px;">
                                    작성자
                                </label>
                                <div style="width: 35%;  margin-left: 15px; margin-top: 15px; margin-bottom: 10px;">
                                    <input type="text" class="form-control" name="writer" value="${sessionScope.id}" required="required" style="font-size: 20px; ">
                                </div>
                            </div>
                            <hr class="hr-133">
                        </div>

                        <div class="j_write_from j_subject_form" style="width: 100%;  margin: 10px auto;">
                            <div class="row" style="width: 100%; margin: 10px auto; ">
                                <label style="float: left; width: 15%; margin-left: 15px; margin-top: 10px; margin-bottom: 10px; font-size: 20px; line-height: 50px;">
                                    제목
                                </label>
                                <div style="width: 60%;  margin-left: 15px; margin-top: 15px; margin-bottom: 10px;">
                                    <input type="text" class="form-control" name="qna_subject" value="${dto.qna_subject}" required="required" style="font-size: 20px; ">
                                </div>
                            </div>
                            <hr class="hr-133">
                        </div>

                        <%--       지울부분 --%>
                        <div class="j_write_from j_nickname_form" style=" width: 100%; margin: 10px auto; float: left;">
                            <div class="row" style="width: 100%; margin: 10px auto; ">
                                <label style="float: left; width: 15%; margin-left: 15px; margin-top: 10px; margin-bottom: 10px; font-size: 20px; line-height: 50px;">
                                    유저타입
                                </label>
                                <div style="width: 35%;  margin-left: 15px; margin-top: 15px; margin-bottom: 10px;">
                                    <input type="text" class="form-control" name="user_type" value ="${dto.user_type}" required="required" style="font-size: 20px; ">
                                </div>
                            </div>
                            <hr class="hr-133">
                        </div>

                        <div class="j_write_from j_nickname_form" style=" width: 100%; margin: 10px auto; float: left;">
                            <div class="row" style="width: 100%; margin: 10px auto; ">
                                <label style="float: left; width: 15%; margin-left: 15px; margin-top: 10px; margin-bottom: 10px; font-size: 20px; line-height: 50px;">
                                    유저인덱스
                                </label>
                                <div style="width: 35%;  margin-left: 15px; margin-top: 15px; margin-bottom: 10px;">
                                    <input type="text" class="form-control" name="user_idx" value ="${dto.user_idx}" required="required" style="font-size: 20px; ">
                                </div>
                            </div>
                            <hr class="hr-133">
                        </div>

                        <%--       지울부분 --%>
                        <div class="j_write_from j_open_form" style="width: 100%; margin: 10px auto;">
                            <div class="row" style="width: 100%; margin: 10px auto; ">
                                <label style="float: left; width: 15%; margin-left: 15px; margin-top: 10px; margin-bottom: 10px; font-size: 20px; line-height: 30px;">
                                    공개 설정
                                </label>
                                <div style="width: 35%;  margin-left: 15px; margin-top: 15px; margin-bottom: 10px;">
                                    <input type="radio" id="is_pass_open" name="qna_ispass" value="false" checked>
                                    <label for="is_pass_open">누구나 보기</label>
                                    <c:if test="${dto.user_type!=3 && sessionScope.user_type!=3}">
                                        <input type="radio" id="is_pass_close" name="qna_ispass" value="true">
                                        <label for="is_pass_close">나만 보기</label>
                                    </c:if>
                                    <div style="display: none;" id="pwfield" >
                                        <input type="password"  class="form-control" name="qna_pass"
                                               style="font-size: 15px;">
                                    </div>
                                </div>
                            </div>
                        </div>
                            <hr class="hr-133">

                        <div class="j_write_from j_subject_form" style="width: 100%;  margin: 10px auto;">
                            <div class="row" style="width: 100%; margin: 10px auto; ">
                                <textarea style="width: 80%; margin: 10px auto;  height: 200px;" name="qna_content" required  class="form-control"></textarea>
                            </div>
                        </div>
                        <hr class="hr-133">

                        <div class="j_write_from j_subject_form" style="width: 100%;  margin: 10px auto;">
                            <div class="row" style="width: 50%; margin: 10px auto; ">
                                <div style="float: left; width: 30%;  margin-top: 15px; margin-bottom: 10px; margin-left: 100px;">
                                    <button type="submit" class="btn btn-outline-success btnclick" >글 저장</button>
                                </div>
                                <div style="width: 30%; left: 0; margin-top: 15px; margin-bottom: 10px; margin-left: 5px;">
                                    <button type="button" class="btn btn-outline-success"
                                            onclick="history.back()">목록으로</button>
                                </div>
                            </div>
                        </div>

                    </div>
                    <hr class="hr-14">
                </div>
            </section>
            <div style="clear: both;"></div>
        </div>
    </div>
</section>

<footer style="margin-top: 50px; margin: 10px auto;">
    <%@ include file="qnafooter.jsp" %>
</footer>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    $('input[name="qna_ispass"]').on('click', function() {
        if ($(this).val() == 'true') {
            $('#pwfield').show();
            $('input[name="qna_ispass"]').attr('required', true);
        } else {
            $('#pwfield').hide();
            $('input[name="qna_ispass"]').removeAttr('required');
        }
    });
</script>
</body>
</html>