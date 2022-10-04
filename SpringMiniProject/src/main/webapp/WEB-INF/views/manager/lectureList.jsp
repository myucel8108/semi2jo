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

        .searchdiv{
            width: 450px;
        }
    </style>
</head>
<body>
    <!-- 검색창 -->
    <div class="searcharea">
        <form action="lecturelist">
            <div class="input-group searchdiv">
                <select class="form-select" style="width: 150px;" name="searchcolumn">
                    <option value="subject">현재 진행 중인 강의</option>
                    <option value="id">기간 만료된 강의</option>
                </select>
                &nbsp;&nbsp;&nbsp;
                <input type="date" name="searchword" class="form-control" style="width: 100px;"
                       value="${param.searchword}">
                <button type="submit" class="btn btn-primary">날짜검색</button>
            </div>
        </form>
    </div>

    <!-- 리스트 출력 창 -->
    <div class="lecturelist">
        <div class="alert alert-primary">총 ${totalCount}개의 강의가 있습니다</div>
        <br><br>
        <table class="table table-bordered">
            <tr style="background-color: #ddd">
                <th align="center" style="width: 50px;">번호</th>
                <th align="center" style="width: 200px;">강의명</th>
                <th align="center" style="width: 80px;">강사</th>
                <th align="center" style="width: 80px;">강의 대분류</th>
                <th align="center" style="width: 90px;">강의 소분류</th>
            </tr>
            <c:if test="${totalCount==0}">
                <tr>
                    <td colspan="6" align="center">
                        <h4>등록된 강의가 없습니다</h4>
                    </td>
                </tr>
            </c:if>

            <!-- 리스트 출력부 -->
            <c:if test="${totalCount>0}">
                <c:forEach var="dto" items="${list}">
                    <tr>
                        <td align="center">${no}</td>
                        <c:set var="no" value="${no-1}"/>
                        <td align="center">${dto.lecname}</td>
                        <td align="center">${dto.teaname}</td>
                        <td align="center">${dto.lectypea}</td>
                        <td align="center">${dto.lectypeb}</td>
                    </tr>
                </c:forEach>
            </c:if>
            <c:if test="${sessionScope.loginok!=null}">
                <tr>
                    <td colspan="6" align="center">
                        <button type="button" class="btn btn-outline-success" onclick="location.href='form'">글쓰기</button>
                    </td>
                </tr>
            </c:if>
        </table>
    </div>

    <!-- 페이징 -->
    <div class="paging">
        <ul class="pagination">
            <c:if test="${startPage>1}">
                <li class="page-item"><a href="list?currentPage=${startPage-1}" class="page-link">이전</a></li>
            </c:if>

            <!-- 페이지 번호 -->
            <c:forEach var="pp" begin="${startPage}" end="${endPage}">
                <c:if test="${pp==currentPage}">
                    <li class="page-item active"><a href="list?currentPage=${pp}" class="page-link">${pp}</a></li>
                </c:if>
                <c:if test="${pp!=currentPage}">
                    <li class="page-item"><a href="list?currentPage=${pp}" class="page-link">${pp}</a></li>
                </c:if>
            </c:forEach>

            <c:if test="${endPage<totalPage}">
                <li class="page-item"><a href="list?currentPage=${endPage+1}" class="page-link">다음</a></li>
            </c:if>
        </ul>
    </div>

</body>
</html>
</body>
</html>