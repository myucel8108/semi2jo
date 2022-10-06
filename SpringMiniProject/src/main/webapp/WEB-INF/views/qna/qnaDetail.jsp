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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
    <style type="text/css">


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
        #detailbox
        {
            margin: auto;
            margin-bottom: 0px;
        }

        #buttonbox{
            margin: auto;
            text-align: center;
            margin-top: 0;
            margin-bottom: 40px;
        }
        #listing{
            margin: auto;
            text-align: center;
            margin-bottom: 20px;
        }
        #tpst{
            font-size: 15px;
            text-decoration: none;
            color: grey;
            font-style: italic;
        }
    </style>
</head>
<body>
<div class="container" style="width: 100%;">
    <div style="margin: 50px;">
        <table class="table table-bordered" style="width: 600px" id="detailbox">
            <tr>
                <td>
                    <h2><b>${dto.subject}</b></h2>
                    <b>${dto.username}</b>
                    <span style="color: gray; font-size: 12px;">
               <fmt:formatDate value="${dto.writeday}" pattern="yyyy-MM-dd HH:mm"/>
            </span>
                    <b id="tpst">${dto.qnatype}</b>
                </td>
            </tr>
            <tr height="500">
                <td>
                    <p>${dto.content}</p>
                    <c:if test="${dto.photo!='no'}">
                        <c:forTokens var="photo" items="${dto.photo}" delims=",">
                            <img src="../upload/${photo}" width="250"
                                 onerror="this.style.display='none'">
                        </c:forTokens>
                    </c:if>
                    <div class="aform">
                        <form id="aform">
                            <input type="hidden" name="qnanum" value="${dto.qnanum}">
                            <input type="hidden" name="loginid" value="${sessionScope.loginid}">
                            <input type="hidden" name="username" value="${sessionScope.username}">
                        </form>
                    </div>
                    <tr>
            <td style="text-align: center; padding: 20px;" >
                    <c:if test="${sessionScope.loginok!=null && sessionScope.usernum==dto.usernum}">
                    <div id="buttonbox" style="width: 250px; margin-top:10px; margin-bottom: 10px;">
                        <button type="button" class="btn btn-outline" style="color: black; text-decoration: none; background-color: white; border: 1px solid black;" onclick="location.href='qnaUpdate?qnanum=${dto.qnanum}&currentPage=${currentPage}'">수정</button>
                        </c:if>
                        <c:if test="${sessionScope.loginok!=null && sessionScope.usernum==dto.usernum || sessionScope.loginid=='admin'}">
                        <button type="button" class="btn btn-outline" style="color: black; text-decoration: none; background-color: white; border: 1px solid black;" onclick="location.href='delete?qnanum=${dto.qnanum}&currentPage=${currentPage}'">삭제</button>
                        </c:if>
                        <c:if test="${dto.restep==0 && sessionScope.loginid=='test'}">
                            <button type="button" class="btn btn-outline"  style="color: black; text-decoration: none; background-color: white; border: 1px solid black;" onclick="location.href='qnaForm?qnanum=${dto.qnanum}&regroup=${dto.regroup}&restep=${dto.restep}&relevel=${dto.relevel}&currentPage=${currentPage}'">답글</button>
                        </c:if>
                        <%--        <div id="listing">--%>
                        <button type="button" class="btn btn-outline"  style="color: black; text-decoration: none; background-color: white; border: 1px solid black;" onclick="location.href='qnaList?currentPage=${currentPage}'">목록</button>
                        <%--        </div>--%>
                    </div>
            </td>
                    </tr>

                </td>
            </tr>

        </table>
    </div>


</div>
</body>
</html>
