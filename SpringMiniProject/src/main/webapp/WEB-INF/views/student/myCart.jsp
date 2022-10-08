<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Yeon+Sung&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

    <style type="text/css">
        *{
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
        .total{
            text-align: end;
            padding-right: 15px !important;
            font-size: 20px;
        }
    </style>

</head>
<body>
<h1>장바구니</h1>
<div class="lectdbox">
    <table class="table table-bordered lectd">
        <tr>
            <th style="width: 80px">과목분류</th>
            <th style="width: 150px">강의명</th>
            <th style="width: 80px">강사</th>
            <th style="width: 80px">강의실</th>
            <th style="width: 100px">강의교시</th>
            <th style="width: 100px">강의요일</th>
            <th style="width: 50px">수강연월</th>
            <th style="width: 50px">가격</th>
        </tr>
        <c:set var="totalPrice" value="0"/>
        <c:set var="totalLecname" value=""/>
        <c:forEach var="dto" items="${list}">
            <tr>
                <td>${dto.lectypea}</td>
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
                <td><fmt:formatNumber type="currency" value="${dto.price}"/></td>
            </tr>
            <c:set var="totalPrice" value="${totalPrice+dto.price}"/>
            <c:set var="totalLecname" value="${totalLecname} [${dto.lecname}]"/>
            <c:set var="usernum" value="${dto.usernum}"/>
        </c:forEach>
        <tr>
            <td colspan="8" class="total">
                총 결제 예정 금액 :  <fmt:formatNumber type="currency" value="${totalPrice}"/>
            </td>
        </tr>
    </table>
    
    <button type="button" onclick="payment('kcp','test','card')">결제하기</button>
</div>
<script type="text/javascript">

    var IMP = window.IMP;

    var name = "${sessionScope.loginname}";
    var email = "${sessionScope.email}";
	var usernum= "${sessionScope.usernum}";
	usernum +="";
    function payment(pg_provider,mode,payment_method) {
    	var usernum = "${sessionScope.usernum}";
        IMP.init("imp32541741");
        var pg_mid;
        if(pg_provider =='kcp'){
            if(mode=='test'){
                pg_mid ='kcp';
            }
            else{

                pg_mid ='kcp.IOfds34' ;

            }

        }

        const data = {
            pg: pg_mid ,
            pay_method:  payment_method,
            merchant_uid: "${totalLecname} ${sessionScope.loginname}",
            name : "${totalLecname}",
            amount : "${totalPrice}",
            buyer_email : '${sessionScope.email}',
            buyer_name : '${sessionScope.loginname}',
 			usernum : "${sessionScope.usernum}"
        };
        
        
        IMP.request_pay(data, response => {
            alert('callback!:' +JSON.stringify(response)),
                $.ajax({
                    url: "../payment/callback_receive",
                    method: "POST",
                    headers: { "Content-Type": "application/json" },
                    datetype:"text",
                    data: JSON.stringify(response),
                	success: function(res) {
                    // 가맹점 서버 결제 API 성공시 로직'
                    location.reload();
                	}
                })
        })
    };

</script>
</body>
</html>