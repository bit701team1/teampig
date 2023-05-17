<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="utf-8">
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-3.6.3.js"></script>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
            rel="stylesheet">
    <link
            href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&family=Gothic+A1&family=Gowun+Batang&family=Hahmlet&family=Song+Myung&display=swap"
            rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.2/main.min.css">
    <script type="text/javascript"
            src="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.2/main.min.js"></script>
    <script
            src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src='/dist/index.global.js'></script>
    <script src='/dist/index.global.min.js'></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    <style>
        #calendar {
            padding: 0;
            max-width: 1000px;
            width: 1000px;
            right: 0;
            bottom: 100px;
            position: relative;
            top:50px;
        }
        h2{
            left: 390px;
            top:100px;
            font-weight: bold;
        }
        .fc-button {
            background-color: #5C732C !important;
            color: white !important;
            border-color:white  !important;
        }
        .fc-button:hover {
            background-color: #2C4002 !important;
            color: white !important;
            border-color:white  !important;
        }
        .fc-day {
            background-image: none;
        }
        div.y_table{
            width: 1000px;
            top:500px;
            margin-left: 10px;
            left: 80px;
            margin-top: 200px;
            margin-bottom: 200px;
        }
        #y_page{
            position: relative;
            bottom: 170px;
            margin: auto;
        }
        .table th {
            position: relative;
            background-color: black;
        }
        .table td {
            border-bottom: 1px solid #5C732C;
        }
        .table th::after {
            content: "";
            position: absolute;
            bottom: -3px; /* 더 두껍게 보이도록 조절 */
            left: 0;
            right: 0;
            height:3px; /* 더 두껍게 보이도록 조절 */
            background-color: #5C732C;
        }
    </style>
    <script>
        <c:set var="root" value="<%=request.getContextPath() %>"/>
        document.addEventListener('DOMContentLoaded', function() {
            var calendarEl = document.getElementById('calendar');
            var currentDate = new Date(); // 현재 날짜 객체 가져오기
            var calendar = new FullCalendar.Calendar(calendarEl, {
                locale: 'ko',  // 한국어 설정
                dayCellContent: function(e) {
                    return e.dayNumberText.split('일')[0];
                },
                // 나머지 설정
                headerToolbar: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'dayGridMonth,timeGridWeek,timeGridDay'
                },
                initialDate: currentDate,
                navLinks: true, // can click day/week names to navigate views
                selectable: true,
                selectMirror: true,
                eventClick: function(info) {
                    if (confirm('예약을 지우시겠습니까?')) {
                        $.ajax({
                            url: './delete',
                            method: 'GET',
                            data: {
                                num: info.event.extendedProps.num // 이벤트의 고유 식별자를 파라미터로 전달 (예: 이벤트 ID)
                            },
                            success: function() {
                                alert('예약이 취소되었습니다');
                                info.event.remove(); // 이벤트 삭제
                            },
                            error: function() {
                                alert('Failed to delete event');
                            }
                        });
                    }
                },
                dateClick: function(info) {
                    openModal("새로운 예약", info.dateStr, info.dateStr);
                    function openModal(title, start) {
                        $('#modalTitle').text(title);
                        $('#start').val(start);
                        $('#exampleModal').modal('show');
                    }

                    // 모달 창 닫기
                    function closeModal() {
                        $('#exampleModal').modal('hide');
                    }
                },
                dayMaxEvents: true,
                timeZone: 'UTC',
                events: function(info, successCallback, failureCallback) {
                    $.ajax({
                        url: './list',
                        method: 'GET',
                        success: function(data) {

                            var events = [];

                            for (var i = 0; i < data.length; i++) {
                                var event = {
                                    title: "예약",
                                    start: data[i].start,
                                    allDay: false,
                                    backgroundColor : '#FFFFFF',
                                    textColor: '#000000',
                                    borderColor:'#bcf58f'
                                };
                                // num 속성이 있는 경우
                                if (data[i].num) {
                                    event.num = data[i].num;
                                }

                                events.push(event);

                            }
                            successCallback(events);

                        },
                        error: function() {
                            failureCallback(new Error('Failed to fetch events'));
                        }
                    });
                },
                eventDidMount: function(info) {
                    // 현재 뷰의 타입 체크
                    var viewType = info.view.type;
                    if (viewType === "dayGridMonth") {
                        // 월 단위 뷰에서만 배경 이미지 설정
                        var dateStr = info.event.startStr.split("T")[0];
                        var cells = document.querySelectorAll('.fc-day[data-date="' + dateStr + '"]');
                        cells.forEach(function(cell) {
                            cell.style.backgroundImage = `url('${root}/photo/pig3.png')`;
                            cell.style.backgroundSize = '70%';
                            cell.style.backgroundRepeat = 'no-repeat';
                            cell.style.backgroundPosition = 'center';
                            cell.style.cursor='pointer';
                        });
                    }
                }
            });
            calendar.render();
        });

    </script>
