<%--<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>--%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>--%>
<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <title>Insert title here</title>--%>
<%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">--%>
<%--    <link--%>
<%--            href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap"--%>
<%--            rel="stylesheet">--%>
<%--    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>--%>
<%--    <style type="text/css">--%>
<%--        *{--%>
<%--            font-family: 'Jua';--%>
<%--        }--%>
<%--        .header {--%>
<%--            display: flex;--%>
<%--            align-items: center;--%>
<%--            justify-content: center;--%>
<%--        }--%>

<%--        .header div {--%>
<%--            flex: 1;--%>
<%--        }--%>

<%--        .logo {--%>
<%--            flex: 1;--%>
<%--            color: white;--%>
<%--            height: 150px;--%>
<%--            margin-left: 60px;--%>
<%--        }--%>

<%--        .header-mid {--%>
<%--            flex: 5;--%>
<%--        }--%>

<%--        .header-right {--%>
<%--            flex: 1;--%>
<%--            font-size: 20px;--%>
<%--            color: white;--%>
<%--        }--%>
<%--    </style>--%>
<%--</head>--%>
<%--<body>--%>
<%--<c:set var="root" value="<%=request.getContextPath() %>"></c:set>--%>
<%--<div class="header">--%>
<%--    <div class="logo">--%>
<%--        <h1 id="main-text">학원이름</h1>--%>
<%--    </div>--%>
<%--    <div class="header-mid"></div>--%>
<%--    <div class="header-right">--%>
<%--            <span>수능 D-Day</span>--%>
<%--            <span>username님 화이팅</span>--%>
<%--        <c:if test="${sessionScope.loginok==null }">--%>
<%--            <button type="button" id="btnloginMain">로그인</button>--%>
<%--        </c:if>--%>

<%--        <c:if test="${sessionScope.loginok!=null }">--%>
<%--            <b>${sessionScope.loginname}님</b>--%>
<%--            &nbsp;&nbsp;--%>
<%--            <button type="button" id="btnlogoutMain" >로그아웃</button>--%>
<%--        </c:if>--%>
<%--    </div>--%>
<%--</div>--%>
<%--<button class="login100-form-btn" class="btnCreateAccount" onclick="location.href='insertAccountF'">--%>
<%--    Create Account--%>
<%--</button>--%>
<%--<script>--%>
<%--    $("#btnloginMain").click(function () {--%>
<%--        location.href="${root}/loginF";--%>
<%--    });--%>

<%--    $("#btnlogoutMain").click(function () {--%>
<%--        $.ajax({--%>
<%--            type:"get",--%>
<%--            url:"logout",--%>
<%--            dataType:"text",--%>
<%--            success:function(res){--%>
<%--                location.reload();--%>
<%--            },--%>
<%--        });--%>
<%--    })--%>
<%--</script>--%>
<%--</body>--%>
<%--</html>--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Yeon+Sung&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    <c:set var="root" value="<%=request.getContextPath() %>"/>
    <link rel="stylesheet" type="text/css" href="${root }/css/header.css">
    <link rel="stylesheet" type="text/css" href="${root }/css/TeachMeStyle.css">

    <script type="text/javascript">
        $(function () {
            $('.icon_myinfo').hover(function(){
                $(this).attr("src","${root }/element/icon_myinfo_hover.png");
            }, function() {
                $(this).attr("src","${root }/element/icon_myinfo.png");
            });
            $('.icon_myactivity').hover(function(){
                $(this).attr("src","${root }/element/icon_myactivity_hover.png");
            }, function() {
                $(this).attr("src","${root }/element/icon_myactivity.png");
            });
            $('.icon_myscrap').hover(function(){
                $(this).attr("src","${root }/element/icon_myscrap_hover.png");
            }, function() {
                $(this).attr("src","${root }/element/icon_myscrap.png");
            });
        });

    </script>

</head>
<body>
<div class="headerarea">

    <%--헤더 좌측 로고--%>
    <div class="logobox">
        <a href="${root}" style="color: #ff4b4e;" class="teachMeLogo">
           TeachMe
        </a>
    </div>

    <%--헤더 우측 로그인/회원가입--%>
    <c:if test="${sessionScope.loginok==null }">
        <div class="menuitem_member" style="width:700px; text-align:right; padding: 18px 1px 10px 0;">
          <span class="membermenu_color" style="border-radius: 20px 0 0 20px;" onclick="location.href='#'">
            로그인
          </span>
          <span class="membermenu_color" style="margin-left:3px; border-radius: 0 20px 20px 0;"
                onclick="location.href='#'">
            회원가입
          </span>
        </div>
    </c:if>
    <c:if test="${sessionScope.loginok!=null }">
        <div class="menuitem_member" style="width:700px; text-align:right; padding: 18px 5px 10px 0px;">
          <span class="membermenu_color" style="border-radius: 20px 0 0 20px;">
            <b>${sessionScope.loginname}</b>님
          </span>
            <span class="membermenu_color" style="margin-left:3px; border-radius: 0 20px 20px 0;"
                  onclick="location.href='#'">
          로그아웃
          </span>
        </div>
    </c:if>

    <%--헤더 우측 아이콘--%>
<%--<c:if test="${sessionScope.loginok!=null }">
        <img alt="" src="${root }/element/icon_myinfo.png" class="icon_myinfo" onclick="location.href='/activity/mypage'">
        <img alt="" src="${root }/element/icon_myactivity.png" class="icon_myactivity" onclick="location.href='/activity'">
        <img alt="" src="${root }/element/icon_myscrap.png" class="icon_myscrap" onclick="location.href='/activity/myscrap'">
    </c:if>--%>
    <hr style="margin: 0;">
</div>
</body>
</html>