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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <style>
        body, body * {
            font-family: 'Jua'
        }
        div.shopname{
            margin : 0px auto;
            margin-top: 20px;
            border: 1px solid black;
            border-radius: 10px;
            width: 80%;
            height: 50px;
            padding-left: 10px;
        }
        div.right_input_section{
            margin-right: 10%;
            float: right;
            border: 1px solid black;
            border-radius: 10px;
            margin-top: 10px;
            width: 38%;
            height: 800px;
        }
        .image-container {
            width: 40%;
            float: left;
            margin-left: 10%;
            border: 1px solid black;
            border-radius: 10px;
            margin-top: 10px;
            height: 800px;
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
        input[type="file"]
        {
            width: 90%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-bottom: 20px;
            margin-left: 30px;
        }

        button[type="button"] {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
        }
        .image-container .detail_img{
            background-color:#cccccc;
            border-radius: 5px;
            width: 95%;
            height: 500px;
            border: black solid 1px;
            margin: 0 auto;
            margin-top: 10px;
            display: flex;
            justify-content: center;
            align-items: center;
            position: relative;
        }
        .detail_thumb{
            border: black solid 1px;
            width: 95%;
            margin: 10px auto;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .thumbnail{
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
        button[type="button"]:hover {
            background-color: #0062cc;
        }
        .prev, .next {
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
            left: 0;
        }

        .next {
            right: 0;
            border-radius: 3px 0 0 3px;
        }

        .prev:hover, .next:hover {
            background-color: rgba(0,0,0,0.8);
        }
        .shopname label {
            display: inline-block;
            width: 60px;

        }
        .shopname input {
            display: inline-block;
            width: 300px;
            height: 90%;
        }
        div.RESTRT_NM{
            margin : 0px auto;
            margin-top: 20px;
            border: 1px solid black;
            border-radius: 10px;
            width: 80%;
            height: 50px;
            padding-left: 10px;
        }
        .prompt {
            display: flex;
        }
        .outputarea{
            border: black 1px solid;
            border-radius: 10px;
            width: 80%;
            height: 500px;
            margin: 0px auto;
            top: 820px;
            position: relative;
        }
        .outputarea_sub{
            border-radius: 10px;
            width: 95%;
            height: 50px;
            position: relative;
            margin: 5px auto;
        }
        .GPT_content{
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
            right: 50px;
        }
        .detail_img img{
            max-width: 100%;
            max-height: 100%;
        }
        /*모달버튼*/
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
            height: 0;
        }

        .video-wrapper video {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
        }
    </style>
    </style>
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
                let cnt=$("#photo")[0].files.length;
                let RESTRT_NM=$("#RESTRT_NM").val();
                let food_type=$("#food_type").val();
                let TASTFDPLC_TELNO=$("#TASTFDPLC_TELNO").val();
                let REPRSNT_FOOD_NM=$("#REPRSNT_FOOD_NM").val();
                let REFINE_ROADNM_ADDR=$("#REFINE_ROADNM_ADDR").val();
                let opentime=$("#opentime").val();
                let closetime=$("#closetime").val();
                let food_price=$("#food_price").val();
                let holiday=$("#holiday").val();
                let point=$("#point").val();
                {
                    if (TASTFDPLC_TELNO.length == 0){
                        alert("전화번호를 입력해주세요")
                        return false;
                    }
                    if (REPRSNT_FOOD_NM.length==0){
                        alert("주요메뉴를 입력해주세요")
                        return false;
                    }
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
                form.append("RESTRT_NM",RESTRT_NM);
                form.append("food_type",food_type);
                form.append("TASTFDPLC_TELNO",TASTFDPLC_TELNO);
                form.append("REFINE_ROADNM_ADDR",REFINE_ROADNM_ADDR);
                form.append("REPRSNT_FOOD_NM",REPRSNT_FOOD_NM);
                form.append("opentime",opentime);
                form.append("closetime",closetime);
                form.append("food_price",food_price);
                form.append("holiday",holiday);
                form.append("point",point);
                openModal()
                $.ajax({
                    type: "post",
                    dataType: "json", // Set the dataType to "json" to receive a JSON response
                    url: "./insert",
                    processData: false,
                    contentType: false,
                    data: form,
                    success: function(response) {
                        console.log("food_idx: " + response.food_idx);
                        console.log("openaiResult: " + response.openaiResult);

                        $("#GPT_content").val(response.openaiResult);

                        // Pass the food_idx value to the sendprompt button
                        $("#sendprompt").data("food_idx", response.food_idx);
                        // alert("ai 홍보글 작성중입니다. 잠시만 기다려주시기 바랍니다 \n 20~30초정도 소요됩니다.")
                    }
                });
            });
        });
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

        $(document).ready(function() {
            $("#sendprompt").click(function (e) {
                e.preventDefault();

                let content = $("#GPT_content").val();
                let food_idx = $("#sendprompt").data("food_idx"); // Retrieve the stored food_idx value

                $.ajax({
                    type: "post",
                    dataType: "text",
                    url: "./W_updateprompt",
                    data: {
                        GPT_content: content,
                        food_idx: food_idx
                    },
                    success: function (res) {
                        console.log("결과" + res); // 응답값 출력
                        // Redirect to the home page
                        window.location.href = res;
                        alert("prompt 전송 성공!!")
                    }
                });
            });

            function changeImage(imagePath) {
                var img = new Image();
                img.onload = function () {
                    var detailImg = document.querySelector('#detail_img');
                    detailImg.innerHTML = '';
                    detailImg.appendChild(img);
                };
                img.src = imagePath;

                // main-img에 이미지 경로를 할당합니다.
                var mainImg = document.querySelector('#main-img');
                mainImg.src = imagePath;
            }

            document.querySelector('#photo').addEventListener('change', function(event) {
                var reader = new FileReader();
                reader.onload = function(e) {
                    var img = new Image();
                    img.src = e.target.result;
                    img.width = 200;

                    var detailImg = document.querySelector('#detail_img');
                    if (detailImg.childNodes.length > 0) {
                        // If an image exists, replace it with the new image
                        detailImg.replaceChild(img, detailImg.childNodes[0]);
                    } else {
                        // If no image exists, add the new image
                        detailImg.appendChild(img);
                    }

                    // Update thumbnails
                    const imagePaths = [];
                    for (let i = 0; i < event.target.files.length; i++) {
                        imagePaths.push(URL.createObjectURL(event.target.files[i]));
                    }
                    $("div.detail_thumb").empty();
                    $.each(imagePaths, function(index, imagePath) {
                        const thumbnail = $("<div class='thumbnail'></div>");
                        const img = $("<img>").attr("src", imagePath);
                        thumbnail.append(img);
                        thumbnail.appendTo($("div.detail_thumb"));
                    });

                    // Handle thumbnail click event
                    $('.thumbnail').on('click', function() {
                        // Get the selected thumbnail's image path
                        var imagePath = $(this).find('img').attr('src');
                        // Change the image in the detail_img element to the selected image
                        changeImage(imagePath);
                    });
                };
                reader.readAsDataURL(event.target.files[0]);
            });
        });
    </script>
