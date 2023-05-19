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
        img.starimage{
            width: 26px;
            height: 26px;
            cursor: pointer;
            z-index: 1;
            position: relative;
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
                        var s = "";
                        $.each(res, function (idx, ele) {
                        s+=`<span>\${ele.restrt_NM}</span>`;
                        s+=`<span>\${ele.food_type}</span>`;
                        s+=`<span><img src="/bookmark/filledstar.png" class="starimage starfilling k_mybookmark" food_idx ='\${ele.food_idx}'></span><br>`;







                        }); //each end

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