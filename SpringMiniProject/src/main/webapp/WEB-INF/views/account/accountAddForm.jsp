<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link
            href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap"
            rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
    <style type="text/css">
        * {
            font-family: 'Jua';
        }
    </style>

    <script type="text/javascript">
        $(function () {
            //버튼 클릭시 사진 불러오는 이벤트 추가
            $("#btnaddphoto").click(function () {
                $("#addphoto").trigger("click");
            });

            //사진 불러오면 미리보기 하기
            $("#addphoto").change(function () {
                /* console.log("1:"+$(this)[0].files.length);
                console.log("2:"+$(this)[0].files[0]); */
                //정규표현식
                var reg = /(.*?)\/(jpg|jpeg|png|bmp|gif)$/;
                var f = $(this)[0].files[0];//현재 선택한 파일
                if (!f.type.match(reg)) {
                    alert("확장자가 이미지파일이 아닙니다");
                    return;
                }
                if ($(this)[0].files[0]) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        $("#showimg").attr("src", e.target.result);
                    }
                    reader.readAsDataURL($(this)[0].files[0]);
                }
            });
            //아이디 입력시 .idsuccess 값을 지운다
            // $("#loginid").keydown(function () {
            //     $("div#idcheckshow").text("");
            // });
            //중복체크 버튼 클릭시 아이디 체크
            // $("#btnidcheck").click(function () {
            //     $.ajax({
            //         type: "get",
            //         dataType: "json",
            //         url: "idcheck",
            //         data: {"loginid": $("#loginid").val()},
            //         success: function (res) {
            //             if (res.count == 0) {
            //                 $("div#idcheckshow").text("ok");
            //             } else {
            //                 $("div#idcheckshow").text("fail");
            //             }
            //         }
            //     });
            // });

            //2번째 비밀번호 입력시 체크
            // $("#addpasscheck").keyup(function () {
            //     var p1 = $("#pass").val();
            //     var p2 = $(this).val();
            //     if (p1 == p2) {
            //         $("div#addpasscheck").text("ok");
            //     } else {
            //         $("div#addpasscheck").text("");
            //     }
            // });
        });//function

        //submit 전에 호출
        // function check() {
        //
        //     //중복체크
        //     if ($("div#idcheckshow").text() != 'ok') {
        //         alert("아이디 중복체크를 해주세요");
        //         return false;
        //     }
        //
        //     //비밀번호
        //     if ($("div#addpasscheck").text() != 'ok') {
        //         alert("비밀번호가 다릅니다.");
        //         return false;
        //     }
        // }
    </script>
</head>
<body>
<div class="addacountbox">
<%--    <form action="insert" method="post" enctype="multipart/form-data" onsubmit="return check()">--%>
    <form action="insert" method="post" enctype="multipart/form-data" >
        <div>아이디
            <input type="text" id="addid" name="userid">
            <button type="button">아이디 중복체크</button>
            <br>
            <div id="idcheckshow">id check</div>
        </div>
        <div>비밀번호<input type="text" id="addpass" name="userpass"></div>
        <div>비밀번호체크<input type="text" id="addpasscheck"></div>
        <div>이름<input type="text" id="addname" name="username"></div>
        <div>닉네임<input type="text" id="addnick" name="usernickname"></div>
        <div>프로필사진
            <input type="file" id="addphoto" name="photo">
            <br><br>
            <img id="showimg">
        </div>
        <div>이메일<input type="text" id="addemail" name="email"></div>
        <div>주소<input type="text" id="addaddr" name="addr"></div>
        <div>hp<input type="text" id="addhp" name="hp"></div>
        <div>생년월일<input type="date" id="addbirth" name="birth"></div>

    <button type="submit">회원가입</button>
    </form>
</div>
</body>
</html>