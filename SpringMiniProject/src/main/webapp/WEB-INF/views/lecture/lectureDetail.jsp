<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap"
            rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
	<!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    <script type="text/javascript">
    
    var IMP = window.IMP; 
    IMP.init("imp32541741"); 
    function requestPay() {
        IMP.request_pay({
            pg : 'kcp', //
            pay_method : 'card',
            merchant_uid: 'merchant_' + new Date().getTime(), //유저 ID+date값 추가할까
            name : '당근 10kg', //강의 이름
            amount : 1004,  //가격 
            buyer_email : 'Iamport@chai.finance',  //회원 이메일
            buyer_name : '아임포트 기술지원팀',    //회원이름
            buyer_tel : '010-1234-5678',    //hp
            buyer_addr : '서울특별시 강남구 삼성동',  //주소
            buyer_postcode : '123-456'  //num
            
	}, function (rsp) {             // callback
 		 if (rsp.success) {            // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
   		 // jQuery로 HTTP 요청
      	 $.ajax({
      	  url: '/verifyIamport/' + rsp.imp_uid, 
      	  method: "POST",
        	headers: { "Content-Type": "application/json" },
      	  data: {
      		  
            imp_uid: rsp.imp_uid,            //결제 고유번호     
            merchant_uid: rsp.merchant_uid   //주문번호
            //관리자 페이지랑 
            //마이페이지에서 결재내역 payok ok로
            //마이페이지 반환하는 신호
    		//만들어진 데이터를 관리자 페이지로 넘겨주는거
   	 }).done(function (data) {
     	//마이페이지 반환하는 신호
    	 //만들어진 데이터를 관리자 페이지로 넘겨주는거
       console.log(data);
      // 가맹점 서버 결제 API 성공시 로직

    })
  } else {
    alert("결제에 실패하였습니다. 에러 내용: " +  rsp.error_msg);
  }
});
    }

    </script>
</head>
<body>
<div class="container">
	<div  style="display: flex;  justify-content: center; align-items: center; ">    
	 <img alt="" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcReSrvKEoni0lh83iBv2RaoBWH3upjHMsg4JHdN8OYkrA&s">
	 <div>
	${lectypeb} ,${lectypea}
 
	
	 <button onclick="requestPay()">${dto.lectypeb}  ${dto.lectypea}</button> <!-- 결제하기 버튼 생성 -->
	 
	 <button onclick="requestPay()">결제하기</button> <!-- 결제하기 버튼 생성 -->
	 </div>
	</div>
	<div style="display: flex; justify-content: center; align-items: center;">
	 <img alt="" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcReSrvKEoni0lh83iBv2RaoBWH3upjHMsg4JHdN8OYkrA&s">
	 <div>

	 </div>
	</div>
	
</div>
</body>
</html>