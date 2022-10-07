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
</head>
<body>
    <c:set var="root" value="<%=request.getContextPath() %>"/>
<div class="container">
	<div  style="display: flex;  justify-content: center; align-items: center; ">    
	 
	 <div>

	 <button type="button" onclick='gocart()'>장바구니로 가기</button> 
	 </div>
	</div>
	<div style="display: flex; justify-content: center; align-items: center;">
	
	 <div>
	 </div>
	</div>
	
</div>


 <script type="text/javascript">
		 function gocart() {	
			var ans = confirm("장바구니에 저장하시겠습니까?");
			var usernum= "${sessionScope.usernum}";
			usernum *=1;

			
			if(ans){
               		$.ajax({
               			url:"../student/myCart",
               			method:"POST",
               		 	dataType :"text",
               			data: {"lecdenum": ${dto.lecdenum}, "usernum": usernum},
    					success: function(res) {
							var ans2 = confirm("장바구니로 이동하시겠습니까?");
							
               				if (ans2) {
               					
               				 location.href='${root}/student/myCart';
							}

						}
		 			})                  		
			}
		}
   </script>    
</body>
</html>