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

<div class="footerbox">
    <div class="footerhead">
        <div>
            <font style="font-size:10px; color:#dbdbdb"></font>
            <span class="option_intro">
              회사소개
                </span>
           </font>
            <font style="font-size:10px; color:#dbdbdb">│</font>
            <span class="option_intro">
              이용약관
           </span>
            <font style="font-size:10px; color:#dbdbdb">│</font>
            <span class="option_intro_highlight">
              개인정보처리방침
           </span>
            <font style="font-size:10px; color:#dbdbdb">│</font>
            <span class="option_intro" style="color:#808080">
              <font style="color:#000000 !important">ErrorJava</font>
              &emsp;&emsp;이준민&emsp;&emsp;유희준&emsp;&emsp;김태민&emsp;&emsp;이동형&emsp;&emsp;최진아&emsp;&emsp;정우진
           </span>
        </div>
    </div>
    <hr noshade="noshade" style="margin: 0;">
    <div class="footerarea">
        <%--footer 좌측 로고--%>
        <div class="logofooterbox">
            <a href="${root}" style="color: #191919; font-size: 40px; font-family: abster;" class="teachMeLogo"  id="ftlogo">
                TeachMe
            </a>
        </div>
        <div class="footer_text">(주)티치미아카데미
            <br>
            대표이사 : 티치미
            <font style="font-size:10px; color:#dbdbdb">&nbsp;│&nbsp;</font>
            서울특별시 강남구 역삼동 7-7번지 7층 티치미 본원
            <font style="font-size:10px; color:#dbdbdb">&nbsp;│&nbsp;</font>
            사업자등록번호 : 123-456-789
            <br>
            통신판매업신고 : 2022-서울강남구-777
            <font style="font-size:10px; color:#dbdbdb">&nbsp;│&nbsp;</font>
            E-mail : TeachMe@academy.com
            <br>
            COPYRIGHT 2022. TeachMe Co., Ltd. ALL RIGHTS RESERVED.
        </div>
    </div>
</div>
</body>
</html>