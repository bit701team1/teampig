<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>공공데이터 검색엔진 - 끼니피그</title>
    <script src="https://code.jquery.com/jquery-3.6.3.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&family=Gothic+A1&family=Gowun+Batang&family=Hahmlet&family=Song+Myung&display=swap"
          rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">

    <style type="text/css">
        body, body * {
            font-family: 'Gowun Batang';
        }
        .y_updateinfo {
            margin-top: 10px;
            width: 1000px;
            border-radius: 0.825rem;
            border-top: 0.25rem solid #5C732C !important;
            box-shadow: 0 .15rem 1.0rem 0 rgba(58, 59, 69, .15) !important;
            transition: box-shadow 0.1s ease;
            height: 800px;
        }

        .RESTRT_NM {
            margin-top: 10px;
            margin-bottom: 10px;
            text-align: center;
            width: 95%;
            height: 50px;
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

        select,
        input[type="tel"],
        input[type="time"],
        input[type="text"],
        input[type="file"] {
            height: 40px;
            width: 90%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-bottom: 20px;
            margin-left: 30px;
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
            background-color: #EAEAEA;
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
            /*border: black solid 1px;*/
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
            border-radius: 10px;
            width: 100%;
            height: 100%;
        }

        button[type="submit"]:hover {
            background-color: #2C4002;
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
            color: inherit;
            float: right;
            font-weight: bold;
            cursor: pointer;
            position: absolute;
            bottom: 10px;
            right: 10px;
            font-size: 20px;
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
            margin-left:20px;
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
        .y_info2{
            font-size:17px;
        }
    </style>

</head>
<c:set var="root" value="<%=request.getContextPath() %>"/>
<script>
    var currentImageIndex = 0;
    var imagePaths = [];

    function prevImage() {
        if (currentImageIndex > 0) {
            currentImageIndex--;
        } else {
            currentImageIndex = imagePaths.length - 1;
        }
        changeImage(imagePaths[currentImageIndex]);
    }

    function nextImage() {
        if (currentImageIndex < imagePaths.length - 1) {
            currentImageIndex++;
        } else {
            currentImageIndex = 0;
        }
        changeImage(imagePaths[currentImageIndex]);
    }

    function changeImage(imagePath) {
        document.getElementById('main-img').src = imagePath;
    }

    $(function () {
        //업로드한 사진들과 데이타를 같이 묶어서 서버에 전송하기
        $("#contentadd").click(function () {
            $("#contentadd").prop("disabled", true);
            let user_idx=$("#user_idx").val();
            let cnt=$("#photo")[0].files.length;
            let point=$("#point").val()
            let TASTFDPLC_TELNO=$("#TASTFDPLC_TELNO").val();
            let REPRSNT_FOOD_NM=$("#REPRSNT_FOOD_NM").val();
            let REFINE_ROADNM_ADDR=$("#REFINE_ROADNM_ADDR").val();
            let opentime=$("#opentime").val();
            let closetime=$("#closetime").val();
            let holiday=$("#holiday").val();
            {
                if (opentime.length==0){
                    alert("오픈시간을 입력해주세요")
                    return false;
                }
                if (closetime.length==0){
                    alert("영업종료시간을 입력해주세요")
                    return false;
                }
            }

            var form=new FormData();
            for(i=0;i<$("#photo")[0].files.length;i++){
                form.append("upload",$("#photo")[0].files[i]);//선택한 사진 모두 추가
            }
            form.append("TASTFDPLC_TELNO",TASTFDPLC_TELNO);
            form.append("REFINE_ROADNM_ADDR",REFINE_ROADNM_ADDR);
            form.append("REPRSNT_FOOD_NM",REPRSNT_FOOD_NM);
            form.append("opentime",opentime);
            form.append("closetime",closetime);
            form.append("holiday",holiday);
            form.append("point",point);
            form.append("user_idx",user_idx);

            console.log($("#photo")[0].files)
            console.log($("#user_idx").val());

            $.ajax({
                type: "delete",
                url: "./removephotos/"+user_idx,
                // data: {user_idx: user_idx},
                dataType: "text",
                success: function () {
                    console.log("기존 사진이 삭제되었습니다.");
                    $.ajax({
                        type: "POST",
                        dataType: "text",
                        url: "./update",
                        processData: false,
                        contentType: false,
                        data: form,
                        success: function () {
                            // console.log("결과" + res); // 응답값 출력
                        },
                        complete: function () {
                            $("#contentadd").prop("disabled", false);
                            location.reload(); // 새로고침
                        }
                    });
                }
            });

        });
    });

    $(document).ready(function() {
        // Function to generate thumbnail with the uploaded photo
        function generateThumbnail(imagePath) {
            const thumbnail = $("<div class='thumbnail'></div>");
            const img = $("<img>").attr("src", imagePath);

            // Add onclick event handler to change the main image
            img.on("click", function() {
                $("#main-img").attr("src", imagePath);
            });

            thumbnail.append(img);
            thumbnail.appendTo($("div.detail_thumb"));
        }

        // Event handler for when a photo is selected
        $("#photo").on("change", function(event) {
            $("div.detail_thumb").empty(); // Clear existing thumbnails

            // Iterate over the selected files and generate thumbnails
            for (let i = 0; i < event.target.files.length; i++) {
                const imagePath = URL.createObjectURL(event.target.files[i]);
                generateThumbnail(imagePath);
            }

            // Set the main-img to the source of the first thumbnail image
            const firstThumb = $("div.thumbnail img").first();
            const firstImgSrc = firstThumb.attr("src");
            $("#main-img").attr("src", firstImgSrc);
        });




        window.change_detail_img = function(photoname) {
            currentImageIndex = imagePaths.indexOf(`http://kr.object.ncloudstorage.com/pig701-bucket/foodphoto/\${photoname}`);
            $("#main-img").attr("src", `http://kr.object.ncloudstorage.com/pig701-bucket/foodphoto/\${photoname}`);
            console.log(currentImageIndex);
        }


        function detail_thumb(user_idx) {
            $.ajax({
                type: "get",
                url: "./getphoto",
                data: { user_idx: user_idx }, // food_idx를 파라미터로 전달
                dataType: "json",
                success: function(res) {
                    let s = "";
                    $.each(res, function(idx, ele) {
                        $.each(ele.photoList, function(fidx, fele) {
                            // food_idx와 일치하는 사진만 출력
                            if (ele.user_idx === fele.user_idx) {
                                console.log(fele)
                                imagePaths.push(`http://kr.object.ncloudstorage.com/pig701-bucket/foodphoto/\${fele.photoname}`);
                                var cphoto = "'" + fele.photoname + "'";

                                s += `
                                       <div class="thumbnail">
                                          <img src="http://kr.object.ncloudstorage.com/pig701-bucket/foodphoto/\${fele.photoname}" onclick="change_detail_img(\${cphoto})">
                                       </div>
              `;
                                console.log(fele.photoname)
                            }
                        });
                        s += "</div></div>";
                    });
                    // imagePaths = imagePaths.concat(thumbPaths);
                    $("div.detail_thumb").html(s);

                    // Set main-img to the src of the first thumbnail image
                    const firstThumb = $("div.thumbnail img").first();
                    const firstImgSrc = firstThumb.attr("src");
                    $("#main-img").attr("src", firstImgSrc);
                }
            });
        }

        // food_idx 값을 가져와서 detail_thumb 함수 호출
        const user_idx = $("#user_idx").val();
        detail_thumb(user_idx);

        $("#sendprompt").click(function (e) {
            e.preventDefault();

            let content = $("#GPT_content").val();
            let user_idx = $("#user_idx").val();

            $.ajax({
                type: "post",
                dataType: "text",
                url: "./U_updateprompt",
                data: {
                    GPT_content: content,
                    user_idx: user_idx
                },
                success: function (res) {
                    console.log("결과"+res); // 응답값 출력
                }
            });
        });

    });
</script>
<body>
<h2>가게정보 관리</h2>
<div class="y_updateinfo">
    <div class="RESTRT_NM" >
        <h1>${dto.RESTRT_NM}</h1>
    </div>
    <div style="margin-left: 25px;">
        <h3  style=" font-weight: bold;">직접수정</h3>
        <span>우리 가게의 정보를 직접 등록해보세요! 최신화된 정보일수록, 더 많은 손님들의 관심을 높일 수 있습니다.</span>
    </div>
    <div class="image-container">
        <div class="detail_img">
            <img id="main-img" src="" alt="Example Image" style="max-width: 100%; max-height: 100%;">
        </div>
        <!--상품 썸네일-->
        <div class="detail_thumb"></div>
    </div>

    <div class="right_input_section">
        <form action="update" method="post" enctype="multipart/form-data">
            <input type="hidden" id="user_idx" name="user_idx" value="${dto.user_idx}">
            <table>
                <tr>
                    <td>
                        <label for="TASTFDPLC_TELNO"><span class="y_info2">전화번호</span> </label>
                    </td>
                    <td>
                        <input type="tel" id="TASTFDPLC_TELNO" name="TASTFDPLC_TELNO" value=${dto.TASTFDPLC_TELNO}>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="REFINE_ROADNM_ADDR"><span class="y_info2">주소</span></label>
                    </td>
                    <td>
                        <input type="text" id="REFINE_ROADNM_ADDR" name="REFINE_ROADNM_ADDR" value="${dto.REFINE_ROADNM_ADDR}">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="REPRSNT_FOOD_NM"><span class="y_info2">주요메뉴</span></label>
                    </td>
                    <td>
                        <input type="text" id="REPRSNT_FOOD_NM" name="REPRSNT_FOOD_NM" value="${dto.REPRSNT_FOOD_NM}">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="point"><span class="y_info2">요청사항</span></label>
                    </td>
                    <td>
                        <input type="text" id="point" name="point" value="${dto.point}" placeholder="언어, 스타일, 홍보포인트(30자이내)" maxlength="30">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="opentime"><span class="y_info2">오픈시간</span></label>
                    </td>
                    <td>
                        <input type="time" id="opentime" name="opentime" min="00:00" max="24:00" step="300" value="${dto.opentime}">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="closetime"><span class="y_info2">종료시간</span></label>
                    </td>
                    <td>
                        <input type="time" id="closetime" name="closetime" min="00:00" max="24:00" step="300" value="${dto.closetime}">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="holiday" ><span class="y_info2">휴일</span></label>
                    </td>
                    <td>
                        <select id="holiday" name="holiday"  style="margin-left: 30px; height: 50px;">
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
                        <br>
                        <label for="photo"><span class="y_info2">사진 넣기</span></label>
                    </td>
                    <td>
                        <br>
                        <input type="file" id="photo" name="photo" multiple style="height: 50px;">
                    </td>
                </tr>
                <tr align="center">
                    <td colspan="2">
                        <button type="submit" style="margin-top:50px; float:right;" id="contentadd" data-bs-toggle="modal" data-bs-target="#myModal" onclick="openModal()">홍보글 작성</button>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>
<div class="outputarea">
    <div class="outputarea_sub" style="display:flex ; align-items: center; top: 10px;" >
        <img src="../photo/chatGPT.png" style="width: 40px">
        <h3 style="margin-left: 10px;">AI 홍보글 작성</h3>
    </div>
    <form action="U_updateprompt" method="post" enctype="multipart/form-data">
        <div class="prompt" id="prompt">
            <textarea class="GPT_content" id="GPT_content" name="GPT_content" value="${dto.GPT_content}">
${dto.GPT_content}
            </textarea>
        </div>
        <button type="submit" id="sendprompt" style="margin-right: 60px;" onclick="location.href='/storepage'">수정</button>
    </form>
</div>
<!-- Modal -->
<div id="modal" class="modal">
    <div class="modal-content">
        <button id="closeButton" style="display: none;" onclick="closeModal()" class="close">&times;</button>
        <div class="video-wrapper">
            <video id="videoPlayer" loop>
                <source src="../video/entersiteinfo.mp4" type="video/mp4">
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