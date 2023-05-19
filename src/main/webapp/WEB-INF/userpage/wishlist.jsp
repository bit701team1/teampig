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

        #k_wishlist{
            width: 1000px;
            margin-top: 55px;
        }

        img.starimage{
            width: 26px;
            height: 26px;
            cursor: pointer;
            z-index: 1;
            position: relative;
        }

        .mypage_tr{
            border-bottom: 1px solid #aaaaaa;
            height: 64px;
            cursor: pointer;
        }
        .mypage_tr:hover{
            border-bottom: 1px solid #aaaaaa;
            height: 50px;
            cursor: pointer;
            background-color: #f6f5f0;
        }
        .mypage_RESTR_NM{
            width: 200px;
            padding-top: 10px;
            vertical-align: middle;
            line-height: 5px;
            font-weight: bolder;
        }

        .page_num{
            text-align: center;
            height: 35px;
            width: 35px;
            font-size: 20px;
            border-radius: 5px;
            cursor: pointer;
        }

        .page_cur_num{
            text-align: center;
            display: inline-block;
            height: 30px;
            width: 30px;
            font-size: 27px;
            border-radius: 5px;
        }

        .page_cur_num, .page_nor_num{
            margin-left: 3px;
            margin-right: 3px;
        }

        .page_last{
            font-size: 25px;
            vertical-align: middle;
            line-height: 10px;
            margin-top: -5px;
        }
        .page_first{
            font-size: 25px;
            vertical-align: middle;
            line-height: 10px;
            margin-top: -5px;
        }

        .page_num{
            display: inline-block;
            height: 30px;
            width: 30px;
            border-radius: 5px;
        }
        .page_num:hover{
            background-color: #7ee0b6;
            color: white;
            border-radius: 5px;
        }

        .page_num a{
            font-family: "Nanum Gothic";
            font-weight: bold;
        }

        .page_previous{
            margin-right: 5px;
        }

        #k_page_place{
            display: inline;
            text-align: center;
            position: absolute;
            margin-left: 320px;

        }
    </style>
    <script>
        $(function (){
            wishlist();

            $(document).on('click', '.k_mybookmark', function() {

                var user_idx = ${loginidx};
                var food_idx = $(this).attr("food_idx");

                var b=confirm("삭제하시겠습니까?");

                if(b){
                    alert("확인");
                    $.ajax({
                        type: "get",
                        url: "/deleteBookmark",
                        data: {"food_idx": food_idx, "user_idx": user_idx},
                        success: function() {
                            wishlist();
                        },
                        error: function(xhr, status, error) {
                            console.error("Error: " + error);
                        }
                    });
                }
            }); // click event


        }); // $func end
        function wishlist(){
            var loginidx =${sessionScope.loginidx}
                $.ajax({
                    type:"get",
                    url:"/bookmarklist",
                    dataType:"json",
                    data:{"user_idx": loginidx},
                    success: function(res) {
                        var s=`<table class="table table-borderless" style="width: 850px">`;
                        $.each(res, function (idx, ele) {
                            s+=`
                            <tr class="mypage_tr" onclick="location.href='detail?food_idx='+\${ele.food_idx}">
                                <td class="mypage_RESTR_NM">\${ele.restrt_NM}</td>
                                <td class="mypage_foodtype">#\${ele.food_type}</td>
                                <td class="k_reviewtext"><img src="/bookmark/filledstar.png" class="starimage starfilling k_mybookmark" food_idx ='\${ele.food_idx}'></td>
                            </tr>
                        `;
                        }); //each end

                        s+=`</table>`;

                        $("div#k_wishlist").html(s);
                    }
                }); //ajax end

        } //wishlist() end
    </script>
</head>
<body>
<div id="k_wishlist" style="margin-left: 30px"></div>
</body>
</html>