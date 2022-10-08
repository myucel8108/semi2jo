<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
</head>
<body>
<c:set var="root" value="<%=request.getContextPath() %>"></c:set>
  <span class="position-absolute trigger"><!-- hidden trigger to apply 'stuck' styles --></span>
    <nav class="navbar navbar-expand-sm sticky-top navbar-dark">
        <div class="container">
            <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbar1">
            <span class="navbar-toggler-icon"></span>
        </button>
            <div class="collapse navbar-collapse" id="navbar1">
                <ul class="navbar-nav">
                    <li class="nav-item active">
                        <a class="nav-link" href="/mini/">Home</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="about.html">About us</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="${root}/lecture/lectureList">lecture</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="${root}/board/boardFree">community</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="${root}/qna/qnaList">Q & A</a>
                    </li>
                    <li class="nav-item">

			        <!--container-->
                    </li>
                </ul>
            </div>
        </div>
        <!--container end-->

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
    </nav>
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
     })
 </script>
</body>
</html>
