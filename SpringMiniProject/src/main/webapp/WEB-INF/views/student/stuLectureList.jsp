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

  <style type="text/css">
    .lcontainer{
      font-family: 'Noto Sans KR';
    }
    .lectd th,td{
      text-align: center;
    }
    .lectdbox{
      width: 850px;
      height: auto;
      padding: 10px 10px 10px 10px;
    }
    .lecpayshow:hover
    {
      cursor: pointer;
    }

  </style>

  <script type="text/javascript">
    $(function(){
      $("#lecpay").hide();

      $(".lecpayshow").click(function (){
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
<div class="lcontainer">
<h2>수강목록</h2>

<div class="lectdbox">
<table class="table table-bordered lectd">
  <tr>
    <th style="width: 80px">과목분류</th>
    <th style="width: 150px">강의명</th>
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

<h4 class="lecpayshow">강의 결제 내역 <span class="glyphicon glyphicon-chevron-down"></span></h4>
<div class="lectdbox" id="lecpay">
  <table class="table table-bordered lectd">
    <tr>
      <th style="width: 160px">결제일시</th>
      <th style="width: 70px">결제상태</th>
      <th style="width: 160px">강의</th>
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

<%--<div>
<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Open Small Modal</button>

<!-- Modal -->
<div class="modal fade" id="myModal" role="dialog">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Modal Header</h4>
      </div>
      <div class="modal-body">
        <p>This is a small modal.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
</div>--%>
</body>
</html>