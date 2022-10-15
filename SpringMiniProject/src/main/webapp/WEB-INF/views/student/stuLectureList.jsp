<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Yeon+Sung&display=swap" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <!-- css  -->
  <c:set var="root" value="<%=request.getContextPath() %>"/>
  <link rel="stylesheet" type="text/css" href="${root}/css/stupagechange.css">

  <style type="text/css">
    .lectd th,td{
      text-align: center;
    }
    .lectdbox{
      width: 850px;
      height: auto;
      padding: 10px 10px 10px 10px;
    }
    #lecpayshow:hover
    {
      cursor: pointer;
    }

  </style>

  <script type="text/javascript">
    $(function(){
      $("#lecpay").hide();

      $("#lecpayshow").click(function (){
        var icon=$(this).find("span").attr("class");
        if(icon=='glyphicon glyphicon-chevron-down'){
          $(this).find("span").attr("class",'glyphicon glyphicon-chevron-up');
        }else{
          $(this).find("span").attr("class",'glyphicon glyphicon-chevron-down');
        }

        $("#lecpay").slideToggle();
      });

    });

  </script>
</head>
<body>
<div class="sttitle">
  수강목록
</div>
<div class="stcontainer">
<div class="lectdbox">
<table class="table table-bordered lectd">
  <tr>
    <th style="width: 80px">과목분류</th>
    <th style="width: 200px">강의명</th>
    <th style="width: 80px">강사</th>
    <th style="width: 80px">강의실</th>
    <th style="width: 80px">강의교시</th>
    <th style="width: 100px">강의요일</th>
    <th style="width: 70px">수강연월</th>
  </tr>
  <c:forEach var="dto" items="${list }">
    <tr>
      <td align="center">${dto.lectypea}</td>
      <td>${dto.lecname}</td>
      <td>${dto.teaname}</td>
      <td>${dto.roomnum}</td>
      <td>${dto.lectime}교시</td>
      <td>
        <c:if test="${fn:contains(dto.lecday,1)}">
          월
        </c:if>
        <c:if test="${fn:contains(dto.lecday,2)}">
          화
        </c:if>
        <c:if test="${fn:contains(dto.lecday,3)}">
          수
        </c:if>
        <c:if test="${fn:contains(dto.lecday,4)}">
          목
        </c:if>
        <c:if test="${fn:contains(dto.lecday,5)}">
          금
        </c:if>
        <c:if test="${fn:contains(dto.lecday,6)}">
          토
        </c:if>
        <c:if test="${fn:contains(dto.lecday,7)}">
          일
        </c:if>
      </td>
      <td>${dto.lecyear}/${dto.lecmonth}</td>
    </tr>
  </c:forEach>
</table>
</div>
</div>
<div class="sttitle" id="lecpayshow" style="font-size: 18px;">강의 결제 내역 <span class="glyphicon glyphicon-chevron-down"></span></div>
<div class="stcontainer">
<div class="lectdbox" id="lecpay">
  <table class="table table-bordered lectd">
    <tr>
      <th style="width: 150px">결제일시</th>
      <th style="width: 70px">결제상태</th>
      <th style="width: 220px">강의</th>
      <th style="width: 80px">강의교시</th>
      <th style="width: 100px">강의요일</th>
      <th style="width: 70px">수강연월</th>
    </tr>
    <c:forEach var="dto" items="${plist}">
      <c:if test="${dto.payok eq 'cancel'}">
        <c:set var="fcolor" value="#aaa"/>
      </c:if>
      <c:if test="${dto.payok eq 'ok'}">
        <c:set var="fcolor" value="black"/>
      </c:if>
      <tr class="lecpaylist" style="color: ${fcolor};">
        <td>${dto.paytime}</td>
        <td>${dto.payok eq "ok"?"완료":"취소"}</td>
        <td>${dto.lecname} [${dto.teaname}]</td>
        <td>${dto.lectime}교시</td>
        <td>
          <c:if test="${fn:contains(dto.lecday,1)}">
            월
          </c:if>
          <c:if test="${fn:contains(dto.lecday,2)}">
            화
          </c:if>
          <c:if test="${fn:contains(dto.lecday,3)}">
            수
          </c:if>
          <c:if test="${fn:contains(dto.lecday,4)}">
            목
          </c:if>
          <c:if test="${fn:contains(dto.lecday,5)}">
            금
          </c:if>
          <c:if test="${fn:contains(dto.lecday,6)}">
            토
          </c:if>
          <c:if test="${fn:contains(dto.lecday,7)}">
            일
          </c:if>
        </td>
        <td>${dto.lecyear}/${dto.lecmonth}</td>
      </tr>
    </c:forEach>
  </table>
</div>
</div>

</body>
</html>