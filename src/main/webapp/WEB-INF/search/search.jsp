<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공공데이터 검색엔진</title>
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
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap" rel="stylesheet">

    <%--<%@ include file="../mainlayout/header.jsp" %>
    &lt;%&ndash;<%@ include file="../mainlayout/mainlist.jsp" %>&ndash;%&gt;
    &lt;%&ndash;<%@ include file="../mainlayout/footer.jsp" %>&ndash;%&gt;
    <%@ include file="../mainlayout/chatbot.jsp" %>--%>

    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/login.css">
    <script src="https://code.jquery.com/jquery-3.6.3.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Jua&family=Lobster&family=Nanum+Pen+Script&family=Single+Day&display=swap"
          rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&display=swap" rel="stylesheet">



    <link rel="stylesheet" href="css/mainlayout.css">

    <script src="https://code.jquery.com/jquery-3.6.3.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Jua&family=Lobster&family=Nanum+Pen+Script&family=Single+Day&display=swap"
          rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">

    <link rel="stylesheet" href="css/login.css">

    <script src="https://code.jquery.com/jquery-3.6.3.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&family=Gothic+A1&family=Gowun+Batang&family=Hahmlet&family=Song+Myung&display=swap"
          rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">


    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-*********" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">

    <style>
        #m_container{
            align-items: center;
            justify-content: center;
            width: 1200px;
            display: inline;
        }

        .restrt_nm{
            font-family: 'Dongle', sans-serif;
            font-size: 30px;
            font-weight: bold;
        }
        .k_scoreline{
            font-size: 20px;
        }
        .k_moneyline{
            font-size: 20px;
        }

        .button.raised:hover {
            background-color: rgba(199,199,199,0.3);
            box-shadow: 4px 4px 8px 0 rgba(199,199,199,0.3);
            transition-delay: 0s;
            border: 1px solid rgba(100, 100, 100, 0.3);
        }

        .button-clicked {
            box-shadow: 4px 4px 8px 0 rgba(199,199,199,0.3) !important;
            transition-delay: 0s!important;
            border: 2px solid rgba(4,202,148,1)!important;
            color: rgba(4,202,148,1)!important;
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

        .moneyimage{
            width: 26px;
            height: 26px;
        }

        .mapinclude{
            clear: both;
            width: 100%;
            height: 300px;
            background-color: orange;
            overflow: hidden;
            margin-top: 50px;
            margin-left: 170px;
        }

        .k_foodlist {
            height: 40px;
            padding-top: 5px;
            font-size: 25px;
        }

        .k_buttonarea{
            width: 1200px;
            align-items: center;
            margin-left: 20px;
        }


        body {
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
            z-index: 999;
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


        .center {
            text-align: center;
            font-weight: bold;
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
            font-size: 17px;
            max-width: 900px;

            overflow: hidden;
            display: -webkit-box;
            -webkit-line-clamp: 2; /* 원하는 줄 수로 조정 */
            -webkit-box-orient: vertical;
            line-height: 1.2; /* 줄 간격 조정 */

        }
        .k_GPT_place{
            content: '...';
        }

        .content_container{
            cursor: pointer;
            float: left;
            width:1200px;
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
            font-family: 'Nanum Pen Script', cursive;
            color: #757575;
            font-size: 28px;
        }

        .k_innercontent_container{
            width: 900px;
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

                if($(".inputsearch").val() !=""){
                    tmpsearch = $(".inputsearch").val();
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
                        if(inputsearch !="")
                            s+=`<b>\${res.inputsearch} 에 대한 검색 결과입니다</b><br>`;

                        var average ="";
                        var fixed_average ="";

                        //console.log(res);

                        s += "<div class='k_searchlist'>";
                        $.each(res.list, function (idx, ele) {

                            s+=`<br><br>
                                <div class="content_container" food_idx="\${ele.food_idx}"
                                         loginidx="${loginidx}"
                                         restrt_list="\${ele.restrt_NM}"
                                         food_type="\${ele.food_type}">
                                    <div>
                                        <img class="k_photoplace" src="http://pujmemyrqkys17181384.cdn.ntruss.com/foodphoto/\${ele.photoname}?type=f&w=200&h=200&ttype=png">
                                    </div>
                                    <div class="k_innercontent_container">
                                        <div class="k_foodlist">
                                        <span class="restrt_nm">\${ele.restrt_NM}</span>
                                        <div class="k_foodtype">#\${ele.food_type}</div>
                                        <span class="k_scoreline">\${ele.average.toFixed(1)}점 | <img src="bookmark/filledstar.png" class="starimage">
                                                \${ele.bookmarkcount}
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k_moneyline"><img src="bookmark/money.png" class="moneyimage"> \${ele.food_price}</span>
                                         </span>

                                        <div class="k_GPT_place">\${ele.gpt_content}</div>
                                    </div>
                                </div>
                            `;

                            s += "</div>";

                        }); //each문 end


                        s += `<br><br><div style="display: inline;margin-left: 420px">
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


                        s+=`
                                <div id="m_footer">
                                <footer class="footer-section">
                                    <div class="m_foottainer">
                                        <div class="footer-cta pt-5 pb-5">
                                            <div class="row">
                                                <div class="col-xl-4 col-md-4 mb-30">
                                                    <div class="single-cta">
                                                        <i class="fas fa-map-marker-alt"></i>
                                                        <div class="cta-text">
                                                            <h4>회사주소</h4>
                                                            <span>서울 강남구 강남대로94길 20 삼오빌딩 5-9층</span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-xl-4 col-md-4 mb-30">
                                                    <div class="single-cta">
                                                        <i class="fas fa-phone"></i>
                                                        <div class="cta-text">
                                                            <h4>전화번호</h4>
                                                            <span>0507-1414-9601</span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-xl-4 col-md-4 mb-30">
                                                    <div class="single-cta">
                                                        <i class="far fa-envelope-open"></i>
                                                        <div class="cta-text">
                                                            <h4>메일주소</h4>
                                                            <span>bitcamp701@naver.com</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="footer-content pt-5 pb-5">
                                            <div class="row">
                                                <div class="col-xl-4 col-lg-4 mb-50">
                                                    <div class="footer-widget">
                                                        <div class="footer-logo">
                                                            <img src="photo/footer/cilogo.png" class="img-fluid" alt="logo">
                                                           <!-- <a href="index.html"><img src="photo/cilogo.png" class="img-fluid" alt="logo"></a>-->
                                                        </div>
                                                        <div class="footer-text">
                                                            <p>술 한잔 마셨습니다... 프로젝트가 미완성이어도 좋습니다. 하지만 '끼니 피그' 하나만 기억해 주세요. 진심을 다해 전합니다. 프로젝트가 별로일 수 있습니다. 밤낮으로 고민하고 코딩했습니다... 최선을 다했고, 열심히 했습니다. 저희 팀의 진심이 느껴지길 바랍니다. 고맙습니다...
                                                            </p>
                                                        </div>
                                                        <div class="footer-social-icon">
                                                            <span>서포터즈</span>
                                                                <a href="https://data.gg.go.kr"><img src="photo/footer/ggd.png" class="ggd"></a>
                                                                <a href="https://openai.com/blog/chatgpt"><img src="photo/footer/aigpt.png"></a>
                                                                <a href="https://www.data.go.kr"><img src="photo/footer/publicdata.png"></a>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-xl-4 col-lg-4 col-md-6 mb-30">
                                                    <div class="footer-widget">
                                                        <div class="footer-widget-heading">
                                                            <h3>전체서비스</h3>
                                                        </div>
                                                        <ul>
                                                            <li><a href="#">회사소개</a></li>
                                                            <li><a href="#">비지니스</a></li>
                                                            <li><a href="#">이용약관</a></li>
                                                            <li><a href="#">공지사항</a></li>
                                                            <li><a href="#">고객센터</a></li>
                                                            <li><a href="#">고객관리</a></li>
                                                            <li><a href="#">광고서비스운영</a></li>
                                                            <li><a href="#">문의내역</a></li>
                                                            <li><a href="#">개인정보처리방침</a></li>
                                                            <li><a href="#">채용공고</a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-xl-12">
                                                            <div id="slideShow">
                                                                 <div id="slides" style="width:900px;">
                                                                    <img src="photo/footer/banner1.png" alt="광고">
                                                                    <img src="photo/footer/banner5.png" alt="광고">
                                                                    <img src="photo/footer/banner3.png" alt="광고">
                                                                    <img src="photo/footer/banner4.png" alt="광고">
                                                                    <img src="photo/footer/banner2.png" alt="광고">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-xl-4 col-lg-4 col-md-6 mb-50">
                                                    <div class="footer-widget">
                                                        <div class="footer-widget-heading">
                                                            <h3>고객의 소리</h3>
                                                        </div>
                                                        <div class="footer-text mb-25">
                                                            <p>
                                                                서비스 개선사항, 공공데이터 수정, 잘못된 정보 제보등 끼니피그에 다양한 고객들의 의견을 들려주세요.
                                                            </p>
                                                        </div>
                                                        <div class="subscribe-form">
                                                            <form action="#">
                                                                <input type="text" placeholder="Email Address">
                                                                <button><i class="fab fa-telegram-plane"></i></button>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="copyright-area" style="width:1250px">
                                        <div class="m_foottainer">
                                            <div class="row">
                                                <div class="col-xl-6 col-lg-6 text-center text-lg-left">
                                                    <div class="copyright-text">
                                                        <p>Copyright &copy; 2023, All Right Reserved <a href="main.jsp"><b>비트캠프 1조</b></a></p>
                                                    </div>
                                                </div>
                                                <div class="col-xl-6 col-lg-6 d-none d-lg-block text-right">
                                                    <div class="footer-menu">
                                                        <ul>
                                                            <li><a href="#">입장페이지</a></li>
                                                            <li><a href="#">검색서비스</a></li>
                                                            <li><a href="">마이페이지</a></li>
                                                            <li><a href="#">관리페이지</a></li>
                                                            <li><a href="#">비지니스</a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </footer>
                            </div>

                        `;

                        $("div.s_list").html(s);
                        $(".inputsearch").val("");
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
            $(document).on("keyup",".searchbtn" ,function (event) {
                if (event.keyCode === 13) {  // Enter 키가 눌렸을 때
                    event.preventDefault(); // 기본 동작 방지
                    $(".searchbtn").click(); // 검색 버튼 클릭
                }
            });

            $(document).on('click',".ajax-button",function() {
                var list_type = $(this).attr("list_type");
                var inputsearch = "";
                var currentPage = ${currentPage}

                if(list_type == "type_search"){
                    inputsearch = $(".inputsearch").val();
                }

                list(currentPage,list_type);
            });

            $(document).ready(function () {
                $(".inputsearch").val(""); // 입력창을 공백으로 초기화
                //$(".ajax-button[list_type='type_search']").trigger("click"); // 검색 버튼 자동 클릭
            });


            $(document).ready(function() {
                $(".btn_condition").on('click', function() {
                /*    if ($(this).hasClass('button-clicked')) {
                        alert("click");
                        $(this).removeClass('button-clicked');
                    } else {
                        $(".btn_condition").removeClass('button-clicked');
                        alert("delete");
                        $(this).addClass('button-clicked');
                    }*/

                    if($(this).hasClass('button-clicked')){
                    }else {
                        $(".btn_condition").removeClass('button-clicked');
                        $(this).addClass('button-clicked');
                    }



                });
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


<c:set var="root" value="<%=request.getContextPath() %>"/>
<%--<button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#loginModal">로그인</button>--%>
<!-- The Modal -->
<div class="modal fade" id="loginModal">
    <div class="modal-dialog" >
        <div class="modal-content" style="background-color: transparent; border:transparent; " >

            <!-- Modal Header -->
            <%--            <div class="modal-header" style="opacity: 0.9">--%>
            <%--                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>--%>
            <%--            </div>--%>

            <!-- Modal body -->
            <div class="modal-body" >
                <div class="position">
                    <div class="cont_principal">
                        <div class="cont_centrar">

                            <div class="cont_login">
                                <div class="cont_info_log_sign_up">
                                    <div class="col_md_login">
                                        <div class="cont_ba_opcitiy">

                                            <h2>LOGIN</h2>
                                            <p>로그인 해주세요!</p>
                                            <button class="btn_login" onclick="change_to_login()">Logout</button>
                                        </div>
                                    </div>
                                    <div class="col_md_sign_up">
                                        <div class="cont_ba_opcitiy">
                                            <h2>SIGN UP</h2>

                                            <h2>test</h2>
                                            <form action="/temp_login" method="post">
                                                <input type="text" name="id" value="testID">
                                                <input type="int" name="loginidx" value="1">
                                                <input type="submit" value="임시로그인"> &nbsp;
                                                <button type="button" onclick="location.href='/temp_logout'">로그아웃</button>
                                            </form>
                                            <span><b>세션id: ${sessionScope.loginid}</b></span><br>
                                            <span><b>세션 loginidx: ${sessionScope.loginidx}</b></span><br>
                                            <span><b>세션 username: ${sessionScope.username}</b></span><br>



                                            <p>계정이 없으신가요?</p>

                                            <button class="btn_sign_up" onclick="change_to_sign_up()">SIGN UP</button>
                                        </div>
                                    </div>
                                </div>

                                <div class="cont_back_info">
                                    <div class="cont_img_back_grey">
                                        <img src='${root}/photo/login.png' />
                                    </div>
                                </div>

                                <div class="modal-body"> <!-- Add this container -->
                                    <div class="cont_forms">
                                        <div class="cont_img_back_">
                                            <img src='${root}/photo/signup.png'/>
                                        </div>
                                        <div class="cont_form_login">
                                            <a href="#" onclick="hidden_login_and_sign_up()" ><i class="bi bi-x-lg"></i></a>
                                            <h2>LOGIN</h2>
                                            <input type="text" placeholder="id" />
                                            <input type="password" placeholder="Password" />
                                            <button class="btn_login" onclick="change_to_login()">LOGIN</button><br>
                                            <img src="${root}/photo/naver.png" width="100px" style="margin-top: 5px; cursor: pointer;" onclick="initNaverLogin()">
                                            <img src='${root}/photo/kakao.png' width="100px" height="37px" style="margin-top: 5px; cursor: pointer;">
                                        </div>

                                        <div class="cont_form_sign_up">
                                            <a href="#" onclick="hidden_login_and_sign_up()"><i class="bi bi-x-lg" style=
                                                    "position: relative; bottom:50px;"></i></a>
                                            <h2>SIGN UP</h2>
                                            <input type="text" placeholder="Email" />
                                            <input type="text" placeholder="id" />
                                            <input type="password" placeholder="Password" /><br>
                                            <select class="form-select">
                                                <option value="일반사용자">일반 사용자</option>
                                                <option value="사장님">사장님</option>
                                            </select>
                                            <button class="btn_sign_up" onclick="change_to_sign_up()">SIGN UP</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    /* ------------------------------------ Click on login and Sign Up to  changue and view the effect
  ---------------------------------------
  */


    const time_to_show_login = 400;
    const time_to_hidden_login = 200;

    function change_to_login() {
        document.querySelector('.cont_forms').className = "cont_forms cont_forms_active_login";
        document.querySelector('.cont_form_login').style.display = "block";
        document.querySelector('.cont_form_sign_up').style.opacity = "0";

        setTimeout(function(){  document.querySelector('.cont_form_login').style.opacity = "1"; },time_to_show_login);

        setTimeout(function(){
            document.querySelector('.cont_form_sign_up').style.display = "none";
        },time_to_hidden_login);
    }

    const time_to_show_sign_up = 100;
    const time_to_hidden_sign_up = 400;

    function change_to_sign_up(at) {
        document.querySelector('.cont_forms').className = "cont_forms cont_forms_active_sign_up";
        document.querySelector('.cont_form_sign_up').style.display = "block";
        document.querySelector('.cont_form_login').style.opacity = "0";

        setTimeout(function(){  document.querySelector('.cont_form_sign_up').style.opacity = "1";
        },time_to_show_sign_up);

        setTimeout(function(){   document.querySelector('.cont_form_login').style.display = "none";
        },time_to_hidden_sign_up);


    }

    const time_to_hidden_all = 500;

    function hidden_login_and_sign_up() {

        document.querySelector('.cont_forms').className = "cont_forms";
        document.querySelector('.cont_form_sign_up').style.opacity = "0";
        document.querySelector('.cont_form_login').style.opacity = "0";

        setTimeout(function(){
            document.querySelector('.cont_form_sign_up').style.display = "none";
            document.querySelector('.cont_form_login').style.display = "none";
        },time_to_hidden_all);

    }
</script>

<script>
    function initNaverLogin() {
        var naverLogin = new naver.LoginWithNaverId({
            clientId: "KMw1CKJNqR_tTHgOY5np",
            callbackUrl: "http://localhost:9000/auth/naver/callback",
            loginButton: { color: "green", type: 10, height: 60 },
            callbackHandle: true
        });

        naverLogin.init();
    }
</script>

<%--HTML 영역--%>
<div class="m_realheader">
    <div class="m_realheader-container">
        <div class="m_headerlogo-container">
            <img src="/photo/header/headerlogo.png" alt="로고출력" style="cursor:pointer;" onclick="location.href='business'">
        </div>
        <div id="m_headertop-panel" class="m_headeraction-panel">
            <ul class="m_headermain-navigation">
                <li>
                    <a href="/search" class="m_cover">
                        <span class="text-effect">맛집리스트</span>
                    </a>
                </li>
                <li>
                    <a href="/business" class="m_cover">
                        <span class="text-effect">끼니비지니스</span>
                    </a>
                </li>
                <li>
                    <a href="/qna/list" class="m_cover">
                        <span class="text-effect">질문게시판</span>
                    </a>
                </li>
                <li>
                    <a href="${root}/userpage" class="m_cover">
                        <span class="text-effect">마이페이지</span>
                    </a>
                </li>
            </ul>
            <div class="m_headeruser-control">
                <a href="#" class="m_cover" data-bs-toggle="modal" data-bs-target="#loginModal">Logout</a>
            </div>
        </div>

        <span id="m_headerform-open" class="m_headersearch-toggle">
                    <i class="fa fa-search"></i>
                </span>
        <div class="m_headersearch-holder">
            <form id="m_headeridsearch-form" class="m_headersearch-form">
                <input type="text" name="qwrd" placeholder="검색어를 입력하세요." class="m_headersearch-input inputsearch">
                <button type="submit" id="form-submit" class="m_headersearch-toggle ajax-button searchbtn" list_type="type_search">
                    <i class="fa fa-search"></i>
                </button>
                <button type="reset" id="m_headerform-close" class="m_search-close">
                    <i class="fa fa-times"></i>
                </button>
                <button type="submit" id="k_btnsearch" class="ajax-button searchbtn" list_type="type_search" hidden>
                </button>
            </form>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="js/header.js"></script>
<%--라인--%>
<div id="#m_container">
    <span style="display: inline-flex;align-items: center;">
        <div id="map" class="mapinclude" style="width:800px; height:400px;"></div>
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
                <div class="center" fit>즐겨찾기순</div>
                <paper-ripple fit></paper-ripple>
            </div>
            <br>
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
            <br><br>
            <div class="button raised btn_condition ajax-button" list_type="3만원대">
                <div class="center" fit>3만원대</div>
                <paper-ripple fit></paper-ripple>
            </div>
            <div class="button raised btn_condition ajax-button" list_type="4만원이상">
                <div class="center" fit>4만원이상</div>
                <paper-ripple fit></paper-ripple>
            </div>
        </div>
    </span>
</div>
<div class="s_list" style="width: 1200px;margin: 0 auto;"></div>
</div>
<script src="js/footer.js"></script>
</body>
</html>
