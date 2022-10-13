<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
<%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">--%>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Yeon+Sung&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<%-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>--%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<%--    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">--%>
    <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    <link rel="stylesheet" type="text/css" href="${root}/css/board/boardForm.css">
    <style type="text/css">

        #test_obj {
            position: fixed;
            width: 70px;
            height: 210px;
            right: 50px;
            border-radius: 70px;
            top: 550px;
            border: 1px solid;
            border-color: grey;
        }
        .boardbtn:active, .boardbtn:focus{
            outline:none !important;
            box-shadow:none !important;
        }
    </style>
</head>
<body>
<div class="container" style="width: 1000px; padding: 50px;">
    <c:set var="root" value="<%=request.getContextPath() %>"/>
    <h1 style="text-align: center;">${boardtype.equals('free')?"자유게시판":"질문게시판"}</h1><br>
    <div class="btn-group">
        <button type="button" class="btn btn-outline-dark boardbtn" onclick="location.href='${root}/board/boardFree?boardtype=free'">자유</button>
        <button type="button" class="btn btn-outline-dark boardbtn" onclick="location.href='${root}/board/boardFree?boardtype=ask'">질문</button>
    </div>
                <button onclick="if(${sessionScope.loginok==null}){alert('로그인 후 이용해주세요')}
                        else{location.href='${root}/board/boardForm'}" style="float: right;" class="btn btn-outline-dark boardbtn">글쓰기</button><br><br>
                <div style="margin: 10px;">
                    <table class="table" style="width: 100%; border-collapse: separate; border-radius: 15px; border: 1px solid black;">
                        <tr>
                            <td colspan="5" align="center">
                                <b>이번주 인기게시물 TOP5</b>
                            </td>
                        </tr>
                        <tr>
                            <th style="width: 300px; text-align: center;">제목</th>
                            <th style="width: 80px; text-align: center;">작성자</th>
                            <th style="width: 120px; text-align: center;">작성일</th>
                            <th style="width: 50px; text-align: center;">좋아요</th>
                            <th style="width: 50px; text-align: center;">조회</th>
                        </tr>
                        <c:forEach var="hotdto" items="${hotlist}">
                            <tr>
                                <td>
                                    <a href="${root}/board/boardDetail?boardnum=${hotdto.boardnum}&currentPage=1" style="text-decoration: none; color: black;">${hotdto.subject}</a>
                                    <c:if test="${hotdto.photo!='no'}">
                                        <i class="fa fa-image" style="font-size:20px"></i>
                                    </c:if>
                                    <c:if test="${hotdto.reboardcount>0}">
                                        <b>[${hotdto.reboardcount}]</b>
                                    </c:if>
                                </td>
                                <td style="text-align: center;">${hotdto.nickname}</td>
                                <td style="text-align: center;">
                                    <fmt:formatDate value="${hotdto.writeday}" pattern="yyyy-MM-dd"/>
                                </td>
                                <td style="text-align: center;">${hotdto.likes}</td>
                                <td style="text-align: center;">${hotdto.readcount}</td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
                <br>
                <div class="boardlist" style="margin: 10px;">
                    <c:set var="root" value="<%=request.getContextPath() %>"/>
                    <table class="table" style="width: 100%; border-collapse: separate; border-radius: 10px; border: 1px solid black;">
                        <tr>
                            <th style="width:50px; text-align: center;">번호</th>
                            <th style="width: 300px; text-align: center;">제목</th>
                            <th style="width: 80px; text-align: center;">작성자</th>
                            <th style="width: 120px; text-align: center;">작성일</th>
                            <th style="width: 50px; text-align: center;">조회</th>
                        </tr>
                        <c:forEach var="dto" items="${list}">
                            <tr>
                                <td style="text-align: center;">${no}</td>
                                <c:set var="no" value="${no-1}"/>
                                <td>
                                    <a href="${root}/board/boardDetail?boardnum=${dto.boardnum}&currentPage=${currentPage}" style="text-decoration: none; color: black;">${dto.subject}</a>
                                    <c:if test="${dto.photo!='no'}">
                                        <i class="fa fa-image" style="font-size:20px"></i>
                                    </c:if>
                                    <c:if test="${dto.reboardcount>0}">
                                        <b>[${dto.reboardcount}]</b>
                                    </c:if>
                                </td>
                                <td style="text-align: center;">${dto.nickname}</td>
                                <td style="text-align: center;">
                                    <fmt:formatDate value="${dto.writeday}" pattern="yyyy-MM-dd"/>
                                </td>
                                <td style="text-align: center;">${dto.readcount}</td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
                <div class="searcharea" style="width: 60%; margin: 10px;">
                    <form action="boardFree">
                        <div class="input-group">
                            <select style="width: 100px; text-align: center;" name="searchcolumn">
                                <option value="subject">제목</option>
                                <option value="nickname">작성자</option>
                                <option value="content">내용</option>
                            </select>
                            &nbsp;&nbsp;&nbsp;
                            <input type="text" name="searchword" style="width: 200px;" placeholder="검색어" value="${param.searchword}">
                            <button type="submit" class="btn btn-outline-dark boardbtn">검색</button>
                        </div>
                    </form>
                </div>
                <!--페이징-->
                <div class="paging">
                    <ul class="pagination" style="justify-content: center;">
                        <c:if test="${startPage>1}">
                            <li class="page-item"><a href="boardFree?boardtype=${boardtype}&currentPage=${startPage-1}" class="page-link boardbtn" style="color: black;">이전</a></li>
                        </c:if>

                        <!-- 페이지번호 -->
                        <c:forEach var="pp" begin="${startPage}" end="${endPage}">
                            <c:if test="${pp==currentPage}">
                                <li class="page-item"><a class="page-link boardbtn" href="boardFree?boardtype=${boardtype}&currentPage=${pp}" style="color: white; background-color: black;">${pp}</a></li>
                            </c:if>
                            <c:if test="${pp!=currentPage}">
                                <li class="page-item"><a class="page-link boardbtn" href="boardFree?boardtype=${boardtype}&currentPage=${pp}" style="color: black;">${pp}</a></li>
                            </c:if>
                        </c:forEach>

                        <c:if test="${endPage<totalPage}">
                            <li class="page-item"><a href="boardFree?boardtype=${boardtype}&currentPage=${endPage+1}" class="page-link boardbtn" style="color: black;">다음</a></li>
                        </c:if>
                    </ul>
                </div>
        </div>


<div id="test_obj"><b style="margin-left:18px; padding-top: 20px; display: inline-block; text-align: center; vertical-align: center; color: black;"><a href="#top" class="well well-sm" onclick="$('html,body').animate({scrollTop:0},fast);return false;" id="toptop">
    TOP</a></b><br><br><br><b style="font-size: 15px; color: black; margin-left: 6px; padding-top: 15px;"></b><a href="${root}/qna/qnaList"><b style="padding-right: 3px; padding-top: 90px;">문의하기</b></a><br><br><br><b style="font-size: 15px; color: black; margin-left: 8px; padding-top: 40px; margin-top: 10px;"><a href="${root}/board/boardFree">커뮤니티</a></b></div>
</span><!-- /top-link-block -->




    </body>



<script>

    $(document).ready(function () {
        var tmp = parseInt($("#test_obj").css('top'));

        $(window).scroll(function () {
            var scrollTop = $(window).scrollTop();
            var obj_position = scrollTop + tmp + "px";

            $("#test_obj").stop().animate({
                "top": obj_position
            }, 500);

        }).scroll();
    });



</script>



</html>