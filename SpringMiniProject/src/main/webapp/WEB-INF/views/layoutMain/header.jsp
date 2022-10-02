<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link
            href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap"
            rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
    <style type="text/css">
        *{
            font-family: 'Jua';
        }
    </style>
</head>


<body>
<c:set var="root" value="<%=request.getContextPath() %>"></c:set>
 <header class="header bg">
        <div class="container text-white">
            <div class="row">
                <div class="col-sm-4 align-self-center text-left">
                    <h6>Estd 1905</h6>
                </div>
                <div class="col-sm-4 col-12 align-self-center box-1 text-center">
                    <a class="navbar-brand" href="index.html"><img src="../../../resources/image/header-logo.png" alt="logo"></a>
                </div>
                <div class="col-sm-4 align-self-center text-right">
                    <div class="social-icons">
                        <a href="#"><i class="fa fa-facebook-official" aria-hidden="true"></i></a>
                        <a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
                        <a href="#"><i class="fa fa-pinterest" aria-hidden="true"></i></a>
                        <a href="#"><i class="fa fa-youtube" aria-hidden="true"></i></a>
                    </div>
                </div>
            </div>
            <!--/row-->
        </div>
     <c:if test="${sessionScope.loginok==null }">
         <button type="button" id="btnloginMain">로그인</button>
     </c:if>

     <c:if test="${sessionScope.loginok!=null }">
         <b>${sessionScope.loginname}님</b>
         &nbsp;&nbsp;
         <button type="button" id="btnlogoutMain" >로그아웃</button>
         <a href="${root}/student/timeTable">마이페이지</a>
     </c:if>
        <!--container-->
    </header>
 <script>
     $("#btnloginMain").click(function () {
         location.href="${root}/loginF";
     });

     $("#btnlogoutMain").click(function () {
         $.ajax({
             type:"get",
             url:"logout",
             dataType:"text",
             success:function(res){
                 location.reload();
             },
         });
     })
 </script>
</body>
</html>