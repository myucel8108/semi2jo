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
            font-size: 25px;
            margin-bottom: 40px;
        }

        .profile__avatar {
            margin-bottom: 30px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-xs-12 col-sm-9">
            <!-- 강좌 정보 -->
            <div class="panel panel-default">
                <div class="panel-heading">
                    <p class="panel-title">강좌 정보</p>
                </div>
                <div class="panel-body">
                    <div class="profile__avatar">
                        <c:if test="${lphoto!=null}">
                            <img src="${lphoto}">
                        </c:if>
                        <c:if test="${lphoto==null}">
                            <img src="resources/image/noimage2.png">
                        </c:if>
                    </div>
                    <div class="profile__header">
                        <h4>[${typea}]<small>-${typeb}</small></h4>
                        <p class="text-muted">
                            ${lname}_${tname}
                        </p>
                    </div>
                </div>
            </div>

            <!-- 개설된 강의 목록 출력 -->
            <div class="panel panel-default">
                <div class="panel-heading">
                    <p>개설된 강의</p>
                </div>
                <div class="panel-body">
                    <table class="table profile__table">
                        <tbody>
                        <tr>
                            <th><strong>Location</strong></th>
                            <td>United States</td>
                        </tr>
                        <tr>
                            <th><strong>Company name</strong></th>
                            <td>Simpleqode.com</td>
                        </tr>
                        <tr>
                            <th><strong>Position</strong></th>
                            <td>Front-end developer</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>


        </div>
    </div>
</div>
</div>
</div>
</div>
</body>
</html>
