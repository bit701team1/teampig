<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공공데이터 검색엔진 - 끼니피그</title>
    <script src="https://code.jquery.com/jquery-3.6.3.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Jua&family=Lobster&family=Nanum+Pen+Script&family=Single+Day&display=swap"
          rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&display=swap" rel="stylesheet">
    <style>
        body, body * {
            font-family: 'Jua'
        }
        #title_bookmark{
            font-size: 30px;
        }

        #k_wishlist{
            width: 1000px;
            margin-top: 10px;
        }

        img.starimage{
            width: 26px;
            height: 26px;
            cursor: pointer;
            z-index: 99;
            vertical-align: center;
        }

        k_bookmark_place{
            /*display: flex;
            align-items: center;
            justify-content: center;*/
        }
        .mypage_tr{
            border-bottom: 1px solid #aaaaaa;
            height: 64px;
            cursor: pointer;
        }
        .mypage_tr:hover{
            border-bottom: 1px solid #aaaaaa;
            height: 64px;
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

        .mypage_foodtype{
            font-family: 'Dongle', sans-serif;
            font-size: 32px;
            vertical-align:center;
            color: #757575;
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
            wishlist(1);

            $(document).on('click', '.k_mybookmark', function() {

                var user_idx = ${loginidx};
                var food_idx = $(this).attr("food_idx");

                var b=confirm("삭제하시겠습니까?");

                if(b){
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
        function wishlist(currentPage){
            var loginidx =${sessionScope.loginidx}
                $.ajax({
                    type:"get",
                    url:"/bookmarklist",
                    dataType:"json",
                    data:{"user_idx": loginidx,"currentPage":currentPage},
                    success: function(res) {
                        console.log(res);
                        var s=`<table style="width: 900px">`;
                        $.each(res.list, function (idx, ele) {
                            s+=`
                            <tr class="mypage_tr">
                                <td class="mypage_RESTR_NM" onclick="location.href='../detail?food_idx='+\${ele.food_idx}">\${ele.restrt_NM}</td>
                                <td class="mypage_foodtype">#\${ele.food_type}</td>
                                <td>\${ele.food_price}</td>
                                <td class="k_bookmark_place"><img src="/bookmark/filledstar.png" class="starimage starfilling k_mybookmark" food_idx ='\${ele.food_idx}'></td>
                            </tr>
                        `;
                        }); //each end

                        s+=`</table>`;

                        /*페이징처리*/
                        s += `<br><br><div id="k_page_place">
                        <!-- 처음으로 -->
                    	<span class="page_num page_first"><i class="bi bi-skip-start-fill" style="color:black;text-decoration:none;cursor: pointer;"
                        onclick="wishlist(1);"></i></span>
                        `;
                        <!-- 이전 -->
                        if(res.startPage>1){
                            s += `<span class="page_num page_previous" startpage="\${res.startPage-1}"><a style="color: black; text-decoration: none; cursor: pointer;"
                            onclick="wishlist(\${res.startPage-1});"><i class="bi bi-caret-left-fill"></i></a></span>`;
                        }
                        //현재 번호
                        for (var i = res.startPage; i <= res.endPage; i++) {
                            if (i == res.currentPage) {
                                s += `<span class="page_cur_num" for_idx="\${i}"><a style="color: #7ee0b6; text-decoration: none; cursor: pointer;border-bottom: 3px solid #7ee0b6;"
                                onclick="wishlist(\${i});" id="currentPage">\${i}</a></span>`;
                            } else {
                                s += `<span class="page_num page_nor_num" for_idx="\${i}"><a style="color: black; text-decoration: none; cursor: pointer; num_type='\${res.list_type}'"
                                id="currentPage" onclick="wishlist(\${i})">\${i}</a></span>`;

                            }
                        }
                        <!-- 다음 -->
                        if (res.endPage < res.totalPage) {
                            s += `<span class="page_num page_next" endpage="\${res.endPage + 1}"><a style="color: black; text-decoration: none; cursor: pointer;"
                            onclick="reviewlist(\${res.endPage + 1});"><i class="bi bi-caret-right-fill"></i></a></span>`;
                        }

                        <!-- 마지막 페이지 -->
                        s+=`<span class="page_num page_last" totalpage="\${res.totalPage}"><i class="bi bi-skip-end-fill"
                           style="color:black;text-decoration:none;cursor: pointer;"
                            onclick="reviewlist(\${res.totalPage});"></i>
                            </div></span>`;


                        $("div#k_wishlist").html(s);
                    }
                }); //ajax end

        } //wishlist() end
    </script>
</head>
<body>
<span id="title_bookmark"><i class="bi bi-star"></i> 즐겨찾기</span>
<div id="k_wishlist" style="margin-left: 30px"></div>

<script>
    (function(){var w=window;if(w.ChannelIO){return w.console.error("ChannelIO script included twice.");}var ch=function(){ch.c(arguments);};ch.q=[];ch.c=function(args){ch.q.push(args);};w.ChannelIO=ch;function l(){if(w.ChannelIOInitialized){return;}w.ChannelIOInitialized=true;var s=document.createElement("script");s.type="text/javascript";s.async=true;s.src="https://cdn.channel.io/plugin/ch-plugin-web.js";var x=document.getElementsByTagName("script")[0];if(x.parentNode){x.parentNode.insertBefore(s,x);}}if(document.readyState==="complete"){l();}else{w.addEventListener("DOMContentLoaded",l);w.addEventListener("load",l);}})();

    ChannelIO('boot', {
        "pluginKey": "b4df2af4-756d-46b8-b999-7ce37d50bfe2"
    });
</script>
</body>
</html>