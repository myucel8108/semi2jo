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
    <link rel="stylesheet" type="text/css" href="${root}/css/menu.css">

    <script type="text/javascript">
        $(function () {
            $("div.category").mouseover(function(){
                $("div.dropmenu").stop().fadeIn(150);
            });

            $("div.category").mouseleave(function(){
                $("div.dropmenu").stop().fadeOut(150);
            });

            $("div.dropmenu").mouseover(function(){
                $("div.category").addClass("over_bg");
                $("img.icon_category").addClass("over_img");
                $("font.over_impact").addClass("over_text");
                $("div.dropmenu").stop().fadeIn(150);
            });

            $("div.dropmenu").mouseleave(function(){
                $("div.category").removeClass("over_bg");
                $("img.icon_category").removeClass("over_img");
                $("font.over_impact").removeClass("over_text");
                $("div.dropmenu").stop().fadeOut(150);
            });
        });
    </script>
</head>
<body>

<div class="menuarea">
    <div class="category">
        <img alt="" src="${root }/image/menu/menubar.png" class="icon_category">
        <span class="menu_category">
        <font class="over_impact">전체메뉴</font>
      </span>
    </div>
    <div class="menuitem">
      <span class="menu">
      <a href="#" style="text-decoration: none;">강의</a>
      </span>
    </div>
    <div class="menuitem">
      <span class="menu">
      <a href="#" style="text-decoration: none;">커뮤니티</a>
      </span>
    </div>
    <div class="menuitem">
      <span class="menu">
      <a href="#" style="text-decoration: none;">강사소개</a>
      </span>
    </div>
    <div class="menuitem">
      <span class="menu">
      <a href="#" style="text-decoration: none;">Q&A</a>
      </span>
    </div>
    <c:if test="${sessionScope.loginOK==null }">
        <div class="menuitem_member" style="width:700px; text-align:right; padding: 18px 1px 10px 0;" >
      <span class="membermenu_color"   style="border-radius: 20px 0 0 20px;" onclick="location.href='#'">
      로그인
      </span>
            <span class="membermenu_color" style="margin-left:3px; border-radius: 0 20px 20px 0;" onclick="location.href='#'">
      회원가입
      </span>
        </div>
    </c:if>
    <c:if test="${sessionScope.loginOK!=null }">

        <div class="menuitem_member" style="width:700px; text-align:right; padding: 18px 5px 10px 0px;">

      <span class="membermenu_color" style="border-radius: 20px 0 0 20px;">
      <b>${sessionScope.userNickname }</b>님
      </span>
            <span class="membermenu_color" style="margin-left:3px; border-radius: 0 20px 20px 0;" onclick="location.href='#'">
      로그아웃
      </span>
        </div>
    </c:if>

</div>
<div class="dropmenu" style="z-index: 9999;">
    <ul class="dropmenu_ul">
        <li><a class="dm_main" href="#">강의</a>
            <ul>
                <li><a href="#">강의 신청</a>
                <li><a href="#">강의 추천</a>
                <li><a href="#">나의 강의</a>
            </ul>
        </li>
        <li><a class="dm_main" href="#">커뮤니티</a>
            <ul>
                <li><a href="#">자유게시판</a>
                <li><a href="#">질문게시판</a>
            </ul>
        </li>
        <li><a class="dm_main" href="#">강사소개</a></li>
        <li><a class="dm_main" href="#">QnA</a></li>

    </ul>
</div>
</body>
</html>