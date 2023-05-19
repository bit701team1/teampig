<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 작성</title>
    <script src="https://code.jquery.com/jquery-3.6.3.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Jua&family=Lobster&family=Nanum+Pen+Script&family=Single+Day&display=swap"
          rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&family=Gothic+A1&family=Gowun+Batang&family=Hahmlet&family=Song+Myung&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=fqj2esytz9&submodules=geocoder"></script>
    <style type="text/css">
        body,
        body * {
            font-family: 'Gowun Batang';
        }

        .y_updateinfo {
            margin-top: 10px;
            width: 1000px;
            border-radius: 0.825rem;
            border-top: 0.25rem solid #5C732C !important;
            box-shadow: 0 .15rem 1.0rem 0 rgba(58, 59, 69, .15) !important;
            transition: box-shadow 0.1s ease;
            height: 820px;
        }

        .y_updateinfo td {
            height: 10px; /* 각 셀의 높이를 조정합니다. 원하는 크기로 변경해주세요. */
            /* 추가적인 셀 스타일을 설정합니다. */
        }

        .right_input_section {
            margin-right: 20px;
            float: right;
            border-radius: 10px;
            width: 45%;
            height: 700px;
        }

        .image-container {
            width: 50%;
            margin-left: 20px;
            float: left;
            border-radius: 10px;
            margin-top: 30px;
            height: 700px;
        }

        .image-container img {
            max-width: 100%;
        }

        .thumbnail-container {
            position: absolute;
            bottom: 10px;
            right: 10px;
        }

        .thumbnail-container img {
            max-width: 100px;
        }

        form {
            align-items: center;
            justify-content: center;
            gap: 20px;
            margin-top: 30px;
        }

        label {
            display: block;
            margin-bottom: 10px;
            font-size: 20px;
            margin-left: 10px;
        }

        button[type="button"],
        button[type="submit"] {
            background-color: #5C732C;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
        }

        .image-container .detail_img {
            background-color: #FCFCFC;
            border-radius: 5px;
            width: 95%;
            height: 500px;
            border: black solid 1px;
            margin: 0 auto;
            margin-top: 10px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .detail_thumb {
            width: 95%;
            margin: 10px auto;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .thumbnail {
            width: 70px;
            height: 70px;
            border: #cccccc 1px solid;
            border-radius: 10px;
            margin: 10px 10px 10px 10px;
            display: flex;
            justify-content: center;
            align-items: center;
            cursor: pointer;
        }
        .thumbnail img{
            width: 99%;
            height: 99%;
            border-radius: 10px;
        }

        button[type="submit"]:hover {
            background-color: #2C4002;
        }

        .prev,
        .next {
            cursor: pointer;
            position: absolute;
            top: 50%;
            width: auto;
            margin-top: -22px;
            padding: 16px;
            color: white;
            font-weight: bold;
            font-size: 30px;
            transition: 0.6s ease;
            border-radius: 0 3px 3px 0;
            user-select: none;
        }

        .prev {
            position: relative;
            right: 274px;
            top: 10px;
        }

        .next {
            right: 492px;
            top: 465px;
            border-radius: 3px 0 0 3px;
        }

        .prev:hover,
        .next:hover {
            background-color: rgba(0, 0, 0, 0.8);
        }

        .prompt {
            display: flex;
        }

        .outputarea {
            width: 100%;
            height: 500px;
            margin: 0px auto;
            top: 80px;
            position: relative;
            border-radius: 0.825rem;
            box-shadow: 0 .15rem 1.0rem 0 rgba(58, 59, 69, .15) !important;
            transition: box-shadow 0.1s ease;
            margin-bottom: 200px;
        }

        .outputarea_sub {
            border-radius: 10px;
            height: 10px;
            margin-left: 20px;
            margin-top: 20px;
            position: absolute;
        }

        .GPT_content {
            margin-top: 80px;
            border: black 1px solid;
            border-radius: 10px;
            width: 98%;
            position: absolute;
            left: 12px;
            height: 350px;
        }

        #sendprompt {
            margin-top: 10px;
            margin-right: 10px;
            position: absolute;
            top: 440px;
            right: 5px;
        }

        .y_info2 {
            font-size: 17px;
        }
        select {
            height: 40px;
            width: 90%;
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-bottom: 10px; /* 수정: 간격을 10px로 설정 */
            margin-left: 0;
            box-sizing: border-box;
        }

        input[type="tel"],
        input[type="time"],
        input[type="text"],
        input[type="file"] {
            height: 40px;
            width: 90%;
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-left: 30px;
            box-sizing: border-box;
        }

        /* 추가: input 요소의 상단 여백 설정 */
        input[type="tel"] + select,
        input[type="time"] + select,
        input[type="text"] + select,
        input[type="file"] + select {
            margin-top: 10px;
        }
        .y_updateinfo table {
            table-layout: fixed; /* 테이블 레이아웃을 고정으로 설정 */
            width: 100%; /* 테이블의 전체 너비를 100%로 설정 */
            border-collapse: collapse; /* 셀 경계를 합치고 겹치는 부분을 제거 */
            height: 800px;
        }

        td {
            height: 30px; /* 각 셀의 높이를 50px로 설정 */
            padding: 10px; /* 셀의 안쪽 여백을 설정 */
        }

        td:first-child {
            width: 30%;
        }

        td:last-child {
            width: 70%;
        }
        /*모달창*/
        .modal {
            display: none;
            position: fixed;
            z-index: 9999;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.5);
        }

        .modal-content {
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 40%;
            max-width: 800px;
            height: auto;
            max-height: 60vh;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            text-align: center;
        }

        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
            cursor: pointer;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }

        .video-wrapper {
            position: relative;
            padding-bottom: 56.25%;
            height: 70%;

        }

        .video-wrapper video {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
        }
    </style>
    <script>
        var currentImageIndex = 0;
        var imagePaths = [];
        var thumbnailPaths = [];

        <%--$(function () {--%>
        <%--    //업로드한 사진들과 데이타를 같이 묶어서 서버에 전송하기--%>
        <%--    $("#contentadd").click(function () {--%>
        <%--        let user_idx=${user_idx};--%>
        <%--        let cnt=$("#photo")[0].files.length;--%>
        <%--        let RESTRT_NM=$("#RESTRT_NM").val();--%>
        <%--        let food_type=$("#food_type").val();--%>
        <%--        let TASTFDPLC_TELNO=$("#TASTFDPLC_TELNO").val();--%>
        <%--        let REPRSNT_FOOD_NM=$("#REPRSNT_FOOD_NM").val();--%>
        <%--        let REFINE_ROADNM_ADDR=$("#REFINE_ROADNM_ADDR").val();--%>
        <%--        let opentime=$("#opentime").val();--%>
        <%--        let closetime=$("#closetime").val();--%>
        <%--        let food_price=$("#food_price").val();--%>
        <%--        let holiday=$("#holiday").val();--%>
        <%--        let point=$("#point").val();--%>
        <%--        let REFINE_WGS84_LAT="";--%>
        <%--        let REFINE_WGS84_LOGT="";--%>
        <%--        {--%>
        <%--            if (RESTRT_NM.length == 0){--%>
        <%--                alert("가게이름을 입력해주세요")--%>
        <%--                return false;--%>
        <%--            }--%>
        <%--            if (TASTFDPLC_TELNO.length == 0){--%>
        <%--                alert("전화번호를 입력해주세요")--%>
        <%--                return false;--%>
        <%--            }--%>
        <%--            if (REFINE_ROADNM_ADDR.length == 0){--%>
        <%--                alert("주소를 입력해주세요")--%>
        <%--                return false;--%>
        <%--            }--%>
        <%--            if (TASTFDPLC_TELNO.length == 0){--%>
        <%--                alert("전화번호를 입력해주세요")--%>
        <%--                return false;--%>
        <%--            }--%>
        <%--            if (REPRSNT_FOOD_NM.length==0){--%>
        <%--                alert("주요메뉴를 입력해주세요")--%>
        <%--                return false;--%>
        <%--            }--%>
        <%--            if (opentime.length==0){--%>
        <%--                alert("오픈시간을 입력해주세요")--%>
        <%--                return false;--%>
        <%--            }--%>
        <%--            if (closetime.length==0){--%>
        <%--                alert("영업종료시간을 입력해주세요")--%>
        <%--                return false;--%>
        <%--            }--%>
        <%--        }--%>
        <%--        naver.maps.Service.fromAddrToCoord({address: $("#REFINE_ROADNM_ADDR").val()}, function (status, response) {--%>
        <%--            if (status === naver.maps.Service.Status.ERROR) {--%>
        <%--                return alert('Something wrong!');--%>
        <%--            }--%>
        <%--            REFINE_WGS84_LAT=response.result.items[0].point.y;--%>
        <%--            REFINE_WGS84_LOGT=response.result.items[0].point.x;--%>
        <%--            // 성공 시의 response 처리--%>
        <%--            console.log("위도경도"+REFINE_WGS84_LAT);--%>
        <%--            console.log(user_idx);--%>
        <%--        });--%>

        <%--        var form=new FormData();--%>
        <%--        for(i=0;i<$("#photo")[0].files.length;i++){--%>
        <%--            form.append("upload",$("#photo")[0].files[i]);//선택한 사진 모두 추가--%>
        <%--        }--%>

        <%--        form.append("user_idx",user_idx);--%>
        <%--        form.append("RESTRT_NM",RESTRT_NM);--%>
        <%--        form.append("food_type",food_type);--%>
        <%--        form.append("TASTFDPLC_TELNO",TASTFDPLC_TELNO);--%>
        <%--        form.append("REFINE_ROADNM_ADDR",REFINE_ROADNM_ADDR);--%>
        <%--        form.append("REPRSNT_FOOD_NM",REPRSNT_FOOD_NM);--%>
        <%--        form.append("opentime",opentime);--%>
        <%--        form.append("closetime",closetime);--%>
        <%--        form.append("food_price",food_price);--%>
        <%--        form.append("holiday",holiday);--%>
        <%--        form.append("point",point);--%>
        <%--        form.append("REFINE_WGS84_LAT",REFINE_WGS84_LAT);--%>
        <%--        form.append("REFINE_WGS84_LOGT",REFINE_WGS84_LOGT);--%>
        <%--        openModal()--%>
        <%--        $.ajax({--%>
        <%--            type: "post",--%>
        <%--            dataType: "json", // Set the dataType to "json" to receive a JSON response--%>
        <%--            url: "./insertinfo",--%>
        <%--            processData: false,--%>
        <%--            contentType: false,--%>
        <%--            data: form,--%>
        <%--            success: function(response) {--%>

        <%--                // console.log("Response : " + response)--%>

        <%--                $("#GPT_content").val(response.openaiResult);--%>

        <%--                // // Pass the food_idx value to the sendprompt button--%>
        <%--                $("#sendprompt").data("user_idx", response.user_idx);--%>
        <%--                // alert("ai 홍보글 작성중입니다. 잠시만 기다려주시기 바랍니다 \n 20~30초정도 소요됩니다.")--%>
        <%--            },--%>
        <%--            error: function(xhr, status, error) {--%>
        <%--                console.log("에러 발생");--%>
        <%--            }--%>
        <%--        });--%>
        <%--    });--%>
        <%--});--%>

        $(function () {
            // 업로드한 사진들과 데이터를 같이 묶어서 서버에 전송하기
            $("#contentadd").click(function () {
                let user_idx = ${user_idx};
                let cnt = $("#photo")[0].files.length;
                let RESTRT_NM = $("#RESTRT_NM").val();
                let food_type = $("#food_type").val();
                let TASTFDPLC_TELNO = $("#TASTFDPLC_TELNO").val();
                let REPRSNT_FOOD_NM = $("#REPRSNT_FOOD_NM").val();
                let REFINE_ROADNM_ADDR = $("#REFINE_ROADNM_ADDR").val();
                let opentime = $("#opentime").val();
                let closetime = $("#closetime").val();
                let food_price = $("#food_price").val();
                let holiday = $("#holiday").val();
                let point = $("#point").val();
                let REFINE_WGS84_LAT = "";
                let REFINE_WGS84_LOGT = "";

                // 유효성 검사
                if (RESTRT_NM.length == 0) {
                    alert("가게이름을 입력해주세요");
                    return false;
                }
                if (TASTFDPLC_TELNO.length == 0) {
                    alert("전화번호를 입력해주세요");
                    return false;
                }
                if (REFINE_ROADNM_ADDR.length == 0) {
                    alert("주소를 입력해주세요");
                    return false;
                }
                if (REPRSNT_FOOD_NM.length == 0) {
                    alert("주요메뉴를 입력해주세요");
                    return false;
                }
                if (opentime.length == 0) {
                    alert("오픈시간을 입력해주세요");
                    return false;
                }
                if (closetime.length == 0) {
                    alert("영업종료시간을 입력해주세요");
                    return false;
                }

                naver.maps.Service.fromAddrToCoord({ address: $("#REFINE_ROADNM_ADDR").val() }, function (
                    status,
                    response
                ) {
                    if (status === naver.maps.Service.Status.ERROR) {
                        return alert("Something wrong!");
                    }
                    REFINE_WGS84_LAT = response.result.items[0].point.y;
                    REFINE_WGS84_LOGT = response.result.items[0].point.x;
                    // 성공 시의 response 처리
                    console.log("위도경도" + REFINE_WGS84_LAT);
                    console.log(user_idx);

                    var form = new FormData();
                    for (i = 0; i < $("#photo")[0].files.length; i++) {
                        form.append("upload", $("#photo")[0].files[i]); // 선택한 사진 모두 추가
                    }

                    form.append("user_idx", user_idx);
                    form.append("RESTRT_NM", RESTRT_NM);
                    form.append("food_type", food_type);
                    form.append("TASTFDPLC_TELNO", TASTFDPLC_TELNO);
                    form.append("REFINE_ROADNM_ADDR", REFINE_ROADNM_ADDR);
                    form.append("REPRSNT_FOOD_NM", REPRSNT_FOOD_NM);
                    form.append("opentime", opentime);
                    form.append("closetime", closetime);
                    form.append("food_price", food_price);
                    form.append("holiday", holiday);
                    form.append("point", point);
                    form.append("REFINE_WGS84_LAT", REFINE_WGS84_LAT);
                    form.append("REFINE_WGS84_LOGT", REFINE_WGS84_LOGT);

                    openModal();
                    $.ajax({
                        type: "post",
                        dataType: "json",
                        url: "./insertinfo",
                        processData: false,
                        contentType: false,
                        data: form,
                        success: function (response) {
                            // console.log("Response : " + response)

                            $("#GPT_content").val(response.openaiResult);

                            // // Pass the food_idx value to the sendprompt button
                            $("#sendprompt").data("user_idx", response.user_idx);
                            // alert("ai 홍보글 작성중입니다. 잠시만 기다려주시기 바랍니다 \n 20~30초정도 소요됩니다.")
                        },
                        error: function (xhr, status, error) {
                            console.log("에러 발생");
                        },
                    });
                });
            });
        });


        $(document).ready(function() {
            $("#sendprompt").click(function (e) {
                e.preventDefault();

                let content = $("#GPT_content").val();
                let user_idx = $("#sendprompt").data("user_idx"); // Retrieve the stored food_idx value

                $.ajax({
                    type: "post",
                    dataType: "text",
                    url: "./W_updateprompt",
                    data: {
                        GPT_content: content,
                        user_idx: user_idx
                    },
                    success: function (res) {
                        console.log("결과" + res); // 응답값 출력
                        // Redirect to the home page
                        window.location.href = "http://localhost:9000/home2";
                        alert("prompt 전송 성공!!")
                    }
                });
            });

            document.querySelector('#photo').addEventListener('change', function(event) {
                var reader = new FileReader();
                reader.onload = function(e) {
                    var img = new Image();
                    img.src = e.target.result;
                    img.style.width = "100%"; // Set initial image width to 100%
                    img.style.height = "100%"; // Set initial image height to 100%
                    img.style.objectFit = "cover"; // Scale and crop the image to fill the container

                    var detailImg = document.querySelector('.detail_img');
                    console.log("detailIMG:"+detailImg);
                    detailImg.innerHTML = '';
                    detailImg.appendChild(img);

                    // Update thumbnails
                    const imagePaths = [];
                    for (let i = 0; i < event.target.files.length; i++) {
                        imagePaths.push(URL.createObjectURL(event.target.files[i]));
                    }
                    console.log("imagePaths:"+imagePaths);
                    var detailThumb = document.querySelector('.detail_thumb');
                    detailThumb.innerHTML = '';
                    imagePaths.forEach(function(imagePath) {
                        var thumbnail = document.createElement('div');
                        thumbnail.classList.add('thumbnail');
                        var img = document.createElement('img');
                        img.src = imagePath;
                        thumbnail.appendChild(img);
                        detailThumb.appendChild(thumbnail);

                        // Handle thumbnail click event
                        thumbnail.addEventListener('click', function() {
                            var clickedImagePath = this.querySelector('img').getAttribute('src');
                            changeImage(clickedImagePath);
                            console.log("clickedImagePath:"+clickedImagePath);
                            console.log("뭐지?"+document.getElementById("setimage"))
                        });
                    });
                };
                reader.readAsDataURL(event.target.files[0]);
            });

        });
        function changeImage(imagePath) {
            var mainImg = document.querySelector('.detail_img img');
            console.log("mainImg:", mainImg);
            console.log("imagePath:", imagePath);
            if (mainImg) {
                mainImg.setAttribute('src', imagePath);
                mainImg.style.width = '100%'; // Set image width to 100%
                mainImg.style.height = '100%'; // Set image height to 100%
                mainImg.style.objectFit = 'cover'; // Scale and crop the image to fill the container
                console.log("Image source updated:", imagePath);
            }
        }
    </script>
