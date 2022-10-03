<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Login V18</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%--    <!--===============================================================================================-->--%>
    <%--    <link rel="icon" type="image/png" href="../../../../../../../../../Downloads/Login_v18/images/icons/favicon.ico"/>--%>
    <%--    <!--===============================================================================================-->--%>
    <%--    <link rel="stylesheet" type="text/css" href="../../../../../../../../../Downloads/Login_v18/vendor/bootstrap/css/bootstrap.min.css">--%>
    <!--===============================================================================================-->
    <%--    <link rel="stylesheet" type="text/css" href="../../../../../../../../../Downloads/Login_v18/fonts/font-awesome-4.7.0/css/font-awesome.min.css">--%>
    <%--    <!--===============================================================================================-->--%>
    <%--    <link rel="stylesheet" type="text/css" href="../../../../../../../../../Downloads/Login_v18/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">--%>
    <%--    <!--===============================================================================================-->--%>
    <%--    <link rel="stylesheet" type="text/css" href="../../../../../../../../../Downloads/Login_v18/vendor/animate/animate.css">--%>
    <%--    <!--===============================================================================================-->--%>
    <%--    <link rel="stylesheet" type="text/css" href="../../../../../../../../../Downloads/Login_v18/vendor/css-hamburgers/hamburgers.min.css">--%>
    <%--    <!--===============================================================================================-->--%>
    <%--    <link rel="stylesheet" type="text/css" href="../../../../../../../../../Downloads/Login_v18/vendor/animsition/css/animsition.min.css">--%>
    <%--    <!--===============================================================================================-->--%>
    <%--    <link rel="stylesheet" type="text/css" href="../../../../../../../../../Downloads/Login_v18/vendor/select2/select2.min.css">--%>
    <%--    <!--===============================================================================================-->--%>
    <%--    <link rel="stylesheet" type="text/css" href="../../../../../../../../../Downloads/Login_v18/vendor/daterangepicker/daterangepicker.css">--%>
    <%--    <!--===============================================================================================-->--%>
    <%--    <link rel="stylesheet" type="text/css" href="../../../../../../../../../Downloads/Login_v18/css/util.css">--%>
    <link rel="stylesheet" type="text/css" href="css/account.css">
    <!--===============================================================================================-->
</head>
<style>
    #check-id{
        cursor: pointer;
    }

</style>
<body style="background-color: #666666;">

<div class="limiter" >
    <div class="container-login100">
        <%--        <div class="wrap-login100">--%>
        <form class="login100-form validate-form" action="insertAccountA" method="post"
              enctype="multipart/form-data" onsubmit="return check()" style="justify-content: center">
					<span class="login100-form-title p-b-43">
						Login
					</span>

<%--            id 입력--%>
            <div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
                <input class="input100 loginid" type="text" >
                <span class="focus-input100"></span>
                <span class="label-input100">Id</span>
            </div>

<%--            pass 입력--%>
            <div class="wrap-input100 validate-input" data-validate="Password is required">
                <input class="input100 loginpass" type="password" >
                <span class="focus-input100"></span>
                <span class="label-input100">Password</span>
            </div>



            <div class="flex-sb-m w-full p-t-3 p-b-32">
<%--                <div class="contact100-form-checkbox">--%>
<%--                    <input class="input-checkbox100" id="ckb1" type="checkbox" name="remember-me">--%>
<%--                    <label class="label-checkbox100" for="ckb1">--%>
<%--                        Remember me--%>
<%--                    </label>--%>
<%--                </div>--%>

<%--                <div>--%>
<%--                    <a href="#" class="txt1">--%>
<%--                        Forgot Password?--%>
<%--                    </a>--%>

<%--                </div>--%>

<%--            간편로그인--%>
            <ul>
                <li onclick="kakaoLogin();">
<%--                    <a href="javascript:void(0)">--%>
<%--                        <span>카카오 로그인</span>--%>
<%--                    </a>--%>
                    카카오 로그인
                </li>
            </ul>
            <ul>
                <li onclick="kakaoLogout();">
                    <%--                    <a href="javascript:void(0)">--%>
                    <%--                        <span>카카오 로그인</span>--%>
                    <%--                    </a>--%>
                    카카오 로그아웃
                </li>
            </ul>


            <div class="container-login100-form-btn">
                <button class="login100-form-btn" id="btn-sign-in" style="width: 40%; margin-right: 5%">
                    Sign In
                </button>
                <button class="login100-form-btn" style="width: 40%; margin-left: 5%"
                        onclick="location.href='insertAccountF'">
                    Sign Up
                </button>
            </div>



        </form>

    </div>
</div>

<script>
    // 로그인 버튼 클릭 이벤트
    $("#btn-sign-in").click(function () {
        //아이디와 비번 읽기
        var loginid = $(".loginid").val();
        var loginpass = $(".loginpass").val();
        console.log("btnclick");
        $.ajax({
            type:"get",
            url:"/mini/loginA",
            dataType:"json",
            data:{"loginid":loginid,"loginpass":loginpass},
            success:function(res){
                console.log("test2"+res.result);
                if(res.result=='fail'){
                    alert("아이디나 비번이 맞지 않습니다");
                }else {
                    alert("로그인 성공!");
                    location.href="/mini";
                }
            },
        });
    });
</script>
카카오 스크립트
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
    Kakao.init('c500f46a6b2ae4e0ca63896f364bf927'); //발급받은 키 중 javascript키를 사용해준다.
    console.log(Kakao.isInitialized()); // sdk초기화여부판단

    function kakaoLogin() {
        Kakao.Auth.login({
            scope:'profile_nickname,account_email,birthday',
            success: function (response) {
                Kakao.API.request({
                    url: '/v2/user/me',
                    success: function (res) {
                        console.log(res);
                        var email = res.kakao_account.email;
                        console.log("email"+email);
                        $.ajax({
                            type:"get",
                            url:"/mini/loginByApi",
                            dataType:"json",
                            data:{"userid":email},
                            success:function(res){
                                console.log("test2"+res.result);
                                if(res.result=='fail'){
                                    alert("아이디나 비번이 맞지 않습니다");
                                }else {
                                    alert("로그인 성공!");
                                    // location.href="/mini";
                                }
                            },
                        });
                    },
                    fail: function (error) {
                        console.log(error)
                    },
                })
            },
            fail: function (error) {
                console.log(error)
            },
        })
    }

    function kakaoLogout(kakaoKey) {
        Kakao.init(kakaoKey); // 초기화
        Kakao.isInitialized();

        if (!Kakao.Auth.getAccessToken()) { // 토큰이 있는지 확인 (토큰 가져와보기)
            console.log('Not logged in.');
            return;
        }

        Kakao.Auth.logout(function() { // 카카오 로그아웃
            console.log(Kakao.Auth.getAccessToken());
        });
    };


</script>
<script src="js/account.js"></script>
<%--jquery cdn--%>
<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>


</body>
</html>