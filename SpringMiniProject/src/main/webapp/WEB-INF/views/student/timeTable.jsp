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
    <link rel="stylesheet" type="text/css" href="${root}/resources/css/timetable.css" />
    <style type="text/css">
        *{
            font-family: Noto Sans KR;
        }
    </style>
</head>
<body>
<h1>시간표</h1>
<table class="lectable">
    <th></th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th><th>일</th>
        <c:forEach var="i" begin="1" end="13">
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
                                <c:set var="bgcolor" value="#ece5cf"/>
                            </c:if>
                            <c:if test="${dto.mylecnum%6==0}">
                                <c:set var="bgcolor" value="#f8ece9"/>
                            </c:if>
                            <div class="mylecname" style="background-color:${bgcolor};">
                                <a>${dto.lecname}</a>
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
</body>
</html>