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
        .y_qnalist{
            margin-top: 100px;
            margin-bottom: 100px;
            display: flex;
            flex-direction: column; align-items: center;
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
        #y_page2{
            display: flex;
            justify-content: center;
        }
        .table td {
            border-bottom: 1px solid #5C732C;
        }

    </style>

</head>
<body>
<h2 h2 style="font-weight: bold;">나의 QnA</h2>
<div class="y_qnalist">
    <table class="table" style="width: 800px; margin: auto;">
        <caption align="top"><h4><b>qna 목록</b></h4></caption>
        <thead>
        <tr>
            <th style="width: 20px">번호</th>
            <th style="width: 300px">제목</th>
            <th style="width: 200px">날짜</th>
        </tr>
        </thead>
        <tbody id="qnaList">
        <!-- 예약 목록이 여기에 동적으로 추가됩니다 -->
        </tbody>
    </table>
    <div id="y_page2" style="width: 700px;  margin: 20px auto;  font-size: 20px;">
        <!-- 페이지네이션은 여기에 동적으로 생성됩니다 -->
    </div>
</div>
<script>
    function loadReservations(currentPage) {
        console.log('Current Page:', currentPage); // 현재 페이지 값 출력

        $.ajax({
            url: './qnaajax',
            type: 'GET',
            data: { currentPage: currentPage },
            dataType: 'json',
            success: function(data) {
                $('#totalCount').text(data.totalCount);
                $('#qnaList').empty();
                if (data.totalCount == 0) {
                    $('#noReservationMessage').show();
                } else {
                    $.each(data.list, function(index, dto) {
                        var subject = dto.qna_subject;
                        if (subject.length > 20) { // 텍스트 길이 제한을 20으로 설정
                            subject = subject.substring(0, 25) + '...';
                        }
                        var reservationRow = '<tr>' +
                            '<td style="text-align: center;">' + ((currentPage - 1) * 10 + index + 1) + '</td>' +
                            '<td style="cursor: pointer;">' + subject + '</td>' +
                            '<td>' + new Date(dto.qna_writeday).toLocaleString("en-US", {
                                year: 'numeric',
                                month: '2-digit',
                                day: '2-digit',
                                hour: '2-digit',
                                minute: '2-digit',
                                second: '2-digit'
                            }) + '<span id="y_delete" style="float: right; font-size: 15px; cursor: pointer;">삭제</span>' +
                            '</td>' +
                            '</tr>';
                        $('#qnaList').append(reservationRow);
                    });
                    $('#noReservationMessage').hide();
                }

                // Generate pagination links
                var pagination = '';
                if (data.startPage > 1) {
                    pagination += '<a style="color: black; text-decoration: none; cursor: pointer; margin-right:5px; " ' +
                        'onclick="loadReservations(' + (data.startPage - 1) + '); return false;">이전</a> ';
                }
                for (var i = data.startPage; i <= data.endPage; i++) {
                    if (i == data.currentPage) {
                        pagination += '<a  style="color: green; text-decoration: none; cursor: pointer; margin-right:5px;" ' +
                            'onclick="loadReservations(' + i + ');" id="currentPage">' + i + '</a> ';
                    } else {
                        pagination += '<a style="color: black; text-decoration: none; cursor: pointer; margin-right:5px;" ' +
                            'onclick="loadReservations(' + i + ');">' + i + '</a> ';
                    }
                }
                if (data.endPage < data.totalPage) {
                    pagination += '<a style="color: black; text-decoration: none; cursor: pointer; margin-right:5px;" ' +
                        'onclick="loadReservations(' + (data.endPage + 1) + '); ">다음</a>';
                }
                $('#y_page2').html(pagination);
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
</html>