</head>
<body>
    <div class="RESTRT_NM" >
        <h1>가게 등록</h1>
    </div>
    <div class="image-container">
        <div class="detail_img" id="detail_img">
<%--            <img id="main-img" src="" alt="main Image" style="max-width: 100%; max-height: 100%;">--%>
            <div class="prev" onclick="prevImage()">&#10094;</div>
            <div class="next" onclick="nextImage()">&#10095;</div>
        </div>
        <!--상품 썸네일-->
        <div class="detail_thumb"></div>
    </div>

<div class="right_input_section">
        <table style="width: 95%;">
            <tr>
                <td>
                    <label for="RESTRT_NM">상호명</label>
                </td>
                <td>
                    <input type="text" id="RESTRT_NM" name="RESTRT_NM" value="새거">
                </td>
            </tr>
            <tr>
                <td>
                    <label for="food_type">카테고리 </label>
                </td>
                <td>
                    <select id="food_type" name="food_type">
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
                    <label for="TASTFDPLC_TELNO">전화번호 </label>
                </td>
                <td>
                    <input type="tel" id="TASTFDPLC_TELNO" name="TASTFDPLC_TELNO" value="031-0000-0000">
                </td>
            </tr>
            <tr>
                <td>
                    <label for="REFINE_ROADNM_ADDR">주소</label>
                </td>
                <td>
                    <input type="text" id="REFINE_ROADNM_ADDR" name="REFINE_ROADNM_ADDR" value="경기도 수원시">
                </td>
            </tr>
            <tr>
                <td>
                    <label for="REPRSNT_FOOD_NM">주요메뉴</label>
                </td>
                <td>
                    <input type="text" id="REPRSNT_FOOD_NM" name="REPRSNT_FOOD_NM" value="한식">
                </td>
            </tr>
            <tr>
                <td>
                    <label for="opentime">오픈시간</label>
                </td>
                <td>
                    <input type="time" id="opentime" name="opentime" min="00:00" max="24:00" step="300">
                </td>
            </tr>
            <tr>
                <td>
                    <label for="closetime">종료시간</label>
                </td>
                <td>
                    <input type="time" id="closetime" name="closetime" min="00:00" max="24:00" step="300">
                </td>
            </tr>
            <tr>
                <td>
                    <label for="food_price">가격대(1인)</label>
                </td>
                <td>
                    <select id="food_price" name="food_price">
                        <option value="1만원대">1만원대</option>
                        <option value="2만원대">2만원대</option>
                        <option value="3만원대">3만원대</option>
                        <option value="4만원이상">4만원이상</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="point">홍보 강조사항</label>
                </td>
                <td>
                    <input type="text" id="point" name="point" value="깨끗한">
                </td>
            </tr>
            <tr>
                <td>
                    <label for="holiday">휴일</label>
                </td>
                <td>
                    <select id="holiday" name="holiday">
                        <option value="없음">없음</option>
                        <option value="일요일">일요일</option>
                        <option value="월요일">월요일</option>
                        <option value="화요일">화요일</option>
                        <option value="수요일">수요일</option>
                        <option value="목요일">목요일</option>
                        <option value="금요일">금요일</option>
                        <option value="토요일">토요일</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="photo">사진 넣기</label>
                </td>
                <td>
                    <input type="file" id="photo" name="photo" multiple>
                </td>
            </tr>
            <tr align="center">
                <td colspan="2">
                    <button type="button"  style="margin-bottom: 10px;" id="contentadd">가게 등록</button>
                </td>
            </tr>
        </table>
