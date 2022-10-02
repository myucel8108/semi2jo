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
    .checkid{
        cursor: pointer;
    }

</style>
<body>
<script type="text/javascript">
    $(function () {
        //버튼 클릭시 사진 불러오는 이벤트 추가
        $("#btnAccountPhoto").click(function () {
            $(".userphoto").trigger("click");
        });

        //사진 불러오면 미리보기 하기
        $("#myphoto").change(function(){
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
        $("#btnidcheck").click(function () {
            $.ajax({
                type:"get",
                dataType:"json",
                url:"idcheck",
                data:{"id":$("#loginid").val()},
                success:function(res){
                    if(res.count==0){
                        $("div.idsuccess").text("ok");
                    }else{
                        $("div.idsuccess").text("fail");
                    }
                }
            });
        });

        //2번째 비밀번호 입력시 체크
        $("#pass2").keyup(function () {
            var p1 = $("#pass").val();
            var p2 = $(this).val();
            if(p1==p2){
                $("div.passsuccess").text("ok");
            }else{
                $("div.passsuccess").text("");
            }
        });
    });//function

    //submit 전에 호출
    function check() {

        //중복체크
        if($("div.idsuccess").text()!='ok'){
            alert("아이디 중복체크를 해주세요");
            return false;
        }

        //비밀번호
        if($("div.passsuccess").text()!='ok'){
            alert("비밀번호가 다릅니다.");
            return false;
        }
    }
</script>
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
                    <input class="input100 " type="text" placeholder="Enter id" name="userid">
                    <button type="button" class="checkid">check id</button>
                    <span class="focus-input100"></span>
                </div>

                <div class="wrap-input100 validate-input m-b-18" data-validate = "Password is required">
                    <span class="label-input100">Password</span>
                    <input class="input100 " type="password" placeholder="Enter password" name="userpass">
                    <span class="focus-input100"></span>
                </div>

                <div class="wrap-input100 validate-input m-b-18" data-validate = "Password is required">
                    <span class="label-input100">Password Check</span>
                    <input class="input100" type="password" placeholder="Enter password">
                    <span class="checkpass"></span>
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

                <div class="container-login100-form-btn">
                    <button class="login100-form-btn" id="btnlogin" type="submit">
                        Create Account
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>
<script>


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