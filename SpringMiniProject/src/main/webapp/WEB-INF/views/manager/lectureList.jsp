<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="css/manager/lectureList.css">
    <style type="text/css">
        ul.pagination {
            justify-content: center;
        }

        .possible-list {
            margin-bottom: 30px;
            font-size: 40px;
            display: flex;
            justify-content: center;
        }

        .lecture-count {
            display: flex;
            justify-content: end;
            padding-right: 130px;
        }

        .present-container {
            cursor: pointer;
        }

        .paging {
            padding-bottom: 20px;
        }

        .search-box {
            padding-right: 125px;
            display: flex;
            justify-content: right;
        }

        .insert-button {
            padding-right: 125px;
            display: flex;
            justify-content: end;
        }

        #paging-pp {
            color: white;
            background-color: #5a5c69;
            border-color: #5a5c69;
        }

        #paging-np {
            color: #5a5c69;
            background-color: white;
            border-color: #5a5c69;
        }

        .container {
            padding-left: 30px;
        }

        .typeb {
            font-size: 15px;
        }
    </style>
</head>
<body>
<div class="whole-list">
    <div class="possible-list">
        강좌 목록
    </div>
    <!-- 검색창 -->
    <div class="search-box">
        <form action="lecturelist">
            <div class="input-group"> <!-- 강좌명으로 검색 -->
                <input type="text" name="searchword" class="form-control" style="width: 100px;">
                <button type="submit" class="btn btn-sm btn-outline-secondary">강좌명 검색</button>
            </div>
        </form>
    </div>
    <br>
    <!-- 리스트 출력 창 -->
    <div class="lecture-count">
        총 강좌 수 : ${totalCount}
    </div>
    <br>
    <div class="container">
        <div class="row row-cols-1 row-cols-md-2 row-cols-xl-4">
            <c:if test="${totalCount>0}">
                <c:forEach var="dto" items="${list}">
                    <c:if test="${dto.lectypea=='국어'}">
                        <div class="col">
                            <div class="card radius-10 border-start border-0 border-3 border-info">
                                <div class="card-body present-container"
                                     onclick="location.href='${root}/mini/lectureDetail?lecnum=${dto.lecnum}'">
                                    <div class="d-flex align-items-center">
                                        <div>
                                            <p class="mb-0 text-dark">[${dto.lectypea}]</p>
                                            <p class="mb-0 text-secondary typeb">(${dto.lectypeb})</p>
                                            <p class="my-1 text-info">${dto.lecname}</p>
                                            <p class="mb-0 font-13">${dto.teaname}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:if>
                    <c:if test="${dto.lectypea=='수학'}">
                        <div class="col">
                            <div class="card radius-10 border-start border-0 border-3 border-primary">
                                <div class="card-body present-container"
                                     onclick="location.href='${root}/mini/lectureDetail?lecnum=${dto.lecnum}'">
                                    <div class="d-flex align-items-center">
                                        <div>
                                            <p class="mb-0 text-dark">[${dto.lectypea}]</p>
                                            <p class="mb-0 text-secondary typeb">(${dto.lectypeb})</p>
                                            <p class="my-1 text-primary">${dto.lecname}</p>
                                            <p class="mb-0 font-13">${dto.teaname}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:if>
                    <c:if test="${dto.lectypea=='영어'}">
                        <div class="col">
                            <div class="card radius-10 border-start border-0 border-3 border-success">
                                <div class="card-body present-container"
                                     onclick="location.href='${root}/mini/lectureDetail?lecnum=${dto.lecnum}'">
                                    <div class="d-flex align-items-center">
                                        <div>
                                            <p class="mb-0 text-dark">[${dto.lectypea}]</p>
                                            <p class="mb-0 text-secondary typeb">(${dto.lectypeb})</p>
                                            <p class="my-1 text-success">${dto.lecname}</p>
                                            <p class="mb-0 font-13">${dto.teaname}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:if>
                    <c:if test="${dto.lectypea=='사회탐구'}">
                        <div class="col">
                            <div class="card radius-10 border-start border-0 border-3 border-warning">
                                <div class="card-body present-container"
                                     onclick="location.href='${root}/mini/lectureDetail?lecnum=${dto.lecnum}'">
                                    <div class="d-flex align-items-center">
                                        <div>
                                            <p class="mb-0 text-dark">[${dto.lectypea}]</p>
                                            <p class="mb-0 text-secondary typeb">(${dto.lectypeb})</p>
                                            <p class="my-1 text-warning">${dto.lecname}</p>
                                            <p class="mb-0 font-13">${dto.teaname}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:if>
                    <c:if test="${dto.lectypea=='과학탐구'}">
                        <div class="col">
                            <div class="card radius-10 border-start border-0 border-3 border-danger">
                                <div class="card-body present-container"
                                     onclick="location.href='${root}/mini/lectureDetail?lecnum=${dto.lecnum}'">
                                    <div class="d-flex align-items-center">
                                        <div>
                                            <p class="mb-0 text-dark">[${dto.lectypea}]</p>
                                            <p class="mb-0 text-secondary typeb">(${dto.lectypeb})</p>
                                            <p class="my-1 text-danger">${dto.lecname}</p>
                                            <p class="mb-0 font-13">${dto.teaname}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:if>
                    <c:if test="${dto.lectypea=='제2외국어'}">
                        <div class="col">
                            <div class="card radius-10 border-start border-0 border-3 border-secondary">
                                <div class="card-body present-container"
                                     onclick="location.href='${root}/mini/lectureDetail?lecnum=${dto.lecnum}'">
                                    <div class="d-flex align-items-center">
                                        <div>
                                            <p class="mb-0 text-dark">[${dto.lectypea}]</p>
                                            <p class="mb-0 text-secondary typeb">(${dto.lectypeb})</p>
                                            <p class="my-1 text-success">${dto.lecname}</p>
                                            <p class="mb-0 font-13">${dto.teaname}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:if>
                </c:forEach>
            </c:if>
        </div>
    </div>
    <br>
    <div class="insert-button"> <!-- 강좌 등록 버튼 -->
        <button type="button" class="btn btn-sm btn-outline-secondary" onclick="location.href='/mini/addlectureform'">강좌
            등록
        </button>
    </div>
    <br>
    <!-- 페이징 -->
    <div class="paging">
        <ul class="pagination">
            <c:if test="${startPage>1}">
                <li class="page-item"><a href="lecturelist?currentPage=${startPage-1}" class="page-link">이전</a></li>
            </c:if>

            <!-- 페이지 번호 -->
            <c:forEach var="pp" begin="${startPage}" end="${endPage}">
                <c:if test="${pp==currentPage}">
                    <li class="page-item active"><a href="lecturelist?currentPage=${pp}" class="page-link"
                                                    id="paging-pp">${pp}</a></li>
                </c:if>
                <c:if test="${pp!=currentPage}">
                    <li class="page-item"><a href="lecturelist?currentPage=${pp}" class="page-link"
                                             id="paging-np">${pp}</a></li>
                </c:if>
            </c:forEach>

            <c:if test="${endPage<totalPage}">
                <li class="page-item"><a href="lecturelist?currentPage=${endPage+1}" class="page-link">다음</a></li>
            </c:if>
        </ul>
    </div>
</div>
</body>
</html>