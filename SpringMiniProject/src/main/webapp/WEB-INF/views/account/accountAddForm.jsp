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

<%--            아이디 입력--%>
            <div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
                <input class="input100 loginid" type="text" >
                <span class="focus-input100"></span>
                <span class="label-input100 userid">Id</span>
                <span id="check-id">check id</span>
            </div>

<%--            비밀번호 입력--%>
            <div class="wrap-input100 validate-input" data-validate="Password is required">
                <input class="input100 loginpass check-pass-one" type="password" >
                <span class="focus-input100"></span>
                <span class="label-input100 ">Password</span>
                <span id="check-pass"></span>
            </div>
            <div class="wrap-input100 validate-input" data-validate="Password is required">
                <input class="input100 loginpass check-pass-two" type="password" >
                <span class="focus-input100"></span>
                <span class="label-input100">Password</span>
            </div>

            <div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
                <input class="input100 loginid" type="text" name="">
                <span class="focus-input100"></span>
                <span class="label-input100 userid">Id</span>
            </div>

            <div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
                <input class="input100 loginid" type="text" >
                <span class="focus-input100"></span>
                <span class="label-input100 userid">Id</span>
            </div>

<%--            프로필 사진--%>
<%--            <div class="wrap-input100 validate-input m-b-18" data-validate = "Password is required">--%>
<%--                <span class="label-input100">Photo</span>--%>
<%--                <input class="input100 userphoto" type="file" name="photo" style="display: none;">--%>
<%--                <button type="button" id="btnAccountPhoto" class="btn btn-secondary">사진선택</button>--%>
<%--                <br><br>--%>
<%--                <img id="showimg">--%>
<%--                <span class="focus-input100"></span>--%>
<%--            </div>--%>

            <div class="flex-sb-m w-full p-t-3 p-b-32">
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


            <div class="container-login100-form-btn">
                <button class="login100-form-btn" id="btnlogin" type="submit">
                    Sing In
                </button>
            </div>

        </form>

    </div>
</div>
<script type="text/javascript">
    $(function () {
        //버튼 클릭시 사진 불러오는 이벤트 추가
        $("#btnAccountPhoto").click(function () {
            $(".userphoto").trigger("click");
        });

        //사진 불러오면 미리보기 하기
        $(".userphoto").change(function(){
            /* console.log("1:"+$(this)[0].files.length);
            console.log("2:"+$(this)[0].files[0]); */
            //정규표현식
            var reg = /(.*?)\/(jpg|jpeg|png|bmp|gif)$/;
            var f=$(this)[0].files[0];//현재 선택한 파일
            if(!f.type.match(reg)){
                alert("확장자가 이미지파일이 아닙니다");
                return;
            }
            if($(this)[0].files[0]){
                var reader=new FileReader();
                reader.onload=function(e){
                    $("#showimg").attr("src",e.target.result);
                }
                reader.readAsDataURL($(this)[0].files[0]);
            }
        });

        //아이디 중복체크 버튼 이벤트
        $("#check-id").click(function () {
            // var temp = document.getElementById("check-id");
            $.ajax({
                type:"get",
                dataType:"json",
                url:"/mini/checkId",
                data:{"userid":$(".userid").val()},
                success:function(res){
                    console.log("checkajax");
                    if(res.result==0){
                        // $("span#check-id").text("ok");
                        // temp.style.display ='none';
                        var temp = document.getElementById("check-id");
                        temp.style.display ='none';
                        $("span#check-id").text("ok");
                    }else{
                        $("span#check-id").text("try again");
                    }
                }
            });
        });

        //아이디 입력 혹은 수정시 무조건 check id 하라고 알려줌
        $(".userid").keyup(function () {
            console.log("btn");
            $("span#check-id").text("check id");
            var temp = document.getElementById("check-id");
            temp.style.display ='block';
        });

        //2번째 비밀번호 입력시 체크
        $(".check-pass-two").keyup(function () {
            var p1 = $(".check-pass-one").val();
            var p2 = $(this).val();
            if(p1==p2){
                var temp = document.getElementById("check-pass");
                temp.style.display ='none';
                $("#check-pass").text("ok");
            }else{
                $("#check-pass").text("incorrect");
            }
        });
    });//function

    //submit 전에 호출
    function check() {

        //중복체크
        if($("#check-id").text()!='ok'){
            alert("아이디 중복체크를 해주세요");
            return false;
        }

        //비밀번호
        if($("#check-pass").text()!='ok'){
            alert("비밀번호가 다릅니다.");
            return false;
        }
    }
</script>





<%--<!--===============================================================================================-->--%>
<%--<script src="../../../../../../../../../Downloads/Login_v18/vendor/jquery/jquery-3.2.1.min.js"></script>--%>
<%--<!--===============================================================================================-->--%>
<%--<script src="../../../../../../../../../Downloads/Login_v18/vendor/animsition/js/animsition.min.js"></script>--%>
<%--<!--===============================================================================================-->--%>
<%--<script src="../../../../../../../../../Downloads/Login_v18/vendor/bootstrap/js/popper.js"></script>--%>
<%--<script src="../../../../../../../../../Downloads/Login_v18/vendor/bootstrap/js/bootstrap.min.js"></script>--%>
<%--<!--===============================================================================================-->--%>
<%--<script src="../../../../../../../../../Downloads/Login_v18/vendor/select2/select2.min.js"></script>--%>
<%--<!--===============================================================================================-->--%>
<%--<script src="../../../../../../../../../Downloads/Login_v18/vendor/daterangepicker/moment.min.js"></script>--%>
<%--<script src="../../../../../../../../../Downloads/Login_v18/vendor/daterangepicker/daterangepicker.js"></script>--%>
<%--<!--===============================================================================================-->--%>
<%--<script src="../../../../../../../../../Downloads/Login_v18/vendor/countdowntime/countdowntime.js"></script>--%>
<!--===============================================================================================-->
<script src="js/account.js"></script>

</body>
</html>