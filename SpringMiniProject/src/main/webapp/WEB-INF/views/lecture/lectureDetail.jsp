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

		var price ="${dto.price}"; 
		var name = "${sessionScope.loginname}";
		var email = "${sessionScope.loginemail}"
		
        function payment(pg_provider,mode,payment_method) {
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
                merchant_uid: "${dto.lecname}+${sessionScope.loginname}", 
                name : "${dto.lecname}",
                amount : ${dto.price},
                buyer_email : '${sessionScope.email}',
                buyer_name : '${sessionScope.loginname}',
            };
            
            IMP.request_pay(data, response => {
            	alert('callback!:' +JSON.stringify(response)),
            	 $.ajax({
            		 url: "/payment/callback_receive",
                     method: "POST",
                     headers: { "Content-Type": "application/json" },
                     data: JSON.stringify(response)
                 }).done(function (data) {
                   // 가맹점 서버 결제 API 성공시 로직'
                   alert("성공");
                   
                   
                 }) 
                     })
               };
               
               
               
               
   </script>    
                 

</head>
<body>
<div class="container">
	<div  style="display: flex;  justify-content: center; align-items: center; ">    
	 
	 <div>
	    <button type="button" onclick="payment('kcp','test','card')">결제하기</button>
	 <button onclick="gocart">장바구니로 가기</button> 
	 </div>
	</div>
	<div style="display: flex; justify-content: center; align-items: center;">
	
	 <div>
	 </div>
	</div>
	
</div>
</body>
</html>