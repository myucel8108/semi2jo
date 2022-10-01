<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Login V15</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--===============================================================================================-->
<%--    <link rel="icon" type="image/png" href="images/icons/favicon.ico"/>--%>
<%--    <!--===============================================================================================-->--%>
<%--    <link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">--%>
<%--    <!--===============================================================================================-->--%>
<%--    <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">--%>
<%--    <!--===============================================================================================-->--%>
<%--    <link rel="stylesheet" type="text/css" href="fonts/Linearicons-Free-v1.0.0/icon-font.min.css">--%>
<%--    <!--===============================================================================================-->--%>
<%--    <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">--%>
<%--    <!--===============================================================================================-->--%>
<%--    <link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">--%>
<%--    <!--===============================================================================================-->--%>
<%--    <link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">--%>
<%--    <!--===============================================================================================-->--%>
<%--    <link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">--%>
<%--    <!--===============================================================================================-->--%>
<%--    <link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">--%>
    <!--===============================================================================================-->
<%--    <link rel="stylesheet" type="text/css" href="css/util.css">--%>
    <link rel="stylesheet" type="text/css" href="css/account.css">
    <!--===============================================================================================-->
</head>
<body>
<div class="limiter">
    <div class="container-login100">
        <div class="wrap-login100">
            <div class="login100-form-title" >
					<span class="login100-form-title-1">
						Sign In
					</span>
            </div>

            <form class="login100-form validate-form">
                <div class="wrap-input100 validate-input m-b-26" data-validate="Username is required">
                    <span class="label-input100">Username</span>
                    <input class="input100 loginid" type="text" placeholder="Enter username">
                    <span class="focus-input100"></span>
                </div>

                <div class="wrap-input100 validate-input m-b-18" data-validate = "Password is required">
                    <span class="label-input100">Password</span>
                    <input class="input100 loginpass" type="password" placeholder="Enter password">
                    <span class="focus-input100"></span>
                </div>

                <div class="flex-sb-m w-full p-b-30">
                    <div class="contact100-form-checkbox">
                        <input class="input-checkbox100" id="ckb1" type="checkbox" name="remember-me">
                        <label class="label-checkbox100" for="ckb1">
                            Remember me
                        </label>
                    </div>

                    <div>
                        <a href="#" class="txt1">
                            Forgot Password?
                        </a>
                    </div>
                </div>
            </form>
            <div class="container-login100-form-btn">
                <button class="login100-form-btn" id="btnlogin">
                    Login
                </button>
                <button class="login100-form-btn" class="btnCreateAccount" onclick="location.href='insertAccountF'">
                    Create Account
                </button>
            </div>
        </div>
    </div>
</div>
<script>

    // 로그인 버튼 클릭 이벤트
    $("#btnlogin").click(function () {
        //아이디와 비번 읽기
        var loginid = $(".loginid").val();
        var loginpass = $(".loginpass").val();

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
                    location.reload();
                }
            },
        });
    });

    //회원가입 버튼 클릭


</script>
<!--===============================================================================================-->
<%--<script src="vendor/jquery/jquery-3.2.1.min.js"></script>--%>
<%--<!--===============================================================================================-->--%>
<%--<script src="vendor/animsition/js/animsition.min.js"></script>--%>
<%--<!--===============================================================================================-->--%>
<%--<script src="vendor/bootstrap/js/popper.js"></script>--%>
<%--<script src="vendor/bootstrap/js/bootstrap.min.js"></script>--%>
<%--<!--===============================================================================================-->--%>
<%--<script src="vendor/select2/select2.min.js"></script>--%>
<%--<!--===============================================================================================-->--%>
<%--<script src="vendor/daterangepicker/moment.min.js"></script>--%>
<%--<script src="vendor/daterangepicker/daterangepicker.js"></script>--%>
<%--<!--===============================================================================================-->--%>
<%--<script src="vendor/countdowntime/countdowntime.js"></script>--%>
<!--===============================================================================================-->
<%--<script src="js/account.js"></script>--%>

</body>
</html>