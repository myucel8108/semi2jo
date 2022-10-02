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
    <style>
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
    </style>
</head>
<body>
<div class="searcharea" >
    <form action="list">
        <div class="input-group" id="viewall" style="width: 450px;">
            <select class="form-select" style="width:150px;" name="searchcolumn">
                <option value="lecture">전체보기</option>
                <option value="lecture">강의명</option>
                <option value="teacher">강사명</option>
                <option value="lectureName">과목명</option>
            </select>
            &nbsp;&nbsp;&nbsp;
            <input type="text" name="searchword" class="form-control" style="width: 140px;"
                   placeholder="검색단어" value="${param.searchword}">
            <button type="submit" class="btn btn-success" style="background-color: darkblue">검색</button>
        </div>
    </form>
</div>
<div class="superbox">
<div class="menulist">
    <div>
    <a>전체강의</a><br><hr>
    <a>국어</a><br><hr>
    <a>영어</a><br><hr>
    <a>수학</a><br><hr>
    <a>사회</a><br><hr>
    <a>과학</a><br>
    </div>
</div>


<div class="box">
    <div>
        강의 출력 목록
    </div>

</div>

<%--<div class="boardlist" style="margin-top: 10px; width:1000px;">--%>
<%--    <br><br>--%>
<%--    <table class="table table-bordered">--%>
<%--        <tr style="background-color: #ddd">--%>
<%--            <th style="width: 50px; text-align:center;">번호</th>--%>
<%--            <th style="width: 250px;text-align:center;">강의명</th>--%>
<%--            <th style="width: 80px;text-align:center;">강사명</th>--%>
<%--            <th style="width: 50px;text-align:center;">조회</th>--%>
<%--        </tr>--%>
<%--        <c:if test="${totalCount==0 }">--%>
<%--            <tr>--%>
<%--                <td colspan="6" align="center">--%>
<%--                    <h4> 등록된 글이 없습니다 </h4>--%>
<%--                </td>--%>
<%--            </tr>--%>
<%--        </c:if>--%>
<%--        <c:if test="${totalCount>0 }">--%>
<%--            <c:forEach var="dto" items="${list}">--%>
<%--                <tr>--%>
<%--                    <td align="center">${no}</td>--%>
<%--                    <c:set var="no" value="${no-1}"/>--%>
<%--                    <td>--%>
<%--                        <!-- 답글일경우 level 1당 2칸 띄우기  -->--%>
<%--                        <c:forEach begin="1" end="${dto.relevel}">--%>
<%--                            &nbsp;&nbsp;--%>
<%--                        </c:forEach>--%>
<%--                        <!-- 답글일 경우 답글 이미지 넣기 -->--%>
<%--                        <c:if test="${dto.relevel>0}">--%>
<%--                            <img src="../image/re.png">--%>
<%--                        </c:if>--%>
<%--                        <a href="detail?num=${dto.num}&currentPage=${currentPage}">--%>
<%--                                ${dto.subject}--%>
<%--                            <c:if test="${dto.photo!='no'}">--%>
<%--                                <i class="fa fa-picture-o"></i>--%>
<%--                            </c:if>--%>

<%--                            <!--댓글이 0개 이상인 경우에 댓글 갯수 출력 -->--%>
<%--                            <c:if test="${dto.acount>0 }">--%>
<%--                                <b style="color: red;">[${dto.acount}]</b>--%>
<%--                            </c:if>--%>
<%--                        </a>--%>


<%--                    </td>--%>
<%--                    <td align="center">${dto.name}</td>--%>
<%--                    <td align="center">--%>
<%--                        <fmt:formatDate value="${dto.writeday}" pattern="yyyy-MM-dd"/>--%>
<%--                    </td>--%>
<%--                    <td align="center">${dto.readcount }</td>--%>
<%--                    <td align="center">${dto.likes }</td>--%>
<%--                </tr>--%>
<%--            </c:forEach>--%>
<%--        </c:if>--%>

<%--    </table>--%>
<%--</div>--%>
</div>
</body>
</html>