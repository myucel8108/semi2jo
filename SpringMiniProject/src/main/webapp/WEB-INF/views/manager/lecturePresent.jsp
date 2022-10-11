<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="css/manager/lecturePresent.css">
    <style>
        .panel-title {
            font-size: 35px;
        }

        .panel-heading {
            font-size: 20px;
            margin-bottom: 40px;
        }

        .profile__avatar {
            margin-bottom: 30px;
        }

        .container {
            height: 90vh;
        }

        .button-box{
            height: 400px;
            text-align: end;
            line-height: 40;
        }

        .width-box{
            width: 100%;
        }

    </style>
</head>
<body>
<c:set var="root" value="<%=request.getContextPath()%>"></c:set>
<div class="container">
    <div class="row">
        <div class="col-xs-12 col-sm-9 width-box">
            <!-- 강좌 정보 -->
            <div class="panel panel-default">
                <div class="panel-heading">
                    <p class="panel-title lec-info">강좌 정보</p>
                </div>
                <div class="panel-body">
                    <div class="profile__avatar">
                        <c:if test="${dto.lecphoto!=null}">
                            <img src="upload/${dto.lecphoto}">
                        </c:if>
                        <c:if test="${dto.lecphoto==null}">
                            <img src="resources/image/noimage2.png">
                        </c:if>
                    </div>
                    <div class="profile__header">
                        <h4>[${dto.lectypea}]<small>-${dto.lectypeb}</small></h4>
                        <p class="text-muted">
                            ${dto.lecname}_${dto.teaname}
                        </p>
                    </div>
                </div>
            </div>
            <br>
            <br>

            <!-- 개설된 강의 목록 출력 -->
            <div class="panel panel-default">
                <div class="panel-heading">
                    <p>개설된 강의</p>
                </div>
                <div class="panel-body">
                    <table class="table profile__table">
                        <tbody>
                        <%--                        <c:forEach var="list" items="list">--%>
                        <%--                            <tr class="lecture-present${list.lecnum}">--%>
                        <%--                                <td>United States</td>--%>
                        <%--                            </tr>--%>
                        <%--                            <script>--%>
                        <%--                                //현재 년월과 비교해서 수강 중인 강의만 출력--%>
                        <%--                                var date = new Date();--%>
                        <%--                                var year = date.getFullYear();--%>
                        <%--                                var month = date.getMonth() + 1;--%>
                        <%--                                var presentlecture = "";--%>
                        <%--                                if ("${list.lecyear}" == year && "${list.lecmonth}" == month) {--%>
                        <%--                                    presentlecture += "<th>[${list.lectypea}]-${list.lectypeb} : ${list.lecname}_${list.teaname} (${list.roomnum}호)";--%>
                        <%--                                    presentlecture += "<span class='show-lecday${list.lecnum}'>[요일 : ${list.lecday}]</span>";--%>
                        <%--                                    presentlecture += "${list.lectime}교시</th>";--%>
                        <%--                                }--%>
                        <%--                                $(".lecture-present${list.lecnum}").html(presentlecture);--%>
                        <%--                            </script>--%>
                        <%--                        </c:forEach>--%>
                        </tbody>
                    </table>
                </div>
                <div class="button-box">
                    <button type="button" class="btn btn-outline-primary update-button" onclick="location.href='${root}/updateLectureForm?lecnum=${lecnum}'">수정</button>
                    <button type="button" id="removephoto" class="btn btn-outline-danger delete-button">삭제</button>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    //경고 후 사진 삭제
    $("#removephoto").click(function () {
        var dephoto = confirm("경고: 강좌를 삭제하시겠습니까?");
        if(dephoto){
            location.href="${root}/deleteLecture?lecnum=${lecnum}";
        }
    });
</script>
</body>
</html>
