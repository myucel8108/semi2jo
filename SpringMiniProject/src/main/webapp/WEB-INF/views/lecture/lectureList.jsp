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
 <!--    <style>
        *{
            font-family: 'abster';
        }
        .searcharea{
            margin-top: 50px;
            margin-left: 50px;
        }
        .menulist{
            width: 300px;
            /*height: 450px;*/
            height: 100%;
            border: 1px solid gray;
            text-align: center;
            margin-top: 50px;
            padding-top: 10px;
            font-size: 30px;
            background-color: darkblue;
            margin-left: 0%;
            color: white;
        }
        .menulist a{
            cursor: pointer;
        }

        .box
        {
            width: 900px;
            height: 100%;
            border: 1px solid gray;
            text-align: center;
            line-height: 900px;
            margin-bottom: 300px;

        }
        .superbox{
            vertical-align: middle;
        }
    </style> -->
</head>
<body>
	<div class="container" style=" display: flex;">
	<div style="width: 300px;">
		 ㅁㄴㅇㄹ                                               ㅁㄴㅇㄹ
	</div>
		<table class="table table-bordered">
		<c:forEach var="dto" items="${list}">
			<tr>
				<td style="width: 250px" align="center" rowspan="5">
					<img src=" " width="230px" height="250" border="1" id="showimg">
					<br>					
				</td>
				<td style="width: 300px">회원명 : ${dto.teaname}</td>
			</tr>
			<tr>
				<td>아이디 : ${dto.lecname}</td>
			</tr>
			<tr>
				<td>이메일 : ${dto.lectypea}</td>
			</tr>
			<tr>
				<td>핸드폰 : ${dto.lectypeb}</td>
			</tr>
			<tr>
				<td>주소 :</td>
			</tr>
		</c:forEach>
	</table>
	</div>
</body>
</html>