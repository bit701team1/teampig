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
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&display=swap" rel="stylesheet">

    <style>
        body, body * {
            font-family: 'Jua'
        }
        td.k_reviewtext {
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            max-width: 300px;
            vertical-align: middle;
            line-height: 5px;
        }

        #k_reviewlist{
            width: 1000px;
            margin-top: 10px;
        }
        #title_myuserpage{
            font-size: 30px;
        }
        #userpage_container{
            margin: 20px;
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
            vertical-align: center;

            color: #757575;
        }

        .mypage_writeday{
            vertical-align: middle;
            line-height: 5px;
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

        body, body * {
            font-family: 'Gowun Batang';
        }

        .y_content:hover .y_coup {
            color: black;
        }

        .custom-div h1 {
            font-size: 24px;
            margin-top: 0;
        }

        .custom-div p {
            margin-bottom: 0;
        }
    </style>
    <script>
     $(function (){
         reviewlist(1);
     }); // $func end



     function reviewlist(inputpage){
         var user_idx =${sessionScope.loginidx}

             var currentPage = inputpage;

             $.ajax({
                 type:"get",
                 url:"reviewlist",
                 dataType:"json",
                 data:{"user_idx": user_idx,"currentPage":currentPage},
                 success: function(res) {
                     var s = "";
                     s+=`<table  style="width: 900px">`;
                        console.log(res);
                     $.each(res.list, function (idx, ele) {
                         s+=`
                            <tr class="mypage_tr" onclick="location.href='detail?food_idx='+\${ele.food_idx}">
                                <td class="mypage_RESTR_NM">\${ele.restrt_NM}</td>
                                <td width="130px" class="mypage_foodtype">#\${ele.food_type}</td>
                                <td width="400px" class="k_reviewtext">\${ele['reviewtext']}</td>
                                <td width="200px" class="mypage_writeday" align="center">\${ele['write_day']}</td>
                            </tr>
                        `;
                     }); //each end

                     s+=`</table>`;

                     /*페이징처리*/
                     s += `<br><br><div id="k_page_place">
                        <!-- 처음으로 -->
                    	<span class="page_num page_first"><i class="bi bi-skip-start-fill" style="color:black;text-decoration:none;cursor: pointer;"
                        onclick="reviewlist(1);"></i></span>
                        `;
                     <!-- 이전 -->
                     if(res.startPage>1){
                         s += `<span class="page_num page_previous" startpage="\${res.startPage-1}"><a style="color: black; text-decoration: none; cursor: pointer;"
                            onclick="reviewlist(\${res.startPage-1});"><i class="bi bi-caret-left-fill"></i></a></span>`;
                     }
                     //현재 번호
                     for (var i = res.startPage; i <= res.endPage; i++) {
                         if (i == res.currentPage) {
                             s += `<span class="page_cur_num" for_idx="\${i}"><a style="color: #7ee0b6; text-decoration: none; cursor: pointer;border-bottom: 3px solid #7ee0b6;"
                                onclick="reviewlist(\${i});" id="currentPage">\${i}</a></span>`;
                         } else {
                             s += `<span class="page_num page_nor_num" for_idx="\${i}"><a style="color: black; text-decoration: none; cursor: pointer; num_type='\${res.list_type}'"
                                id="currentPage" onclick="reviewlist(\${i})">\${i}</a></span>`;

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

                     $("div#k_reviewlist").html(s);
                 }
             }); //ajax end

     } //reviewlist() end

    </script>
</head>
<body>
<span id="title_myuserpage"><i class="bi bi-card-list"></i> 작성글</span>
<br><br>
<div id="k_reviewlist" style="margin-left: 30px">
</div>
</div>
</body>
</html>