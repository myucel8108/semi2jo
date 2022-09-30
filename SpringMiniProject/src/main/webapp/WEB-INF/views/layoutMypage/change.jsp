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
    <div style="margin-top: 100px;">
        <h1>나의 정보</h1>
        <table class="table table-bordered" style="background-color: #bac9e0; width: 500px; text-align: center;" >
            <tr>
                <th>회원명</th>
                <td>username</td>
                <td rowspan="4">
                프사
                    <br>
                    <button>사진변경</button>
                </td>
            </tr>
            <tr>
                <th>아이디</th>
                <td>userid</td>
            </tr>
            <tr>
                <th>닉네임</th>
                <td>nickname</td>
            </tr>
            <tr>
                <th>생년월일</th>
                <td>birth</td>
            </tr>
            <tr>
                <th>핸드폰</th>
                <td colspan="2">hp</td>
            </tr>
            <tr>
                <th>이메일</th>
                <td colspan="2">email</td>
            </tr>
            <tr>
                <th>주소</th>
                <td colspan="2">addr</td>
            </tr>
            <tr>
               <td colspan="3">
                   <button>수정하기</button>
                   <button>삭제하기</button>
               </td>
            </tr>
        </table>

    </div>
</body>
</html>