<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
<style>


    .bt1{
        width: 100px;
        height: 35px;
        /*font-size: 16px;*/
        /*font-weight: 600;*/
        color: #fff;
        cursor: pointer;
        /*margin: 20px;*/
        /*height: 55px;*/
        text-align:center;
        border: none;
        background-size: 300% 100%;
        border-radius: 50px;

    }


    .bt1 {
        background-image: linear-gradient(to right, #25aae1, #4481eb, #04befe, #3f86ed);
    }


    #logos{
        background: linear-gradient(to right, #25aae1, #4481eb, #04befe, #3f86ed);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        width: 200px;
    }




</style>
</head>
<body>
<c:set var="root" value="<%=request.getContextPath() %>"></c:set>
<header class="header bg">
    <div class="container text-white">
        <div class="row">
            <div class="col-sm-4 align-self-center text-left">
                <h1 style="font-family: abster; text-decoration: none;"><a href="${root}" style="text-decoration: none; color: #3f86ed;" id="logos">TeachMe</a></h1>
            </div>
            <div class="col-sm-4 col-12 align-self-center box-1 text-center">
                <a class="navbar-brand" href="/mini/"><b style="color: #191919; font-size: 40px" class="teachMeLogo">
                </b></a>
            </div>
        </div>
        <!--/row-->
    </div>
    <div style="float: right;">
    <!-- login button -->
    <c:if test="${sessionScope.loginok==null }">
    <button type="button" id="btnloginMain" class="bt1" style=" margin-right: 110px;"><b>JOIN</b></button>
    </c:if>
    <c:if test="${sessionScope.loginok!=null && sessionScope.usertype=='user'}">
    <b>${sessionScope.loginname}님</b>&nbsp;&nbsp;
    <a href="${root}/student/timeTable" class="bt1" >MYPAGE</a>&nbsp;
    <button type="button" id="btnlogoutMain" class="bt1" style=" margin-right: 110px; margin-left: 5px;"><b>LOGOUT</b></button>
    </c:if>
    <c:if test="${sessionScope.loginok!=null && sessionScope.usertype=='manager'}">
    <b>${sessionScope.loginname}님</b>	            &nbsp;&nbsp;
    <a href="${root}/manager/main">관리자페이지</a>
    <button type="button" id="btnlogoutMain" class="bt1" style=" margin-right: 110px;" >LOGOUT</button>
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