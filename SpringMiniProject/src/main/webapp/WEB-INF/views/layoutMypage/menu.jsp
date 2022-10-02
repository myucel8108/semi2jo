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
<div>
    <ul>
        <!-- 1번째 메뉴 -->
        <li class="dropdown">
            <a class="dropdown-btn">강의</a>
            <ul class="dropdown-submenu">
                <li><a>수강신청</a></li>
                <li><a>강사안내</a></li>
                <li><a>수강평</a></li>
            </ul>
        </li>

        <!-- 2번째 메뉴 -->
        <li class="dropdown">
            <a class="dropdown-btn">게시판</a>
            <ul class="dropdown-submenu">
                <li><a>자유게시판</a></li>
                <li><a>질문게시판</a></li>
                <li><a>장터게시판</a></li>
                <li><a>반별게시판</a></li>
            </ul>
        </li>

        <!-- 3번째 메뉴 -->
        <li class="dropdown">
            <a class="dropdown-btn">학원안내</a>
            <ul class="dropdown-submenu">
                <li><a>시설안내</a></li>
                <li><a>공지사항</a></li>
                <li><a>이벤트</a></li>
                <li><a>FAQ</a></li>
                <li><a>1:1문의</a></li>
            </ul>
        </li>
    </ul>
</div>
</body>
</html>