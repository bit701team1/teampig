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
    <style>
        body, body * {
            font-family: 'Jua'
        }
    </style>
</head>
<body>
<form method="post" action="joinformtest" enctype="multipart/form-data"></form>
<table>
    <tr>
        <td>아이디</td>
    <td><input type="text"></td>
    </tr>
    <tr><td>비밀번호</td>
        <td><input type="password"></td></tr>

    <tr><td>이름</td>
        <td><input type="text" value="${name==null?null:name}"></td></tr>
    <tr><td>이메일</td>
        <td><input type="text" value="${email==null?null:email}"></td></tr>
    <tr><td>전화번호</td>
        <td><input type="text"></td></tr>
    <tr><td colspan="2"><button type="submit">회원가입</button></td></tr>
</table>
</body>
</html>
