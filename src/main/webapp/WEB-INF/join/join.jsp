<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입 페이지</title>
    <script src="https://code.jquery.com/jquery-3.6.3.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Jua&family=Lobster&family=Nanum+Pen+Script&family=Single+Day&display=swap"
          rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <style>
        body, body * {
            font-family: 'Jua'
        }
        h1 {
            text-align: center;
        }

        form {
            width: 600px;
            margin: 0 auto;
        }

        table {
            border-collapse: collapse;
            width: 100%;
        }

        table td {
            padding: 10px;
            border: 1px solid #ddd;
        }

        label {
            display: inline-block;
            width: 100px;
        }

        input, select {
            margin-bottom: 10px;
            width: 100%;
            box-sizing: border-box;
        }

        input[type="submit"] {
            margin-top: 20px;
            float: right;
        }
        #showimg{
            width: 130px;
            height: 150px;
            border: black 1px solid;
            margin: 0px auto;
            display: block;
        }
    </style>
</head>
<body>
<h1>회원가입 페이지</h1>
<form action="insert" method="POST" enctype="multipart/form-data">
    <table>
        <tr>
            <td><label for="id">아이디:</label></td>
            <td><input type="text" id="id" name="id"></td>
            <td rowspan="3">
                <img src="" id="showimg">
            </td>
        </tr>
        <tr>
            <td><label for="password">비밀번호:</label></td>
            <td><input type="password" id="password" name="password"></td>
        </tr>
        <tr>
            <td><label for="user_name">이름:</label></td>
            <td><input type="text" id="user_name" name="user_name"></td>
        </tr>
        <tr>
            <td><label for="user_photo">사진:</label></td>
            <td colspan="2"><input type="file" id="myfile" name="upload"></td>
        </tr>
        <tr>
            <td><label for="shopname">가게 이름:</label></td>
            <td colspan="2"><input type="text" id="shopname" name="shopname"></td>
        </tr>
        <tr>
            <td><label for="user_type">유저 타입:</label></td>
            <td colspan="2">
                <select id="user_type" name="user_type">
                    <option value="1">사장님</option>
                    <option value="2">소비자</option>
                    <option value="3">관리자</option>
                </select>
            </td>
        </tr>
    </table>
    <br>
    <button type="submit">회원가입</button>
</form>
<script type="text/javascript">

    $("#myfile").change(function(){
        console.log("1:"+$(this)[0].files.length);
        console.log("2:"+$(this)[0].files[0]);
        //정규표현식
        var reg = /(.*?)\/(jpg|jpeg|png|bmp)$/;
        var f=$(this)[0].files[0];//현재 선택한 파일
        if(!f.type.match(reg)){
            alert("확장자가 이미지파일이 아닙니다");
            return;
        }
        if($(this)[0].files[0]){
            var reader=new FileReader();
            reader.onload=function(e){
                $("#showimg").attr("src",e.target.result);
            }
            reader.readAsDataURL($(this)[0].files[0]);
        }
    });
</script>
</body>
</html>