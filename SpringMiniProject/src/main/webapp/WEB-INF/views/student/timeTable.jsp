<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <c:set var="root" value="<%=request.getContextPath() %>"/>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Yeon+Sung&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
    <!-- css  -->
    <c:set var="root" value="<%=request.getContextPath() %>"/>
    <link rel="stylesheet" type="text/css" href="${root}/css/stupagechange.css">
    <link rel="stylesheet" type="text/css" href="${root}/resources/css/timetable.css" />

    <style type="text/css">

        a.lecdego:hover{
            color: #6d6d6d !important;
        }

        #main_menu {
            position: fixed;
            width: 70px;
            height: 210px;
            right: 60px;
            border-radius: 70px;
            top: 35%;
            text-align: center;

        }
        .cuz {
            width: 100px;
        }

        ul {
            padding: 0;
        }

        li {
            list-style: none;
            line-height: 34px;
        }

        .snd_menu {
            background: #efefef;
        }

        .sub_menu {
            display: none;
        }
    </style>
</head>
<body>
<div class="sttitle">
    시간표
</div>
<div class="stcontainer">
<table class="lectable">
    <th></th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th><th>일</th>
        <c:forEach var="i" begin="1" end="9">
            <tr>
                <c:forEach var="j" begin="0" end="7">
                    <td>
                        <c:if test="${j==0}">
                            ${i}교시<br>
                            ${i+7}~${i+8}시
                        </c:if>
                        <c:forEach var="dto" items="${list}">
                        <c:if test="${fn:contains(dto.lectime,i)&&fn:contains(dto.lecday,j)}">
                            <c:if test="${dto.mylecnum%6==1}">
                                <c:set var="bgcolor" value="#d7ecf3"/>
                            </c:if>
                            <c:if test="${dto.mylecnum%6==2}">
                                <c:set var="bgcolor" value="#dddbec"/>
                            </c:if>
                            <c:if test="${dto.mylecnum%6==3}">
                                <c:set var="bgcolor" value="#f8e6ec"/>
                            </c:if>
                            <c:if test="${dto.mylecnum%6==4}">
                                <c:set var="bgcolor" value="#d2eadd"/>
                            </c:if>
                            <c:if test="${dto.mylecnum%6==5}">
                                <c:set var="bgcolor" value="#fff5d5"/>
                            </c:if>
                            <c:if test="${dto.mylecnum%6==0}">
                                <c:set var="bgcolor" value="#f8ece9"/>
                            </c:if>
                            <div class="mylecname" style="background-color:${bgcolor};">
                                <a class="lecdego" href="${root}/lecture/lectureDetail?lecdenum=${dto.lecdenum}">
                                <c:if test="${fn:length(dto.lecname)>6}">
                                    ${fn:substring(dto.lecname,0,6)}<br>
                                    ${fn:substring(dto.lecname,7,14)}
                                    <c:if test="${fn:length(dto.lecname)>15}">..</c:if>
                                </c:if>
                                </a>
                            </div>
                            <div style="color: #6d6d6d;">
                                ${dto.teaname}
                                [${dto.roomnum}호]
                            </div>
                        </c:if>
                        </c:forEach>
                    </td>
                </c:forEach>
            </tr>
        </c:forEach>

</table>
</div>
<%--랜덤 색상값 넣는 함수
    <script>
    $("#btn1").click(function (){
        r=parseInt(Math.random()*256);
        g=parseInt(Math.random()*256);
        b=parseInt(Math.random()*256);
        randomcolor='rgba('+r+','+g+','+b+')';
        console.log('rgba('+r+','+g+','+b+')');

        $("div.mylec").css("background-color",randomcolor);
    });
</script>--%>
<nav class="cuz">
    <ul id="main_menu">
        <div class="btn_gotop"><a href="#"><img src="../image/tttt.png"
                                                style="width: 70%; background-color:transparent; color: black;"></a>
        </div>
        <br>
        <br>
        <li><a href="javascript:dos()" style="color: black;"><img src="../image/pointt.png"
                                                                  style="width: 80%; background-color:transparent; color: black;"></a>
            <ul class="snd_menu sub_menu" style=" background-color:transparent;">
                <br>
                <li><a class="quick" href="${root}/lecture/lectureList"><img src="../image/yu.png"
                                                               style="width: 100%; background-color:transparent; color: black;">강의</a>
                </li>
                <br>
                <li><a class="quick" href="${root}/board/boardFree"><img src="../image/cccb.png"
                                                           style="width: 100%;padding-left:10px;  ">커뮤니티</a></li>
                <br>
                <li><a class="quick" href="${root}/qna/qnaList"><img src="../image/1ask.png" style="width:130%; padding-right: 25px;">문의하기</a>
                </li>
            </ul>
        </li>
    </ul>
</nav>
<script>
    $(document).ready(function dos() {
        $('#main_menu > li > a').click(function () {
            $(this).next($('.snd_menu sub_menu')).slideToggle('fast');
            // $(this).show($('.snd_menu sub_menu')("slide",{direction:'left'},1000));
        })
        // e.stopPropagation();

    })
</script>
</body>
</html>