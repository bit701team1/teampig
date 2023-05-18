<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../commonvar.jsp"%>

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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

    <script type="text/javascript"
            src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=wvbgxt3966"></script>
    <link rel="stylesheet" href="/css/detail.css">

    <style>
    </style>
    <script type="text/javascript">
        $(function(){
            reviewphotolist();
            reviewlist();
            printicon();
            nearbystore();
            //리뷰작성 버튼
           $("#s_reviewform").click(function(){
                //로그인 한 사람만 리뷰쓸 수 있음
                if('${sessionScope.loginok}'!='yes')
                {
                    alert("로그인해주세요");
                }
            })//review 작성 버튼

            //리뷰 목록에서 리뷰 삭제 버튼
           $(document).on("click", ".s_delete", function(e){
               let b=confirm("해당 리뷰 삭제하시겠습니까?");
               if(b){
                   let review_idx=$(this).attr("review_idx");
                    console.log(review_idx);
                   $.ajax({
                       type:"get",
                       url:"./delete",
                       data:{"review_idx":review_idx},
                       success:function(){
                           alert("삭제되었습니다");
                           //목록 다시 호출
                           reviewlist();
                       }
                   });
               }
           });
            //리뷰 모달 저장 버튼
            $(document).on("click", ".s_reviewsave", function(e){
                let reviewtext=$("#reviewtext").val();
                let user_idx=$("#user_idx").val();
                let food_idx=$("#food_idx").val();
                let score=$("#score").val();


                if(reviewtext.length==0){
                    alert("내용을 입력해주세요");
                    return false;
                }

                var form=new FormData();
                for(i=0;i<$("#myfile")[0].files.length;i++){
                    form.append("upload",$("#myfile")[0].files[i]);//선택한 사진 모두 추가
                }

                form.append("reviewtext",reviewtext);
                form.append("user_idx",user_idx);
                form.append("food_idx", food_idx);
                form.append("score", score);

                $.ajax({
                    type:"post",
                    url:"./insertreview",
                    processData: false, // FormData 처리를 jQuery가 자동으로 하지 않도록 설정
                    contentType: false, // 컨텐츠 타입을 설정하지 않도록 설정
                    data:form,
                    success:function(res){
                        location.reload();
            }
            })
            })
            var reviewIdx="";
            //리뷰 수정시 모달에 review_idx 값 넣어주기
            $(document).on("click",".s_update", function(e){
                reviewIdx = $(this).attr('review_idx');
                //$('#u_review_idx').val(reviewIdx);
                console.log(reviewIdx);
                //값 받아와서 수정 모달에 띄워주기
                $.ajax({
                    type:"get",
                    url:"/selectonereview",
                    data: { "review_idx": reviewIdx},
                    dataType:"json",
                    success:function(res){
                        console.log(res.reviewtext);
                        $("#u_reviewtext").val(res.reviewtext);
                        $("#u_score").val(res.score);
                        let items = document.querySelectorAll('.u_rate_radio');
                        items.forEach(function(item, idx){
                            if(idx < res.score){
                                item.checked = true;
                            }else{
                                item.checked = false;
                            }
                        });
                        $.each(res.photoList, function(i, e){
                            $("#u_myfile").val(e);
                        })
                    }


            });
            })
//리뷰 수정 모달 저장 버튼
            $(document).on("click", ".s_updatebtn", function(e){
                let review_idx=reviewIdx;
                console.log("test"+review_idx);
                let reviewtext=$("#u_reviewtext").val();
                let user_idx=$("#u_user_idx").val();
                let food_idx=$("#u_food_idx").val();
                let score=$("#u_score").val();

                if(u_reviewtext.length==0){
                    alert("내용을 입력해주세요");
                    return false;
                }

                var form=new FormData();
                for(i=0;i<$("#u_myfile")[0].files.length;i++){
                    form.append("upload",$("#u_myfile")[0].files[i]);//선택한 사진 모두 추가
                }

                form.append("reviewtext",reviewtext);
                form.append("user_idx",user_idx);
                form.append("review_idx", review_idx);
                form.append("food_idx", food_idx);
                form.append("score", score);

                $.ajax({
                    type:"post",
                    url:"./updatereview",
                    processData: false, // FormData 처리를 jQuery가 자동으로 하지 않도록 설정
                    contentType: false, // 컨텐츠 타입을 설정하지 않도록 설정
                    data:form,
                    success:function(res){
                        //console.log(review_idx);xw
                        location.reload();
                    }
                })//ajax 끝

            })

            //지도
            var map = new naver.maps.Map('map', {
                center: new naver.maps.LatLng(${dto.REFINE_WGS84_LAT}, ${dto.REFINE_WGS84_LOGT}), // 잠실 롯데월드를 중심으로 하는 지도
                zoom: 15
            });

            var marker = new naver.maps.Marker({
                map: map,
                position: new naver.maps.LatLng(${dto.REFINE_WGS84_LAT}, ${dto.REFINE_WGS84_LOGT})
            });
            //추가
            $(document).on('click','.listbookmark',function(){
                var icon = $(this);

                if("${sessionScope.loginok}"=="no"||null)
                {
                    alert("로그인해주세요");
                }else{

                    toggleIcon(icon);
                }
            });




        })//시작함수 끝


        function reviewphotolist(){
            $.ajax({
                type: "get",
                url:"./showreview?food_idx="+${dto.food_idx},
                dataType:"json",
                success:function(res){
                    let s="";

                    $.each(res, function(idx, ele){
                        $.each(ele.photoList, function(i, e){
                            s+=`
                            <img src="https://${imageUrl}/review/\${e.photoname}" class='s_photolist'>`;
                            if(i==0)
                            {
                                return false;//사진 5장만 띄우고 break
                            }
                        })
                        if(idx==4)
                        {
                            return false;//사진 리뷰 당 핝장만 띄우기 break
                        }
                    });
                    $("div.s_reviewphoto").html(s);
                }
            })
        };//상단에 사진 띄우는 함수 끝
        function reviewlist(){
            $.ajax({
                type: "get",
                url:"./showreview?food_idx="+${dto.food_idx},
                dataType:"json",
                success:function(res){
                   let s="<span style='color:gray'>&nbsp;리뷰 ("+res.length+")</span>";

                   $.each(res, function(idx, ele){

                       s+=`<div class='s_reviewtable'><table class="s_inner_table">
                           <tr>
                           <td rowspan='3'class="s_persontd">`;

                       if(ele.user_photo!=null){
                           s+=`
        <img src="https://${imageUrl}/join/\${ele.user_photo}" style="width: 80px; height: 80px;border-radius: 100%;">
        <br>&nbsp;<span style="color:gray">\${ele.user_name}</span>`;
                       }else{
                           s+=`
        <img src="../../save/pigperson.png" style="width: 80px; height: 80px; border-radius: 100%;" >
         <br>&nbsp;<span style="color:gray">\${ele.user_name}</span>
        `
                       }
                       s+=`</td>
                       <td>\${ele.write_day}`;
                       if(ele.user_id=='${sessionScope.loginid}')
                       {s+=`<span class="s_update" review_idx="\${ele.review_idx}" data-bs-toggle="modal" data-bs-target="#reviewupdateModal" >수정</span>|<span class="s_delete" review_idx="\${ele.review_idx}">삭제</span>`}
                           s+=`</td></tr>
                       <tr>
                           <td><pre>\${ele.reviewtext}</pre></td>
                       </tr><tr><td>`;


                      if(ele.photoList!="")
                       {
                           s+="<div class='s_photoreview'>";
                           $.each(ele.photoList, function(i, e){
                               s+=`<div style="background-image: url(https://${imageUrl}/review/\${e.photoname}); height: 100px; width: 100px; border: 1px solid black;" class="s_plist"></div>
`;
                           })
                           s+='</div>';
                       }
                       s+='</td></table></div>';
                   })

                    $("div.s_review").html(s);
                }
            })
        };//리뷰 띄우는 함수 끝
        function printicon(){

            var food_idx = ${dto.food_idx}

            $.ajax({
                type:"get",
                url:"./isbookmark",
                dataType:"json",
                data:{"food_idx":food_idx},
                success: function(res) {

                    if(res==1) {
                        var s=`<button type='button' class="btn btn-success"><i class="bi bi-bookmark-star-fill listbookmark" style="cursor: pointer">가고싶다</i></button>`;
                    }
                    else{
                        var s=`<button type='button' class="btn btn-success"><i class="bi bi-bookmark-star listbookmark" style="cursor: pointer">가고싶다</i></button>`;
                    }

                    $("#k_iconplace").html(s);
                }
            }); //ajax end
        } //printicon() end
        function toggleIcon(icon) {

            var user_idx=${sessionScope.loginidx};

            food_idx = ${dto.food_idx};


            if (icon.hasClass("bi-bookmark-star")) {
                icon.removeClass("bi-bookmark-star").addClass("bi-bookmark-star-fill");
                // insert data하고 icon 영역 다시 출력
                $.ajax({
                    type:"get",
                    url:"./insertBookmark",
                    dataType:"json",
                    data:{"food_idx":food_idx,"user_idx":user_idx},
                    success: function() {
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
                        printicon();
                    }
                }); //ajax end

            }
        } //toggleIcon end
        //주변인기식당, 주변에 있고 리뷰 높은 순 식당 4개 오른쪽에 출력
        function nearbystore(){
            let SIGUN_NM="${dto.SIGUN_NM}";
            console.log(SIGUN_NM);

            $.ajax({
                type:"get",
                dataType:"json",
                url:"./nearbystore?SIGUN_NM="+SIGUN_NM,
                success:function(res){
                    let s="";
                    s+="<div> 주변 인기 식당 ";
                    $.each(res, function(idx, ele){
                        s+="<table>";
                        s+=`<tr><td rowspan='3'><img src='../../save/pigperson.png' style="width: 80px; height: 80px;"></td>`;
                        s+=`<td><a href="detail?food_idx=\${ele.food_idx}">\${ele.restrt_NM} </a>  <span class="s_fontcolorapply">\${ele.average}</span></td>`;
                        s+=`<tr><td>\${ele.food_type}</td></tr>`;
                        s+=`<tr><td>\${ele.food_price}</td></tr>`;
                        s+="</table>";
                        if(idx==4)
                        {
                            return false;
                        }
                    })
                    s+="</div>";
                    $("#s_nearby").html(s);
                }//success function 끝


            })
        }
        //리뷰 업데이트시
        //별점 마킹 모듈 프로토타입으로 생성
        function u_Rating(){};
        u_Rating.prototype.rate = 0;
        u_Rating.prototype.setRate = function(newrate){//클릭이벤트로 newrate에 누른 값이 들어감
            //별점 마킹 - 클릭한 별 이하 모든 별 체크 처리
            this.rate = newrate;
            console.log(newrate);
            document.querySelector(".u_review_score").setAttribute("value", newrate);
            let items = document.querySelectorAll('.u_rate_radio');
            items.forEach(function(item, idx){
                if(idx < newrate){
                    item.checked = true;
                }else{
                    item.checked = false;
                }
            });
        }
        let u_rating = new u_Rating();//별점 인스턴스 생성

        document.addEventListener('DOMContentLoaded', function(){
            //별점선택 이벤트 리스너
            document.querySelector('.u_rating').addEventListener('click',function(e){
                let elem = e.target;
                if(elem.classList.contains('u_rate_radio')){
                    u_rating.setRate(parseInt(elem.value));
                }
            })
        });





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
</head>
<body>


