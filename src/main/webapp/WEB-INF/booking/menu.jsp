<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&family=Gothic+A1&family=Gowun+Batang&family=Hahmlet&family=Song+Myung&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
</head>
<style>
   body, body * {
       font-family: 'Gowun Batang';
   }
   div .y_menu{
	   position: fixed;
	   top: 0;
	   bottom: 0;
	   left: 0;
	   z-index: 25;
	   padding-top: 96px;
	   width: 271px;
	   border-right: 1px solid #f0f0f0;
	   background: #fff;
	   transition: width 0.5s;
   }
   .y_menu .y_logo{
	   display: block;
	   position: absolute;
	   top: 0px;
	   left: 32px;
	   width: 120px;
	   height: 24px;
   }
   .y_menu .y_mainul{
	   margin: 0 auto;
	   width: 240px;
   }
   a, ol, ul, li {
	   list-style: none;
	   text-decoration-line:none;
	   color:black;
	   cursor: pointer;
   }
   li {
	   margin-top:50px;
   }
   .y_txt {
	   display: block;
	   position: relative;
	   z-index: 2;
	   color: #5c667b;
	   font-size: 20px;
	   letter-spacing: -1px;
	   line-height: 24px;
   }
   ul .y_user {
	   height: 0;
	   overflow: hidden;
	   transition: height 0.3s;
   }

   ul .y_user.slideup {
	   height: 0;
   }

   ul .y_user.slidedown {
	   height: 150px;
   }

   span #expand1{
	   display: block;
	   position: absolute;
	   bottom:5px;
	   right: 70px;
	   z-index: 3;
	   width: 25px;
	   height: 32px;
	   border-radius: 16px;
	   outline: 0;
	   color: #5c667b;
	   font-size: 30px;
	   cursor: pointer;
   }
div .y_btn{
	position: absolute;
	bottom: 1px;
	left: 120px;
}

</style>
<c:set var="root" value="<%=request.getContextPath() %>"/>
<body>

<div class="y_menu">
<a href="/" class="y_logo" style="width:400px; color: black;"><img src="${root}/photo/pig.png" style="width:70px; margin-left:10px; margin-top:20px;" class="y_logo2"></a>

	<ul class="y_mainul">
		<li><span style="position: relative;">
			<a href="${root}/home2"><span class="y_txt"><i class="bi bi-house" ></i>  My홈</span></a>
			<span  id="expand1"><i class="bi bi-chevron-compact-down"></i></span>
	</span>
	<ul class="y_user">
				<li>
				<a href="${root}/home2"><span class="y_txt"> 가게 정보</span></a>
				</li>
				<li>
				<a href="${root}/mypage/infoupdate"><span class="y_txt"> 정보 수정</span></a>
				</li>
			</ul>
		<li>
		<li>
			<a href="${root}/mypage/form"><span class="y_txt"><i class="bi bi-star"></i> 쿠폰관리</span></a>
		</li>
			<li>
			<a href="${root}/calendar/calendar"><span class="y_txt"><i class="bi bi-calendar-check"></i> 예약관리</span></a>
		</li>
		<li>
			<a href="${root}/mypage/review"><span class="y_txt"><i class="bi bi-pen"></i> 리뷰관리</span></a>
		</li>
		<li>
			<a href="${root}/mypage/qna"><span class="y_txt"><i class="bi bi-patch-question"></i> 나의 Qna</span></a>
		</li>
</ul>
	<div class="y_btn">
		<a>회원탈퇴</a>&nbsp;&nbsp;&nbsp;<a>로그아웃</a>
	</div>
</div>
<script>
const expand1 = document.getElementById('expand1');
const user = document.querySelector('.y_user');
expand1.addEventListener('click', function() {
	if (user.classList.contains('slideup')) {
		user.classList.remove('slideup');
		user.classList.add('slidedown');
	} else {
		user.classList.remove('slidedown');
		user.classList.add('slideup');
	}
});



</script>
</body>
</html>