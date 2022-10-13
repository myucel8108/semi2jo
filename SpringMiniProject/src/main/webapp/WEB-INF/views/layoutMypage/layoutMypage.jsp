<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <style type="text/css">

        div.layout{
            width: 100%;
        }

        /* layout 테스트 환경일 경우 border 1px 지정 */
        /*div.layout div{
            border: 2px dotted gray;
        }*/

        div.layoutbox{
            position: relative;
        }

        div.layout div.header{
            position: relative;
            width: 100%;
            height: 90px;
        }

        div.layout div.menu{
            position: relative;
            width: 100%;
            height: 56px;
            z-index: 10;
        }

        /* main 내 side_menu 영역 */
        div.layout div.side_menu{
            position: relative;
            margin-top: -5px;
            padding: 30px 30px 30px 50px; /* 상단, 우측, 하단, 좌측 */
            width: 200px;
            height: 800px;
            z-index: 1;
            float: left;
            clear: both;
        }

        div.layout div.change{
            position: relative;
            margin-left: 200px;
            margin-bottom: 100px;
            padding: 30px 30px 30px 30px;
            width: 800px;
            height: 800px;
            z-index: 1;
        }

        div.layout div.footer{
            width: auto;
            height: 250px;
        }

    </style>
</head>
<body>

<!-- 사이드 메뉴가 존재하는 challenge layout -->
<div class="layout">
    <div class="layoutbox">
        <div class="header">
            <tiles:insertAttribute name="header"/>
        </div>
        <div class="menu">
            <tiles:insertAttribute name="menu"/>
        </div>
        <div class="side_menu">
            <tiles:insertAttribute name="a_sidemenu"/>
        </div>
        <div class="change">
            <tiles:insertAttribute name="change"/>
        </div>
        <div class="footer">
            <tiles:insertAttribute name="footer"/>
        </div>
    </div>
</div>
</body>
</html>