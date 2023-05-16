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
    <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&family=Gothic+A1&family=Gowun+Batang&family=Hahmlet&family=Song+Myung&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <style>
         body, body * {
             font-family: 'Gowun Batang'
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
        div.right_input_section{
            margin-right: 10%;
            float: right;
            border: 1px solid black;
            border-radius: 10px;
            margin-top: 10px;
            width: 38%;
            height: 700px;
        }
        .image-container {
            width: 40%;
            float: left;
            margin-left: 10%;
            border: 1px solid black;
            border-radius: 10px;
            margin-top: 10px;
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
        input[type="file"]{
            width: 90%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-bottom: 20px;
            margin-left: 30px;
        }

        button[type="button"],
        button[type="submit"]{
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
         .detail_img img{
             width: 100%;
             height: 100%;
         }
        .detail_thumb{
            /*border: black solid 1px;*/
            width: 95%;
            margin: 10px auto;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .thumbnail{
            width: 80px;
            height: 80px;
            border: #cccccc 1px solid;
            border-radius: 10px;
            margin: 10px 10px 10px 10px;
            display: flex;
            justify-content: center;
            align-items: center;
            cursor: pointer;
        }
        button[type="submit"]:hover {
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

         .prompt {
             display: flex;
         }
         .outputarea{
             border: black 1px solid;
             border-radius: 10px;
             width: 80%;
             height: 500px;
             margin: 0px auto;
             top: 700px;
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
         .thumbnail img{
             width: 100%;
             height: 100%;
             border-radius: 10px;
         }
    </style>
    <script>
        var currentImageIndex = 0;
        var imagePaths = [];

        // function prevImage() {
        //     if (currentImageIndex > 0) {
        //         currentImageIndex--;
        //     } else {
        //         currentImageIndex = imagePaths.length - 1;
        //     }
        //     changeImage(imagePaths[currentImageIndex]);
        // }
        //
        // function nextImage() {
        //     if (currentImageIndex < imagePaths.length - 1) {
        //         currentImageIndex++;
        //     } else {
        //         currentImageIndex = 0;
        //     }
        //     changeImage(imagePaths[currentImageIndex]);
        // }
        // Modify the changeImage() function

        // function changeImage(imagePath) {
        //     document.getElementById('main-img').src = imagePath;
        // }

        $(function () {
            //업로드한 사진들과 데이타를 같이 묶어서 서버에 전송하기
            $("#contentadd").click(function () {
                let food_idx=$("#food_idx").val();
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
                form.append("food_idx",food_idx);
                openModal();
                console.log($("#photo")[0].files)
                console.log($("#food_idx").val());
                $.ajax({
                    type: "get",
                    url: "./removephotos",
                    data: {food_idx: food_idx},
                    dataType: "text",
                    success: function () {
                        console.log("기존 사진이 삭제되었습니다.");
                        $.ajax({
                            type: "post",
                            dataType: "text",
                            url:"./update",
                            processData:false,
                            contentType:false,
                            data:form,
                            success:function (res){
                                console.log("결과"+res); // 응답값 출력
                            }
                        });
                    }
                });
            });
        });

        function changeImage(imagePath) {
            var mainImage = document.getElementById('main-img');
            mainImage.src = imagePath;
        }

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


            function detail_thumb(food_idx) {
                $.ajax({
                    type: "get",
                    url: "./getphoto",
                    data: { food_idx: food_idx }, // food_idx를 파라미터로 전달
                    dataType: "json",
                    success: function(res) {
                        let s = "";
                        $.each(res, function(idx, ele) {
                            $.each(ele.photoList, function(fidx, fele) {
                                // food_idx와 일치하는 사진만 출력
                                if (ele.food_idx === fele.food_idx) {
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
            const food_idx = $("#food_idx").val();
            detail_thumb(food_idx);

            $("#sendprompt").click(function (e) {
                e.preventDefault();

                let content = $("#GPT_content").val();
                let food_idx = $("#food_idx").val();

                $.ajax({
                    type: "post",
                    dataType: "text",
                    url: "./U_updateprompt",
                    data: {
                        GPT_content: content,
                        food_idx: food_idx
                    },
                    success: function (res) {
                        console.log("결과"+res); // 응답값 출력
                    }
                });
            });
        });
    </script>
</head>
<body>
<div class="RESTRT_NM" >
    <h1>${dto.RESTRT_NM}</h1>
</div>
<div class="image-container">
    <div class="detail_img">
        <img id="main-img" src="" alt="Example Image" style="max-width: 100%; max-height: 100%;">
<%--        <div class="prev" onclick="prevImage()">&#10094;</div>--%>
<%--        <div class="next" onclick="nextImage()">&#10095;</div>--%>
    </div>
    <!--상품 썸네일-->
    <div class="detail_thumb"></div>
</div>

<div class="right_input_section">
    <form action="update" method="post" enctype="multipart/form-data">
        <input type="hidden" id="food_idx" name="food_idx" value="${dto.food_idx}">
        <table>
            <tr>
                <td>
                    <label for="TASTFDPLC_TELNO">전화번호 </label>
                </td>
                <td>
                    <input type="tel" id="TASTFDPLC_TELNO" name="TASTFDPLC_TELNO" value=${dto.TASTFDPLC_TELNO}>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="REFINE_ROADNM_ADDR">주소</label>
                </td>
                <td>
                    <input type="text" id="REFINE_ROADNM_ADDR" name="REFINE_ROADNM_ADDR" value="${dto.REFINE_ROADNM_ADDR}">
                </td>
            </tr>
            <tr>
                <td>
                    <label for="REPRSNT_FOOD_NM">주요메뉴</label>
                </td>
                <td>
                    <input type="text" id="REPRSNT_FOOD_NM" name="REPRSNT_FOOD_NM" value="${dto.REPRSNT_FOOD_NM}">
                </td>
            </tr>
            <tr>
                <td>
                    <label for="point">홍보 포인트</label>
                </td>
                <td>
                    <input type="text" id="point" name="point" value="${dto.point}" placeholder="신선한, 주차장이 넓은 등">
                </td>
            </tr>
            <tr>
                <td>
                    <label for="opentime">오픈시간</label>
                </td>
                <td>
                    <input type="time" id="opentime" name="opentime" min="00:00" max="24:00" step="300" value="${dto.opentime}">
                </td>
            </tr>
            <tr>
                <td>
                    <label for="closetime">종료시간</label>
                </td>
                <td>
                    <input type="time" id="closetime" name="closetime" min="00:00" max="24:00" step="300" value="${dto.closetime}">
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
                    <button type="submit"  style="margin-bottom: 10px;" id="contentadd">홍보글 작성</button>
                </td>
            </tr>
        </table>
    </form>
</div>
<br>
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
<!-- Modal -->
<div id="modal" class="modal">
    <div class="modal-content">
        <span id="close" style="display: none;"class="close" onclick="closeModal()">&times;</span>
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