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
    </style>
</head>
<body>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<script>

    var naverLogin = new naver.LoginWithNaverId({
        clientId: "KMw1CKJNqR_tTHgOY5np",
        callbackUrl: "http://localhost:9000/auth/naver/callback", // 아무거나 설정
        isPopup: false,
        callbackHandle: true
    });
    naverLogin.init();

    window.addEventListener('load', function(){
        naverLogin.getLoginStatus(function (status){
                if(status) {
                    var email = naverLogin.user.getEmail();//필수로 설정한 것을 받ㄷ아옴.
                    var name= naverLogin.user.getName();
                    console.log(naverLogin.user);
                    if (email == undefined || email == null) {
                        alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
                        naverLogin.reprompt();//이메일을 못받아왔으면 다시한번 동의화면을 또 ㄸ띄움
                        return;
                    }else{
                        console.log('성공');
                        console.log(name);
                        console.log(email);


                        //db에 이메일이 있으면 로그인 상태로 전환(세션에 로그인 정보 뿌림)
                        //db에 이메일이 없으면 회원가입페이지로 전환하면서 이메일과 이름 정보를 보내준다
                        $.ajax({
                            type:"post",
                            url:"/emailcheck",
                            data: {"email":email, "name":name},
                            dataType:"text",
                            success: function (res) {
                                if(res==0)
                                {
                                    //alert("회원이 아닙니다. 회원가입해주세요.");
                                    //String ss=(String)${sessionScope.previousUrl};
                                    //console.log(ss);

                                    var redirectUrl='../../business?n_email='+email+'&n_name='+name;
                                    window.location.href=redirectUrl;
                                }
                                else{
                                    window.location.href='../../naverloginaction?email='+email;
                                }
                            }//success function 끝
                        })

                    }
                }else{
                    console.log("callback처리에 실패했습니다.");
                }
            }
        );
    });
</script>
</body>
</html>
