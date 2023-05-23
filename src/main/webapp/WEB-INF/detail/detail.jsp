<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ include file="../commonvar.jsp"%>

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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

    <script type="text/javascript"
            src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=wvbgxt3966"></script>

    <%--<link rel="stylesheet" type="text/css" href="slick/slick.css"/>
    <link rel="stylesheet" type="text/css" href="slick/slick-theme.css"/>
--%>
    <link rel="import" href="https://www.polymer-project.org/0.5/components/paper-ripple/paper-ripple.html">
    <link rel="import" href="http://www.polymer-project.org/components/core-icons/core-icons.html">
    <link rel="import" href="http://www.polymer-project.org/components/font-roboto/roboto.html">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-*********" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>

    <style>

        .s_reviewphoto{
            /*border: 1px solid black;*/
            position: absolute;
            height: 300px;
            width: 100%;

        }
        .s_headerphotolist{
            height: 300px;
            width:19%;
        }
        pre{
            white-space: pre-wrap;
            margin-right: 20px;
        }
        .s_side{
            margin-top: 10px;
            margin-left: 50px;
            width: 340px;

        }
        .s_plist{
            width: 100px;
            height: 100px;
            display: inline-block;
            margin-left: 8px;
        }
        .s_persontd
        {
            vertical-align: top;
            width: 80px;
            font-size:13px;

        }

        .s_persontr{
            width: 80px;
        }
        /*가고싶다*/
        img.starimage{
            width: 32px;
            height: 32px;
            cursor: pointer;
            z-index: 1;
            position: relative;
        }
        /*리뷰쓰는 폼 관련*/
        .rating .rate_radio + label {
            position: relative;
            display: inline-block;
            margin-left: -4px;
            z-index: 10;
            width: 60px;
            height: 60px;
            background-image: url('../photo/pigstar.png');
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
            background-image: url('../photo/pigstar.png');
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
        .modal{
            z-index: 20000;
        }
        a{
            text-decoration: none;
            color: black;
        }
        a:hover{
            color: gray;
        }
        .s_persontd
        {
            vertical-align: top;

        }
        div.s_reviewtable:hover{
            background-color: #edf2f1;

            cursor: pointer;
        }
        div.s_imagetable:hover{
            background-color: #edf2f1;

            cursor: pointer;
        }
        table.s_inner_table{
            position: relative;
            border-top: 10px;
            font-size: 16px;
        }
        .tablepadding{
            padding-top: 10px;
        }
        .tdpadding{
            padding: 7px;
        }
        .s_photoreview{
            position:relative;
            margin-top: 8px;
            margin-bottom: 20px;
        }
        .infotable  td{
            padding: 6px;
        }
        .infotable{
            margin-top: 5px;
        }


        /*수정*/
        .u_rating .u_rate_radio + label {
            position: relative;
            display: inline-block;
            margin-left: -4px;
            z-index: 10;
            width: 60px;
            height: 60px;
            background-image: url('../photo/pigstar.png');
            background-repeat: no-repeat;
            background-size: 60px 60px;
            cursor: pointer;
            background-color: #f0f0f0;
        }
        .u_rating .u_rate_radio:checked + label {
            background-color: #ff8;
        }
        /* 레이아웃 외곽 너비 400px 제한*/
        .u_wrap{
            max-width: 480px;
            margin: 0 auto; /* 화면 가운데로 */
            background-color: #fff;
            height: 100%;
            padding: 20px;
            box-sizing: border-box;

        }
        .u_reviewform textarea{
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
        }
        .u_rating .u_rate_radio {
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
        .u_rating .u_rate_radio + label {
            position: relative;
            display: inline-block;
            margin-left: -4px;
            z-index: 10;
            width: 60px;
            height: 60px;
            background-image: url('../photo/pigstar.png');
            background-repeat: no-repeat;
            background-size: 60px 60px;
            cursor: pointer;
            background-color: #f0f0f0;
        }
        .u_rating .u_rate_radio:checked + label {
            background-color: #ff8;
        }
        .s_u_photosqure{
            width: 100px;
            height: 100px;
            border: dimgray 1px solid;
        }
        .reviewformrestrt_nm{
            font-size: 28px;
        }
        <%--추가로 넣은 것 --%>
        .s_nearbystoretable{
            margin-top: 10px;
            /*margin-bottom: 7px;*/
        }
        .nearbydiv{
            position:relative;
            margin-top: 10px;
            width: 400px;
            background-color: #edf2f1 ;
            padding-left: 10px;
            padding-top: 10px;
        }
        .nearbyimg{
            padding-left: 6px;
            padding-right: 6px;
        }
        .s_fontsize30{
            font-size: 30px;
        }
        .s_fontsize25{
            font-size: 23px;
        }
        .s_fontcolorapply{
            color: #5C732C;
        }

        .reviewpencil:hover {
            filter: opacity(0.5) drop-shadow(0 0 0 green);
        }
        .td640{
            width: 640px;
        }
        p.s_upddel{
            float:right;
            margin-right: 15px;
        }
        .s_update:hover {
            color: gray;
        }
        span.s_delete:hover{
            color:gray;
        }
        /*.s_couptable{*/
        /*    display: flex;*/
        /*}*/
        /*.s_ct{*/
        /*    float: left;*/
        /*}*/
        .s_couptable {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            grid-gap: 10px; /* 필요에 따라 조정 */
        }
        /*지저분하면 뺼 것*/
        .s_couponimage{

            animation: vibration 0.2s infinite;
        }
        @keyframes vibration {
            from {
                transform: rotate(2deg);
            }
            to {
                transform: rotate(-2deg);
            }
        }
        .s_cpinfobottom{
            position: relative;
            margin-top: -18px;
            margin-left: 10px;
        }
        .s_cpinfotop{
            position: relative;
            margin-bottom: -18px;
            z-index: 50;
            margin-left: 23px;
        }
    </style>
    <script>
        $(function(){
            reviewphotolist();//상단의 사진 띄우기
            reviewlist();//리뷰 리스트
            nearbystore();//주변 식당
            printicon();//즐겨찾기 버튼 출력


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


            //리뷰 수정시 모달에 review_idx 값 넣어주기
            var reviewIdx="";
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
                        location.reload();//수정
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
            $(document).on('click','.starimage',function(){
                var icon = $(this);

                if("${sessionScope.loginok}"=="no"||null)
                {
                    alert("로그인해주세요");
                }else{
                    toggleIcon(icon);
                }
            });
            //리뷰 클릭시 자세히 보기
            $("div.s_reviewtable").click(function(){
                openModal();
            })

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
                            <img src="https://${imageUrl}/review/\${e.photoname}" class='s_headerphotolist'>`;
                            if(i==0)
                            {
                                return false; //사진 리뷰 당 핝장만 띄우기 break
                            }
                        })
                        if(idx==4)
                        {
                            return false;   //사진 5장만 띄우고 break
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
                    let s="<span style='color:gray; font-size: 20px;padding-bottom: 20px;'>&nbsp;리뷰 <span style='font-size: 19px;'>("+res.length+")</span></span>";

                    $.each(res, function(idx, ele){
                        let num=Math.floor(Math.random()*5)+1;

                        s+=`<div class='s_reviewtable s_imagetable'><table class="s_inner_table">

                           <tr class="s_persontr trpadding" >
                           <td rowspan='4'class="s_persontd tablepadding" align="center">`;

                        if(ele.user_photo!=null){
                            s+=`
        <img src="https://${imageUrl}/join/\${ele.user_photo}" style="width: 20px; height: 20px;border-radius: 100%;">
        <br>&nbsp;<span style="color:gray">\${ele.user_name}</span>`;
                        }else{
                            s+=`
        <img src="https://kr.object.ncloudstorage.com/pig701-bucket/wjstp/personimage\${num}.png" style="width: 48px; height: 48px; border-radius: 100%; padding-top: 10px;" >
         <br>&nbsp;<span class="rusername"style="color:gray">\${ele.user_name}</span>
        `
                        }
                        s+=`</td>
                       <td class="tablepadding td640" >`;
                        for(let i=0; i<ele.score; i++)
                        {
                            s+=`<img src="../../save/pigperson.png" style="width: 26px; height: 26px;">`;
                        }

                        if(ele.user_id=='${sessionScope.loginid}')
                        {s+=`<p class="s_upddel"><span class="s_update" review_idx="\${ele.review_idx}" data-bs-toggle="modal" data-bs-target="#reviewupdateModal" >수정</span>|<span class="s_delete" review_idx="\${ele.review_idx}">삭제</span></p>`}
                        s+=`</td></tr>`


                        s+=` <tr><td style="color:gray">`;
                        //s+=`<img src="../../save/pigperson.png" style="width: px; height: 9px;">`;
                        // $.each(ele.score, function(i, e){
                        //     s+=`<img src="../../save/pigperson.png" style="width: 9px; height: 9px;">`;
                        // })

                        s+=`\${ele.write_day}`;
                        s+=`</td></tr>`;
                        s+=`
                       <tr>
                           <td class="tablepadding"><pre>\${ele.reviewtext}</pre></td>
                       </tr><tr style="border-bottom: 1px solid lightgray"><td>`;


                        if(ele.photoList!="")
                        {
                            s+="<div class='s_photoreview'>";
                            $.each(ele.photoList, function(i, e){
                                s+=`<div style="background-image: url(http://${reviewthumbnail}/review/\${e.photoname}?type=f&w=100&h=100);" class="s_plist"></div>`;
                            })
                            s+='</div>';
                        }
                        else{
                            s+="<div style='height: 30px'></div>"
                        }
                        s+='</td></table></div>';
                    })

                    /* s+=`<div id="m_footer">
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
                                                     <div id="slides">
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
                         <div class="copyright-area">
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
                                                 <li><a href="#">마이페이지</a></li>
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
         </div>`;*/


                    $("div.s_review").html(s);
                }
            })
        };//리뷰 띄우는 함수 끝
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
                    let num=0;
                    s+="<div class='nearbydiv'><span class='s_fontcolorapply s_fontsize25 '> 주변 인기 식당</span> ";
                    $.each(res, function(idx, ele){
                        if(${dto.food_idx}!=ele.food_idx){
                            num++;
                            s+="<table class='s_nearbystoretable'>";
                            s+=`<tr><td rowspan='3' class='s_nearbytd'><img src='http://pujmemyrqkys17181384.cdn.ntruss.com/review/\${ele.photoname}?type=f&w=80&h=80' style="width: 80px; height: 80px;"class="nearbyimg"></td>`;
                            s+=`<td style="font-size: 18px;"><a href="detail?food_idx=\${ele.food_idx}" >\${ele.restrt_NM} </a>  <span class="s_fontcolorapply">\${ele.average}</span></td>`;
                            s+=`<tr><td>\${ele.food_type}</td></tr>`;
                            s+=`<tr><td>\${ele.food_price}</td></tr>`;
                            s+="</table>";
                            s+="<hr style='color: gray'>";
                            if(num==4)
                            {
                                return false;
                            }}
                    })
                    s+="</div>";
                    $("#s_nearby").html(s);
                }//success function 끝


            })
        }//주변 인기 식당 띄우기 함수 끝
        function printicon(){

            var food_idx = ${dto.food_idx}

                $.ajax({
                    type:"get",
                    url:"./isbookmark",
                    dataType:"json",
                    data:{"food_idx":food_idx},
                    success: function(res) {
                        var s="";

                        if(res==1) {
                            s=`<img src="https://kr.object.ncloudstorage.com/pig701-bucket/wjstp/filledstar.png" class="starimage starfilling reviewpencil"><span style="font-size: 10px;"><b class="reviewpencil">찜하기</b></span>`;
                        }
                        else{
                            s=`<img src="https://kr.object.ncloudstorage.com/pig701-bucket/wjstp/star.png" class="starimage starempty reviewpencil"><span style="font-size: 10px;"><b class="reviewpencil">찜하기</b></span>`;
                        }

                        $("#k_iconplace").html(s);
                    }
                }); //ajax end
        } //printicon() end
        function toggleIcon(icon) {

            var user_idx=${sessionScope.loginidx};

            food_idx = ${dto.food_idx};


            if (icon.hasClass("starempty")) {
                icon.removeClass("starempty").addClass("starfilling");
                // insert data하고 icon 영역 다시 출력
                $.ajax({
                    type:"get",
                    url:"./insertBookmark",
                    dataType:"json",
                    data:{"food_idx":food_idx,"user_idx":user_idx}
                }) //ajax end
                    .done(function() {
                        printicon();
                    })
                    .fail(function(xhr, status, error) {
                        console.log("오류 발생:", error);
                    });

            } else {
                icon.removeClass("starfilling").addClass("starempty");
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
        //예약 관련

        function allSave() {
            var event = {
                start: '',
                food_idx: ''
            };

            event.start = document.getElementById('y_date').value + 'T' + document.getElementById('y_time').value;
            event.food_idx = ${dto.food_idx}; // JavaScript에서 food_idx 값을 가져옴


            var events = [event];

            var jsondata = JSON.stringify(events);
            console.log(jsondata);
            savedata(jsondata);
        }

        function savedata(jsondata, food_idx) {
            $.ajax({
                type: 'POST',
                url: './calendarinsert?food_idx=' + food_idx,
                data: jsondata,
                contentType: 'application/json',
                dataType: 'text',
                success: function(result) {
                    console.log(jsondata);
                    alert("예약완료!");
                },
                error: function(request, status, error) {
                    alert('이미 예약된 시간입니다' + error);
                }
            });
        }

    </script>
</head>
<body>

<style>
    @keyframes slide {
        0% { transform: translateX(0); }
        90% { transform: translateX(100%); }
        100% { transform: translateX(-100%); }
    }


    .s_review{
        position: relative;
        margin-top: 70px;
    }
    .s_storename
    {
        display: inline;
    }
    .s_button{
        float:right;
        display: flex;
        /*align-items: center;*/
        /*justify-content: center;*/
    }
    .s_btn{
        display: flex;
        align-items: center;
        justify-content: center;
    }
    .s_btbt{
        margin-left: 15px;
    }
    .s_info{
        margin-top: 10px;
    }




</style>
<div id="s_cont">
    <header>
        <%--HTML 영역--%>
        <div class="m_realheader">
            <div class="m_realheader-container">
                <div class="m_headerlogo-container">
                    <img src="/photo/header/headerlogo.png" alt="로고출력" onclick="location.href='business'">
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
                            <a href="/userpage" class="m_cover">
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
                        <input type="text" name="qwrd" placeholder="검색어를 입력하세요." class="m_headersearch-input">
                        <button type="submit" id="form-submit" class="m_headersearch-toggle">
                            <i class="fa fa-search"></i>
                        </button>
                        <button type="reset" id="m_headerform-close" class="m_search-close">
                            <i class="fa fa-times"></i>
                        </button>
                    </form>
                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="js/header.js"></script>
    </header>

    <div class="s_detail">
        <div id="s_photolist">
            <div id="s_photos">
                <div class="s_reviewphoto"></div>
            </div>
        </div>


        <div id="s_infolist">
            <div id="s_storelist">
                <div class="s_info">
                    <div class="s_storename ">
                        <span class="s_fontsize30">${dto.RESTRT_NM} <span class="s_fontcolorapply">${dto.average}</span></span>

                        <div class="s_button">
                            <%--                            <button id="s_reviewform" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#reviewModal"><i class="bi bi-pencil-fill"></i>--%>
                            <%--                                <span>리뷰쓰기</span></button>--%>
                            <%--                            <button type=기"button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#calendarModal"> <i class="bi bi-calendar-check-fill"></i>--%>
                            <%--                                <span>예약하기</span></button>--%>
                            <div id="k_iconplace" class="s_btbt" style="width: 38px;cursor: pointer; height: 38px;"></div>
                            <div class="s_btbt"><img src="https://kr.object.ncloudstorage.com/pig701-bucket/wjstp/pencil.png" class="reviewpencil s_btn" style="height: 32px; width: 32px;" data-bs-toggle="modal" data-bs-target="#reviewModal"><span style="font-size: 10px;cursor: pointer"><b class="reviewpencil">리뷰쓰기</b></span></div>
                            <div class="s_btbt"><img src="https://kr.object.ncloudstorage.com/pig701-bucket/wjstp/calendar.png" class="reviewpencil s_btn" style="height: 32px; width: 32px;" data-bs-toggle="modal" data-bs-target="#calendarModal"><span style="font-size: 10px;cursor: pointer"><b class="reviewpencil">예약하기</b></span></div>

                        </div>

                    </div>
                    <div class="s_storedetailinfo">
                        <div  class="s_couptable">
                            <div class="s_ct" style="width: 800px;">
                                <table class="infotable">
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
                            </div>

                            <%--<div style="width: 100px; height: 100px; margin-left: 300px; margin-top: 20px;" class="s_ct s_coupon"><div class="s_cpinfotop">10% 할인</div><img src="../../save/couponimage.png" style="width: 120px; height: 100px;" class="s_couponimage"><div class="s_cpinfobottom">남은 시간</div></div>--%>
                            <c:if test="${cdto.max > 0}">
                                <div style="width: 200px; height: 100px; margin-left: 300px; margin-top: 20px;" class="s_ct s_coupon"><div class="s_cpinfotop" style="margin-left: 35px;">${cdto.number}% 할인</div>
                                    <img src="../../save/couponimage.png" onclick="update()" style="cursor:pointer;width: 120px; height: 100px; margin-left: 10px;" class="s_couponimage"> 수량 ${cdto.max}<div class="s_cpinfobottom">
                                        <div class="countdown" id="countdown-" style="margin-top: 10px">
                                            <p class="countdown-timer-days" style="display: inline-block;">00</p>
                                            <p class="countdown-timer-hours"  style="display: inline-block;">00</p>
                                            <p class="countdown-timer-minutes" style="display: inline-block;" >00</p>
                                            <p class="countdown-timer-seconds" style="display: inline-block;" >00</p>
                                        </div></div></div>     </c:if>
                            <script>
                                var time = "${cdto.time}";
                                const endDate = new Date(time);
                                const timeinterval = setInterval(() => {
                                    const timeDiff = endDate.getTime() - Date.now();
                                    // 남은 시간을 일, 시간, 분, 초 단위로 계산합니다.
                                    const days = Math.floor(timeDiff/ (1000 * 60 * 60 * 24));
                                    const hours= Math.floor((timeDiff% (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
                                    const minutes = Math.floor((timeDiff % (1000 * 60 * 60)) / (1000 * 60));
                                    const seconds = Math.floor((timeDiff % (1000 * 60)) / 1000);

                                    const daysEl= document.querySelector("#countdown- .countdown-timer-days");
                                    const hoursEl = document.querySelector("#countdown- .countdown-timer-hours");
                                    const minutesEl = document.querySelector("#countdown- .countdown-timer-minutes");
                                    const secondsEl = document.querySelector("#countdown- .countdown-timer-seconds");

                                    daysEl.textContent = days + "일";
                                    hoursEl.textContent = hours + "시간";
                                    minutesEl.textContent = minutes+ "분";
                                    secondsEl.textContent = seconds + "초";
                                }, 1000);
                            </script>
                            <script>
                                function update() {
                                    var food_idx = ${dto.food_idx};
                                    var number = "${cdto.number}";
                                    var time= "${cdto.time}";
                                    var max = "${cdto.max}";
                                    var storename = "${dto.RESTRT_NM}";
                                    $.ajax({
                                        type: "POST",
                                        url: './max',
                                        data: { "user_idx": food_idx,
                                            "number":number,
                                            "time":time,
                                            "max":max,
                                            "storename":storename,
                                        },
                                        success: function (response) {
                                            alert(response);
                                        },
                                        error: function (xhr, status, error) {
                                            alert(xhr.responseText);
                                        }
                                    });
                                }
                            </script>
                        </div>
                        <br>
                        ${dto.GPT_content}<br>
                    </div>
                </div>
                <br>
                <br>
                <hr>
                <div class="s_review"></div>
                <div id="m_footer" class="container-fluid navbar-fixed-bottom">
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
                                                <a href="index.html"><img src="photo/footer/cilogo.png" class="img-fluid" alt="logo"></a>
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
                                                    <div id="slides">
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
                        <div class="copyright-area" style="width: 1240px;">
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
                                                <li><a href="#">마이페이지</a></li>
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
            </div>
            <div id="s_around">
                <div class="s_side">
                    <div id="map" style="width:400px; height:328px;"></div>
                    <div id="s_nearby"></div><!--주변 인기 식당-->
                </div>
            </div>
        </div>
        <%--        챗봇--%>
        <script>
            (function(){var w=window;if(w.ChannelIO){return w.console.error("ChannelIO script included twice.");}var ch=function(){ch.c(arguments);};ch.q=[];ch.c=function(args){ch.q.push(args);};w.ChannelIO=ch;function l(){if(w.ChannelIOInitialized){return;}w.ChannelIOInitialized=true;var s=document.createElement("script");s.type="text/javascript";s.async=true;s.src="https://cdn.channel.io/plugin/ch-plugin-web.js";var x=document.getElementsByTagName("script")[0];if(x.parentNode){x.parentNode.insertBefore(s,x);}}if(document.readyState==="complete"){l();}else{w.addEventListener("DOMContentLoaded",l);w.addEventListener("load",l);}})();

            ChannelIO('boot', {
                "pluginKey": "b4df2af4-756d-46b8-b999-7ce37d50bfe2"
            });
        </script>
        <!--모달 관련-->
        <!--리뷰 자세히 보기 클릭-->
        <!-- Modal -->
        <div id="modal" class="modal">
            <div class="modal-content">
                <button id="closeButton" style="display: none;"onclick="closeModal()" class="close" >&times;</button>
                <div class="video-wrapper">
                    <video id="videoPlayer" controls>
                        <source src="../ad/ad.mp4" type="video/mp4">
                    </video>
                </div>
            </div>
        </div>

        <script>
            // Modal 이벤트
            // Open Modal
            function openModal() {
                document.getElementById("modal").style.display = "block";
                document.getElementById("videoPlayer").play();
            }

            // Close Modal
            function closeModal() {
                document.getElementById("modal").style.display = "none";
                document.getElementById("videoPlayer").pause();
                document.getElementById("videoPlayer").currentTime = 0;
            }
            const videoPlayer = document.getElementById('videoPlayer');
            const closeButton = document.getElementById('closeButton');

            videoPlayer.addEventListener('ended', function() {
                closeButton.style.display = 'block';
            });
        </script>
        <!---예약모달-->
        <%--    <div style="width:450px;">--%>

        <%--        <!-- The Modal -->--%>
        <%--        <div class="modal fade" id="calendarModal">--%>
        <%--            <div class="modal-dialog">--%>
        <%--                <div class="modal-content">--%>

        <%--                    <!-- Modal Header -->--%>
        <%--                    <div class="modal-header">--%>
        <%--                        <h4 class="modal-title">예약하기</h4>--%>
        <%--                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>--%>
        <%--                    </div>--%>

        <%--                    <!-- Modal body -->--%>
        <%--                    <div class="modal-body">--%>

        <%--                        <table  class="table table-bordered">--%>

        <%--                            <tr>--%>
        <%--                                <th style="width: 100px;background-color: #ddd">날짜</th>--%>
        <%--                                <td>--%>
        <%--                                    <input type="date" class="form-control" name="start" id="y_date">--%>
        <%--                                </td>--%>
        <%--                            </tr>--%>
        <%--                            <tr>--%>
        <%--                                <th style="width: 100px;background-color: #ddd">시간</th>--%>
        <%--                                <td>--%>
        <%--                                    <input type="text" id="y_time" >--%>
        <%--                                </td>--%>
        <%--                            </tr>--%>
        <%--                            <tr>--%>
        <%--                            </tr>--%>
        <%--                        </table>--%>

        <%--                    </div>--%>
        <%--                    <!-- Modal footer -->--%>
        <%--                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal" onclick="allSave()">예약하기</button>--%>
        <%--                </div>--%>
        <%--            </div>--%>
        <%--        </div>--%>
        <%--    </div>--%>
        <!---예약모달-->
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

                        <table id="tables">

                            <tr>
                                <th style="width: 100px;">날짜</th>
                                <td>
                                    <input type="date" class="form-control" name="start" id="y_date">
                                </td>
                            </tr>
                            <tr>
                                <th style="width: 100px;">시간</th>
                                <td>
                                    <input type="text" class="form-control" id="y_time" >
                                </td>
                            </tr>
                            <tr>
                            </tr>
                        </table>

                    </div>
                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-success" style="background-color:#5C732C;" data-bs-dismiss="modal" onclick="allSave()">예약하기</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        const timeInput = document.getElementById('y_time');
        const dateInput = document.getElementById('y_date');
        const now = new Date();
        // opentime과 closetime 값을 출력할 HTML 요소의 ID를 가리키는 변수를 설정합니다.
        const openTime = '${dto.opentime}'; // 'opentime' 값으로 변경해야 합니다.
        const closeTime = '${dto.closetime}'; // 'closetime' 값으로 변경해야 합니다.

        dateInput.min = now.toISOString().split('T')[0];

        flatpickr(dateInput, {
            minDate: "today", // 오늘 날짜를 최소 선택 가능 날짜로 설정
            onChange: function(selectedDates, dateStr, instance) {
                if (selectedDates[0].toDateString() === now.toDateString()) {
                    // 선택한 날짜가 오늘이라면, 현재 시간부터 선택 가능하도록 설정
                    timePicker.set('minTime', now.getHours() + ':00');
                } else {
                    // 선택한 날짜가 오늘이 아니라면, 어떤 시간이든 선택 가능하도록 설정
                    timePicker.set('minTime', '00:00');
                }
            },
        });
        const timePicker = flatpickr(timeInput, {
            enableTime: true,
            noCalendar: true,
            dateFormat: 'H:i',
            time_24hr: true,
            minuteIncrement: 60,
            minTime: openTime, // 현재 시간부터 선택 가능
            maxTime: closeTime, // 23:59까지 선택 가능
        });

    </script>


    <!--리뷰 수정 모달-->
    <!-- The Modal -->
    <div class="modal" id="reviewupdateModal" >
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
                    <button type="button" class="btn btn-success s_updatebtn" data-bs-dismiss="modal" >수정하기</button>
                </div>

            </div>
        </div>
    </div>
    <div style="width: 450px;">
        <!--review modal-->
        <!-- The Modal -->
        <div class="modal fade" id="reviewModal">
            <div class="modal-dialog" style="width: 500px;">
                <div class="modal-content" style="width: 500px;">

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
                            <button type="button" class="btn btn-success s_reviewsave" data-bs-dismiss="modal" >리뷰저장</button>
                        </div>

                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

<script src="js/footer.js"></script>

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
<style>
    *{
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }
    .s_review{
        position: relative;
        margin-top: 10px;
    }
    #s_cont{
        margin: 0 auto;
        width: 1200px;
        max-width: 100%; /* 추가 */
    }

    header{
        width: 100%;
        height: 100px;
        /*background-color: brown;*/
    }

    #s_logo{
        float: left;
        width: 250px;
        height: 100px;
        /*background-color: yellowgreen;*/
    }

    nav{
        float: right;
        width: 900px;
        height: 100px;
        /*background-color: aqua;*/
    }

    #s_infolist {
        /* overflow: hidden; 클리어(Clear) 처리 */
        position: absolute;
        width: 100%;
        height: auto;
        margin: 0;
        padding: 0;
    }
    .s_detail{
        position: absolute;
    }
    #s_storelist {
        float: left;
        display: inline-block;
        width: 60%;
        height: 300px;
        position:absolute;
        margin-top: 7px;
        /*background-color: lightblue;*/
    }

    #s_around {
        float: right;
        display: inline-block;
        position: relative;
        margin-top: 0px;
        width: 40%;
        height: 300px;
        /*background-color: lightgray;*/
    }



    #s_photolist{
        width: 100%;
        height: 300px;
    }

    #s_photos{
        width: 1200px;
        height: 100%;
        /*background-color: beige;*/
    }


    footer{
        /*position: absolute;*/
        width: 100%;
        height: 100px;
        /*background-color: chocolate;*/
    }

</style>

</body>
</html>