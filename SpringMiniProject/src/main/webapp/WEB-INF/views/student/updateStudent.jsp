<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Yeon+Sung&display=swap" rel="stylesheet">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>

    <!-- css  -->
    <c:set var="root" value="<%=request.getContextPath() %>"/>
    <link rel="stylesheet" type="text/css" href="${root}/css/updateform.css">
    <style type="text/css">

    </style>
    <script>

    </script>
</head>
<body>
<div class="container" style="width: 80%;">
    <form action="update" method="post" enctype="multipart/form-data">
        <div class="title">
            회원정보수정
        </div>
        <div class="container" style="width: 80%;">
            <div class="box">
                <table class="text">
                    <tr>
                        <td class="text1"> <div style="padding-bottom: 10px; width: 95px;">아이디</div></td>
                        <td colspan="3" class="text2">
                            <div class="wrapper">
                                <input type="text" class="input" readonly name="email" value="${dto.email}" style="width: 200px;">
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="text1"><div style="padding-bottom: 10px;">비밀번호</div></td>
                        <td colspan="3" class="text2">
                            <div class="wrapper">
                                <input type="text" class="input" name="subject" placeholder="새 비밀번호 입력" required="required" style="width: 200px;">
                                <span class="underline"></span>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="text1"><div style="padding-bottom: 10px;">비밀번호 확인</div></td>
                        <td colspan="3" class="text2">
                            <div class="wrapper">
                                <input type="text" class="input" name="subject" placeholder="새 비밀번호 입력" required="required" style="width: 200px;">
                                <span class="underline"></span>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="text1"><div style="padding-bottom: 20px;">이미지 첨부</div></td>
                        <td colspan="3" class="text2" style="padding-bottom: 10px;">
                            <div class="filebox">
                                <input class="filename_list" style="margin-left: 10px; outline: none;" value="이미지 첨부" readonly="readonly">
                                <input type="file" value="첨부파일" id="file" name="upload" style="width: 200px;" multiple="multiple">
                                <label for="file"><i class='far fa-images' style='font-size:30px'></i></label>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <div class="wrapper_textarea" id="textarea_normal"  style="margin-top: 15px;">
                                <div style="position:relative; margin-bottom: 15px; font-size:16px; font-weight: 500; color: #505050;" >본문</div>
                                <textarea class="select" id="textarea_common" name="content" style="resize: none;" placeholder="본문 내용을 입력하세요"></textarea>
                                <div style="font-size:12px; letter-spacing :-0.1em; position: relative; margin-bottom: 10px; color: #505050">
                                </div>
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="4" style="text-align: right;">
                            <button type="button" class="btn-large2" style="margin-right: 20px;" onclick="location.href='/board/boardFree'">뒤로가기</button>
                            <button type="submit" class="btn-large1" id="btn_submit" style="margin-right: 230px;">등록하기</button>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </form>
</div>

</div>
</body>
</html>