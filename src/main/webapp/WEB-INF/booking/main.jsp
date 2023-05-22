<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta id="ch-new-plugin-theme" name="theme-color" content="#686868">
    <title>공공데이터 검색엔진 - 끼니피그</title>
    <script src="https://code.jquery.com/jquery-3.6.3.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&family=Gothic+A1&family=Gowun+Batang&family=Hahmlet&family=Song+Myung&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    <style type="text/css">
        body, body * {
            font-family: 'Gowun Batang';
        }
        div.y_myinfo{
            width: 1000px;
            padding: 10px;
            border-radius: 0.825rem;
            border-top:0.25rem solid #5C732C !important;
            box-shadow: 0 .15rem 1.0rem 0 rgba(58,59,69,.15)!important;
            transition: box-shadow 0.1s ease;
        }
        h2 {
            font-weight: bold;
        }
        .y_square {
            margin-top:10px;
            width: 1000px;
            margin-bottom: 20px;
            height: 100px;
            border-radius: 15px;
            box-shadow: 1px 1px 10px 0 rgba(72, 75, 108, .08);
            border: solid 1px #e3e9ed;
            background-color: #fff;
            box-sizing: border-box;
            position: relative; /* 수정: position 값을 relative로 변경 */
            display: flex;
            justify-content: space-between;
        }

        .y_square::before,
        .y_square::after {
            content: "";
            position: absolute;
            top: 25px;
            bottom: 25px;
            width: 1px;
            background-color: #e3e9ed;
        }

        .y_square::before {
            left: calc(33.33% - 0.5px);
        }

        .y_square::after {
            right: calc(33.33% - 0.5px);
        }

        .y_content {
            flex: 1;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 18px;
            color: #5c667b;
        }
        .y_content:hover .y_coup {
            color: black;
        }
    </style>

</head>
<body>
<c:set var="root" value="<%=request.getContextPath() %>"/>
<h2>가게정보</h2>
<div class="y_myinfo">
    <div style="display: flex; margin-top: 10px;" class="detail_img">
        <img src="" style="width: 450px; height:400px;" class="rounded" alt="Cinque Terre" id="main-img">
        <table class="table table-bordered" style="width: 500px; margin-left: 20px; height:400px; ">
            <tr>
                <td style="width: 100px; background: #F6F6F6;">이름 </td>
                <td>${dto.RESTRT_NM}</td>
            </tr>
            <tr>
                <td style="width: 100px; background: #F6F6F6;">전화번호 </td>
                <td>${dto.TASTFDPLC_TELNO}</td>
            </tr>
            <tr>
                <td style="width: 100px; background: #F6F6F6;">가격대 </td>
                <td>${dto.food_price}</td>
            </tr>
            <tr>
                <td style="width: 100px; background: #F6F6F6;">주 메뉴</td>
                <td>${dto.food_type}</td>
            </tr>
            <tr>
                <td style="width: 100px; background: #F6F6F6;">주소  </td>
                <td>${dto.REFINE_ROADNM_ADDR}</td>
            </tr>
         <%--   <tr>
                <td style="width: 100px; background: #F6F6F6;"> 가게 포인트 </td>
                <td>${dto.point}</td>
            </tr>--%>
            <tr>
                <td style="width: 100px; background: #F6F6F6;"> 오픈 시간 </td>
                <td>${dto.opentime}</td>
            </tr>
            <tr>
                <td style="width: 100px; background: #F6F6F6;"> 닫는 시간 </td>
                <td>${dto.closetime}</td>
            </tr>
            <tr>
                <td style="width: 100px; background: #F6F6F6;">휴일</td>
                <td>${dto.holiday}</td>
            </tr>
        </table>
    </div>
</div>
<div class="y_square">
    <div class="y_content">예약 총 ${totalCount} </div>
    <div class="y_content" style="cursor: pointer;" data-bs-toggle="modal" data-bs-target="#couponModal"><span class="y_coup">쿠폰 등록</span></div>
    <div class="y_content">내 가게 리뷰 ${reviewcount}</div>
</div>

