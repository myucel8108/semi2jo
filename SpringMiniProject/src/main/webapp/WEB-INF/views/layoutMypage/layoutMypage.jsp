<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
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
        *{
            font-family: 'Jua';
        }

        #header{
            background-color: #17344f;
            height: 150px;
            width: 100%;
        }

        #menu{
            background-color: #bac9e0;
            height: 100px;
        }

        #info {
            width: 15%;
            height: 1000px;
            background-color: #97b0d1;
            position: absolute;
        }

        #change {
            width: 75%;
            float: right;
            background-color: #dce4f0;
            height: 600px;
        }

        #footer {
            background-color: #bac9e0;
            height: 200px;
            width: 100%;
            position: absolute;
            top: 1100px;
        }

    </style>
</head>
<body style="background-color: #dce4f0">
<c:set var="root" value="<%=request.getContextPath() %>"/>
<div class="main" id="header">
    <tiles:insertAttribute name="header"/>
</div>
<div class="main" id="menu">
    <tiles:insertAttribute name="menu"/>
</div>
<div class="main" id="info">
    <tiles:insertAttribute name="info"/>
</div>
<div class="main" id="change">
    <tiles:insertAttribute name="change"/>
</div>
<div class="main" id="footer">
    <tiles:insertAttribute name="footer"/>
</div>
<!-- 퀵메뉴 -->
<div id="Quick" style="position: absolute; right: 10px; top: 400px;">
    <table class="table table-bordered" style="background-color: #97b0d1; text-align: center;">
        <tr>
            <td>QuickMenu</td>
        </tr>
        <tr>
            <td style="cursor:pointer;" onclick="location.href='lecture/lectureList'">수강신청</td>
        </tr>
        <tr>
            <td style="cursor:pointer;" onclick="location.href='${root}/board/boardFree'">커뮤니티</td>
        </tr>
        <tr>
            <td style="cursor:pointer;" onclick="location.href='qna/qnaList'">관리자문의</td>
        </tr>
        <tr>
            <td style="cursor:pointer;" onclick="window.scrollTo(0,0);">TOP</td>
        </tr>
    </table>
</div>
<script>
    //퀵메뉴 추가 이벤트 시작
    $(document).ready(function(){
        $(window).scroll(function(){  //스크롤이 움직일때마다 이벤트 발생
            var position = $(window).scrollTop()+200; // 현재 스크롤바의 위치값을 반환
            $("#Quick").stop().animate({top:position+"px"}, 400); //해당 오브젝트 위치값 재설정
        });
    });
</script>
</body>
</html>