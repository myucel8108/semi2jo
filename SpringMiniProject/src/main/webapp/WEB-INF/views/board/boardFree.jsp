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
<div style="margin: 10px;">
    <table class="table table-bordered" style="width: 900px;">
        <tr style="background-color: #bac9e0">
            <th colspan="2">인기게시물 (어케만드는거야...)</th>
        </tr>
        <tr>
            <td>인기1</td>
            <td>인기2</td>
        </tr>
        <tr>
            <td>인기3</td>
            <td>인기4</td>
        </tr>
        <tr>
            <td>인기5</td>
            <td>인기6</td>
        </tr>
        <tr>
            <td>인기7</td>
            <td>인기8</td>
        </tr>
        <tr>
            <td>인기9</td>
            <td>인기10</td>
        </tr>
    </table>
</div>
<br>
<div class="boardlist" style="margin: 10px;">
    <c:set var="root" value="<%=request.getContextPath() %>"/>
    <table class="table table-bordered" style="width: 900px;">
        <tr style="background-color: #bac9e0; text-align: center;">
            <th style="width:50px;">번호</th>
            <th style="width: 300px;">제목</th>
            <th style="width: 80px;">작성자</th>
            <th style="width: 120px;">작성일</th>
            <th style="width: 50px;">조회</th>
        </tr>
        <c:forEach var="dto" items="${list}">
            <tr>
                <td style="text-align: center;">${no}</td>
                <c:set var="no" value="${no-1}"/>
                <td><a href="${root}/board/boardDetail?boardnum=${dto.boardnum}&currentPage=${currentPage}">${dto.subject}</a></td>
                <td>${dto.nickname}</td>
                <td style="text-align: center;">
                    <fmt:formatDate value="${dto.writeday}" pattern="yyyy-MM-dd"/>
                </td>
                <td style="text-align: center;">${dto.readcount}</td>
            </tr>
        </c:forEach>
    </table>
</div>
<div class="searcharea" style="width: 100%; margin: 10px;">
    <form action="">
        <div class="input-group" style="width: 500px;">
            <select class="form-select" style="width: 150px;" name="searchcolumn">
                <option value="subject">제목</option>
                <option value="name">닉네임</option>
                <option value="content">내용</option>
            </select>
            &nbsp;&nbsp;&nbsp;
            <input type="text" name="searchword" class="form-control" style="width: 140px;" placeholder="검색어" value="${param.searchword}">
            <button type="submit">검색</button>
        </div>
    </form>
    <button onclick="location.href='${root}/board/boardForm'">글쓰기</button>
</div>
<div class="paging" style="margin-left: 600px;">
    <ul class="pagination">
        <c:if test="${startPage>1}">
            <li class="page-item"><a href="boardFree?currentPage=${startPage-1}" class="page-link">이전</a></li>
        </c:if>

        <!-- 페이지번호 -->
        <c:forEach var="pp" begin="${startPage}" end="${endPage}">
            <c:if test="${pp==currentPage}">
                <li class="page-item active"><a class="page-link" href="boardFree?currentPage=${pp}">${pp}</a></li>
            </c:if>
            <c:if test="${pp!=currentPage}">
                <li class="page-item"><a class="page-link" href="boardFree?currentPage=${pp}">${pp}</a></li>
            </c:if>
        </c:forEach>

        <c:if test="${endPage<totalPage}">
            <li class="page-item"><a href="boardFree?currentPage=${endPage+1}" class="page-link">다음</a></li>
        </c:if>
    </ul>
</div>
</body>
</html>