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
<style>
  .star {
    position: relative;
    font-size: 2rem;
    color: #ddd;
  }
  
  .star input {
    width: 100%;
    height: 100%;
    position: absolute;
    left: 0;
    opacity: 0;
    cursor: pointer;
  }
  
  .star span {
    width: 0;
    position: absolute; 
    left: 0;
    color: red;
    overflow: hidden;
    pointer-events: none;
  }
  #myform fieldset{
    display: inline-block;
    direction: rtl;
    border:0;
}
#myform fieldset legend{
    text-align: right;
}
#myform input[type=radio]{
    display: none;
}
#myform label{
    font-size: 3em;
    color: transparent;
    text-shadow: 0 0 0 #f0f0f0;
}
#myform label:hover{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#myform label:hover ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#myform input[type=radio]:checked ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#reviewContents {
    width: 100%;
    height: 150px;
    padding: 10px;
    box-sizing: border-box;
    border: solid 1.5px #D3D3D3;
    border-radius: 5px;
    font-size: 16px;
    resize: none;
}
</style>
<body>
	
	 <div style="display: flex; background-color: #002333;">
		<img src=" " style="min-width:500px; max-width: 30%; min-height:300px; max-height: 20%;  margin: 50px 350px; display: flex;">		
	 	${dto.price}
		${dto.lecname}
		${dto.teaname}
		${dto.avgstar}

	  </div>
    <c:set var="root" value="<%=request.getContextPath() %>"/>
	<div class="container" style="height:3000px;">
	<div  style="display: flex;  justify-content: center; align-items: center; ">    

	 <div>

	<img alt="" src="https://contents.kyobobook.co.kr/dtl/illustrate/963/i9788954761963.jpg">
	
 		${dto.lecdenum}
	 	${dto.price}
		${dto.lecname}
		${dto.teaname}
		${dto.avgstar}
	 <button type="button" onclick='gocart()'>장바구니에 담기</button>  
	 </div>
	</div>
	<div style="display: flex; justify-content: center; align-items: center;">
	
	 <div>
	 </div>
	</div>
	
	 <c:forEach var="redto" items="${list}">
		<div>
		작성자:${redto.username}  별점: ${redto.star} 
		리뷰내용:${redto.review}	
		</div>
	</c:forEach>
	<span class="star">
  <span>★★★★★</span>
  <input type="range" oninput="drawStar(this)" value="1" step="1" min="0" max="10">
</span>
	
 	<form class="mb-3" name="myform" id="myform" method="post">
	<fieldset>
		<span class="text-bold">별점을 선택해주세요</span>
		<input type="radio" name="reviewStar" value="5" id="rate1"><label
			for="rate1">★</label>
		<input type="radio" name="reviewStar" value="4" id="rate2"><label
			for="rate2">★</label>
		<input type="radio" name="reviewStar" value="3" id="rate3"><label
			for="rate3">★</label>
		<input type="radio" name="reviewStar" value="2" id="rate4"><label
			for="rate4">★</label>
		<input type="radio" name="reviewStar" value="1" id="rate5"><label
			for="rate5">★</label>
	</fieldset>
	<div>
		<textarea class="col-auto form-control" type="text" id="reviewContents"
				  placeholder="좋은 수강평을 남겨주시면  teachMe에 큰 힘이 됩니다! "></textarea>
	</div>
</form>	
	
	
	
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