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

    <link rel="import" href="https://www.polymer-project.org/0.5/components/paper-ripple/paper-ripple.html">
    <link rel="import" href="http://www.polymer-project.org/components/core-icons/core-icons.html">
    <link rel="import" href="http://www.polymer-project.org/components/font-roboto/roboto.html">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">

    <%--<%@ include file="../mainlayout/header.jsp" %>
    &lt;%&ndash;<%@ include file="../mainlayout/mainlist.jsp" %>&ndash;%&gt;
    &lt;%&ndash;<%@ include file="../mainlayout/footer.jsp" %>&ndash;%&gt;
    <%@ include file="../mainlayout/chatbot.jsp" %>--%>

    <style>
        body, body * {
            font-family: 'Jua'
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
        .starimage{
            width: 26px;
            height: 26px;
            margin-bottom: 6px;
        }

        .mapinclude{
            clear: both;
            width: 100%;
            height: 300px;
            background-color: orange;
            overflow: hidden;
            margin-top: 50px;
        }

        .k_foodlist {
            height: 40px;
            padding-top: 5px;
            font-size: 25px;
        }

        .k_buttonarea{
            margin-left: 20px;
        }

        /*버튼*/
        body {
            background-color: #f9f9f9;
            font-family: RobotoDraft, 'Helvetica Neue', Helvetica, Arial;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
            -webkit-tap-highlight-color: rgba(0,0,0,0);
            -webkit-touch-callout: none;
        }

        /* Button */
        .btn_condition {
            display: inline-block;
            position: relative;
            width: 120px;
            height: 32px;
            line-height: 32px;
            border-radius: 2px;
            font-size: 0.9em;
            background-color: #fff;
            color: #646464;
        }

        .button > paper-ripple {
            border-radius: 2px;
            overflow: hidden;
        }


        .button.raised {
            transition: box-shadow 0.2s cubic-bezier(0.4, 0, 0.2, 1);
            transition-delay: 0.2s;
            box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.26);

        }

        .button.raised:hover {
            background-color: rgba(199,199,199,0.3);
            box-shadow: 4px 4px 8px 0 rgba(199,199,199,0.3);
            transition-delay: 0s;
            border: 1px solid rgba(100, 100, 100, 0.3);
        }

        .button-clicked {
            box-shadow: 4px 4px 8px 0 rgba(199,199,199,0.3);
            transition-delay: 0s;
            border: 2px solid rgba(4,202,148,1);
            color: rgba(4,202,148,1);
        }
        .center {
            text-align: center;
        }

        .k_photoplace{
            width: 200px;
            height: 200px;
            border: 1px solid black;
            border-radius: 20px;
        }

        .k_searchlist{
            width: 900px;
            height: 300px;
        }

        .k_GPT_place {
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            max-width: 600px;
        }

        .content_container{
            cursor: pointer;
            float: left;
            width:900px;
            display: flex;
            margin-bottom: 20px;
        }

        .content_container:hover{
            background-color: rgba(199,199,199,0.1);
            box-shadow: 8px 8px 8px 0 rgba(211,255,206,0.3);

        }
        .bookmarkstar{
            color: orange;
        }

        .k_foodtype{
            color: #757575;
        }

        .k_innercontent_container{
            margin-left: 10px;
            font-size: 15px ;
        }
    </style>
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
                        //console.log(res);
                        let s =`<br>`;
                        if(inputsearch !="")
                            s+=`<b>\${res.inputsearch}에 대한 검색 결과입니다</b><br>`;

                        var average ="";
                        var fixed_average ="";
                        s += "<div class='k_searchlist'>";
                        $.each(res.list, function (idx, ele) {

                            s+=`
                                <div class="content_container" food_idx="\${ele.food_idx}"
                                         loginidx="${loginidx}"
                                         restrt_list="\${ele.restrt_NM}"
                                         food_type="\${ele.food_type}">
                                    <div class="k_photoplace">사진</div>
                                    <div class="k_innercontent_container">
                                        <div class="k_foodlist">
                                        \${ele.restrt_NM}
                                        <div class="k_foodtype">#\${ele.food_type}</div>
                                        <div>\${ele.average.toFixed(1)}점 | <img src="bookmark/filledstar.png" class="starimage">
                                                \${ele.bookmarkcount}</div>
                                        <div>\${ele.food_price}</div>
                                        <div class="k_GPT_place">\${ele.gpt_content}</div>
                                    </div>
                                </div>

                            `;

                            s += "</div>";

                        }); //each문 end


                        s += `<br><br><div style="display: inline">
                        <!-- 처음으로 -->
                    	<span class="page_num page_first" num_type='\${res.list_type}'><i class="bi bi-skip-start-fill" style="color:black;text-decoration:none;cursor: pointer;"
                        onclick="list(1, '\${res.list_type}');"></i></span>
                        `;
                        <!-- 이전 -->
                        if(res.startPage>1){
                            s += `<span class="page_num page_previous" num_type="\${res.list_type}" startpage="\${res.startPage-1}"><a style="color: black; text-decoration: none; cursor: pointer;"
                            onclick="list(\${res.startPage-1}, '\${res.list_type}');"><i class="bi bi-caret-left-fill"></i></a></span>`;
                        }
                        //현재 번호
                        for (var i = res.startPage; i <= res.endPage; i++) {
                            if (i == res.currentPage) {
                                s += `<span class="page_cur_num" num_type="\${res.list_type}" for_idx="\${i}"><a style="color: #7ee0b6; text-decoration: none; cursor: pointer;border-bottom: 3px solid #7ee0b6;"
                                onclick="list(\${i}, '\${res.list_type}');" id="currentPage">\${i}</a></span>`;
                            } else {
                                s += `<span class="page_num page_nor_num" num_type="\${res.list_type}" for_idx="\${i}"><a style="color: black; text-decoration: none; cursor: pointer; num_type='\${res.list_type}'"
                                id="currentPage" onclick="list(\${i}, '\${res.list_type}')">\${i}</a></span>`;

                            }
                        }
                        <!-- 다음 -->
                        if (res.endPage < res.totalPage) {
                            s += `<span class="page_num page_next" num_type="\${res.list_type}" endpage="\${res.endPage + 1}"><a style="color: black; text-decoration: none; cursor: pointer;"
                            onclick="list(\${res.endPage + 1}, '\${res.list_type}');"><i class="bi bi-caret-right-fill"></i></a></span>`;
                        }

                        <!-- 마지막 페이지 -->
                        s+=`<span class="page_num page_last" num_type="\${res.list_type}" totalpage="\${res.totalPage}"><i class="bi bi-skip-end-fill"
                           style="color:black;text-decoration:none;cursor: pointer;"
                            onclick="list(\${res.totalPage}, '\${res.list_type}');"></i>
                            </div></span><br><br><br>`;

                        $("div.s_list").html(s);
                        $("#inputsearch").val("");
                    }) //success
                /*});*/ // click event
                //});

            } // list end

            $(document).on('click','.page_num', function(){

                if($(this).hasClass("page_first")){
                    var e_list_type = $(this).attr("num_type");
                    list(1,e_list_type);
                } else if($(this).hasClass("page_previous")) {
                    var e_list_type = $(this).attr("num_type");
                    var startPage = $(this).attr("startpage");
                    list(startPage,e_list_type);
                } else if($(this).hasClass("page_next")) {
                    var e_list_type = $(this).attr("num_type");
                    var endPage = $(this).attr("endpage");
                    list(endPage,e_list_type);
                } else if($(this).hasClass("page_last")){
                    var e_list_type = $(this).attr("num_type");
                    var totalPage = $(this).attr("totalpage");
                    list(totalPage,e_list_type);
                } else {
                    var e_list_type = $(this).attr("num_type");
                    var idx = $(this).attr("for_idx");
                    list(idx,e_list_type);
                }

            });


            //detail 진입시 히스토리 저장
            $(document).on('click', '.content_container', function () {

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
<h2>test</h2>
<form action="/temp_login" method="post">
    <input type="text" name="id" value="testID">
    <input type="int" name="loginidx" value="1">
    <input type="submit" value="임시로그인"> &nbsp;
    <button type="button" onclick="location.href='/temp_logout'">로그아웃</button>
</form>
<span><b>세션id: ${sessionScope.id}</b></span><br>
<span><b>세션 loginidx: ${sessionScope.loginidx}</b></span><br>


<div class="input-group">
    <input type="text" id="inputsearch">
    <button type="button" class="ajax-button searchbtn" list_type="type_search">검색</button>
</div>

<div id="map" class="mapinclude" style="width:800px; height:400px;"></div><br><br>
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

<br><br>

</div>


<div class="s_list">
</div>
<br><br><br>

<script>
</script>
</body>
</html>
