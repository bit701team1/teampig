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

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <script type="text/javascript"
            src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=wvbgxt3966"></script>

    <link rel="import" href="https://www.polymer-project.org/0.5/components/paper-ripple/paper-ripple.html">
    <link rel="import" href="http://www.polymer-project.org/components/core-icons/core-icons.html">
    <link rel="import" href="http://www.polymer-project.org/components/font-roboto/roboto.html">


    <link rel="stylesheet" href="/css/mainlist.css">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Jua&family=Lobster&family=Nanum+Pen+Script&family=Single+Day&display=swap"
          rel="stylesheet">

    <style>
    </style>

    <%--    스크립트 영역--%>
    <%
        int currentPage = 1;
    %>
    <script>
        $(function () {

            var tmpsearch = "";

            window.list = function list(inputPage,k_list_type) {

                var list_type = k_list_type;
                var currentPage = inputPage;
                var inputsearch ="";



                if(list_type == null){
                    list_type = "type_search";
                }


                if($("#inputsearch").val() !=""){
                    tmpsearch = $("#inputsearch").val();
                    inputsearch = tmpsearch;
                }
                else {
                    if(list_type =="type_search" ){

                        inputsearch = tmpsearch;
                    }else {
                        tmpsearch = "";
                    }
                }

                $.ajax({
                    type: "get",
                    url:"./totallist",
                    dataType:"json",
                    data: {
                        "list_type": list_type,
                        "inputsearch": inputsearch,
                        "currentPage": currentPage // 현재 페이지 번호를 추가로 전달
                    },
                    success:function(res){
                        var map = new naver.maps.Map('map', {
                            center: new naver.maps.LatLng(37.66995281, 126.8554586),
                            zoom: 10
                        });//지도 시작 시 중심 지점

                        let markers=new Array();//마커 정보를 담는 배열
                        let infoWindows=new Array();//정보창을 담는 배열

                        var index = 0;
                        //마커와 정보창 채우기
                        $.each(res.list, function(idx, ele){

                            index++;
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

                        console.log(index);

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
                    },//success 끝
                    error:function (){
                        console.log("지도 ajax 오류")
                    }
                });//ajax 끝

                $.ajax({
                    type: "get",
                    url: "./totallist",
                    dataType: "json",
                    async: false,
                    data: {
                        "list_type": list_type,
                        "inputsearch": inputsearch,
                        "currentPage": currentPage // 현재 페이지 번호를 추가로 전달
                    }
                })
                    .done(function(res) {

                        let s =`<br>`;

                        s+=`<b>\${res.inputsearch}에 대한 검색 결과입니다</b><br>`;

                        s += "<table class='table table-bordered'>";
                        $.each(res.list, function (idx, ele) {

                            s += `<tr>
                        <td rowspan='3'>사진
                        </td>
                        <td>
                            <div class="k_foodlist"
                                 food_idx="\${ele.food_idx}"
                                 loginidx="${loginidx}"
                                 restrt_list="\${ele.restrt_NM}"
                                 food_type="\${ele.food_type}">
                                \${ele.restrt_NM}
                            </div>
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
                    </tr>`;
                        }); //each

                        s += "</table>";

                        //처음으로
                        s += `
                    	<i class="bi bi-skip-start-fill" style="color:black;text-decoration:none;cursor: pointer;"
                        onclick="list(1, '\${res.list_type}');"></i>
                        &nbsp;&nbsp;`;
                        <!-- 이전 -->
                        if(res.startPage>1){
                            s += `<a style="color: black; text-decoration: none; cursor: pointer;"
                            onclick="list(\${res.startPage-1}, '\${res.list_type}');">이전</a>&nbsp&nbsp`;
                        }

                        for (var i = res.startPage; i <= res.endPage; i++) {
                            if (i == res.currentPage) {
                                s += `<a style="color: green; text-decoration: none; cursor: pointer;"
                                onclick="list(\${i}, '\${res.list_type}');" id="currentPage">\${i}</a>&nbsp `;
                            } else {
                                s += `<a style="color: black; text-decoration: none; cursor: pointer;"
                                onclick="list(\${i}, '\${res.list_type}');" id="currentPage">\${i}</a>&nbsp `;
                            }
                        }
                        if (res.endPage < res.totalPage) {
                            s += `<a style="color: black; text-decoration: none; cursor: pointer;"
                            onclick="list(\${res.endPage + 1}, '\${res.list_type}');">다음</a>&nbsp&nbsp`;
                        }

                        <!-- 마지막 페이지 -->
                        s+=`<i class="bi bi-skip-end-fill"
                           style="color:black;text-decoration:none;cursor: pointer;"
                            onclick="list(\${res.totalPage}, '\${res.list_type}');"></i>
                            `;

                        $("div.s_list").html(s);
                        $("#inputsearch").val("");
                    }) //success
                /*});*/ // click event
                //});

            } // list end



            //detail 진입시 히스토리 저장
            $(document).on('click', '.k_foodlist', function () {

                var food_type = $(this).attr("food_type");
                var user_idx = $(this).attr("loginidx");
                var restrt_list = $(this).attr("restrt_list");
                var food_idx = $(this).attr("food_idx");

                $.ajax({
                    type: "POST",
                    url: "/godetail",
                    data: {
                        "food_type": food_type,
                        "user_idx": user_idx,
                        "restrt_list": restrt_list,
                        "food_idx": food_idx
                    },
                    success: function (res) {
                        console.log("ajax History saved!");
                        window.location.href = "/detail?food_idx=" + food_idx;
                    }
                });
            });

            //검색 버튼 enter키 활성화
            $("#inputsearch").on("keyup", function (event) {
                if (event.keyCode === 13) {  // Enter 키가 눌렸을 때
                    event.preventDefault(); // 기본 동작 방지
                    $(".searchbtn").click(); // 검색 버튼 클릭
                }
            });

            $(".ajax-button").click(function() {
                var list_type = $(this).attr("list_type");
                var inputsearch = "";
                var currentPage = ${currentPage}

                if(list_type == "type_search"){
                    inputsearch = $("#inputsearch").val();
                }

                list(currentPage,list_type);
            });

            $(document).ready(function () {
                $("#inputsearch").val(""); // 입력창을 공백으로 초기화
                //$(".ajax-button[list_type='type_search']").trigger("click"); // 검색 버튼 자동 클릭
            });

            //조건 버튼 이벤트
            /*      $(".btn_condition").on('click',function(){

                      if ($(this).hasClass('button-clicked')) {
                          $(this).removeClass('button-clicked');
                      } else {
                          $(this).addClass('button-clicked');
                      }
                  });*/

            $(".btn_condition").on('click', function() {
                if ($(this).hasClass('button-clicked')) {
                    $(this).removeClass('button-clicked');
                } else {
                    $(".btn_condition").removeClass('button-clicked');
                    $(this).addClass('button-clicked');
                }
            });



            window.list(1);
        }); // $func end

        //지도 관련 메서드
        function initMap(){

            $.ajax({
                type: "get",
                url:"./totallist",
                dataType:"json",
                success:function(res){
                    var map = new naver.maps.Map('map', {
                        center: new naver.maps.LatLng(37.66995281, 126.8554586),
                        zoom: 10
                    });//지도 시작 시 중심 지점

                    let markers=new Array();//마커 정보를 담는 배열
                    let infoWindows=new Array();//정보창을 담는 배열

                    //마커와 정보창 채우기
                    $.each(res.list, function(idx, ele){
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
                },//success 끝
                error:function (){
                    console.log("ajax 오류")
                }
            });//ajax 끝
        }//initMap function 끝
    </script>

</head>
<body>
<div id="m_container">

    <!-- 1.상단 메뉴바 영역 - 아마 tiles 쓸 수도 있음 -->
    <%--    <header>--%>
    <%--        <div id="m_logo">--%>
    <%--            <a href="index2.html">--%>
    <%--                <img src="images/logo4.png">--%>
    <%--            </a>--%>
    <%--        </div>--%>

    <%--        <div id="m_topMenu">--%>
    <%--            <ul>--%>
    <%--                <li><a href="#">avis</a></li>--%>
    <%--                <li><a href="#">clientèle</a></li>--%>
    <%--                <li><a href="#">adhésion</a></li>--%>
    <%--                <li><a href="#">connexion</a></li>--%>
    <%--            </ul>--%>
    <%--        </div>--%>
    <%--        <nav>--%>
    <%--            <div class="container">--%>
    <%--                <form autocomplete="off">--%>
    <%--                    <div class="finder">--%>
    <%--                        <div class="finder__outer">--%>
    <%--                            <div class="finder__inner">--%>
    <%--                                <div class="finder__icon" ref="icon"></div>--%>
    <%--                                <input class="finder__input" type="text" name="q" />--%>
    <%--                            </div>--%>
    <%--                        </div>--%>
    <%--                    </div>--%>
    <%--                </form>--%>

    <%--                <div id="m_status">--%>
    <%--                    <h3>로그인 여부 영역</h3>--%>
    <%--                </div>--%>
    <%--            </div>--%>
    <%--        </nav>--%>
    <%--    </header>--%>

    <!-- 2. 지도 출력 영역 -->
    <div id="m_apimap">
        <div id="map" style="width:1200px; height:400px;"></div>
    </div>

    <!-- 3. 각 영역의 이름이 들어감 -->
    <div id="m_pagename">
        <div class="input-group">
            <input type="text" id="inputsearch">
            <button type="button" class="ajax-button searchbtn" list_type="type_search">검색</button>
        </div>
    </div>

    <!-- 4. 리스트 출력 영역 -->

        <div id="m_tabMenu">
            <div class="k_buttonarea">
                <div class="button raised btn_condition ajax-button" list_type="type_1">
                    <div class="center" fit>평점순</div>
                    <paper-ripple fit></paper-ripple>
                </div>
                <div class="button raised btn_condition ajax-button" list_type="type_2">
                    <div class="center" fit>리뷰많은순</div>
                    <paper-ripple fit></paper-ripple>
                </div>
                <div class="button raised btn_condition ajax-button" list_type="type_3">
                    <div class="center" fit>가고싶다순</div>
                    <paper-ripple fit></paper-ripple>
                </div>
                <br>
                <br>
                <div class="button raised btn_condition ajax-button" list_type="1만원대">
                    <div class="center" fit>1만원대</div>
                    <paper-ripple fit></paper-ripple>
                </div>
                <div class="button raised btn_condition ajax-button" list_type="2만원대">
                    <div class="center" fit>2만원대</div>
                    <paper-ripple fit></paper-ripple>
                </div>
                <div class="button raised btn_condition ajax-button" list_type="3만원대">
                    <div class="center" fit>3만원대</div>
                    <paper-ripple fit></paper-ripple>
                </div>
                <div class="button raised btn_condition ajax-button" list_type="4만원이상">
                    <div class="center" fit>4만원이상</div>
                    <paper-ripple fit></paper-ripple>
                </div>
            </div>
        </div>
        <div id="m_list">
            <div class="s_list"></div>
        </div>




    <%--    <!-- 5.푸터 영역 - 아마 tiles 쓸수도 있음 -->--%>
    <%--    <footer>--%>
    <%--        <div id="m_bottomMenu">--%>
    <%--            <ul>--%>
    <%--                <li><a href="#">présentation d'une entreprise</a></li>--%>
    <%--                <li><a href="#">être surveillé</a></li>--%>
    <%--                <li><a href="#">service publicitaire</a></li>--%>
    <%--                <li><a href="#">carte du site</a></li>--%>
    <%--            </ul>--%>
    <%--            <div id="m_sns">--%>
    <%--                <ul>--%>
    <%--                    <li><a href="#"><img src="images/sns1.png"></a></li>--%>
    <%--                    <li><a href="#"><img src="images/sns2.png"></a></li>--%>
    <%--                    <li><a href="#"><img src="images/sns3.png"></a></li>--%>
    <%--                </ul>--%>
    <%--            </div>--%>
    <%--        </div>--%>
    <%--        <div id="m_company">--%>
    <%--            <p>5e et 9e étages de l'immeuble Samo de 20 Samo-gil, Gangnam-gu, Séoul</p>--%>
    <%--        </div>--%>
    <%--    </footer>--%>
</div>
<%--<!-- 6. 채널톡 API 연결 -->--%>
<%--<script>--%>
<%--    (function(){var w=window;if(w.ChannelIO){return w.console.error("ChannelIO script included twice.");}var ch=function(){ch.c(arguments);};ch.q=[];ch.c=function(args){ch.q.push(args);};w.ChannelIO=ch;function l(){if(w.ChannelIOInitialized){return;}w.ChannelIOInitialized=true;var s=document.createElement("script");s.type="text/javascript";s.async=true;s.src="https://cdn.channel.io/plugin/ch-plugin-web.js";var x=document.getElementsByTagName("script")[0];if(x.parentNode){x.parentNode.insertBefore(s,x);}}if(document.readyState==="complete"){l();}else{w.addEventListener("DOMContentLoaded",l);w.addEventListener("load",l);}})();--%>

<%--    ChannelIO('boot', {--%>
<%--        "pluginKey": "b4df2af4-756d-46b8-b999-7ce37d50bfe2"--%>
<%--    });--%>
<%--</script>--%>
<%--<script src="js/main2.js"></script>--%>
</body>
</html>
