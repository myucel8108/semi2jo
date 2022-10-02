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
    <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
    <style type="text/css">

        span.likes {
            cursor: pointer;
        }
        div.alist pre{
            text-indent: 10px; /*들여쓰기*/
            color: black;
        }
        div.alist img{
            width: 40px;
            height: 40px;
            cursor: pointer;
            border: 1px solid gray;
            border-radius: 10px;
            margin-left: 10px;
        }
    </style>
</head>
<body>
<body>
<div style="margin: 50px;">
    <table class="table table-bordered" style="width: 600px;">
        <tr>
            <td>
                <h2><b>${dto.subject}</b></h2>
                <b>${dto.nickname}(${dto.userid})</b>
                <span style="color: gray; font-size: 12px;">
					<fmt:formatDate value="${dto.writeday}" pattern="yyyy-MM-dd HH:mm"/>
					&nbsp;&nbsp;
					조회&nbsp; ${dto.readcount}
				</span>
            </td>
        </tr>
        <tr height="200">
            <td>
                <p>${dto.content}</p>
                <c:if test="${dto.photo!='no'}">
                    <c:forTokens var="photo" items="${dto.photo}" delims=",">
                        <img src="../upload/${photo}" width="250"
                             onerror="this.style.display='none'">
                    </c:forTokens>
                </c:if>
                <br>
                <span class="likes">
                <i class='far fa-thumbs-up'></i>
				좋아요<b>${dto.likes}</b></span>&nbsp;&nbsp;

                <i class="far fa-comment-dots"></i>
                &nbsp;<b class="banswer">0</b>
                <br>
                <div class="alist">
                    댓글목록
                </div>
                <div class="aform">
                    <form id="aform">
                        <input type="hidden" name="num" value="${dto.boardnum}">
                        <input type="hidden" name="id" value="${sessionScope.loginid}">
                        <input type="hidden" name="name" value="${sessionScope.loginname}">
                        <div class="input-group">
                            <textarea name="message" id="message" style="width: 400px; height: 60px;" class="form-control"></textarea>
                            <button type="button" class="btn btn-secondary" id="btnasave">등록</button>
                        </div>
                    </form>
                </div>
            </td>
            <button type="button" onclick="location.href='boardUpdate?boardnum=${dto.boardnum}&currentPage=${currentPage}'">수정</button>
            <button type="button" onclick="location.href='delete?boardnum=${dto.boardnum}&currentPage=${currentPage}'">삭제</button>
        </tr>
    </table>
</div>
</body>
</body>
</html>