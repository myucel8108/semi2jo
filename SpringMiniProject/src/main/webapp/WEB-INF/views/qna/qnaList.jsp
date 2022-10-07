<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<%--    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">--%>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <c:set var="root" value="<%=request.getContextPath() %>"/>
    <link rel="stylesheet" type="text/css" href="${root}/css/qna.css">
    <style>
        li>a.page-link{
            display: block;
            justify-content: center;
            align-items: center;
            vertical-align: middle;
            text-align: center;
            margin: auto;
            background-color: white;
            width: 50px;
        }
        ul.pagination{
            justify-content: center;
        }
        table>td>a{
            text-decoration: none;
        }

    </style>
</head>
<body>
<h1 style="text-align: center; font-size: 30px; margin-top: 80px; padding-bottom: 0px; font-family: abster;" >TeachMe 지원</h1>
<div class="container" style="width: 100%;" >
        <div class="myaskbox">
            <button type="button" onclick="location.href='qnaList?'" class="myask2">전체글보기</button>&nbsp;
            <c:if test="${sessionScope.loginok!=null}">

            <button type="button" onclick="location.href='qnaList?usernum=${sessionScope.usernum}'" class="myask">나의문의보기</button>
            </c:if>
        </div>
    <br>
<div class="qnalist" style="margin-top: 10px; ">
    <h3 class="hname-tm">총 ${totalCount} 개의 글이 있습니다</h3>
</div>
    <br><br>
    <table class="table table-bordered" >
        <tr class="listbox-tm">
            <th style="width: 30px; text-align:center; ">번호</th>
            <th style="width: 150px;text-align:center; ">제목</th>
            <th style="width: 50px;text-align:center; ">작성자</th>
            <th style="width: 20px;text-align:center; ">작성일</th>
        </tr>
        <c:if test="${totalCount==0 }">
            <tr>
                <td colspan="6" align="center">
                    <h5> 등록된 문의글이 없습니다 </h5>
                </td>
            </tr>
        </c:if>
        <c:if test="${totalCount>0 }">
            <c:forEach var="dto" items="${list}">
                <tr>
                    <td align="center">${no}</td>
                    <c:set var="no" value="${no-1}"/>
                    <td>
                        <!-- 답글일경우 level 1당 2칸 띄우기  -->
                        <c:forEach begin="1" end="${dto.relevel}">
                            &nbsp;&nbsp;
                        </c:forEach>
                        <!-- 답글일 경우 답글 이미지 넣기 -->
                        <c:if test="${dto.relevel>0}">

                            <img src="../image/ree.png" width="20px;" style="background-color: white">

                            <img src="../image/ans.jpg" width="20px;" style="background-color: white">
                            <a href="qnaDetail?qnanum=${dto.qnanum}&currentPage=${currentPage}" class="subject-tm"></a>
                            <img src="../image/lock2.png" width="10px;" style="background-color: white">
                        </c:if>


                        <a href="qnaDetail?qnanum=${dto.qnanum}&currentPage=${currentPage}" class="subject-tm">

                            <c:if test="${dto.relevel==0}">
                            <img src="../image/lockimg.jpg" width="10px;" style="background-color: white">
                            </c:if>
                                ${dto.subject}&nbsp;&nbsp;
                                ${dto.qnatype}
                            <c:if test="${dto.photo!='no'}">
                                <i class="fa fa-picture-o"></i>
                            </c:if>
                            <c:if test="${dto.relevel>0}">
                                <b style="color: orange; text-decoration: none;">답변완료</b>
                            </c:if>
                        </a>
                    </td>
                    <c:set var="username" value="${resultInfo.dto.username}"/>
                    <c:set var="totalLength" value="${fn:length(dto.username)}"/>
                    <c:set var="first" value="${fn:substring(dto.username, 0, 1)}"/>
                    <c:set var="last" value="${fn:substring(dto.username, 3, totalLength)}"/>

                    <td align="center"><c:if test="${!empty dto.username and dto.username!='티치미'}"><c:out value="${first}**${last}"/>
                    </c:if>
                    <c:if test="${dto.username=='티치미'}"><c:out value="${dto.username}"/>
                        </c:if>




                    <td align="center">
                        <fmt:formatDate value="${dto.writeday}" pattern="yyyy-MM-dd"/>
                    </td>
                </tr>
            </c:forEach>
        </c:if>
        <!-- 글쓰기 버튼은 로그인을 해야만 보인다 -->
        <c:if test="${sessionScope.loginok!=null}">
        <tr>
                <td colspan="6" align="right" style= "text-align:center" >
                    <c:if test="${sessionScope.email!='admin@gmail.com'}">
                    <button type="button" class="btn btn-outline"
                            onclick="location.href='qnaForm'" id="writecolor" >문의하기</button>
                    </c:if>
                </td>
        </tr>

        </c:if>
    </table>
</div>
    <div class="container" style="width: 100%;">
<div class="paging">
    <ul class="pagination">
        <c:if test="${startPage>1}">
            <li class="page-item"><a href="qnaList?currentPage=${startPage-1}"
                                     class="page-link">이전</a></li>
        </c:if>

        <!--  페이지 번호  -->
        <c:forEach var="pp" begin="${startPage}" end="${endPage}">
            <c:if test="${pp==currentPage}">
                <li class="page-item active"><a class="page-link" id="page-button-tm" href="qnaList?currentPage=${pp}">${pp}</a></li>
            </c:if>
            <c:if test="${pp!=currentPage}">
                <li class="page-item"><a class="page-link" id="page-button-tm2" href="qnaList?currentPage=${pp}">${pp}</a></li>
            </c:if>
        </c:forEach>
        <c:if test="${endPage<totalPage}">
            <li class="page-item"><a href="qnaList?currentPage=${endPage+1}"
                                     class="page-link" id="page-button-tm3">다음</a></li>
        </c:if>
    </ul>
</div>
</div>
</div>
</body>
</html>