<div class="s_reviewphoto"></div>
<div class="s_side">
    <div id="map" style="width:400px; height:328px;"></div>
    <div id="s_nearby"></div><!--주변 인기 식당-->
</div>
<div class="s_info">
    <div class="s_storename ">${dto.RESTRT_NM} <span class="s_fontcolorapply">${dto.average}</span>
        <div class="s_button">
            <button id="s_reviewform" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#reviewModal"><i class="bi bi-pencil-fill"></i>
                <span>리뷰쓰기</span></button>
            <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#calendarModal"> <i class="bi bi-calendar-check-fill"></i>
                <span>예약하기</span></button>
            <div id="k_iconplace"></div>
        </div>
    </div>
    <div class="s_storedetailinfo">
        <table>
            <tr>
                <td style="color: gray">주소</td><td>&nbsp;${dto.REFINE_LOTNO_ADDR}</td>
            </tr>
            <tr>
                <td style="color: gray">전화번호</td><td>&nbsp;${dto.TASTFDPLC_TELNO}</td>
            </tr>

            <tr>
                <td style="color: gray">음식종류</td><td>&nbsp;${dto.food_type}</td>
            </tr>
            <tr>
                <td style="color: gray">가격대</td><td>&nbsp;${dto.food_price}</td>
            </tr>
        </table>
        <br>
        ${dto.GPT_content}<br>
    </div>
    <div class="s_review"></div>
