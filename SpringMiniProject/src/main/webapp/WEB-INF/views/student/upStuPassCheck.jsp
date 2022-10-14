<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Yeon+Sung&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>

    <!-- css  -->
    <c:set var="root" value="<%=request.getContextPath() %>"/>
    <link rel="stylesheet" type="text/css" href="${root}/css/updateform.css">
    <style type="text/css">
        .container{
            font-family: 'Noto Sans KR';
        }
    </style>
    <script type="text/javascript">

    //submit 전에 호출
    function check(){

        //비밀번호
        if($("#pass").val()!=${dto.userpass}){
            alert("비밀번호가 맞지 않습니다");
            return false;
        }
    }

    </script>
</head>
<body>
<div class="container" style="width: 80%;">
    <form action="updateStudent" method="post" onsubmit="return check()">
        <input type="hidden" name="usernum" value="${sessionScope.usernum}">
        <div class="title">
            회원정보수정
        </div>
        <br><br>
        <div class="container" style="width: 80%; margin-left: 100px;">
            <div style="font-size: 15px; color: #6d6d6d">
                안전한 회원정보변경을 위해 비밀번호를 입력해주세요
            </div>
            <div class="box">
                <table class="text">
                  <tr>
                        <td class="text1"> <div style="padding-bottom: 0px; width: 120px;">아이디</div></td>
                        <td class="text2">
                            <div class="wrapper">
                                <input type="text" class="input" readonly value="${dto.email}" style="width: 170px;">
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="text1"><div style="padding-bottom: 0px;">비밀번호</div></td>
                        <td class="text2">
                            <div class="wrapper">
                                <input type="password" class="input" id="pass" placeholder="비밀번호 입력" required="required" style="width: 170px;">
                                <span class="underline"></span>
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="2" style="text-align: center;">
                            <button type="button" class="btn-large2" style="margin-right: 60px;" onclick="location.href='${root}/student/timeTable'">취소</button>
                            <button type="submit" class="btn-large1" id="btn_submit" style="margin-right: 30px;">확인</button>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </form>
</div>

</div>
</body>
</html>