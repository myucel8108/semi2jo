<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/manager/userList.css">
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
    <style type="text/css">
        td>a{
            text-decoration: none;
        }

        .container{
            height: 85vh;
        }

        ul.pagination{
            justify-content: center;
        }

        .deleteuser{
            cursor: pointer;
        }

        .finduser{
            display: flex;
            justify-content: right;
        }

        .usertitle{
            text-align: center;
        }

        .search-container{
            width: 200px;
        }
    </style>
</head>
<body>
<c:set var="root" value="<%=request.getContextPath()%>"></c:set>
    <!-- 검색창 -->
    <div class="finduser">
        <div class="usertitle">
            회원 목록
            <form action="userlist">
                <div class="search-container">이름으로 회원 검색
                    <div class="input-group search-item2"> <!-- 검색 -->
                        <input type="text" name="searchword" class="form-control" style="width: 100px;">
                        <button type="submit" class="btn btn-primary">검색</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <br>
    <div class="container bootstrap snippets bootdey">
        <div class="row">
            <div class="col-lg-12">
                <div class="main-box no-header clearfix">
                    <div class="main-box-body clearfix">
                        <div class="table-responsive">
                            <table class="table user-list">
                                <thead>
                                <tr>
                                    <th><span>회원</span></th>
                                    <th><span>연락처</span></th>
                                    <th><span>Email</span></th>
                                    <th>관리</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:if test="${totalCount>0}">
                                    <c:forEach var="dto" items="${list}">
                                        <c:if test="${dto.usertype=='user'}">
                                        <tr>
                                            <td>
                                                <c:if test="${dto.userphoto!=null}">
                                                    <img src="upload/${dto.userphoto}" width="50" height="50">
                                                </c:if>
                                                <c:if test="${dto.userphoto==null}">
                                                    <img src="resources/image/noimage2.png">
                                                </c:if>
                                                <a href="${root}/userdetail?usernum=${dto.usernum}" class="user-link">${dto.username}</a>
                                                <span class="user-subhead">${dto.nickname}</span>
                                            </td>
                                            <td>
                                                ${dto.hp}
                                            <td>
                                                ${dto.email}
                                            </td>
                                            <td style="width: 20%;">
                                                <a href="${root}/userdetail?usernum=${dto.usernum}" class="table-link text-warning">
                                                        <span class="fa-stack">
                                                            <i class="fa fa-square fa-stack-2x"></i>
                                                            <i class="fa fa-search-plus fa-stack-1x fa-inverse"></i>
                                                        </span>
                                                </a>
                                                <a href="${root}/updateuserform?usernum=${dto.usernum}" class="table-link text-info">
                                                        <span class="fa-stack">
                                                            <i class="fa fa-square fa-stack-2x"></i>
                                                            <i class="fa fa-pencil fa-stack-1x fa-inverse"></i>
                                                        </span>
                                                </a>
                                                <span class="table-link text-danger deleteuser">
                                                        <span class="fa-stack">
                                                            <i class="fa fa-square fa-stack-2x"></i>
                                                            <i class="fa fa-trash-o fa-stack-1x fa-inverse"></i>
                                                        </span>
                                                        <span class="readusernum" style="display: none">${dto.usernum}</span>
                                                </span>
                                            </td>
                                        </tr>
                                        </c:if>
                                    </c:forEach>
                                </c:if>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br>
    <br>
    <!-- 페이징 -->
    <div class="paging">
        <ul class="pagination">
            <c:if test="${startPage>1}">
                <li class="page-item"><a href="userlist?currentPage=${startPage-1}" class="page-link">이전</a></li>
            </c:if>

            <!-- 페이지 번호 -->
            <c:forEach var="pp" begin="${startPage}" end="${endPage}">
                <c:if test="${pp==currentPage}">
                    <li class="page-item active"><a href="userlist?currentPage=${pp}" class="page-link">${pp}</a></li>
                </c:if>
                <c:if test="${pp!=currentPage}">
                    <li class="page-item"><a href="userlist?currentPage=${pp}" class="page-link">${pp}</a></li>
                </c:if>
            </c:forEach>

            <c:if test="${endPage<totalPage}">
                <li class="page-item"><a href="userlist?currentPage=${endPage+1}" class="page-link">다음</a></li>
            </c:if>
        </ul>
    </div>
</div>
</div>
</div>
</body>
<script>
    $(function () {
        $(".deleteuser").click(function () {
            var cf = confirm("삭제하시겠습니까?");
            var num = $(this).children(".readusernum").text();
            if(cf){
                location.href="${root}/deleteuser?usernum="+num;
            }
        });
    })
</script>
</html>