</div>






<!---예약모달-->
<div style="width:450px;">

    <!-- The Modal -->
    <div class="modal fade" id="calendarModal">
        <div class="modal-dialog">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">예약하기</h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">

                    <table  class="table table-bordered">

                        <tr>
                            <th style="width: 100px;background-color: #ddd">날짜</th>
                            <td>
                                <input type="date" class="form-control" name="start" id="y_date">
                            </td>
                        </tr>
                        <tr>
                            <th style="width: 100px;background-color: #ddd">시간</th>
                            <td>
                                <input type="text" id="y_time" >
                            </td>
                        </tr>
                        <tr>
                        </tr>
                    </table>

                </div>
                <!-- Modal footer -->
                <button type="button" class="btn btn-danger" data-bs-dismiss="modal" onclick="allSave()">예약하기</button>
            </div>
        </div>
    </div>
</div>
<!--리뷰 수정 모달-->
<!-- The Modal -->
<div class="modal" id="reviewupdateModal">
    <div class="modal-dialog">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">수정하기</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>

            <!-- Modal body -->
            <div class="modal-body">
                <div class="u_wrap">
                    <h1>${dto.RESTRT_NM}에 대한 솔직한 리뷰를 써주세요.</h1>
                    <input type="hidden" id="u_food_idx" value="${dto.food_idx}">
                    <input type="hidden" id="u_user_idx" value="${sessionScope.loginidx}">
                    <input type="hidden" id="u_review_idx" value="">

                    <input type="hidden" class="u_review_score" id="u_score" value="0">
                    <div class="u_review_rating">

                        <div class="u_rating">
                            <!-- 해당 별점을 클릭하면 해당 별과 그 왼쪽의 모든 별의 체크박스에 checked 적용 -->
                            <input type="checkbox" name="rating" id="u_rating1" value="1" class="u_rate_radio" title="1점">
                            <label for="u_rating1"></label>
                            <input type="checkbox" name="rating" id="u_rating2" value="2" class="u_rate_radio" title="2점">
                            <label for="u_rating2"></label>
                            <input type="checkbox" name="rating" id="u_rating3" value="3" class="u_rate_radio" title="3점" >
                            <label for="u_rating3"></label>
                            <input type="checkbox" name="rating" id="u_rating4" value="4" class="u_rate_radio" title="4점">
                            <label for="u_rating4"></label>
                            <input type="checkbox" name="rating" id="u_rating5" value="5" class="u_rate_radio" title="5점">
                            <label for="u_rating5"></label>
                        </div>
                    </div>

                    <div class="u_review_contents">
            <textarea rows="10" class="u_review_textarea form-control"
                      placeholder="${sessionScope.loginid}님, 주문하신 메뉴는 어떠셨나요? 식당의 분위기와 서비스도 궁금해요!
            " id="u_reviewtext" ></textarea>
                    </div>
                    <div><input type="file" multiple="multiple" class="form-control" name="upload" id="u_myfile"></div>
                    <div>
                        <div class="s_photosqure">
                            <img src="" style="width: 100px; height: 100px;" id="s_u_photosqure">
                        </div>
                    </div>

                </div>
            </div>

            <!-- Modal footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-danger s_updatebtn" data-bs-dismiss="modal" >수정하기</button>
            </div>

        </div>
    </div>
