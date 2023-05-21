<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-3.6.3.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&family=Gothic+A1&family=Gowun+Batang&family=Hahmlet&family=Song+Myung&display=swap"
          rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">

    <style type="text/css">
        body, body * {
            font-family: 'Gowun Batang';
        }
        .y_reviewlist{
            margin-top: 100px;
            margin-bottom: 100px;
            display: flex;
            flex-direction: column; align-items: center;
        }
        .table {
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
            background-color: #5C732C;
        }

        .table td {
            border-bottom: 1px solid #5C732C;
        }
        #y_page3{
            display: flex;
            justify-content: center;
        }
    </style>

</head>
<body>
<h2 h2 style="font-weight: bold;">${store} 리뷰 관리</h2>
<div class="y_reviewlist">
    <table class="table" style="width: 800px; margin: auto;">
        <caption align="top"><h4><b>리뷰 목록</b></h4></caption>
        <thead>
        <tr>
            <th style="width: 20px">번호</th>
            <th style="width: 50px">작성자</th>
            <th style="width: 150px">내용</th>
            <th style="width: 120px">날짜</th>
            <th style="width: 100px">별점</th>
        </tr>
        </thead>
        <tbody id="reviewList">
        <!-- 예약 목록이 여기에 동적으로 추가됩니다 -->
        </tbody>
    </table>
    <div id="y_page3" style="width: 700px; margin: 20px auto; font-size: 20px;">
        <!-- 페이지네이션은 여기에 동적으로 생성됩니다 -->
    </div>
</div>
<script>
    function loadReservations(currentPage) {
        console.log('Current Page:', currentPage); // 현재 페이지 값 출력

        $.ajax({
            url: './reviewajax',
            type: 'GET',
            data: { currentPage: currentPage },
            dataType: 'json',
            success: function(data) {
                $('#reviewcount').text(data.reviewcount);
                $('#reviewList').empty();
                if (data.reviewcount == 0) {
                    $('#noReservationMessage').show();
                } else {
                    $.each(data.list, function(index, dto) {
                        var reviewText = dto.reviewtext;
                        if (reviewText.length > 20) { // 텍스트 길이 제한을 20으로 설정
                            reviewText = reviewText.substring(0, 15) + '...';
                        }
                        var reservationRow = '<tr>' +
                            '<td style="text-align: center;">' + ((currentPage - 1) * 10 + index + 1) + '</td>' +
                            '<td>' + dto.user_name+ '</td>' +
                            '<td style="cursor: pointer;">' + reviewText + '</td>' +
                            '<td>' + new Date(dto.write_day).toLocaleString("en-US", {
                                year: 'numeric',
                                month: '2-digit',
                                day: '2-digit',
                                hour: '2-digit',
                                minute: '2-digit',
                                second: '2-digit'
                            }) +
                            '</td>' +
                            '<td>' + dto.score +'점'
                            + '<span id="y_delete3_'+dto.review_idx+'" style="float: right; font-size: 15px; cursor: pointer;">삭제</span>'+
                            '</td>' +
                            '</tr>';
                        $('#reviewList').append(reservationRow);
                        // 삭제 이벤트 바인딩 코드를 AJAX 콜백 함수 내부로 이동
                        $("#y_delete3_" + dto.review_idx).click(function() {
                            let a = confirm("삭제하려면 확인을 눌러주세요");
                            if (a) {
                                location.href = './deletereview?review_idx=' + dto.review_idx;
                            }
                        });
                    });
                    $('#noReservationMessage').hide();
                }

                // Generate pagination links
                var pagination = '';
                if (data.startPage > 1) {
                    pagination += '<a style="color: black; text-decoration: none; cursor: pointer; margin-right: 5px;" ' +
                        'onclick="loadReservations(' + (data.startPage - 1) + '); return false;">이전</a> ';
                }
                for (var i = data.startPage; i <= data.endPage; i++) {
                    if (i == data.currentPage) {
                        pagination += '<a  style="color: green; text-decoration: none; cursor: pointer;  margin-right: 5px;" ' +
                            'onclick="loadReservations(' + i + ');" id="currentPage">' + i + '</a> ';
                    } else {
                        pagination += '<a style="color: black; text-decoration: none; cursor: pointer;  margin-right: 5px;" ' +
                            'onclick="loadReservations(' + i + ');">' + i + '</a> ';
                    }
                }
                if (data.endPage < data.totalPage) {
                    pagination += '<a style="color: black; text-decoration: none; cursor: pointer;  margin-right: 5px;" ' +
                        'onclick="loadReservations(' + (data.endPage + 1) + '); ">다음</a>';
                }
                $('#y_page3').html(pagination);
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
</body>
<