<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
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
        .header{
            border: 3px solid black;
            height: 150px;
            width: 100%;
        }
        .main{
            border: 3px solid black;
            width: 1000px;
            height: 1050px;
            margin: 50px auto;
        }
        .menu{
            border: 3px solid black;
            top: 400px;
            width: 100%;
        }

    </style>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="mainlist.jsp" %>
<%@ include file="footer.jsp" %>
<%@ include file="chatbot.jsp" %>
   <%-- <div class="mainlayout">
        <header class="header">
            <tiles:insertAttribute name="header"/>
        </header>
        <section class="mainlist">
            <tiles:insertAttribute name="mainlist"/>
        </section>
        <section class="main">
            <tiles:insertAttribute name="main"/>
        </section>
        <section class="footer">
            <tiles:insertAttribute name="footer"/>
        </section>
        <section class="chatbot">
            <tiles:insertAttribute name="chatbot"/>
        </section>
    </div>--%>
</body>
</html>