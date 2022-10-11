<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>
<c:set var="root" value="<%=request.getContextPath() %>"></c:set>
<header class="header bg">
    <div class="container text-white">
        <div class="row">
            <div class="col-sm-4 align-self-center text-left">
                <h6>errjava</h6>
            </div>
            <div class="col-sm-4 col-12 align-self-center box-1 text-center">
                <a class="navbar-brand" href="/mini/"><b style="color: #191919; font-size: 40px" class="teachMeLogo">
                    TeachMe
                </b></a>
            </div>

        </div>
        <!--/row-->
    </div>
    <div style="float: right;">
    <!-- login button -->
    <c:if test="${sessionScope.loginok==null }">
    <button type="button" id="btnloginMain" style=" margin-right: 110px;">로그인</button>
    </c:if>
    <c:if test="${sessionScope.loginok!=null && sessionScope.usertype=='user'}">
    <b>${sessionScope.loginname}님</b>&nbsp;&nbsp;
    <a href="${root}/student/timeTable" style="text-decoration: none; color: black;">마이페이지</a>&nbsp;
    <button type="button" id="btnlogoutMain" style=" margin-right: 110px;" >로그아웃</button>
    </c:if>
    <c:if test="${sessionScope.loginok!=null && sessionScope.usertype=='manager'}">
    <b>${sessionScope.loginname}님</b>	            &nbsp;&nbsp;
    <a href="${root}/manager/main">관리자페이지</a>
    <button type="button" id="btnlogoutMain" style=" margin-right: 110px;" >로그아웃</button>
    </c:if>
    </div>
    <script>
        $("#btnloginMain").click(function () {
            location.href="${root}/loginF";
        });

        $("#btnlogoutMain").click(function () {
            $.ajax({
                type:"get",
                url:"${root}/logout",
                dataType:"text",
                success:function(res){
                    location.reload();
                },
            });
        });
    </script>
</header>
</body>
</html>