</head>
<body>
<h2 style="font-weight: bold;">예약 관리</h2>
<div id="calendar">
    <h5>달력에 예약을 누르면 삭제가 가능합니다</h5>
</div>
<div class="y_table">
    <table class="table" id="y_list">
        <caption align="top">
            <h4><b>총 <span id="totalCount"></span>개의 예약이 있습니다</b></h4>
        </caption>
        <thead>
        <tr>
            <th style="width: 20px; text-align: center;">번호</th>
            <th style="width: 100px">예약자</th>
            <th style="width: 280px">예약시간</th>
        </tr>
        </thead>
        <tbody id="reservationList">
        <!-- 예약 목록이 여기에 동적으로 추가됩니다 -->
        </tbody>
    </table>
</div>
<div id="y_page" style="width: 800px; text-align: center; font-size: 20px;">
    <!-- 페이지네이션은 여기에 동적으로 생성됩니다 -->
</div>
<script>
    function loadReservations(currentPage) {
        console.log('Current Page:', currentPage); // 현재 페이지 값 출력

        $.ajax({
            url: './calendarajax',
            type: 'GET',
            data: { currentPage: currentPage },
            dataType: 'json',
            success: function(data) {
                $('#totalCount').text(data.totalCount);
                $('#reservationList').empty();
                if (data.totalCount == 0) {
                    $('#noReservationMessage').show();
                } else {
                    $.each(data.list, function(index, dto) {
                        var reservationRow = '<tr>' +
                            '<td style="text-align: center;">'  + (index+1) + '</td>' +
                            '<td>' + '님</td>' +
                            '<td>' + dto.start.substring(0, 16) +
                            '<span style="float: right; font-size: 20px; cursor: pointer;" data-bs-toggle="modal" ' +
                            'data-bs-target="#calendarModal" onclick="openModal(' + dto.num + ', \'' + dto.start.substring(0, 10) + '\', \'' + dto.start.substring(11, 16) + '\')">' +
                            '<i class="bi bi-pencil"></i>수정</span>' +
                            '</td>' +
                            '</tr>';
                        $('#reservationList').append(reservationRow);
                    });
                    $('#noReservationMessage').hide();
                }

                // Generate pagination links
                var pagination = '';
                if (data.startPage > 1) {
                    pagination += '<a style="color: black; text-decoration: none; cursor: pointer;" ' +
                        'onclick="loadReservations(' + (data.startPage - 1) + '); return false;">이전</a> ';
                }
                for (var i = data.startPage; i <= data.endPage; i++) {
                    if (i == data.currentPage) {
                        pagination += '<a  style="color: green; text-decoration: none; cursor: pointer;" ' +
                            'onclick="loadReservations(' + i + ');" id="currentPage">' + i + '</a> ';
                    } else {
                        pagination += '<a style="color: black; text-decoration: none; cursor: pointer;" ' +
                            'onclick="loadReservations(' + i + ');">' + i + '</a> ';
                    }
                }
                if (data.endPage < data.totalPage) {
                    pagination += '<a style="color: black; text-decoration: none; cursor: pointer;" ' +
                        'onclick="loadReservations(' + (data.endPage + 1) + '); ">다음</a>';
                }
                $('#y_page').html(pagination);
            },
            error: function(xhr, status, error) {
                console.log(error);
            }
        });
    }

    $(document).ready(function() {
        // Initial load of reservations
        loadReservations(1);
    });
</script>
<!-- 수정 -->
<div class="modal fade" id="calendarModal">
    <div class="modal-dialog">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">예약 수정하기</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>

            <!-- Modal body -->
            <div class="modal-body">

                <table  id="tables">

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
            <button type="button" class="btn btn-danger" data-bs-dismiss="modal" onclick="allupdate()">수정하기</button>
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
    let selectedNum;

    function openModal(num, date, time) {
        selectedNum = num;

        document.getElementById('y_date').value = date;
        document.getElementById('y_time').value = time;
    }

    function allupdate() {
        var event = {
            num: selectedNum,
            start: document.getElementById('y_date').value + 'T' + document.getElementById('y_time').value
        };

        var jsondata = JSON.stringify(event);
        console.log(jsondata);
        updateData(jsondata);
    }

    function updateData(jsondata) {
        $.ajax({
            type: 'POST',
            url: './update',
            data: jsondata,
            contentType: 'application/json',
            dataType: 'text',
            success: function(result) {
                console.log(jsondata);
                alert("예약이 수정되었습니다!");
                location.reload(); // 페이지 새로고침
            },
            error: function(request, status, error) {
                alert('예약 수정에 실패했습니다. 다시 시도해주세요. ' + error);
            }
        });
    }

</script>
</body>
</html>