</head>
<body>
<c:set var="root" value="<%=request.getContextPath() %>"/>
<h2>가게정보 관리</h2>
<div class="y_updateinfo">
    <div style="margin-left: 25px; margin-top: 20px;">
        <h3  style=" font-weight: bold;">가게등록</h3>
        <span>우리 가게의 정보를 직접 등록해보세요! 최신화된 정보일수록, 더 많은 손님들의 관심을 높일 수 있습니다.</span>
    </div>
    <div class="image-container">
        <div class="detail_img">
            <img id="setimage" src="../save/img.png" alt="Example Image" style="width: 100px; height: 100px;">
        </div>
        <!--상품 썸네일-->
        <div class="detail_thumb"></div>
    </div>

    <div class="right_input_section">
            <input type="hidden" id="user_idx" name="user_idx" value="${dto.user_idx}">
            <table>
                <tr>
                    <td>
                        <label for="RESTRT_NM"><span class="y_info2">가게 이름</span> </label>
                    </td>
                    <td>
                        <input type="tel" id="RESTRT_NM" name="RESTRT_NM">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="food_type"><span class="y_info2">카테고리</span></label>
                    </td>
                    <td style="padding-bottom: 10px;">
                        <select id="food_type" name="food_type" style="margin-left: 30px;">
                            <option value="" selected disabled>선택</option>
                            <option value="닭고기">닭고기</option>
                            <option value="돼지고기">돼지고기</option>
                            <option value="소고기">소고기</option>
                            <option value="오리고기">오리고기</option>
                            <option value="정식">정식</option>
                            <option value="해산물">해산물</option>
                            <option value="면류">면류</option>
                            <option value="기타">기타</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="TASTFDPLC_TELNO"><span class="y_info2">전화번호</span> </label>
                    </td>
                    <td>
                        <input type="tel" id="TASTFDPLC_TELNO" name="TASTFDPLC_TELNO" >
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="REFINE_ROADNM_ADDR"><span class="y_info2">주소</span></label>
                    </td>
                    <td>
                        <input type="text" id="REFINE_ROADNM_ADDR" name="REFINE_ROADNM_ADDR">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="REPRSNT_FOOD_NM"><span class="y_info2">주요메뉴</span></label>
                    </td>
                    <td>
                        <input type="text" id="REPRSNT_FOOD_NM" name="REPRSNT_FOOD_NM" class="y_info2">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="food_price"><span class="y_info2">가격대</span></label>
                    </td>
                    <td style="padding-bottom: 10px;">
                        <select id="food_price" name="food_price" style="margin-left: 30px;">
                            <option value="1만원대">1만원대</option>
                            <option value="2만원대">2만원대</option>
                            <option value="3만원대">3만원대</option>
                            <option value="4만원이상">4만원이상</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="point"><span class="y_info2">홍보 포인트</span></label>
                    </td>
                    <td>
                        <input type="text" id="point" name="point" placeholder="신선한, 주차장이 넓은 등">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="opentime"><span class="y_info2">오픈시간</span></label>
                    </td>
                    <td>
                        <input type="time" id="opentime" name="opentime" min="00:00" max="24:00" step="300">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="closetime"><span class="y_info2">종료시간</span></label>
                    </td>
                    <td>
                        <input type="time" id="closetime" name="closetime" min="00:00" max="24:00" step="300" >
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="holiday" ><span class="y_info2">휴일</span></label>
                    </td>
                    <td tyle="padding-bottom: 10px;">
                        <select id="holiday" name="holiday" style="margin-left: 30px;">
                            <option value="없음" ${dto.holiday == '없음' ? 'selected' : ''}>없음</option>
                            <option value="일요일" ${dto.holiday == '일요일' ? 'selected' : ''}>일요일</option>
                            <option value="월요일" ${dto.holiday == '월요일' ? 'selected' : ''}>월요일</option>
                            <option value="화요일" ${dto.holiday == '화요일' ? 'selected' : ''}>화요일</option>
                            <option value="수요일" ${dto.holiday == '수요일' ? 'selected' : ''}>수요일</option>
                            <option value="목요일" ${dto.holiday == '목요일' ? 'selected' : ''}>목요일</option>
                            <option value="금요일" ${dto.holiday == '금요일' ? 'selected' : ''}>금요일</option>
                            <option value="토요일" ${dto.holiday == '토요일' ? 'selected' : ''}>토요일</option>
                        </select>
                    </td>
                </tr>

                <tr>
                    <td>
                        <label for="photo"><span class="y_info2">사진 넣기</span></label>
                    </td>
                    <td>
                        <input type="file" id="photo" name="photo" multiple style="height: 50px;">
                    </td>
                </tr>
                <tr align="center">
                    <td colspan="2">
                        <button type="submit" style=" float:right;" id="contentadd" >홍보글 작성</button>
                    </td>
                </tr>
            </table>
    </div>
