<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Refresh" content="10;url=list">
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

</head>
<script type="text/javascript">
    $(function(){
        list();//기봉으로 리스트 출력, 나중에 검색받은 항목만 출력하게 수정할 것
        initMap();//지도 표시

        //탭에서 버튼 클릭시 출력 이벤트
        $("#s_highscore").click(function(){
            $.ajax({
                type: "get",
                url:"./scorelist",
                dataType:"json",
                success:function(res){
                    let s="총 "+res.length+"개";
                    s+="<table class='table table-bordered'>";
                    $.each(res, function(idx, ele){
                        s+=`<tr>
                           <td rowspan='3'>사진
                            </td>
                            <td><a href='detail?food_idx=\${ele.food_idx}'>\${ele.restrt_NM}</a>
                            </td>
                         </tr>
                        <tr>
                            <td>\${ele.food_type}
                            </td>
                        </tr>
                        <tr>
                            <td>\${ele.average}
                            </td>
                        </tr>
                        <tr>
                            <td colspan='2'>짤막한 홍보글?
                            </td>
                        </tr>

                        `;
                    });
                    s+="</table>";
                    $("div.s_list").html(s);
                }
            })//ajax 끝

        });//점수순 정렬 끝
        $("#s_manyreview").click(function(){
            $.ajax({
                type: "get",
                url:"./manyreviewlist",
                dataType:"json",
                success:function(res){
                    let s="총 "+res.length+"개";
                    s+="<table class='table table-bordered'>";
                    $.each(res, function(idx, ele){
                        s+=`<tr>
                           <td rowspan='3'>사진
                            </td>
                            <td><a href='detail?food_idx=\${ele.food_idx}'>\${ele.restrt_NM}</a>
                            </td>
                         </tr>
                        <tr>
                            <td>\${ele.food_type}
                            </td>
                        </tr>
                        <tr>
                            <td>\${ele.average}
                            </td>
                        </tr>
                        <tr>
                            <td colspan='2'>짤막한 홍보글?
                            </td>
                        </tr>

                        `;
                    });
                    s+="</table>";
                    $("div.s_list").html(s);
                }
            })//ajax 끝
        })//리뷰 많은 순 정렬


    })



    //지도 관련 메서드
    function initMap(){
        $.ajax({
            type: "get",
            url:"./flist",
            dataType:"json",
            success:function(res){
                var map = new naver.maps.Map('map', {
                center: new naver.maps.LatLng(37.66995281, 126.8554586),
                zoom: 10
                });//지도 시작 시 중심 지점

                let markers=new Array();//마커 정보를 담는 배열
                let infoWindows=new Array();//정보창을 담는 배열

                //마커와 정보창 채우기
                $.each(res, function(idx, ele){
                var marker = new naver.maps.Marker({
                    map: map,
                    title: "ele.restrt_NM",
                    position: new naver.maps.LatLng(ele.refine_WGS84_LAT, ele.refine_WGS84_LOGT)
                });
                //정보창
                var infoWindow =new naver.maps.InfoWindow({
                    content: `<div style="width: 200px; text-align: center; padding:10px;"> <b>\${ele.restrt_NM}</b><br>-네이버 지도-</div>`
                });

                markers.push(marker);//생성한 마커를 배열에 담음
                infoWindows.push(infoWindow); //생성한 정보창을 배열에 넣는다.
                })


                console.log(infoWindows[0]);
             console.log(infoWindows[3]);

             function getClickHandler(seq){
                return function(e){//마커 클릭하는 부분, 이벤트 함수 반환
                    var marker= markers[seq],//클릭한 마커의 시퀀스로 찾기
                    infoWindow=infoWindows[seq];

                if(infoWindow.getMap()){
                    infoWindow.close();

                }else{
                    infoWindow.open(map, marker);//표출
                }
            }

        }
        for(var i=0, ii=markers.length; i<ii;i++){
            console.log(markers[i], getClickHandler(i));
            naver.maps.Event.addListener(markers[i], 'click',getClickHandler(i));//클릭한 마커 핸들러
        }
            }//success 끝
            })//ajax 끝
    }//initMap function 끝

    function list()
    {
        $.ajax({
            type: "get",
            url:"./flist",
            dataType:"json",
            success:function(res){
                let s="총 "+res.length+"개";
                s+="<table class='table table-bordered'>";
                $.each(res, function(idx, ele){
                    s+=`<tr>
                           <td rowspan='3'>사진
                            </td>
                            <td><a href='detail?food_idx=\${ele.food_idx}'>\${ele.restrt_NM}</a>
                            </td>
                         </tr>
                        <tr>
                            <td>\${ele.food_type}
                            </td>
                        </tr>
                        <tr>
                            <td>\${ele.average}
                            </td>
                        </tr>
                        <tr>
                            <td colspan='2'>짤막한 홍보글?
                            </td>
                        </tr>

                        `;
                });
                s+="</table>";
                $("div.s_list").html(s);
            }

        });
    }


</script>

<body>

<div id="map" style="width:800px; height:400px;"></div>

<div class="s_tab">
    <button type="button" id="s_highscore">평점순</button>
    <button type="button" id="s_manyreview">리뷰많은순</button>
    <button type="button" id="s_go">가고싶다순</button>
</div>

<div class="s_list">
</div>
</body>
</html>