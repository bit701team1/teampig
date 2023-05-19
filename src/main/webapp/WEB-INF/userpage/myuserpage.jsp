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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">

    <style>
        body, body * {
            font-family: 'Jua'
        }
        td.k_reviewtext {
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            max-width: 300px;
        }
        #userpage_container{
            margin: 20px;
        }

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

        .custom-div {
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            font-size: 18px;
            color: #333;
            line-height: 1.5;
            text-align: center;

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
        .custom-div p {
            margin-bottom: 0;
        }
    </style>
    <script>
     $(function (){
         reviewlist();
     }); // $func end



     function reviewlist(){
         var user_idx =${sessionScope.loginidx}
             $.ajax({
                 type:"get",
                 url:"reviewlist",
                 dataType:"json",
                 data:{"user_idx": user_idx},
                 success: function(res) {
                     var s = "";
                     s+=`<table class="table table-bordered" style="width: 850px">`;

                     $.each(res, function (idx, ele) {
                         s+=`
                            <tr>
                                <td>\${ele.food_idx}</td>
                                <td style="width: 200px">\${ele.restrt_NM}</td>
                                <td class="k_reviewtext">\${ele['reviewtext']}</td>
                                <td width="150px">\${ele['write_day']}</td>
                            </tr>
                        `;
                     }); //each end

                     s+=`</table>`;
                     $("div#k_reviewlist").html(s);
                 }
             }); //ajax end

     } //reviewlist() end
    </script>
</head>
<body>
<br><br>
<div id="k_reviewlist" style="margin-left: 30px">
</div>
</div>
</body>
</html>