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
    #div-check-id{
        cursor: pointer;
    }
    /*#check-id{*/
    /*    !*position: absolute;*!*/
    /*    color: red;*/
    /*    !*vertical-align: center;*!*/
    /*    margin-right: auto;*/
    /*    display: block;*/
    /*}*/
    /*.div-check-id{*/
    /*    display: flex;*/
    /*    justify-content: right;*/
    /*}*/

</style>
<body style="background-color: #666666;">

<div class="limiter" >
    <div class="container-login100">
        <%--        <div class="wrap-login100">--%>
        <form class="login100-form validate-form" action="insertAccountA" method="post"
              enctype="multipart/form-data" onsubmit="return check()" style="justify-content: center">
					<span class="login100-form-title p-b-43">
						Create Account
					</span>

<%--            아이디 입력--%>
            <div class="wrap-input100 validate-input" data-validate = "Id is required">
                <input class="input100 userid" type="text" name="userid">
                <span class="focus-input100"></span>
                <span class="label-input100 userid">Id</span>
            </div>

            <div style="margin-bottom: 10px; display: none" id="div-check-id" >
                <span style="margin-left: 10px;" id="result-check-id">Check Id</span>
            </div>


<%--            비밀번호 입력--%>
            <div class="wrap-input100 validate-input" data-validate="Password is required">
                <input class="input100 loginpass check-pass-one" type="password" name="userpass">
                <span class="focus-input100"></span>
                <span class="label-input100 ">Password</span>
            </div>
            <div class="wrap-input100 validate-input" data-validate="Password is required">
                <input class="input100 loginpass check-pass-two" type="password" >
                <span class="focus-input100"></span>
                <span class="label-input100">Check Password</span>
            </div>
            <div style="margin-bottom: 10px;" id="div-check-pass" >
                <span style="margin-left: 10px;" id="result-check-pass">Incorrect</span>
            </div>

<%--            이름--%>
            <div class="wrap-input100 validate-input" data-validate = "Name is required">
                <input class="input100" type="text" name="username">
                <span class="focus-input100"></span>
                <span class="label-input100 userid">Name</span>
            </div>
<%--            이메일--%>
            <div class="wrap-input100 validate-input" data-validate = "Email is required">
                <input class="input100" type="text" name="email">
                <span class="focus-input100"></span>
                <span class="label-input100 userid">email</span>
            </div>
<%--            주소--%>
            <div class="wrap-input100 validate-input" data-validate = "Address is required">
                <input class="input100" type="text" name="addr">
                <span class="focus-input100"></span>
                <span class="label-input100 userid">Address</span>
            </div>
<%--            핸드폰버호--%>
            <div class="wrap-input100 validate-input" data-validate = "Phone Number is required">
                <input class="input100" type="text" name="hp">
                <span class="focus-input100"></span>
                <span class="label-input100 userid">Phone Number</span>
            </div>
<%--            생일--%>
<%--            <div class="wrap-input100 validate-input div-input-birth" data-validate = "Valid email is required: ex@abc.xyz">--%>
<%--                <input class="input100" id="birth" type="date" style="display: none">--%>
<%--                <span class="focus-input100"></span>--%>
<%--                <span class="label-input100 userid">Birth Day</span>--%>
<%--            </div>--%>

<%--            프로필 사진--%>
<%--            <div class="wrap-input100 validate-input m-b-18" data-validate = "Password is required">--%>
<%--                <span class="label-input100">Photo</span>--%>
<%--                <input class="input100 userphoto" type="file" name="photo" style="display: none;">--%>
<%--                <button type="button" id="btnAccountPhoto" class="btn btn-secondary">사진선택</button>--%>
<%--                <br><br>--%>
<%--                <img id="showimg">--%>
<%--                <span class="focus-input100"></span>--%>
<%--            </div>--%>




            <div class="container-login100-form-btn">
                <button class="login100-form-btn" id="btn-sign-up" type="submit">
                    Sing Up
                </button>
            </div>

        </form>

    </div>
</div>
<script type="text/javascript">
    $(function () {
        // //버튼 클릭시 사진 불러오는 이벤트 추가
        // $("#btnAccountPhoto").click(function () {
        //     $(".userphoto").trigger("click");
        // });
        //
        // //사진 불러오면 미리보기 하기
        // $(".userphoto").change(function(){
        //     /* console.log("1:"+$(this)[0].files.length);
        //     console.log("2:"+$(this)[0].files[0]); */
        //     //정규표현식
        //     var reg = /(.*?)\/(jpg|jpeg|png|bmp|gif)$/;
        //     var f=$(this)[0].files[0];//현재 선택한 파일
        //     if(!f.type.match(reg)){
        //         alert("확장자가 이미지파일이 아닙니다");
        //         return;
        //     }
        //     if($(this)[0].files[0]){
        //         var reader=new FileReader();
        //         reader.onload=function(e){
        //             $("#showimg").attr("src",e.target.result);
        //         }
        //         reader.readAsDataURL($(this)[0].files[0]);
        //     }
        // });

        //아이디 중복체크 버튼 이벤트
        $("#div-check-id").click(function () {
            // var temp = document.getElementById("check-id");
            $.ajax({
                type:"get",
                dataType:"json",
                url:"/mini/checkId",
                data:{"userid":$(".userid").val()},
                success:function(res){
                    if(res.result==0){
                        // $("span#check-id").text("ok");
                        // temp.style.display ='none';

                        $("#result-check-id").text("ok");
                        document.getElementById("div-check-id").style.display='none';

                    }else{
                        $("#result-check-id").text("try again");

                    }
                }
            });
        });

        //아이디 입력 혹은 수정시 무조건 check id 하라고 알려줌
        $(".userid").keyup(function () {
            console.log("btn");
            $("#result-check-id").text("check id");
            var temp = document.getElementById("div-check-id");
            temp.style.display ='block';
        });

        //1번째 비밀번호 입력시 체크
        $(".check-pass-two").keyup(function () {
            var temp = document.getElementById("result-check-pass");
            var p1 = $(".check-pass-one").val();
            var p2 = $(this).val();
            if(p1==p2){
                temp.style.display ='none';
                $("#result-check-pass").text("ok");
            }else{
                $("#result-check-pass").text("incorrect");
                temp.style.display='block';
            }
        });
        //2번째 비밀번호 입력시 체크(1번과 코드 동일)
        $(".check-pass-one").keyup(function () {
            var temp = document.getElementById("result-check-pass");
            var p1 = $(".check-pass-two").val();
            var p2 = $(this).val();
            if(p1==p2){
                temp.style.display ='none';
                $("#result-check-pass").text("ok");
            }else{
                $("#result-check-pass").text("incorrect");
                temp.style.display='block';
            }
        });


        //birth 입력하는 div 클릭시 input tag 활성화
        // $(".div-input-birth").click(function () {
        //     console.log("teset click");
        //     document.getElementById("birth").style.display='block';
        //     $("#birth").trigger("click");
        // });
    });//function

    //submit 전에 호출
    function check() {

        //중복체크
        if($("#result-check-id").text()!='ok'){
            alert("아이디 중복체크를 해주세요");
            return false;
        }

        //비밀번호
        if($("#result-check-pass").text()!='ok'){
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
<%--jquery cdn--%>
<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
</body>
</html>