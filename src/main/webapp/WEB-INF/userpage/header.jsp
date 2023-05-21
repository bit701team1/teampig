<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
  <title>공공데이터 검색엔진</title>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&family=Gothic+A1&family=Gowun+Batang&family=Hahmlet&family=Song+Myung&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">

<style>
   body, body * {
       font-family: 'Gowun Batang';
   }

   div #y_menu{
     position: relative;
     margin: auto;
     top: 1px;
     float: right;
   }
   div .y_y{
     position: relative;
     margin: auto;
     top: 22px;
   }

   #txt_mypage{
     font-size: 40px;
     font-weight: bold;
     margin-left: 30px;
   }
</style>

</head>
<body>
<span id="txt_mypage">My page</span>
  <div  id="y_menu">
    <span class="y_store" style="margin-right: 40px;"><i class="bi bi-person-circle"></i> ${user_name}님</span>
  </div>
</body>
</html>