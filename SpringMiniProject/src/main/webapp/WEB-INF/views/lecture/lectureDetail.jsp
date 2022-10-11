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
.review { display:none; 
}
 
.sangse{
    font-weight: 400;
    line-height: 1.43;
    letter-spacing: -.3px;
    font-size: 14px;
    display: flex;
    flex-wrap: wrap;
  
    margin-bottom: 20px;

}
.type{
    overflow: hidden;
    align-items: center;
    margin-bottom: 15px;
    flex-wrap: wrap;
      margin-top :50px;
}
.title{
	line-height: 1.5;
    letter-spacing: -.3px;
    font-weight: 700;
    font-size: 26px;
    margin-bottom: 15px;
   
}
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
	 <c:set var="root" value="<%=request.getContextPath()%>"/>
	 <div style="display: flex;">
	<div>
	<img src="../upload/${dto.lecphoto}" style=" margin: 0 auto; margin-top:50px; display: flex;">			
	<div class="type">
	카테고리:${dto.lectypea}>${dto.lectypeb}
	<div class="title">
	 강의명:${dto.lecname}
	</div>
	<div class=" sangse">
	 가격:${dto.price}원
	</div>
	<div>
	 강사명:${dto.teaname} 평균별점:${dto.avgstar}	
	</div>
	<div style="margin-top: 30px;">
	 <button type="button" onclick='gocart()'>장바구니에 담기</button>  
	</div>
	</div>
</div>
</div>

	<%-- 
	 <div style="display: flex;">
	<img src=" " style="min-width:500px; max-width: 30%; min-height:300px; max-height: 20%;  margin-top: 50px; margin-left:350px; margin-right:50px; display: flex;">		
	 <form action="" style="margin-top: 50px;">
	 <table>
	 <tr>
	 <td>
	 ${dto.lectypea}>${dto.lectypeb}
	 </td>
	 </tr>
	 <tr>
	 <td>
	 ${dto.lecname}
	 </td>
	 </tr>
	 <tr>
	 <td>
	 	${dto.price}
	 	</td>
	 	</tr>
	  <tr>
	 <td>
		${dto.teaname}
		</td>
		</tr>
	<tr>
	<td>
		${dto.avgstar}	
	</td>
	</tr> 	
	<tr>
	<td>
		 <button type="button" onclick='gocart()'>장바구니에 담기</button>  
	 </td>
	 </tr>
	 </table>
	</form>
</div> --%>
    <c:set var="root" value="<%=request.getContextPath()%>"/>
	<div class="container" >
	<div style="display: flex; justify-content: center; align-items: center;">
	 <div>
	 </div>
	</div>
	<div>

		

	 <c:forEach var="redto" items="${list}">
	 
		<div class="review">	
		<c:if test="${not empty redto.review}">
		작성자:${redto.username}
		</c:if>
		<div>
		<c:if test="${not empty redto.review}">
		작성자:${redto.username} 
		<br>
		별점:
		<c:forEach begin="1" end="${redto.star}">
		 ★
		</c:forEach>
		<br>
		리뷰 내용:${redto.review}
		</c:if>
		</div>
    </div> 
	
	<a href="#" id="load">후기 더 보기</a>

	<%--별점 및 수강평 입력 부분(로그인한 수강생이 해당강의를 수강한 학생일때만 보이게 하기--%>
	<c:set var="inmylec" value=""/> <%--내가 수강중인 lecdenum 합치기--%>
	<c:forEach var="jdto" items="${jlist}">
		<c:set var="inmylec" value="${inmylec} [${jdto.lecdenum}]"/> <%--내가 수강중인 lecdenum 합치기--%>
		<c:if test="${jdto.lecdenum==dto.lecdenum}"> <%--내 수강목록의 lecdenum과 현재 상세페이지의 lecdenum이 같아야 출력--%>
			<span class="star">
				<span>★★★★★</span>
				<input type="range" oninput="drawStar(this)" value="1" step="1" min="0" max="10">
			</span>

			<form class="mb-3" action="lecUpStarReview" name="myform" id="myform" method="post">
				<input type="hidden" name="usernum" value="${sessionScope.usernum}">
				<input type="hidden" name="lecdenum" value="${dto.lecdenum}">
				<fieldset>
					<span class="text-bold"></span>
					<input type="radio" name="star" value="5" id="rate1"><label
						for="rate1">★</label>
					<input type="radio" name="star" value="4" id="rate2"><label
						for="rate2">★</label>
					<input type="radio" name="star" value="3" id="rate3"><label
						for="rate3">★</label>
					<input type="radio" name="star" value="2" id="rate4"><label
						for="rate4">★</label>
					<input type="radio" name="star" value="1" id="rate5"><label
						for="rate5">★</label>
				</fieldset>
				<div>
					<textarea class="col-auto form-control" name="review" type="text" id="reviewContents"
							  placeholder="좋은 수강평을 남겨주시면  TeachMe에 큰 힘이 됩니다! "></textarea>
				</div>
				<button type="submit">
					등록하기
				</button>
			</form>
		</c:if>

	</c:forEach>


<script type="text/javascript">

	function gocart() {

		var test = "${sessionScope.loginname}";
		function gocart() {
			if(test!=""){
				var inmylec="${inmylec}";
				if(inmylec.indexOf("[${dto.lecdenum}]")>-1){
					alert("이미 수강목록에 있는 강의입니다");
				}else{
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
						});
					}
				}
			}else{
				alert("로그인 후 이용해주세요");
			}
		}
	}

	$(".review").slice(0,3).show(); // select the first ten
	$("#load").click(function(e){ // click event for load more
		$("div:hidden").slice(0,3).show(); // select next 10 hidden divs and show them
		if($("div:hidden").length == 0){ // check if any hidden divs still exist
			// alert if there are none left
		}
	});

</script>

</body>
</html>
