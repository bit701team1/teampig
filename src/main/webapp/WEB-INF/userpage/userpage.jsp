<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta id="ch-new-plugin-theme" name="theme-color" content="#686868">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&family=Gothic+A1&family=Gowun+Batang&family=Hahmlet&family=Song+Myung&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<style type="text/css">



</style>

</head>
<body>
<c:set var="root" value="<%=request.getContextPath() %>"/>
<h2>가게정보</h2>
<div class="y_myinfo">
    <div style="display: flex; margin-top: 10px;">
        <img src='${root}/photo/food.gif' style="width: 450px; height:400px;" class="rounded" alt="Cinque Terre">
<table class="table table-bordered" style="width: 500px; margin-left: 20px; height:400px; ">
    <tr>
        <td style="width: 100px; background: #F6F6F6;">이름 </td>
        <td>${dto.RESTRT_NM}</td>
    </tr>
    <tr>
        <td style="width: 100px; background: #F6F6F6;">전화번호 </td>
        <td>${dto.TASTFDPLC_TELNO}</td>
    </tr>
    <tr>
        <td style="width: 100px; background: #F6F6F6;">가격대 </td>
        <td>${dto.food_price}</td>
    </tr>
    <tr>
        <td style="width: 100px; background: #F6F6F6;">주 메뉴</td>
        <td>${dto.food_type}</td>
    </tr>
    <tr>
        <td style="width: 100px; background: #F6F6F6;">주소  </td>
        <td>${dto.REFINE_ROADNM_ADDR}</td>
    </tr>
    <tr>
        <td style="width: 100px; background: #F6F6F6;"> 가게 포인트 </td>
        <td>${dto.point}</td>
    </tr>
    <tr>
        <td style="width: 100px; background: #F6F6F6;"> 오픈 시간 </td>
        <td>${dto.opentime}</td>
    </tr>
    <tr>
        <td style="width: 100px; background: #F6F6F6;"> 닫는 시간 </td>
        <td>${dto.closetime}</td>
    </tr>
    <tr>
        <td style="width: 100px; background: #F6F6F6;">휴일</td>
        <td>${dto.holiday}</td>
    </tr>
</table>
</div>
</div>
<div class="y_square">
    <div class="y_content">예약 총 ${totalCount} </div>
    <div class="y_content" style="cursor: pointer;" data-bs-toggle="modal" data-bs-target="#couponModal"><span class="y_coup">쿠폰 등록</span></div>
    <div class="y_content">내 가게 리뷰 100개</div>
</div>

<script>
    const timeInput2 = document.getElementById('y_ctime');
    const dateInput2 = document.getElementById('y_cdate');
    const now2 = new Date();
</script>
<style>
    .custom-div {
        border: 1px solid #ddd;
        border-radius: 8px;
        padding: 20px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        font-size: 18px;
        color: #333;
        line-height: 1.5;
        text-align: center;

        background-color:rgba(228, 247, 186, 0.3);
    }

    .custom-div h1 {
        font-size: 24px;
        margin-top: 0;
    }
    .custom-div2{
        border: 1px solid #ddd;
        border-radius: 8px;
        padding: 20px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        font-size: 18px;
        color: #333;
        line-height: 1.5;
        text-align: center;
        background-color: white;
    }
    .custom-div p {
        margin-bottom: 0;
    }
</style>


</body>
</html>