<!-- The Modal -->
<div style="width: 450px;">

    <!-- The Modal -->
    <div class="modal fade" id="couponModal">
        <div class="modal-dialog">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">쿠폰등록</h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                    <form>
                        <div class="mb-3">
                            <label for="coupon" class="form-label">할인율</label>
                            <select class="form-select" id="coupon" name="number">
                                <option value="5">5%</option>
                                <option value="10">10%</option>
                                <option value="15">15%</option>
                                <option value="20">20%</option>
                                <option value="25">25%</option>
                                <option value="30">30%</option>
                                <option value="35">35%</option>
                                <option value="40">40%</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <div class="input-group">
                                <span class="input-group-text">수량</span>
                                <input type="text" class="form-control" id="quantity" name="max">
                            </div>
                        </div>
                        <div class="mb-3">
                            <label>유효기간</label>
                            <input type="date" name="time" id="y_cdate"  class="form-control" style="width: 200px; display: inline-block;" >
                            &nbsp;<input type="text" id="y_ctime" class="form-control" style="width:190px; display: inline-block;">
                        </div>
                    </form>
                </div>

                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-success" style="background-color:#5C732C;" data-bs-dismiss="modal" onclick="applyCoupon()">등록</button>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    const timeInput2 = document.getElementById('y_ctime');
    const dateInput2 = document.getElementById('y_cdate');
    const now2 = new Date();
    var imagePaths = [];

    dateInput2.min = now2.toISOString().split('T')[0];
    flatpickr(dateInput2, {
        minDate: "today", // 오늘 날짜를 최소 선택 가능 날짜로 설정
        onChange: function(selectedDates, dateStr, instance) {
            if (selectedDates[0].toDateString() === now2.toDateString()) {
                // 선택한 날짜가 오늘이라면, 현재 시간부터 선택 가능하도록 설정
                timePicker2.set('minTime', now2.getHours() + ':00');
            } else {
                // 선택한 날짜가 오늘이 아니라면, 어떤 시간이든 선택 가능하도록 설정
                timePicker2.set('minTime', '00:00');
            }
        },
    });
    const timePicker2 = flatpickr(timeInput2, {
        enableTime: true,
        noCalendar: true,
        dateFormat: 'H:i',
        time_24hr: true,
        minuteIncrement: 1,
        minTime: now2,
        maxTime: '23:59', // 23:59까지 선택 가능
    });
    function applyCoupon() {
        var event2 = {
            number: '', time:'', max:''
        };

        event2.time = document.getElementById('y_cdate').value + 'T' + document.getElementById('y_ctime').value;
        event2.number= document.getElementById('coupon').value;
        event2.max = document.getElementById('quantity').value;
        var events2 = [event2];

        var jsondata2 = JSON.stringify(events2);
        console.log(jsondata2);
        savedata2(jsondata2);
    }
    function savedata2(jsondata2) {
        $.ajax({
            type: 'POST',
            url: './insertcoupon',
            data: jsondata2,
            contentType: 'application/json',
            dataType: 'text',
            success: function (response) {
                alert(response);
            },
            error: function (xhr, status, error) {
                alert(xhr.responseText);
            }
        });
    }
    $(document).ready(function() {
        // Function to change the main image
        function changeImage(imagePath) {
            $("#main-img").attr("src", imagePath);
        }
        var user_idx = ${dto.user_idx};
        console.log(user_idx);
        // Send an Ajax request to get the photos
        $.ajax({
            type: "GET",
            url: "/mypage/getphoto", // 해당 URL을 실제로 사용하는 경로로 변경해야 합니다.
            data: { "user_idx": user_idx }, // 사용자의 user_idx 값을 넣어야 합니다.
            dataType: "json",
            success: function(res) {
                // 첫 번째 사진의 photoname을 꺼내어 콘솔에 출력
                var firstPhoto = res[0].photoList[0];
                var photoname = firstPhoto.photoname;
                console.log("First photoname: " + photoname);

                $("#main-img").attr("src", "http://kr.object.ncloudstorage.com/pig701-bucket/foodphoto/"+photoname);
            }
        });
    });
</script>
<style>
    .custom-div {
        border: 1px solid #ddd;
        border-radius: 8px;
        padding: 20px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        font-size: 18px;
        color: #333;
        line-height: 1.5;
        text-align: center;
        margin-bottom: 100px;
        background-color:rgba(228, 247, 186, 0.3);
    }

    .custom-div h1 {
        font-size: 24px;
        margin-top: 0;
    }
    .custom-div2{
        border: 1px solid #ddd;
        border-radius: 8px;
        padding: 20px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        font-size: 18px;
        color: #333;
        line-height: 1.5;
        text-align: center;
        background-color: white;
    }
</style>

<div class="custom-div" >
    <h1><img src="../photo/chatGPT.png" style="width: 40px">&nbsp;< AI가 출력해주는 홍보글 ></h1>
    <div class="custom-div2">
        <pre style="white-space: pre-wrap;">${dto.GPT_content}</pre>
    </div>
</div>
</body>
