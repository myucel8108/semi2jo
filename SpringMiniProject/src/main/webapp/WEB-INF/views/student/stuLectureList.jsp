<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    *{
      font-family: 'Jua';
    }
  </style>
</head>
<body>
<h1>수강목록</h1>
<table class="table table-bordered">
  <tr style="background-color: #ddd">
    <th style="width: 80px">과목분류</th>
    <th style="width: 350px">강의명</th>
    <th style="width: 80px">강사</th>
    <th style="width: 80px">강의실</th>
    <th style="width: 100px">강의교시</th>
    <th style="width: 100px">강의일</th>
    <th style="width: 50px">수강월</th>
  </tr>
  <c:forEach var="dto" items="${list }">
    <tr>
      <td>${dto.lectypea}</td>
      <td>${dto.lecname}</td>
      <td>${dto.teaname}</td>
      <td>${dto.roomnum}</td>
      <td>${dto.lectime}</td>
      <td>${dto.lecday}</td>
      <td>${dto.lecmonth}</td>
    </tr>
  </c:forEach>
</table>

</body>
</html>