</div>
<div style="width: 450px;">
<!--review modal-->
<!-- The Modal -->
<div class="modal fade" id="reviewModal">
    <div class="modal-dialog">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">리뷰 쓰기</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>

            <!-- Modal body -->
            <div class="modal-body">
                <div class="wrap">
                    <div><b class="reviewformrestrt_nm s_fontcolorapply">${dto.RESTRT_NM}</b><span>에 대한 솔직한 리뷰를 써주세요.</span></div>
                    <form  method="post" action="insertreview" enctype="multipart/form-data">

                        <input type="hidden" id="user_idx" value="${sessionScope.loginidx}">
                        <input type="hidden" id="food_idx" value="${dto.food_idx}">
                        <input type="hidden" class="review_score" id="score" value="0">
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
            " id="reviewtext"></textarea>
                        </div>
                        <div><input type="file" multiple="multiple" class="form-control" name="upload" id="myfile"></div>
                        <div>
                            <div class="s_photosqure">
                                <img src="" style="width: 100px; height: 100px;" id="s_photosqure">
                            </div>
                        </div>



                    </form>

                </div>

            <!-- Modal footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-danger s_reviewsave" data-bs-dismiss="modal" >리뷰저장</button>
            </div>

        </div>
    </div>
</div>
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
    $("#u_myfile").change(function(){
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
                $("#s_u_photosqure").attr("src",e.target.result);
            }
            reader.readAsDataURL($(this)[0].files[0]);
        }
    });
</script>

</body>
</html>