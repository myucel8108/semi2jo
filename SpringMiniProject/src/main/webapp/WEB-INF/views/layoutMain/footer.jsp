<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Yeon+Sung&display=swap" rel="stylesheet">
<%--    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">--%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    <c:set var="root" value="<%=request.getContextPath() %>"/>
    <link rel="stylesheet" type="text/css" href="${root }/css/footer.css">

</head>
<style>
    #ftlogo{

        background: linear-gradient(to right, #25aae1, #4481eb, #04befe, #3f86ed);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
    }
    #fttlogo{
        background: linear-gradient(to right, #25aae1, #4481eb, #04befe, #3f86ed);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
    }

    .footerarea{
        /*background: linear-gradient(to right, lightgray, darkgray, lightgray);*/
        background-color: lightgray;
    }



</style>
<body>
<!-- Copyright -->
<div class="footer-copyright text-center">
    <div class="gradient"></div>
</div>
<!-- Copyright -->

</footer>
<!-- Footer -->
</section>

<%--<div class="footerbox">--%>
<%--    <div class="footerhead">--%>
<%--        <div>--%>
<%--            <font style="font-size:10px; color:#dbdbdb"></font>--%>
<%--            <span class="option_intro">--%>
<%--              회사소개--%>
<%--                </span>--%>
<%--           </font>--%>
<%--            <font style="font-size:10px; color:#dbdbdb">│</font>--%>
<%--            <span class="option_intro">--%>
<%--              이용약관--%>
<%--           </span>--%>
<%--            <font style="font-size:10px; color:#dbdbdb">│</font>--%>
<%--            <span class="option_intro_highlight">--%>
<%--              개인정보처리방침--%>
<%--           </span>--%>
<%--            <font style="font-size:10px; color:#dbdbdb">│</font>--%>
<%--            <span class="option_intro" style="color:#808080">--%>
<%--              <font style="color:#000000 !important">ErrorJava</font>--%>
<%--              &emsp;&emsp;이준민&emsp;&emsp;유희준&emsp;&emsp;김태민&emsp;&emsp;이동형&emsp;&emsp;최진아&emsp;&emsp;정우진--%>
<%--           </span>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--    <hr noshade="noshade" style="margin: 0;">--%>

    <div class="footerarea" >
        <%--footer 좌측 로고--%>
        <div class="logofooterbox" style="margin-left: 140px;">
            <a href="${root}" style="color: #191919; font-size: 40px; font-family: abster;" class="teachMeLogo"  id="ftlogo">
                TeachMe
            </a><br>
            <b style="color: #191919;" id="fttlogo">Study and Changes Life</b>
        </div>
            <div style="margin-left: 130px;">

            <div class="footer_text" style="margin-right: 150px;"><b style="font-size: 13px; color: dimgrey;">주식회사 티치미</b><br>
            <div style="font-size: 12px;">
            대표 : 김티치 ㅣ
            개인정보관리책임자 : 김티치<br>
            사업자등록번호 : 123-456-789 ㅣ
            통신판매업신고 : 2022-서울강남구-777<br>
            서울특별시 강남구 도산대로7 7층 티치미빌딩
            <br>
            TEL : 02-777-7777
            E-mail : TeachMe@academy.com
            <br>
            © 2022 TeachMe All Rights reserved
            </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>