<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="utf-8">
    <title>Insert title here</title>
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
        div.y_coupon{
            position : absolute;
            width: 1000px;
            padding: 10px;
            /*border-radius: 0.825rem;*/
            /*border-top:0.25rem solid #5C732C !important;*/
            /*box-shadow: 0 .15rem 1.0rem 0 rgba(58,59,69,.15)!important;*/
            /*transition: box-shadow 0.1s ease;*/
            /*margin-bottom: 20px;*/
        }
        p{
            display: inline-block;
        }
        .table {
            width: 800px;
            margin: auto;
            border-collapse: collapse;
        }

        .table th {
            position: relative;
            background-color: black;
        }

        .table th::after {
            content: "";
            position: absolute;
            bottom: -3px; /* 더 두껍게 보이도록 조절 */
            left: 0;
            right: 0;
            height:3px; /* 더 두껍게 보이도록 조절 */
            background-color:#5C732C;
        }

        .table td {
            border-bottom: 1px solid #5C732C;
        }
    </style>

</head>
<body>
<div class="y_coupon">
    <h2 h2 style="font-weight: bold;">쿠폰 관리</h2>
    <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#calendarModal">예약하기</button>
<div style="width:450px;">

    <!-- The Modal -->
    <div class="modal fade" id="calendarModal">
        <div class="modal-dialog">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">예약하기</h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">

                    <table id="tables">

                        <tr>
                            <th style="width: 100px;">날짜</th>
                            <td>
                                <input type="date" class="form-control" name="start" id="y_date">
                            </td>
                        </tr>
                        <tr>
                            <th style="width: 100px;">시간</th>
                            <td>
                                <input type="text" class="form-control" id="y_time" >
                            </td>
                        </tr>
                        <tr>
                        </tr>
                    </table>

                </div>
                <!-- Modal footer -->
                <div class="modal-footer">
                <button type="button" class="btn btn-success" style="background-color:#5C732C;" data-bs-dismiss="modal" onclick="allSave()">예약하기</button>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    const timeInput = document.getElementById('y_time');
    const dateInput = document.getElementById('y_date');
    const now = new Date();
    // opentime과 closetime 값을 출력할 HTML 요소의 ID를 가리키는 변수를 설정합니다.
    const openTime = '${dto.opentime}'; // 'opentime' 값으로 변경해야 합니다.
    const closeTime = '${dto.closetime}'; // 'closetime' 값으로 변경해야 합니다.

    dateInput.min = now.toISOString().split('T')[0];

    flatpickr(dateInput, {
        minDate: "today", // 오늘 날짜를 최소 선택 가능 날짜로 설정
        onChange: function(selectedDates, dateStr, instance) {
            if (selectedDates[0].toDateString() === now.toDateString()) {
                // 선택한 날짜가 오늘이라면, 현재 시간부터 선택 가능하도록 설정
                timePicker.set('minTime', now.getHours() + ':00');
            } else {
                // 선택한 날짜가 오늘이 아니라면, 어떤 시간이든 선택 가능하도록 설정
                timePicker.set('minTime', '00:00');
            }
        },
    });
    const timePicker = flatpickr(timeInput, {
        enableTime: true,
        noCalendar: true,
        dateFormat: 'H:i',
        time_24hr: true,
        minuteIncrement: 60,
        minTime: openTime, // 현재 시간부터 선택 가능
        maxTime: closeTime, // 23:59까지 선택 가능
    });

</script>
<script>
    function allSave() {
        var event = {
            start: ''
        };

        event.start = document.getElementById('y_date').value + 'T' + document.getElementById('y_time').value;

        var events = [event];

        var jsondata = JSON.stringify(events);
        console.log(jsondata);
        savedata(jsondata);
    }

    function savedata(jsondata) {
        $.ajax({
            type: 'POST',
            url: './insert',
            data: jsondata,
            contentType: 'application/json',
            dataType: 'text',
            success: function(result) {
                console.log(jsondata);
                alert("예약완료!");
            },
            error: function(request, status, error) {
                alert('이미 예약된 시간입니다' + error);
            }
        });
    }
