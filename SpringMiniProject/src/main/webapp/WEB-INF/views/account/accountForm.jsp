<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Login V18</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <c:set var="root" value="<%=request.getContextPath() %>"></c:set>
    <link rel="stylesheet" type="text/css" href="${root}/css/account.css">
    <link rel="stylesheet" type="text/css" href="${root}/css/qna.css">
    <link rel="stylesheet" type="text/css" href="${root}/TeachMeStyle/.css">
    <link rel="stylesheet" type="text/css" href="${root}/css/quickmenu.css">
    <!--===============================================================================================-->
</head>
<style>
    #check-id{
        cursor: pointer;
    }



</style>
<body style="background-color: white;">

<div class="limiter" >
    <div class="container-login100">
        <%--        <div class="wrap-login100">--%>
        <div class="login100-form validate-form" style="justify-content: center">
					<span class="login100-form-title p-b-43">
						Sign In
					</span>

<%--            id 입력--%>
            <div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
                <input class="input100 loginemail" type="text" placeholder="Email">
<%--                <span class="focus-input100"></span>--%>
<%--                <span class="label-input100">Email</span>--%>
            </div>

<%--            pass 입력--%>
            <div class="wrap-input100 validate-input" data-validate="Password is required">
                <input class="input100 loginpass" type="password" placeholder="Password">
<%--                <span class="focus-input100"></span>--%>
<%--                <span class="label-input100">Password</span>--%>
            </div>
            <div class="wrap-input200" data-validate="Password is required"
                    style="background-image: url('${root}/image/kakaoLogobig.png');background-repeat: no-repeat;
                            background-size: cover; background-position: center center" onclick="kakaoLogin();">

            </div>


            <div class="container-login100-form-btn">
                <button class="login100-form-btn" id="btn-sign-in" style="width: 40%; margin-right: 5%; color: black">
                    Sign In
                </button>
                <button class="login100-form-btn" style="width: 40%; margin-left: 5%; color: black"
                        onclick="location.href='${root}/insertAccountF'">
                    Sign Up
                </button>
            </div>



        </div>

    </div>
</div>

<%--퀵메뉴--%>
<nav class="cuz">
    <ul id="main_menu">
        <div class="btn_gotop"><a href="#"><img src="image/tttt.png"
                                                style="width: 70%; background-color:transparent; color: black;"></a>
        </div>
        <br>
        <br>
        <li><a href="javascript:dos()" style="color: black;"><img src="image/pointt.png"
                                                                  style="width: 80%; background-color:transparent; color: black;"></a>
            <ul class="snd_menu sub_menu" style=" background-color:transparent;">
                <br>
                <li><a href="${root}/lecture/lectureList"><img src="image/yu.png"
                                                               style="width: 100%; background-color:transparent; color: black;">강의</a>
                </li>
                <br>
                <li><a href="${root}/board/boardFree"><img src="image/cccb.png"
                                                           style="width: 100%;padding-left:10px;  ">커뮤니티</a></li>
                <br>
                <li><a href="${root}/qna/qnaList"><img src="image/1ask.png" style="width:130%; padding-right: 25px;">문의하기</a>
                </li>
            </ul>
        </li>
    </ul>
</nav>


<script>
    // 로그인 버튼 클릭 이벤트
    $("#btn-sign-in").click(function () {
        loginClick();
    });

    //엔터키로 로그인 버튼클릭
    $(document).keyup(function(event) {
        if (event.key == "Enter") {
            loginClick();
        }
    });

    function loginClick() {
        //아이디와 비번 읽기
        var email = $(".loginemail").val();
        var userpass = $(".loginpass").val();
        console.log("btnclick");
        $.ajax({
            type:"get",
            url:"${root}/loginA",
            dataType:"json",
            data:{"email":email,"userpass":userpass},
            success:function(res){
                console.log("test2"+res.result);
                if(res.result=='fail'){
                    alert("아이디나 비밀번호가 맞지 않습니다");
                }else {

                    location.href="${root}/";

                }
            },
        });
    }

    // 퀵메뉴 script
    $(document).ready(function dos() {
        $('#main_menu > li > a').click(function () {
            $(this).next($('.snd_menu sub_menu')).slideToggle('fast');
            // $(this).show($('.snd_menu sub_menu')("slide",{direction:'left'},1000));
        })
        // e.stopPropagation();

    })
</script>
<%--    카카오 api 로그인--%>
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
                            url:"${root}/loginByApi",
                            dataType:"json",
                            data:{"email":email},
                            success:function(res){
                                console.log("test2"+res.result);
                                if(res.result=='fail'){
                                    //fail 일 경우 회원가입 폼으로 이동
                                    location.href='${root}/insertAccountF?email='+email;
                                }else {
                                    // alert("로그인 성공!");
                                    location.href="/mini";
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
