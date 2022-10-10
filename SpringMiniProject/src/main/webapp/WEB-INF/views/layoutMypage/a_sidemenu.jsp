<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Yeon+Sung&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    <c:set var="root" value="<%=request.getContextPath() %>"/>
    <link rel="stylesheet" type="text/css" href="${root }/css/activity.css">

    <title></title>
</head>

<body>
<!-- sidebar -->

<div class="sidebar_title">마이페이지</div>
<hr id="sidebar_hr">
<div class="sidebar_content">
    <div class="sidebar_detail" id="d1" onclick="location.href='${root}/student/upStuPassCheck'">

        <span class="side_main_span_main">회원정보수정</span>
    </div>
    <div class="sidebar_detail" id="d2" onclick="location.href='${root}/student/timeTable'">
        <span class="side_main_span_write">강의시간표</span>
    </div>
    <div class="sidebar_detail" id="d3" onclick="location.href='${root}/student/stuLectureList'">
        <span class="side_main_span_market">수강목록</span>
    </div>
    <div class="sidebar_detail" id="d4" onclick="location.href='#'">
        <span class="side_main_span_challenge">마이커뮤니티</span>
    </div>
    <div class="sidebar_detail" id="d5" onclick="location.href='${root}/student/myCart'">
        <span class="side_main_span_scrap">장바구니</span>
    </div>
</div>

</body>
</html>