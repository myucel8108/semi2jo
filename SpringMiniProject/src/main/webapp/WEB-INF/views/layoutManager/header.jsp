<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link
            href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap"
            rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
    <style type="text/css">
        #logoutbox{
            justify-content: right;
            padding-right: 123px;
        }
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
    </style>
    <c:set var="root" value="<%=request.getContextPath() %>"></c:set>

    <div id="content-wrapper" class="d-flex flex-column">
        <div id="content">
    <!-- TopBar -->
    <nav class="navbar navbar-expand navbar-light bg-navbar topbar mb-4 static-top" id="logoutbox">
        <button type="button" id="btn-logout-manager" class="bt1" style=" margin-right: 0px; margin-left: 5px; margin-top: 10px;"><b>LOGOUT</b></button><%--        <button id="sidebarToggleTop" class="btn btn-link rounded-circle mr-3">--%>
<%--            <i class="fa fa-bars"></i>--%>
<%--        </button>--%>
<%--        <ul class="navbar-nav ml-auto">--%>
<%--            <li class="nav-item dropdown no-arrow">--%>
<%--                <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button" data-toggle="dropdown"--%>
<%--                   aria-haspopup="true" aria-expanded="false">--%>
<%--                    <i class="fas fa-search fa-fw"></i>--%>
<%--                </a>--%>
<%--                <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"--%>
<%--                     aria-labelledby="searchDropdown">--%>
<%--                    <form class="navbar-search">--%>
<%--                        <div class="input-group">--%>
<%--                            <input type="text" class="form-control bg-light border-1 small" placeholder="What do you want to look for?"--%>
<%--                                   aria-label="Search" aria-describedby="basic-addon2" style="border-color: #3f51b5;">--%>
<%--                            <div class="input-group-append">--%>
<%--                                <button class="btn btn-primary" type="button">--%>
<%--                                    <i class="fas fa-search fa-sm"></i>--%>
<%--                                </button>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </form>--%>
<%--                </div>--%>
<%--            </li>--%>
<%--            <div class="topbar-divider d-none d-sm-block"></div>--%>
<%--            <li class="nav-item dropdown no-arrow">--%>
<%--                <span class="nav-link dropdown-toggle" id="btn-logout-manager" role="button" data-toggle="dropdown"--%>
<%--                   aria-haspopup="true" aria-expanded="false">--%>
<%--                    <img class="img-profile rounded-circle" src="img/boy.png" style="max-width: 60px">--%>
<%--                    로그아웃--%>
<%--                    <span class="ml-2 d-none d-lg-inline text-white small">Maman Ketoprak</span>--%>
<%--                </span>--%>
<%--                <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">--%>
<%--                    <a class="dropdown-item" href="#">--%>
<%--                        <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>--%>
<%--                        Profile--%>
<%--                    </a>--%>
<%--                    <a class="dropdown-item" href="#">--%>
<%--                        <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>--%>
<%--                        Settings--%>
<%--                    </a>--%>
<%--                    <a class="dropdown-item" href="#">--%>
<%--                        <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>--%>
<%--                        Activity Log--%>
<%--                    </a>--%>
<%--                    <div class="dropdown-divider"></div>--%>
<%--                    <a class="dropdown-item" href="javascript:void(0);" data-toggle="modal" data-target="#logoutModal">--%>
<%--                        <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>--%>
<%--                        Logout--%>
<%--                    </a>--%>
<%--                </div>--%>
<%--            </li>--%>
<%--        </ul>--%>
    </nav>
    <!-- Topbar -->

    <script>
        $("#btn-logout-manager").click(function () {
            $.ajax({
                type:"get",
                url:"${root}/logout",
                dataType:"text",
                success:function(res){
                    location.href='${root}/';
                },
            });
        })
    </script>
</head>
</html>