<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta id="ch-new-plugin-theme" name="theme-color" content="#686868">
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
       height: 100px;
       border-radius: 15px;
       box-shadow: 1px 1px 10px 0 rgba(72, 75, 108, .08);
       border: solid 1px #e3e9ed;
       background-color: #fff;
       box-sizing: border-box;
       position : absolute;
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
</style>

</head>
<body>
<c:set var="root" value="<%=request.getContextPath() %>"/>
<h2>가게정보</h2>
<div class="y_myinfo">
    <div style="display: flex; margin-top: 10px;">
        <img src='${root}/photo/food.gif' style="width: 300px" class="rounded" alt="Cinque Terre">
<table class="table table-bordered" style="width: 650px; margin-left: 20px; ">
    <tr>
        <td style="width: 100px; background: #F6F6F6;">이름 </td>
        <td>마마마</td>
    </tr>
    <tr>
        <td style="width: 100px; background: #F6F6F6;">전화번호 </td>
        <td>010-2222-3333</td>
    </tr>
    <tr>
        <td style="width: 100px; background: #F6F6F6;">가격대 </td>
        <td>2만원이상~3만원미만</td>
    </tr>
    <tr>
        <td style="width: 100px; background: #F6F6F6;">주 음식  </td>
        <td>국밥</td>
    </tr>
    <tr>
        <td style="width: 100px; background: #F6F6F6;">주소  </td>
        <td>서울시 강남구 역삼동</td>
    </tr>
    <tr>
        <td style="width: 100px; background: #F6F6F6;"> 가게 포인트 </td>
        <td>멋짐</td>
    </tr>
</table>
</div>
</div>
<div class="y_square">
    <div class="y_content">예약 총 ${totalCount} </div>
    <div class="y_content" style="cursor: pointer;" data-bs-toggle="modal" data-bs-target="#couponModal">쿠폰 등록</div>
    <div class="y_content">내 가게 리뷰 100개</div>
</div>
<div style="width:450px;">

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
                                    <input type="text" class="form-control" id="quantity">
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
                        <button type="button" class="btn btn-success" data-bs-dismiss="modal" onclick="applyCoupon()">등록</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    const timeInput2 = document.getElementById('y_ctime');
    const dateInput2 = document.getElementById('y_cdate');
    const now2 = new Date();

    dateInput2.min = now2.toISOString().split('T')[0];
    flatpickr(dateInput2, {
        minDate: "today", // 오늘 날짜를 최소 선택 가능 날짜로 설정
        onChange: function(selectedDates, dateStr, instance) {
            if (selectedDates[0].toDateString() === now.toDateString()) {
                // 선택한 날짜가 오늘이라면, 현재 시간부터 선택 가능하도록 설정
                timePicker2.set('minTime', now.getHours() + ':00');
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
</script>
<script>
    function applyCoupon() {
        var event2 = {
            number: '', time:''
        };

        event2.time = document.getElementById('y_cdate').value + 'T' + document.getElementById('y_ctime').value;
        event2.number= document.getElementById('coupon').value;
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
            success: function(result) {
                alert("쿠폰등록완료!!");
            },
            error: function(request, status, error) {
                alert('오류' + error);
            }
        });
    }
</script>
</body>
</html>