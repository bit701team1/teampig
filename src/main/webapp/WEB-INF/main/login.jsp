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
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
    <style>

    </style>
</head>
<script type="text/javascript">
    $(function(){
        $("#s_login").click(function(){
            let id=$("#s_id").val();
            let password=$("#s_password").val();

            var form=new FormData();
            form.append("id", id);
            form.append("password", password);

            $.ajax({
                type: "post",
                url: "./loginaction",
                processData:false,
                contentType:false,
                data: form,
                dataType:"text",
                success: function (res) {
                    if(res==1)
                    {
                        window.location.href="login";
                    }else{
                        document.querySelector("#s_alert").html("아이디 또는 비밀번호가 일치하지 않습니다.");
                    }
                }//success function 끝
            })//ajax 끝
        })//로그인버튼 끝

    })


</script>
<body>

<c:choose>
    <c:when test="${sessionScope.loginok=='yes'}">
        <i class="bi bi-person-circle" id="s_logout" onclick="location.href='logout'"></i>
        <%--<img src="https://${imageUrl}/join/${dto.user_photo}">--%>
    </c:when>
    <c:otherwise>

        <button type="button" data-bs-toggle="modal" data-bs-target="#s_loginModal">로그인</button>
        <!-- The Modal -->
        <div class="modal" id="s_loginModal">
            <div class="modal-dialog">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">로그인</h4>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">
                        <table>
                            <tr><td><input type="checkbox" id="saveid" name="saveid" checked="${sessionScope.saveid=='yes'?true:false}">아이디 저장</td></tr>
                            <tr>
                                <td><i class="bi bi-person"></i><input type="text" placeholder="아이디" id="s_id"
                                                                       value="${sessionScope.saveid=='yes'?sessionScope.loginid:null}"></td>
                            </tr>
                            <tr>
                                <td><i class="bi bi-lock"></i><input type="password" placeholder="비밀번호" id="s_password"></td>
                            </tr>
                            <tr>
                                <td colspan="2"><button type="button" id="s_login" >로그인</button> <br><div id="s_alert"></div></td>
                            </tr>


                        </table>
                    </div>

                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <div class="border p-3 mb-4 bg-light justify-content-between">
                                <%--
                                카카오 로그인 처리중 중 오류가 발생하면 아래 경고창에 표시된다.
                                카카오 로그인 오류는 스크립트에서 아래 경고창에 표시합니다.
                             --%>
                            <div class="alert alert-danger d-none" id="alert-kakao-login">오류 메세지</div>


                                <a href="javascript:kakaoLogin();"><img src="../../save/kakao_login_button.png" style="height:60px"></a>
                                    <div id="naverIdLogin"></div>
                        </div>
                        <form id="form-kakao-login" method="post" action="kakao-login">
                            <input type="hidden" name="email"/>
                            <input type="hidden" name="name"/>
                            <input type="hidden" name="img"/>
                        </form>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </c:otherwise>
</c:choose>

<%--
<a href="javascript:kakaoLogin();"><img src="../../save/kakao.png" style="height:60px"></a>
--%>

<script>
    //카카오 관련
    window.Kakao.init("4d6b82467bdefbaaed27526fdc7aecbe");// 어떤 웹앱으로 연결될지

    function kakaoLogin() {
        window.Kakao.Auth.login({
            scope: 'profile_nickname, account_email',//카카오로부터 받아올 정보
            //로그인에 성공할 경우 콜백함수 작동, authObj: 받아온 오브젝트 데이터
            success: function (authObj) {
                console.log(authObj);
                window.Kakao.API.request({
                    url: '/v2/user/me',//혅재 로그인한 사용자의 정보를 가지고 옴.
                    success: res => {
                        var kakao_account = res.kakao_account;//account정보 가져옴
                        console.log(kakao_account);
                        console.log(kakao_account.email);
                        console.log(kakao_account.profile.nickname);

                       $.ajax({
                            type: "post",
                            url: "/emailcheck",
                            dataType: "text",
                            data: {"email": kakao_account.email, "name": kakao_account.profile.nickname},
                            success: function (res) {
                                if(res==0)
                                {
                                    window.location.href='joinformtest?email='+kakao_account.email+'&name='+kakao_account.profile.nickname;
                                }
                                else{
                                    window.location.href='snsloginaction?email='+kakao_account.email;
                                }


                            }//success function 끝
                        });//ajax 끝
                    }//success 끝
                })
            }
        })
    }
    //네이버 관련
    //네이버 아이디로그인 초기화 script
    var naverLogin =new naver.LoginWithNaverId({
        clientId:"KMw1CKJNqR_tTHgOY5np",
        callbackUrl: "http://localhost:9000/auth/naver/callback", //callback ur
        loginButton: {color: "green", type:10, height: 60},//로그인 버튼의 타입 지정
        callbackHandle: true//callback 페이지가 분리되었을 경우 콜백 페이지에서는 콜백 처리를 바꿀 수있도록 설정
    });

    naverLogin.init();//설정정보 초기화 연ㄷ동 준비

//이 페이지가 정상적으로 다 로드되었을 때 해당 함수를 실행할 것.

</script>


</body>
</html>
