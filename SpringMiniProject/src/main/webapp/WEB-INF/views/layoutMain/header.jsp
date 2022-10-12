<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" type="text/css" href="${root}/css/taemin.css">
    <link rel="stylesheet" type="text/css" href="${root}/css/qna.css">
    <link rel="stylesheet" type="text/css" href="${root}/css/taeminfont.css">
    <script src="${pageContext.request.contextPath}/resources/javascript/taemin.js"></script>

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

    .bt1:hover{
        background-image: linear-gradient(to right, white,skyblue,blue,darkblue);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
    }


    #logos{
        background: linear-gradient(to right, #25aae1, #4481eb, #04befe, #3f86ed);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        /*position: absolute;*/
        /*padding-bottom: 50px;*/
        position: absolute;
        margin-left: 200px;
    }


    #rowfor{
        text-align: left;
    }


    #headerfor{
        margin-left: -50px;
        padding-top: 20px;
        margin-bottom: 30px;


    }

    @keyframes slide{

        from{
            left: -200px;
        }

        to{
            left: 200px;
        }

    }

</style>
</head>
<body>
<c:set var="root" value="<%=request.getContextPath() %>"></c:set>
<header id="headerfor">
    <div  id="rowrowfor">
        <div id="rowfor">
                <div>
                <h1 style="font-family: abster; margin: auto; text-decoration: none;" id="h1for"><a href="${root}" style="text-decoration: none; color: #3f86ed;" id="logos" data-aos="fade-right" data-aos-delay="100">TeachMe</a></h1>
            </div>
<%--            <div>--%>
            <div >
                <a href="/mini/"><b style="color: #191919;  font-size: 40px" >
                </b></a>
            </div>
        </div>
        <!--/row-->
    </div>
    <div style="float: right;">
    <!-- login button -->
    <c:if test="${sessionScope.loginok==null }">
    <button type="button" id="btnloginMain" class="bt1" style=" margin-right: 110px; margin-top: 10px;"><b>LOGIN</b></button>
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