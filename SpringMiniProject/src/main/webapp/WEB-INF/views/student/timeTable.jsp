<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    </style>
</head>
<body>
<h1>수강목록</h1>
<table class="table table-bordered">
    <c:forEach var="dto" items="${list}">
        <c:forEach var="i" begin="0" end="13">
            <tr>
            <c:forEach var="j" begin="0" end="7">
                <td>
                    <c:if test="${fn:contains(dto.lectime,i)&&fn:contains(dto.lecday,j)}">
                        <a>${dto.lecname}</a><br>
                        ${dto.teaname}
                        [${dto.roomnum}호]
                    </c:if>
                </td>
            </c:forEach>
            </tr>
        </c:forEach>
    </c:forEach>
</table>

</body>
</html>