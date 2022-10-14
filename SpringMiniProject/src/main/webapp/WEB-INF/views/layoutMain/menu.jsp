<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
</head>
<style>

    #menucolor:hover{
        color:#3f86ed;
    }
    #menucolor2:hover{
        color:#3f86ed;
    }
    #menucolor3:hover{
        color:#3f86ed;
    }
    #menucolor4:hover{
        color:#3f86ed;
    }
</style>
<body>
<c:set var="root" value="<%=request.getContextPath() %>"></c:set>
  <span class="position-absolute trigger"><!-- hidden trigger to apply 'stuck' styles --></span>
    <nav class="navbar navbar-expand-sm sticky-top navbar-dark" style="border: 0">
        <div class="container">
            <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbar1">
            <span class="navbar-toggler-icon"></span>
        </button>
            <div class="collapse navbar-collapse" id="navbar1" style="margin: 0 auto; display: flex;">
                <ul class="navbar-nav" style="">
                    <li class="nav-item" style="border: 0"></li>
                    <li class="nav-item active" style="border: 0">
                        <a class="nav-link" href="/mini/" style="margin-left: 20px; margin-right: 20px;" id="menucolor">Home</a>
                    </li>
                    <li class="nav-item active" style="border: 0">
                        <a class="nav-link" href="${root}/lecture/lectureList" style="margin-left: 20px; margin-right: 20px;" id="menucolor2">lecture</a>
                    </li>
                    <li class="nav-item active" style="border: 0">
                        <a class="nav-link" href="${root}/board/boardFree" style="margin-left: 20px; margin-right: 20px;" id="menucolor3">community</a>
                    </li>
                    <li class="nav-item active" style="border: 0">
                        <a class="nav-link" href="${root}/qna/qnaList" style="margin-left: 20px; margin-right: 20px;" id="menucolor4">Q & A</a>
                    </li>
                    <li class="nav-item"></li>
                </ul>
            </div>
        </div>
    </nav>

        <!--container end-->

<%--        <!-- login button -->--%>
<%--       <c:if test="${sessionScope.loginok==null }">--%>
<%--			<button type="button" id="btnloginMain" style=" margin-right: 110px;">로그인</button>--%>
<%--       </c:if>--%>
<%--        <c:if test="${sessionScope.loginok!=null && sessionScope.usertype=='user'}">--%>
<%--             <b>${sessionScope.loginname}님</b>&nbsp;&nbsp;--%>
<%--             <a href="${root}/student/timeTable" style="text-decoration: none; color: black;">마이페이지</a>&nbsp;--%>
<%--            <button type="button" id="btnlogoutMain" style=" margin-right: 110px;" >로그아웃</button>--%>
<%--        </c:if>--%>
<%--        <c:if test="${sessionScope.loginok!=null && sessionScope.usertype=='manager'}">--%>
<%--            <b>${sessionScope.loginname}님</b>	            &nbsp;&nbsp;--%>
<%--            <a href="${root}/manager/main">관리자페이지</a>--%>
<%--            <button type="button" id="btnlogoutMain" style=" margin-right: 110px;" >로그아웃</button>--%>
<%--        </c:if>--%>
<%--    </nav>--%>
<%--     <script>--%>
<%--     $("#btnloginMain").click(function () {--%>
<%--         location.href="${root}/loginF";--%>
<%--     });--%>

<%--     $("#btnlogoutMain").click(function () {--%>
<%--         $.ajax({--%>
<%--             type:"get",--%>
<%--             url:"${root}/logout",--%>
<%--             dataType:"text",--%>
<%--             success:function(res){--%>
<%--                 location.reload();--%>
<%--             },--%>
<%--         });--%>
<%--     });--%>
<%-- </script>--%>
</body>
</html>
