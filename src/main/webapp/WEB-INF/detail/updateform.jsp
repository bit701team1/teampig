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
        .rating .rate_radio + label {
            position: relative;
            display: inline-block;
            margin-left: -4px;
            z-index: 10;
            width: 60px;
            height: 60px;
            background-image: url('../../save/pigstar1.png');
            background-repeat: no-repeat;
            background-size: 60px 60px;
            cursor: pointer;
            background-color: #f0f0f0;
        }
        .rating .rate_radio:checked + label {
            background-color: #ff8;
        }
        /* 레이아웃 외곽 너비 400px 제한*/
        .wrap{
            max-width: 480px;
            margin: 0 auto; /* 화면 가운데로 */
            background-color: #fff;
            height: 100%;
            padding: 20px;
            box-sizing: border-box;

        }
        .reviewform textarea{
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
        }
        .rating .rate_radio {
            position: relative;
            display: inline-block;
            z-index: 20;
            opacity: 0.001;
            width: 60px;
            height: 60px;
            background-color: #fff;
            cursor: pointer;
            vertical-align: top;
            display: none;
        }
        .rating .rate_radio + label {
            position: relative;
            display: inline-block;
            margin-left: -4px;
            z-index: 10;
            width: 60px;
            height: 60px;
            background-image: url('../../save/pigstar1.png');
            background-repeat: no-repeat;
            background-size: 60px 60px;
            cursor: pointer;
            background-color: #f0f0f0;
        }
        .rating .rate_radio:checked + label {
            background-color: #ff8;
        }
        .s_photosqure{
            width: 100px;
            height: 100px;
            border: dimgray 1px solid;
        }


    </style>
</head>
<script type="text/javascript">
    //별점 마킹 모듈 프로토타입으로 생성
    function Rating(){};
    Rating.prototype.rate = 0;
    Rating.prototype.setRate = function(newrate){//클릭이벤트로 newrate에 누른 값이 들어감
        //별점 마킹 - 클릭한 별 이하 모든 별 체크 처리
        this.rate = newrate;
        console.log(newrate);
        document.querySelector(".review_score").setAttribute("value", newrate);
        let items = document.querySelectorAll('.rate_radio');
        items.forEach(function(item, idx){
            if(idx < newrate){
                item.checked = true;
            }else{
                item.checked = false;
            }
        });
    }
    let rating = new Rating();//별점 인스턴스 생성

    document.addEventListener('DOMContentLoaded', function(){
        //별점선택 이벤트 리스너
        document.querySelector('.rating').addEventListener('click',function(e){
            let elem = e.target;
            if(elem.classList.contains('rate_radio')){
                rating.setRate(parseInt(elem.value));
            }
        })
    });

</script>
<body>
<script>
    console.log("${sessionScope.loginid}");
</script>
<div class="wrap">
    <h1>${fdto.RESTRT_NM}에 대한 솔직한 리뷰를 써주세요.</h1>
    <form  method="post" action="updatereview" enctype="multipart/form-data">
        <input type="hidden" name="food_idx" value="${fdto.food_idx}">
        <input type="hidden" name="user_idx" value="${sessionScope.loginidx}">
        <input type="hidden" name="review_idx" value="${rdto.review_idx}">

        <input type="hidden" class="review_score" name="score" value="0">
        <div class="review_rating">

            <div class="rating">
                <!-- 해당 별점을 클릭하면 해당 별과 그 왼쪽의 모든 별의 체크박스에 checked 적용 -->
                <input type="checkbox" name="rating" id="rating1" value="1" class="rate_radio" title="1점">
                <label for="rating1"></label>
                <input type="checkbox" name="rating" id="rating2" value="2" class="rate_radio" title="2점">
                <label for="rating2"></label>
                <input type="checkbox" name="rating" id="rating3" value="3" class="rate_radio" title="3점" >
                <label for="rating3"></label>
                <input type="checkbox" name="rating" id="rating4" value="4" class="rate_radio" title="4점">
                <label for="rating4"></label>
                <input type="checkbox" name="rating" id="rating5" value="5" class="rate_radio" title="5점">
                <label for="rating5"></label>
            </div>
        </div>

        <div class="review_contents">
            <textarea rows="10" class="review_textarea form-control"
                      placeholder="${sessionScope.loginid}님, 주문하신 메뉴는 어떠셨나요? 식당의 분위기와 서비스도 궁금해요!
            " name="reviewtext" >${rdto.reviewtext}</textarea>
        </div>
        <div><input type="file" multiple="multiple" class="form-control" name="upload" id="myfile"></div>
        <div>
            <div class="s_photosqure">
                <img src="" style="width: 100px; height: 100px;" id="s_photosqure">
            </div>
        </div>
        <div class="cmd">
            <button type="button" onclick="history.back()"> 취소 </button>
            <button type="submit" > 수정하기</button>
        </div>


    </form>




</div>

<script type="text/javascript">
    $("#myfile").change(function(){
        console.log("1:"+$(this)[0].files.length);
        console.log("2:"+$(this)[0].files[0]);
        //정규표현식
        var reg = /(.*?)\/(jpg|jpeg|png|bmp)$/;
        var f=$(this)[0].files[0];//현재 선택한 파일
        if(!f.type.match(reg)){
            alert("확장자가 이미지파일이 아닙니다");
            return;
        }
        if($(this)[0].files[0]){
            var reader=new FileReader();
            reader.onload=function(e){
                $("#s_photosqure").attr("src",e.target.result);
            }
            reader.readAsDataURL($(this)[0].files[0]);
        }
    });
</script>


</body>
</html>

