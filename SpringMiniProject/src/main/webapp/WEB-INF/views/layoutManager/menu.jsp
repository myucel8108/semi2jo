<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
    <style>
        div>div{
            width: 100%;
        }
        .nav-item{
            margin-top: 100px;
            margin-left: 40px;
        }
    </style>
    <script>
        $(function(){
            $(".agag").hover(function(){
                $(this).css("color","orange");
            },function(){
                $(this).css("color","black");
            });
        });
    </script>
</head>
<c:set var="root" value="<%=request.getContextPath()%>"/>

<body id="page-top">
<div id="wrapper">
<!-- Sidebar -->
<ul class="navbar-nav sidebar sidebar-light accordion" id="accordionSidebar" style="background-color: white;">
    <a class="sidebar-brand d-flex align-items-center justify-content-center" href="${root}/">
<%--        <div class="sidebar-brand-icon">--%>
<%--            <img src="img/logo/logo2.png">--%>
<%--        </div>--%>
        <div class="sidebar-brand-text mx-3" style="    background: linear-gradient(to right, #25aae1, #4481eb, #04befe, #3f86ed);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    position: absolute;
    font-size: 40px;
">
<%--            TeachMe--%>
            <img src="${root}/image/sib.png" width="200px;" style="margin-top: 10px;">
        </div>
    </a>
    <li class="nav-item active">
        <a class="nav-link" href='${root}/manager/main'>
<%--            <i class="fas fa-fw fa-tachometer-alt"></i>--%>
            <span>매출 관리</span></a>
    </li>
    <li class="nav-item active">
        <a class="nav-link" href='${root}/userlist'>
<%--            <i class="fas fa-fw fa-tachometer-alt"></i>--%>
            <span>회원 관리</span></a>
    </li>
    <li class="nav-item active">
        <a class="nav-link" href='${root}/lecturelist'>
<%--            <i class="fas fa-fw fa-tachometer-alt"></i>--%>
            <span>강좌 관리</span></a>
    </li>
    <li class="nav-item active">
        <a class="nav-link" href='${root}/manager/boardControl'>
<%--            <i class="fas fa-fw fa-tachometer-alt"></i>--%>
            <span>커뮤니티 관리</span></a>
    </li>
<%--    <hr class="sidebar-divider">--%>
<%--    <div class="sidebar-heading">--%>
<%--        Features--%>
<%--    </div>--%>
<%--&lt;%&ndash;    User 메뉴&ndash;%&gt;--%>
<%--    <li class="nav-item">--%>
<%--        <a class="nav-link collapsed" href="${root}/userlist" data-toggle="collapse" data-target="#collapseBootstrap"--%>
<%--           aria-expanded="true" aria-controls="collapseBootstrap">--%>
<%--            <i class="far fa-fw fa-window-maximize"></i>--%>
<%--            <span>회원관리</span>--%>
<%--        </a>--%>
<%--    </li>--%>
<%--&lt;%&ndash;    Lecture 메뉴&ndash;%&gt;--%>
<%--    <li class="nav-item" onclick="location.href='${root}/lecturelist'">--%>
<%--        <a class="nav-link collapsed"  data-toggle="collapse" data-target="#collapseForm" aria-expanded="true"--%>
<%--           aria-controls="collapseForm" >--%>
<%--            <i class="fab fa-fw fa-wpforms"></i>--%>
<%--            <span>강좌</span>--%>
<%--        </a>--%>
<%--    </li>--%>
<%--    <li class="nav-item" onclick="location.href='${root}/manager/boardControl'">--%>
<%--        <a class="nav-link collapsed" data-toggle="collapse" data-target="#collapseTable" aria-expanded="true"--%>
<%--           aria-controls="collapseTable">--%>
<%--            <i class="fas fa-fw fa-table"></i>--%>
<%--            <span>커뮤니티 관리</span>--%>
<%--        </a>--%>
<%--    </li>--%>
<%--    <li class="nav-item">--%>
<%--        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTable" aria-expanded="true"--%>
<%--           aria-controls="collapseTable">--%>
<%--            <i class="fas fa-fw fa-table"></i>--%>
<%--            <span>QnA 관리</span>--%>
<%--        </a>--%>
<%--    </li>--%>
<%--    <hr class="sidebar-divider">--%>
<%--    <div class="version" id="version-ruangadmin"></div>--%>
</ul>
<!-- Sidebar -->

</body>
</html>

