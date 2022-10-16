<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Login V18</title>
    <meta charset="UTF-8">
    <c:set var="root" value="<%=request.getContextPath() %>"></c:set>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="css/account.css">
    <link rel="stylesheet" type="text/css" href="${root}/css/quickmenu.css">
    <!--===============================================================================================-->
</head>
<style>
    #div-check-id{
        cursor: pointer;
    }

</style>

<body style="background-color: #666666;">

<div class="limiter" >
    <div class="container-login100">
        <%--        <div class="wrap-login100">--%>
        <form class="login100-form validate-form" action="${root}/insertAccountA" method="post"
              enctype="multipart/form-data" onsubmit="return check()" style="justify-content: center">
					<span class="login100-form-title p-b-43">
						Create Account
					</span>
<%--            이메일--%>
            <%--   api 회원가입시 기존 정보를 가져와 입력한다--%>
            <div class="wrap-input100 validate-input" data-validate = "Email is required">
                <c:if test="${email!=null}">
                    <input class="input100 userid" type="email" name="email" value="${email}" readonly>
                    <span class="focus-input100"></span>
                    <span class="label-input100 userid"></span>
                    <script>
                        $("#result-check-id").text("ok");
                    </script>
                </c:if>
                <c:if test="${email==null}">
                    <input class="input100 userid" type="text" name="email" data-validate = "Valid email is required: ex@abc.xyz"
                            placeholder="Email">
<%--                    <span class="focus-input100"></span>--%>
<%--                    <span class="label-input100 userid">email</span>--%>
                </c:if>
            </div>

            <div style="margin-bottom: 10px; display: none; margin-left: 10%" id="div-check-id">
                <span id="result-check-id">Check Id</span>
            </div>


<%--            비밀번호 입력--%>
            <div class="wrap-input100 validate-input" data-validate="Password is required">
                <input class="input100 loginpass check-pass-one" type="password" name="userpass" placeholder="Password">
<%--                <span class="focus-input100"></span>--%>
<%--                <span class="label-input100 ">Password</span>--%>
            </div>
            <div class="wrap-input100 validate-input" data-validate="Password is required">
                <input class="input100 loginpass check-pass-two" type="password" placeholder="Password">
<%--                <span class="focus-input100"></span>--%>
<%--                <span class="label-input100">Check Password</span>--%>
            </div>
            <div style="margin-bottom: 10px; margin-left: 10%;" id="div-check-pass" >
                <span style="margin-left: 10px; display: none" id="result-check-pass">Incorrect</span>
            </div>

<%--            이름--%>
            <div class="wrap-input100 validate-input" data-validate = "Name is required">
                <input class="input100" type="text" name="username" placeholder="Name">
<%--                <span class="focus-input100"></span>--%>
<%--                <span class="label-input100 userid">Name</span>--%>
            </div>

<%--            주소--%>
            <div class="wrap-input100 validate-input" data-validate = "Address is required">
                <input class="input100" type="text" name="addr" placeholder="Address">
<%--                <span class="focus-input100"></span>--%>
<%--                <span class="label-input100 userid">Address</span>--%>
            </div>
<%--            핸드폰버호--%>
            <div class="wrap-input100 validate-input" data-validate = "Phone Number is required">
                <input class="input100" type="text" name="hp" placeholder="Phone Number">
<%--                <span class="focus-input100"></span>--%>
<%--                <span class="label-input100 userid">Phone Number</span>--%>
            </div>

            <div class="wrap-input100 validate-input" data-validate ="Nick Name is required">
                <input class="input100" type="text" name="nickname" placeholder="Nick Name">
                <%--                <span class="focus-input100"></span>--%>
                <%--                <span class="label-input100 userid">Phone Number</span>--%>
            </div>
<%--            생일--%>
            <div class="wrap-input100 validate-input div-input-birth" >
                <input class="input100" id="birth" type="date" name="birth" placeholder="Birth Day" value="Birth Day">
<%--                <span class="focus-input100"></span>--%>
<%--                <span class="label-input100 userid">Birth Day</span>--%>
            </div>


            <div class="container-login100-form-btn">
                <button class="login100-form-btn" id="btn-sign-up" type="submit" style="color: black">
                    Sing Up
                </button>
            </div>

        </form>

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

<script type="text/javascript">
    $(function () {

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

        // 퀵메뉴 script
        $(document).ready(function dos() {
            $('#main_menu > li > a').click(function () {
                $(this).next($('.snd_menu sub_menu')).slideToggle('fast');
                // $(this).show($('.snd_menu sub_menu')("slide",{direction:'left'},1000));
            })
            // e.stopPropagation();

        })

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

        //엔터키로 회원가입 버튼클릭
        $(document).keyup(function(event) {
            if (event.key == "Enter") {
                $("#btn-sign-up").onclick;
            }
        });

    }
</script>





<script src="js/account.js"></script>
<%--jquery cdn--%>
<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
</body>
</html>