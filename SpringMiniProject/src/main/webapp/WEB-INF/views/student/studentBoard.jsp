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
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Yeon+Sung&display=swap" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
  <style>
    *{
      font-family: 'Noto Sans KR';
    }
  </style>
</head>
<body>
<h1>커뮤니티</h1>
<br>
<div class="btn-group">
  <button type="button" class="btn-outline-danger">내가 쓴 글</button>
  <button type="button" class="btn-outline-danger">내가 댓글 단 글</button>
  <button type="button" class="btn-outline-danger">내가 좋아요 한 글</button>
</div>
<br><br><br>
  <table class="table table-bordered">
    <tr>
      <th style="text-align: center; width: 50%;">제목</th>
      <th style="text-align: center; width: 20%;">작성자</th>
      <th style="text-align: center; width: 30%;">작성일</th>
    </tr>
    <tr>
      <c:forEach var="dto" items="${list}">
    <tr>
      <td>
        <a href="${root}/board/boardDetail?boardnum=${dto.boardnum}&currentPage=${currentPage}" style="text-decoration: none; color: black;">${dto.subject}</a>
        <c:if test="${dto.photo!='no'}">
          <i class="fa fa-image" style="font-size:20px"></i>
        </c:if>
        <c:if test="${dto.reboardcount>0}">
          <b>[${dto.reboardcount}]</b>
        </c:if>
      </td>
      <td style="text-align: center;">${dto.nickname}</td>
      <td style="text-align: center;">
        <fmt:formatDate value="${dto.writeday}" pattern="yyyy-MM-dd"/>
      </td>
    </tr>
    </c:forEach>
    </tr>
  </table>
</body>
</html>