</div>
    <div class="outputarea">
        <div class="outputarea_sub">
            <h3 style="position: absolute; padding: 5px 10px">AI 홍보글 작성</h3>
        </div>
        <form action="updateprompt" method="post" enctype="multipart/form-data">
            <div class="prompt" id="prompt">
            <textarea class="GPT_content" id="GPT_content" name="GPT_content" value="${dto.GPT_content}">
                ${dto.GPT_content}
            </textarea>
            </div>
            <button type="submit" id="sendprompt">전송</button>
        </form>
    </div>
    <!-- Modal Button -->
    <button onclick="openModal()">Watch Video</button>
    <!-- Modal -->
    <div id="modal" class="modal">
        <div class="modal-content">
            <button id="closeButton" style="display: none;">&times;</button>
            <div class="video-wrapper">
                <video id="videoPlayer" controls>
                    <source src="../ad/ad.mp4" type="video/mp4">
                </video>
            </div>
        </div>
    </div>

    <script>
            // // Open Modal
            // function openModal() {
            //     document.getElementById("modal").style.display = "block";
            //     document.getElementById("videoPlayer").play();
            // }
            //
            // // Close Modal
            // function closeModal() {
            //     document.getElementById("modal").style.display = "none";
            //     document.getElementById("videoPlayer").pause();
            //     document.getElementById("videoPlayer").currentTime = 0;
            // }
    </script>
</body>
</html>