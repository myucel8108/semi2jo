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
    .lectd th,td{
      text-align: center;
    }
    .lectdbox{
      width: 850px;
      height: auto;
      background-color: #f2f2f2;
      padding: 10px 10px 10px 10px;
    }
  </style>
</head>
<body>
<h1>수강목록</h1>
<div class="lectdbox">
<table class="table table lectd">
  <tr>
    <th style="width: 80px">과목분류</th>
    <th style="width: 150px">강의명</th>
    <th style="width: 80px">강사</th>
    <th style="width: 80px">강의실</th>
    <th style="width: 100px">강의교시</th>
    <th style="width: 100px">강의요일</th>
    <th style="width: 50px">수강연월</th>
  </tr>
  <c:forEach var="dto" items="${list }">
    <tr>
      <td align="center">${dto.lectypea}</td>
      <td>${dto.lecname}</td>
      <td>${dto.teaname}</td>
      <td>${dto.roomnum}</td>
      <td>${dto.lectime}교시</td>
      <td>
        <c:if test="${fn:contains(dto.lecday,1)}">
          월
        </c:if>
        <c:if test="${fn:contains(dto.lecday,2)}">
          화
        </c:if>
        <c:if test="${fn:contains(dto.lecday,3)}">
          수
        </c:if>
        <c:if test="${fn:contains(dto.lecday,4)}">
          목
        </c:if>
        <c:if test="${fn:contains(dto.lecday,5)}">
          금
        </c:if>
        <c:if test="${fn:contains(dto.lecday,6)}">
          토
        </c:if>
        <c:if test="${fn:contains(dto.lecday,7)}">
          일
        </c:if>
      </td>
      <td>${dto.lecyear}/${dto.lecmonth}</td>
    </tr>
  </c:forEach>
</table>
</div>
</body>
</html>