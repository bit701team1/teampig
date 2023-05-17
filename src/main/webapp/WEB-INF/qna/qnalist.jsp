<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
    <link rel="stylesheet" href="/css/qnalist.css" />
    <script src="/js/qnalist.js"> </script>
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
    </style>
    <script>
    </script>
</head>
<body>
<c:if test="${sessionScope.user_idx==null}">
    <script>
        alert("로그인 먼저 해주세요")
    </script>
</c:if>
<div class="j_qna_board">
    <section class="qna_header text-center">
        <img class="j_qna_logo" src="/photo/gguineapig.png">
        <h2 style="margin-top: 8px;">질문게시판</h2>
        <p>끼니피그 서비스 사용 중 궁금한 문의사항을 확인하실 수 있습니다</p>
    </section>
    <button class="btn btn-sm btn-outline-danger" type="button" style="cursor: pointer; margin-bottom: 10px;" onclick="location.href ='./writeform'">
        <i class="bi bi-pencil"></i>글쓰기
    </button>
    <form action="temp_login" method="post">
        <input type="text" name="id" value="test">
        <input type="int" name="user_idx" value="0">
        <input type="int" name="user_type" value="1">
        <input type="submit" value="임시 로그인"> &nbsp;
        <button type="button" onclick="location.href='temp_logout'">로그아웃</button>
    </form>
    <span> id: ${sessionScope.id} // user_idx: ${sessionScope.user_idx} // user_type: ${sessionScope.user_type}</span><br>
    <h5 style="background-color: lightgoldenrodyellow">총 ${totalCount}개의 글이 있습니다. </h5>
    <h5 style="background-color: lightgoldenrodyellow">총 개의 답글이 있습니다. </h5>



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
                        <hr>
                    </li>
                </c:if>
                <li class="j_alert_content">
                    <img src="/photo/gguineapig02.png" style="width: 30px; height: 30px; margin-left: 10px;">
                    <span style="font-size: 1.5em; margin-left: 35px;">${dto.qna_content}</span>
                    <c:if test="${dto.user_type==sessionScope.user_type}">
                        <i class="bi bi-trash2-fill admin_alertdel" qna_idx="${dto.qna_idx}"
                           style="cursor: pointer; margin-left: 20px;"></i>
                    </c:if>
                    <hr>
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
<%--                    onclick="answerread(${dto.qna_idx})--%>
                    <li style="margin: 0px; padding: 0px; left: 0px;">
                        <h5 style="color: black; display: flex; font-size: 1.5em;">
                                <span style="max-width: 1000px; margin-left: 10px; color: rosybrown">Q${no}
                                <c:set var="no" value="${no-1}"/></span>
                            <c:choose>
                                <c:when test="${dto.qna_ispass == true}">
                                    <%-- 비밀글에 대한 접근 제어 로직 --%>
                                    <c:choose>
                                        <c:when test="${sessionScope.user_type == 3 or sessionScope.user_idx == dto.user_idx}">
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
                        <span style="margin-left: 9px;">by ${dto.writer}  |  <fmt:formatDate value="${dto.qna_writeday}" pattern="yyyy-MM-dd HH:mm"/>
                                            user_type : ${dto.user_type}  | user_idx : ${dto.user_idx}  |
                            <c:if test="${dto.qna_ispass==true}">
                                 <i class="bi bi-lock-fill" style="font-size: 13px;"> 비밀 </i>
                            </c:if>

                        </span>
                        <hr>
                    </li>
<%--                </c:if>--%>

                <li class="j_qna_content">
                    <img src="/photo/gguineapig02.png" style="width: 30px; height: 30px; margin-left: 10px;">
                    <span style="font-size: 1.5em; margin-left: 35px; color: cornflowerblue;">${dto.qna_content}</span>
                    <c:if test="${dto.user_idx==sessionScope.user_idx || sessionScope.user_type==3}">
                        <i class="bi bi-trash2-fill uesr_qnadel" qna_idx="${dto.qna_idx}"
                           style="cursor: pointer; margin-left: 20px;"></i>
                    </c:if>

                    <br>
                    <img src="../photo/re.png" style="margin-left: 100px;"><br>
                    <img src="/photo/gguineapig.png" style="width: 30px; height: 30px; margin-left: 130px; margin-top: 10px;"><br>
                    <span class="j_answerPrint"></span>

                    <c:if test="${dto.user_idx!=null and sessionScope.user_type==3}">
                        <div class="j_answer_InsertBox" style="width: 600px; margin-left: 200px; margin-top: 10px;" >
                            <form name="j_aboardInsert" id="j_aboardInsert_x">
                                <h5>관리자는 위의 질문에 답변하라!</h5>

                                <textarea class="form-control" id="j_aboardContent${dto.qna_idx}" name="answer_content"></textarea>

                                <button type="button" class="btn btn-outline-dark" style="position: relative; right: -86%"
                                        onclick="answerinsert(${dto.qna_idx})">답변 작성</button>
                            </form>
                        </div>
                        <hr>
                    </c:if>
                </li>
                </ul>
            </c:forEach>
        </section>
    </section>
</div>

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
                              <span style="left: 0; white-space: pre-wrap; font-size: 20px; color: maroon">
                                \${idx+1}. \${ele.answer_content}</span>
                                <c:if test="${dto.user_idx==sessionScope.user_idx || sessionScope.user_type==3}">
                                 <i class="bi bi-trash2-fill answerdel" qna_idx="\${ele.qna_idx}" answer_idx="\${ele.answer_idx}"
                                 style="cursor: pointer; margin-left: 20px;"></i>
                                </c:if>
                   `;
                });
                $("span.j_answerPrint").html(s);
            },
            error: function (xhr, status, error){
                console.log(error);
            }
        });
    }
</script>

<!-- 페이징 처리 -->
<div style="width: 700px; text-align: center; font-size: 20px; margin: 0 auto;">
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
</body>
</html>