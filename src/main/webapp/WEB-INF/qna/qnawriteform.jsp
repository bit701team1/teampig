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
    <link rel="stylesheet" href="/css/qnalist.css" />
    <link rel="stylesheet" href="/css/footer.css" />
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    <script src="/js/qnalist.js"> </script>
    <script src="/js/qnafooter.js"></script>
    <style>
        body, body * {
            font-family: 'Jua'
        }
    </style>
</head>
<body>
<div style="width: 450px;">
    <form action="insert" method="post" >
        <%-- hidden --%>
        <input type="hidden" name="qna_idx" value="${qna_idx}">
        <input type="hidden" name="qna_ref" value="${qna_ref}">
        <input type="hidden" name="qna_step" value="${qna_step}">
        <input type="hidden" name="qna_depth" value="${qna_depth}">
        <input type="hidden" name="currentPage" value="${currentPage}">
        <input type="hidden" name="is_pass" value="">

        <table  class="table table-bordered">
            <caption align="top"><h4><b>
                <c:if test="${qna_idx==0}">
                    글쓰기
                </c:if>
                <c:if test="${qna_idx>0}">
                    답글쓰기
                </c:if>
            </b></h4></caption>
            <%-- name이 dto 변수명과 똑같아야 한다. --%>
            <tr>
                <th style="width: 130px;background-color: #ddd">id</th>
                <td>
                    <input type="text" class="form-control" name="writer" value="${sessionScope.id}" required="required">
                </td>
            </tr>

            <tr>
                <th style="width: 130px;background-color: #ddd">제목</th>
                <td>
                    <input type="text" class="form-control" name="qna_subject" value="${dto.qna_subject}" required="required">
                </td>
            </tr>

            <tr>
                <th style="width: 100px;background-color: #ddd">유저타입</th>
                <td>
                    <input type="text" class="form-control" name="user_type" value ="${dto.user_type}" required="required">
                </td>
            </tr>

            <tr>
                <th style="width: 130px;background-color: #ddd">유저인덱스</th>
                <td>
                    <input type="text" class="form-control" name="user_idx" value ="${dto.user_idx}" required="required">
                </td>
            </tr>


            <tr>
                <th style="width: 130px;background-color: #ddd">나만보기 설정</th>
                <td>
                    <input type="radio" id="is_pass_open" name="qna_ispass" value="false" checked>
                    <label for="is_pass_open">누구나 보기</label>
                    <c:if test="${dto.user_type!=3 && sessionScope.user_type!=3}">
                    <input type="radio" id="is_pass_close" name="qna_ispass" value="true">
                    <label for="is_pass_close">나만 보기</label>
                    </c:if>
                </td>
            </tr>
            <tr id="pwfield" style="display:none;">
                <th style="width: 130px;background-color: #ddd">비밀번호</th>
                <td>
                    <input type="password" class="form-control" name="qna_pass">
                </td>
            </tr>

            <tr>
                <td colspan="2">
                   <textarea style="width: 100%; height: 130px;" name="qna_content" required
                             class="form-control"></textarea>
                </td>
            </tr>


            <tr>
                <td colspan="2" align="center">
                    <button type="submit" class="btn btn-outline-success btnclick">글 저장</button>
                    <button type="button" class="btn btn-outline-success"
                            onclick="history.back()">취소</button>
                </td>
            </tr>
        </table>
    </form>
</div>
<footer style="margin-top: 200px;">
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
