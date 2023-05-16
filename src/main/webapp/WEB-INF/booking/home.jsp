<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&family=Gothic+A1&family=Gowun+Batang&family=Hahmlet&family=Song+Myung&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<style type="text/css">
   body, body * {
       font-family: 'Gowun Batang';
   }
   div.y_bosspage1 .header{
	   margin-left: 270px;
	   width:1250px;
	   height: 70px;
	   position : fixed;
	   background-color: rgba(188, 229, 92, 0.3); /* 9FC93C 컬러를 사용하고, 투명도를 0.7로 설정합니다 */
	   z-index: 10;
   }

   div.y_bosspage2 {
	   position : absolute;
	   top:100px;
	   left: 380px;
	   width: 1000px;
	   margin: 10px;
   }
</style>

</head>
<script>
	(function(){var w=window;if(w.ChannelIO){return w.console.error("ChannelIO script included twice.");}var ch=function(){ch.c(arguments);};ch.q=[];ch.c=function(args){ch.q.push(args);};w.ChannelIO=ch;function l(){if(w.ChannelIOInitialized){return;}w.ChannelIOInitialized=true;var s=document.createElement("script");s.type="text/javascript";s.async=true;s.src="https://cdn.channel.io/plugin/ch-plugin-web.js";var x=document.getElementsByTagName("script")[0];if(x.parentNode){x.parentNode.insertBefore(s,x);}}if(document.readyState==="complete"){l();}else{w.addEventListener("DOMContentLoaded",l);w.addEventListener("load",l);}})();
	ChannelIO('boot', {
		"pluginKey": "708c4779-dafe-4260-abe0-c76183c1b24a"
	});
</script>
<body>
<div class="y_bosspage1">
	<section class="header">
		<tiles:insertAttribute name="header"/>
	</section>
</div>
<div class="y_bosspage2">
	<section class="main">
		<tiles:insertAttribute name="main"/>
	</section>
</div>
<div class="y_bosspage3">
	<section class="menu">
		<tiles:insertAttribute name="menu"/>
	</section>
</div>


</body>
</html>