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
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=fqj2esytz9&submodules=geocoder"></script>




    <style>
        body, body * {
            font-family: 'Jua'
        }
    </style>


</head>
<body>


<table>
    <tr>
        <td>주소</td>
    </tr>
    <tr>
        <td><input type="text" value="" id="test"></td>
    </tr>
    <tr><td><button type="button" id="btntest">입력</button></td></tr>
</table>
<script>


    $("#btntest").click(function() {//address 부분에 주소
               naver.maps.Service.fromAddrToCoord({address: $("#test").val()}, function (status, response) {
                   if (status === naver.maps.Service.Status.ERROR) {
                       return alert('Something wrong!');
                   }
                   // 성공 시의 response 처리
                  alert('3' + '﻿경도: ' + response.result.items[0].point.x + ', 위도: ' + response.result.items[0].point.y)
                   return alert('4' + 'Good job!');
                    $("#map").html(${response.result[0].point.x});

                   });

               })





</script>
<div id="map" style="width:100%;height:600px;"></div>
    </body>
</html>
