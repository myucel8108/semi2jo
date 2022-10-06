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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
    <style>
        @font-face {
            font-family: 'MICEGothic Bold';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEGothic Bold.woff2') format('woff2');
            font-weight: 700;
            font-style: normal;
        }

        * {
            font-family: 'MICEGothic Bold';
        }

        div>div{
            width: 100%;
        }

        .atag{
            text-decoration: none;
            color: gray;
        }

        .menu {
            vertical-align: middle;
            text-align:center;
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
<body>
<c:set var="root" value="<%=request.getContextPath()%>"/> <!— 자기 주소 얻어오기 —>
<%--<div class="menu">--%>
<%--    <div><a class="atag">학생 관리</a></div>--%>
<%--    <div><a class="atag" href="${root}/lecturelist">강의 관리</a></div>--%>
<%--    <div><a class="atag">게시판 관리</a></div>--%>
<%--    <div><a class="atag">Q&A 관리</a></div>--%>
<%--</div>--%>

<body id="page-top">
<div id="wrapper">
<!-- Sidebar -->
<ul class="navbar-nav sidebar sidebar-light accordion" id="accordionSidebar">
    <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
        <div class="sidebar-brand-icon">
            <img src="img/logo/logo2.png">
        </div>
        <div class="sidebar-brand-text mx-3">로고 위치</div>
    </a>
    <hr class="sidebar-divider my-0">
    <li class="nav-item active">
        <a class="nav-link" href="index.html">
            <i class="fas fa-fw fa-tachometer-alt"></i>
            <span>관리자 페이지</span></a>
    </li>
    <hr class="sidebar-divider">
    <div class="sidebar-heading">
        Features
    </div>
<%--    User 메뉴--%>
    <li class="nav-item">
        <a class="nav-link collapsed" href="${root}/userlist" data-toggle="collapse" data-target="#collapseBootstrap"
           aria-expanded="true" aria-controls="collapseBootstrap">
            <i class="far fa-fw fa-window-maximize"></i>
            <span>회원관리</span>
        </a>
        <div id="collapseBootstrap" class="collapse" aria-labelledby="headingBootstrap" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
<%--                <h6 class="collapse-header">User</h6>--%>
                <a class="collapse-item" href="">회원관리</a>
            </div>
        </div>
    </li>
<%--    Lecture 메뉴--%>
    <li class="nav-item">
        <a class="nav-link collapsed" href="${root}/lecturelist" data-toggle="collapse" data-target="#collapseForm" aria-expanded="true"
           aria-controls="collapseForm">
            <i class="fab fa-fw fa-wpforms"></i>
            <span>강좌</span>
        </a>
        <div id="collapseForm" class="collapse" aria-labelledby="headingForm" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
<%--                <h6 class="collapse-header">Forms</h6>--%>
                <a class="collapse-item" href="${root}/lecturelist">강의 분류보기</a>
            </div>
        </div>
    </li>
    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTable" aria-expanded="true"
           aria-controls="collapseTable">
            <i class="fas fa-fw fa-table"></i>
            <span>커뮤니티 관리</span>
        </a>
        <div id="collapseTable" class="collapse" aria-labelledby="headingTable" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
<%--                <h6 class="collapse-header">Tables</h6>--%>
                <a class="collapse-item" href="">커뮤니티 글 목록</a>
                <a class="collapse-item" href="">신고접수 리스트</a>
            </div>
        </div>
    </li>
    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTable" aria-expanded="true"
           aria-controls="collapseTable">
            <i class="fas fa-fw fa-table"></i>
            <span>QnA 관리</span>
        </a>
        <div id="" class="collapse" aria-labelledby="headingTable" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <%--                <h6 class="collapse-header">Tables</h6>--%>
                <a class="collapse-item" href="">QnA 신규글</a>
                <a class="collapse-item" href="">답변 완료</a>
            </div>
        </div>
    </li>
<%--    <li class="nav-item">--%>
<%--        <a class="nav-link" href="ui-colors.html">--%>
<%--            <i class="fas fa-fw fa-palette"></i>--%>
<%--            <span>UI Colors</span>--%>
<%--        </a>--%>
<%--    </li>--%>
<%--    <hr class="sidebar-divider">--%>
<%--    <div class="sidebar-heading">--%>
<%--        Examples--%>
<%--    </div>--%>
<%--    <li class="nav-item">--%>
<%--        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePage" aria-expanded="true"--%>
<%--           aria-controls="collapsePage">--%>
<%--            <i class="fas fa-fw fa-columns"></i>--%>
<%--            <span>Pages</span>--%>
<%--        </a>--%>
<%--        <div id="collapsePage" class="collapse" aria-labelledby="headingPage" data-parent="#accordionSidebar">--%>
<%--            <div class="bg-white py-2 collapse-inner rounded">--%>
<%--                <h6 class="collapse-header">Example Pages</h6>--%>
<%--                <a class="collapse-item" href="login.html">Login</a>--%>
<%--                <a class="collapse-item" href="register.html">Register</a>--%>
<%--                <a class="collapse-item" href="404.html">404 Page</a>--%>
<%--                <a class="collapse-item" href="blank.html">Blank Page</a>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </li>--%>
<%--    <li class="nav-item">--%>
<%--        <a class="nav-link" href="charts.html">--%>
<%--            <i class="fas fa-fw fa-chart-area"></i>--%>
<%--            <span>Charts</span>--%>
<%--        </a>--%>
<%--    </li>--%>
    <hr class="sidebar-divider">
    <div class="version" id="version-ruangadmin"></div>
</ul>
<!-- Sidebar -->
</body>
</html>

