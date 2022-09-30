<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.2.0.js"></script>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
    
    <script>
        var IMP = window.IMP; 
        IMP.init("imp32541741"); 
        function requestPay() {
            IMP.request_pay({
                pg : 'kcp', //
                pay_method : 'card',
                merchant_uid: 'merchant_' + new Date().getTime(), //겹치지않는 수 
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
            url: "{"/verifyIamport/" + rsp.imp_uid}", 
            method: "POST",
            headers: { "Content-Type": "application/json" },
            data: {
                imp_uid: rsp.imp_uid,            //결제 고유번호     
                merchant_uid: rsp.merchant_uid   //주문번호
            }
        }).done(function (data) {
           
           console.log(data);
          // 가맹점 서버 결제 API 성공시 로직
          location.reload();
 
        })
      } else {
        alert("결제에 실패하였습니다. 에러 내용: " +  rsp.error_msg);
      }
    });
        }
    </script>
</head>
<body>
 <button onclick="requestPay()">결제하기</button> <!-- 결제하기 버튼 생성 -->
</body>
</html>