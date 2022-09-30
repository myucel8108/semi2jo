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
        ul li{
            list-style: none;
        }
        #mypagelist{
            margin-top: 50px;
        }
    </style>
</head>
<body>
        <div id="mypagelist">
            <c:set var="root" value="<%=request.getContextPath() %>"/>
            <h1 style="text-align: center;">마이페이지</h1>
                <ul>
                    <li>
                        <a href="${root}/student/updateStudent">나의 정보</a>
                            <ul>
                                <li>정보 수정</li>
                                <li>비밀번호 변경</li>
                                <li>뭐하지</li>
                            </ul>
                    </li>
                    <li>
                        <a href="${root}/student/timeTable">시간표</a>
                        <ul>
                            <li>시간표 조회</li>
                            <li>시간표 꾸미기</li>
                        </ul>
                    </li>
                    <li>
                        <a>수강목록</a>
                        <ul>
                            <li>현재 수강 중</li>
                            <li>수강 완료</li>
                            <li>음</li>
                        </ul>
                    </li>
                    <li>
                        <a>내 게시판</a>
                        <ul>
                            <li>작성한 글</li>
                            <li>댓글 단 글</li>
                            <li>좋아요 한 글</li>
                        </ul>
                    </li>
                    <li>
                        <a>장바구니</a>
                        <ul>
                            <li>장바구니 조회</li>
                            <li>결제창 바로가기</li>
                            <li>뭐하지</li>
                        </ul>
                    </li>
                </ul>
        </div>
</body>
</html>