</div>
<div class="outputarea">
    <div class="outputarea_sub">
        <h3>AI 홍보글 작성</h3>
    </div>
    <form action="U_updateprompt" method="post" enctype="multipart/form-data">
        <div class="prompt" id="prompt">
            <textarea class="GPT_content" id="GPT_content" name="GPT_content" value="${dto.GPT_content}">
                ${dto.GPT_content}
            </textarea>
        </div>
        <button type="submit" id="sendprompt">전송</button>
    </form>
</div>
    <!-- Modal -->
    <div id="modal" class="modal">
        <div class="modal-content">
            <button id="closeButton" style="display: none;"onclick="closeModal()" class="close" >&times;</button>
            <div class="video-wrapper">
                <video id="videoPlayer" controls>
                    <source src="../ad/ad.mp4" type="video/mp4">
                </video>
            </div>
        </div>
    </div>

    <script>
        // Modal 이벤트
        // Open Modal
        function openModal() {
            document.getElementById("modal").style.display = "block";
            document.getElementById("videoPlayer").play();
        }

        // Close Modal
        function closeModal() {
            document.getElementById("modal").style.display = "none";
            document.getElementById("videoPlayer").pause();
            document.getElementById("videoPlayer").currentTime = 0;
        }
        const videoPlayer = document.getElementById('videoPlayer');
        const closeButton = document.getElementById('closeButton');

        videoPlayer.addEventListener('ended', function() {
            closeButton.style.display = 'block';
        });
    </script>
</body>
</html>