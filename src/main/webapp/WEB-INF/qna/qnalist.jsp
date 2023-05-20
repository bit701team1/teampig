<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-3.6.3.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Jua&family=Lobster&family=Nanum+Pen+Script&family=Single+Day&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="/css/qnalist.css" />
    <link rel="stylesheet" href="/css/qnafooter.css" />
    <link rel="stylesheet" href="/css/header.css" />
    <script src="/js/qnalist.js"> </script>
    <script src="/js/qnafooter.js"></script>
    <script src="/js/header.js"></script>

    <style>
        body, body *{
            font-family: 'Jua'
        }
        .j_qna_content{
            display: none;
        }
        .j_alert_content{
            display: none;
        }
        .j_qna_header{
            margin: 0 auto;
        }
        .j_qna_logo{
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
    </style>
</head>
<body>
<header class="j_qna_header" style="height: 90px;">
    <%@ include file="../mainlayout/header.jsp" %>
</header>
<section style="width: 100%;">
    <div class="j_qna_allbox" style="margin: 0 auto; width: 1400px;">

        <div class="qna_header clear" style=" width: 1400px;">
            <div style="width: 300px; height: 200px; float: left; text-align: center;" >
                <img class="j_qna_logo" src="/photo/pastachul/chul01.png" style="margin:10px 0 ; width: 180px; height: 180px; opacity: 0.4; border-radius: 100px;">
            </div>
            <div style="width: 1100px; height: 200px; float: left; text-align: center;">
                <img class="j_qna_logo" src="/photo/gguineapig01.png">
                <h2 style="margin-top: 8px; ">질문게시판</h2>
                <p>끼니피그 서비스 사용 중 궁금한 문의사항을 확인하실 수 있습니다</p>
            </div>
        </div>

        <div class="hongbobox" style="width: 200px; height: 100%; float: left; text-align: center; margin-left: 50px; margin-top: 100px;">
            <div class="qna_banner_imgbox" style="height: 50%; width: 100%; white-space: nowrap; ">
                <img class="qna_banner_img" src="/photo/pastachul/mangata05.jpg" style="height: 340px; width: 100%; border-radius: 10px; ">
<%--                <img class="qna_banner_img" src="/photo/mangata01.jpg" style="height: 340px; width: 100%; border-radius: 10px; ">--%>
<%--                <img class="qna_banner_img" src="/photo/mangata01.jpg" style="height: 340px; width: 100%; border-radius: 10px; ">--%>
<%--                <img class="qna_banner_img" src="/photo/mangata01.jpg" style="height: 340px; width: 100%; border-radius: 10px; ">--%>
<%--                <img class="qna_banner_img" src="/photo/mangata01.jpg" style="height: 340px; width: 100%; border-radius: 10px; ">--%>
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
                    <i class="bi bi-pencil"></i> 글 쓰기
                </button>
                </c:if>
                <hr class="hr-14">
            </div>

            <section id="qna_notice_list">
                <section class="j_alert">
                    <c:forEach var="dto" items="${adminlist}">
                        <c:if test="${dto.user_type==3}">
                            <ul class="j_alert_ul">
                            <li class="j_admin_alert" style="margin: 0px; padding: 0px; left: 0px;">
                                <h4 style="color: black; cursor: pointer; display: flex;">
                                    <span style="max-width: 1000px; margin-left: 10px; color: red;" >[공지]</span>
                                    <span style="text-overflow:ellipsis; overflow: hidden; white-space: nowrap;
                                                             max-width: 500px; margin-left: 35px; ">
                                            ${dto.qna_subject}
                                    </span>
                                </h4>
                                <span style="margin-left: 9px;">by ${dto.writer}  |  <fmt:formatDate value="${dto.qna_writeday}" pattern="yyyy-MM-dd HH:mm"/>  |
                                            user_type : ${dto.user_type}  | user_idx : ${dto.user_idx}  </span>
                                <hr class="hr-13">
                            </li>
                        </c:if>
                        <li class="j_alert_content">
                            <div style="width: 5%; height: 100%;" >
                                <img src="/photo/gguineapig02.png" style="width: 30px; height: 30px; margin-left: 10px;">
                            </div>
                            <div style="width: 88%; height: 50%; margin: 0 auto; left: 20%;">
                                <span style="font-size: 1.5em; margin-left: 15px; color: black">${dto.qna_content}</span>
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
                                <span style="max-width: 1000px; margin-left: 10px; color: rosybrown">Q${no}
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
                                <span style="margin-left: 9px;">by ${dto.writer}  |  <fmt:formatDate value="${dto.qna_writeday}" pattern="yyyy-MM-dd HH:mm"/>  |
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
</html>