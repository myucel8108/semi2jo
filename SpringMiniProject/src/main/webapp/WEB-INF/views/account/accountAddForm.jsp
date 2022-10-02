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
<style>
    #check-id{
        cursor: pointer;
    }

</style>
<body>

<div class="limiter">
    <div class="container-login100">
        <div class="wrap-login100">
            <div class="login100-form-title" >
					<span class="login100-form-title-1">
						Create Account
					</span>
            </div>
            <form class="login100-form validate-form" action="insertAccountA" method="post"
                  enctype="multipart/form-data" onsubmit="return check()">
                <div class="wrap-input100 validate-input m-b-26" data-validate="Username is required">
                    <span class="label-input100">UserId</span>
                    <input class="input100 userid" type="text" placeholder="Enter id" name="userid" required="required">
                    <span id="check-id">check id</span>

                    <span class="focus-input100"></span>
                </div>

                <div class="wrap-input100 validate-input m-b-18" data-validate = "Password is required">
                    <span class="label-input100">Password</span>
                    <input class="input100 check-pass-one" type="password" placeholder="Enter password" name="userpass" required="required">
                    <span class="focus-input100"></span>
                </div>

                <div class="wrap-input100 validate-input m-b-18" data-validate = "Password is required">
                    <span class="label-input100">Password Check</span>
                    <input class="input100 check-pass-two" type="password" placeholder="Enter password" required="required">
                    <span id="check-pass"></span>
                    <span class="focus-input100"></span>
                </div>

                <div class="wrap-input100 validate-input m-b-18" data-validate = "Password is required">
                    <span class="label-input100">Name</span>
                    <input class="input100 userpass" type="text" placeholder="Enter name" name="username">
                    <span class="focus-input100"></span>
                </div>

                <div class="wrap-input100 validate-input m-b-18" data-validate = "Password is required">
                    <span class="label-input100">Photo</span>
                    <input class="input100 userphoto" type="file" name="photo" style="display: none;">
                    <button type="button" id="btnAccountPhoto" class="btn btn-secondary">사진선택</button>
                    <br><br>
                    <img id="showimg">
                    <span class="focus-input100"></span>
                </div>

                <div class="wrap-input100 validate-input m-b-18" data-validate = "Password is required">
                    <span class="label-input100">nick Name</span>
                    <input class="input100" type="text" placeholder="Enter name" name="nickname">
                    <span class="focus-input100"></span>
                </div>

                <div class="wrap-input100 validate-input m-b-18" data-validate = "Password is required">
                    <span class="label-input100">email</span>
                    <input class="input100" type="text" placeholder="Enter name" name="email">
                    <span class="focus-input100"></span>
                </div>

                <div class="wrap-input100 validate-input m-b-18" data-validate = "Password is required">
                    <span class="label-input100">addr</span>
                    <input class="input100" type="text" placeholder="Enter name" name="addr">
                    <span class="focus-input100"></span>
                </div>

                <div class="wrap-input100 validate-input m-b-18" data-validate = "Password is required">
                    <span class="label-input100">hp</span>
                    <input class="input100" type="text" placeholder="Enter name" name="hp" pattern="[0-9]{11,}">
                    <span class="focus-input100"></span>
                </div>

                <div class="wrap-input100 validate-input m-b-18" data-validate = "Password is required">
                    <span class="label-input100">birth</span>
                    <input class="input100" type="date" placeholder="Enter name" name="birth">
                    <span class="focus-input100"></span>
                </div>

                <div class="container-login100-form-btn">
                    <button class="login100-form-btn" id="btnlogin" type="submit">
                        Create Account
                    </button>
                </div>
            </form>
        </div>
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