</script>
    <div class="y_couponlist" style="margin-top: 50px;">
        <table class="table" style="width: 800px; margin: auto; margin-bottom: 50px;">
            <caption align="top">
                <h4><b>쿠폰 목록</b></h4>
            </caption>
            <thead>
            <tr>
                <th style="width: 80px;text-align: center;">번호</th>
                <th style="width: 200px; text-align: center;">쿠폰</th>
                <th style="width: 320px; text-align: center;">남은 시간</th>
                <th style="width:200px; text-align: center;">수량</th>

            </tr>
            </thead>
            <tbody>
            <c:forEach var="dto" items="${list2}" varStatus="i">
                <tr>
                    <td  style="text-align: center;">${i.index+1}</td>
                    <td style="text-align: center;">${dto.number}%할인</td>
                    <td style="text-align: center;">
                        <div class="countdown" id="countdown-${i.index}">
                            <p class="countdown-timer-days">00</p>
                            <p class="countdown-timer-hours">00</p>
                            <p class="countdown-timer-minutes">00</p>
                            <p class="countdown-timer-seconds">00</p>
                        </div>
                    </td>
                    <td style="text-align: center;">${dto.max}개 남았습니다
                        <span style="float: right;font-size:15px;cursor:pointer;"
                              id="y_delete_${dto.num}">삭제</span></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<script>
    <c:forEach var="dto" items="${list2}" varStatus="i">
    var time${i.index} = "${dto.time}";
    const endDate${i.index} = new Date(time${i.index});

    const timeinterval${i.index} = setInterval(() => {
        const timeDiff${i.index} = endDate${i.index}.getTime() - Date.now();
        if (timeDiff${i.index} <= 0) {
            clearInterval(timeinterval${i.index});
            const countdownEl${i.index} = document.querySelector("#countdown-${i.index}");
            countdownEl${i.index}.querySelector(".countdown-timer-days").innerHTML = "쿠폰 유효기간이 끝났습니다";
            countdownEl${i.index}.querySelector(".countdown-timer-hours").innerHTML = "";
            countdownEl${i.index}.querySelector(".countdown-timer-minutes").innerHTML = "";
            countdownEl${i.index}.querySelector(".countdown-timer-seconds").innerHTML = "";
            countdownEl${i.index}.querySelector("#y_delete_${dto.num}").textContent = "삭제";
            return;
        }
        // 남은 시간을 일, 시간, 분, 초 단위로 계산합니다.
        const days${i.index} = Math.floor(timeDiff${i.index} / (1000 * 60 * 60 * 24));
        const hours${i.index} = Math.floor((timeDiff${i.index} % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
        const minutes${i.index} = Math.floor((timeDiff${i.index} % (1000 * 60 * 60)) / (1000 * 60));
        const seconds${i.index} = Math.floor((timeDiff${i.index} % (1000 * 60)) / 1000);

        const daysEl${i.index} = document.querySelector("#countdown-${i.index} .countdown-timer-days");
        const hoursEl${i.index} = document.querySelector("#countdown-${i.index} .countdown-timer-hours");
        const minutesEl${i.index} = document.querySelector("#countdown-${i.index} .countdown-timer-minutes");
        const secondsEl${i.index} = document.querySelector("#countdown-${i.index} .countdown-timer-seconds");

        daysEl${i.index}.textContent = days${i.index} + "일";
        hoursEl${i.index}.textContent = hours${i.index} + "시간";
        minutesEl${i.index}.textContent = minutes${i.index} + "분";
        secondsEl${i.index}.textContent = seconds${i.index} + "초";
    }, 1000);
    </c:forEach>
</script>
<script type="text/javascript">
    <c:forEach var="dto" items="${list2}" varStatus="i">
    $("#y_delete_${dto.num}").click(function() {
        let a = confirm("삭제하려면 확인을 눌러주세요");
        if (a) {
            location.href = './deletecoupon?num=' + ${dto.num};
        }
    });
    </c:forEach>
</script>
</body>
</html>