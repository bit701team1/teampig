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
    <script type="text/javascript"
            src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=wvbgxt3966"></script>

    <style>

    </style>
    <script>
        $(function (){
            printicon();

        }); //$func end


       function printicon(){

            //***************원래는 var food_idx = ${dto.food_idx};*********************
            var food_idx = 2;

            $.ajax({
                type:"get",
                url:"isbookmark",
                dataType:"json",
                data:{"food_idx":food_idx},
                success: function(res) {

                    if(res==1) {
                        var s=`<i class="bi bi-bookmark-star-fill listbookmark" style="cursor: pointer"></i>`;
                    }
                    else{
                        var s=`<i class="bi bi-bookmark-star listbookmark" style="cursor: pointer"></i>`;
                    }

                    $("#k_iconplace").html(s);
                }
            }); //ajax end
        } //printicon() end
    </script>
</head>
<body>
<div>
    <div id="map" style="width:800px; height:400px;"></div>
</div>

<h4>사진</h4>


<button type="button" id="s_reviewform">리뷰작성</button>





<div id="k_iconplace">icon자리</div>


<%--<img src="https://kr.object.ncloudstorage.com/pig701-bucket/bookmark/filledstar.png">
<img src="https://kr.object.ncloudstorage.com/pig701-bucket/bookmark/star.png">--%>
<div class="s_review"></div>
<script>
    $(document).on('click','.listbookmark',function(){
        var icon = $(this);
        toggleIcon(icon);
    });



   function toggleIcon(icon) {

       var user_idx=${user_idx};
       //***************원래는 var food_idx = ${dto.food_idx};*********************
       food_idx = 2;

        if (icon.hasClass("bi-bookmark-star")) {
            icon.removeClass("bi-bookmark-star").addClass("bi-bookmark-star-fill");
            // insert data하고 icon 영역 다시 출력
            $.ajax({
                type:"get",
                url:"insertBookmark",
                dataType:"json",
                data:{"food_idx":food_idx,"user_idx":user_idx},
                success: function() {
                    alert("insert확인");
                    printicon();
                }
            }); //ajax end

        } else {
            icon.removeClass("bi-bookmark-star-fill").addClass("bi-bookmark-star");
            //delete data하고 icon 영역 다시 출력
            $.ajax({
                type:"get",
                url:"deleteBookmark",
                data:{"food_idx":food_idx,"user_idx":user_idx},
                success: function() {
                    alert("delete확인");
                    printicon();
                }
            }); //ajax end

        }
    } //toggleIcon end
</script>
</body>
</html>