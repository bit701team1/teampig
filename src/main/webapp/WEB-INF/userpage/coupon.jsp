<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Insert title here</title>
  <script src="https://code.jquery.com/jquery-3.6.3.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&family=Gothic+A1&family=Gowun+Batang&family=Hahmlet&family=Song+Myung&display=swap"
        rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">

  <style type="text/css">
    body, body * {
      font-family: 'Gowun Batang';
    }
  </style>
<body>
<div class="y_coupon">
  <h2 h2 style="font-weight: bold;">쿠폰 관리</h2>

  <div style="width:450px;">

    <div class="y_couponlist" style="margin-top: 50px;">
      <table class="table" style="width: 800px; margin: auto; margin-bottom: 50px;">
        <caption align="top">
          <h4><b>쿠폰 목록</b></h4>
        </caption>
        <thead>
        <tr>
          <th style="width: 80px;text-align: center;">번호</th>
          <th style="width: 200px; text-align: center;">가게이름</th>
          <th style="width: 320px; text-align: center;">할인율</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="dto" items="${list}" varStatus="i">
          <tr>
            <td  style="text-align: center;">${i.index+1}</td>
            <td style="text-align: center;">${dto.storename}</td>
            <td style="text-align: center;">${dto.number}%할인</td>
          </tr>
        </c:forEach>
        </tbody>
      </table>
    </div>
  </div>
</div>
</body>
</html>