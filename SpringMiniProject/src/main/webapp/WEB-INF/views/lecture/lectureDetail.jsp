<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>Insert title here</title>
   <link rel="stylesheet" type="text/css" href="${root}/css/qna.css">
   <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
   <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
   <!-- iamport.payment.js -->
   <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
</head>
<style>
.rounded-circle {
    border-radius: 50%!important;
}
   .que:first-child{
       border-top: 1px solid black;
     }
     
   .que{
     position: relative;
     padding: 17px 0;
     cursor: pointer;
     font-size: 14px;
     border-bottom: 1px solid black;
     
   }
     
   .que::before{
     display: inline-block;
     content: ;
     font-size: 14px;
     margin: 0 5px;
   }
   
   .que.on>span{
     font-weight: bold;
   }
     
   .anw {
     display: none;
     overflow: hidden;
     font-size: 14px;
     text-align : center;
     border-bottom: 1px solid #e4e4e4;
      border-radius: 4px;
      font-size: 1rem;
     
   }
    
   #explain{ 
    opacity: 0; 
      } 
      
      .text_photo:hover #explain{ 
      opacity: 1; 
      }
   .anw::before {
     display: inline-block;
     font-size: 14px;
     font-weight: bold;
     margin: 0 5px;
   }
   
   .arrow-wrap {
     position: absolute;
     top:50%; right: 10px;
     transform: translate(0, -50%);
   }
   
   .que .arrow-top {
     display: none;
   }
   .que .arrow-bottom {
     display: block;
   }
   .que.on .arrow-bottom {
     display: none;
   }
   .que.on .arrow-top {
     display: block; 
   }
.review {
 display:none; 
 margin-bottom: 20px;

}

 button:focus {
            outline: none;
        }

.sangse{
    font-weight: 400;
    line-height: 1.43;
    letter-spacing: -.3px;
    flex-wrap: wrap;
    align-items: center;
    margin-top: 30px;

}
.name{
    font-weight: 400;
    line-height: 1.43;
    letter-spacing: -.3px;
    font-size: xx-large;
    flex-wrap: wrap;
    align-items: center;
    margin-top: 30px;

}
.type{
    overflow: hidden;
    margin-bottom: 15px;
    flex-wrap: wrap;
    align-items: center;
    display: flex;
    margin: 0 auto;
}
.title{
   	line-height: 1.5;
    letter-spacing: -.3px;
    margin-bottom: 30px;
    align-items: center;
    margin-left: 50px;
   
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
    <div class="container">
    <div style=" width: 1000px; height: 700px;">
   		<div style=" display: flex; margin: 0 auto;" >
   		 <div id="Accordion_wrap" style="width: 150px; ">
     <div class="que">
      <span><i class='fas fa-book-open'></i> 국어</span>
       <div class="arrow-wrap">
         <span class="arrow-top">↑</span>
        <span class="arrow-bottom">↓</span>
       </div> 
     </div>
     <div class="anw">
     <div style="padding: 10px 0; border-bottom: 1px solid #dddddd;">
     <a href="lectureList?lectypeb=문학&order=" style="color: black; text-decoration:none; margin-bottom: 5px;">문학</a>
   </div>
   <div style="padding: 10px 0; border-bottom: 1px solid #dddddd;">
     <a href="lectureList?lectypeb=비문학" style="color: black; text-decoration:none;">비문학</a>
     </div>    
       </div>
      <div class="que">
      <span><i class='fas fa-calculator'></i>  수학</span>
       <div class="arrow-wrap">
         <span class="arrow-top">↑</span>
        <span class="arrow-bottom">↓</span>
       </div> 
     </div>
     <div class="anw">
     <div style="padding: 10px 0; border-bottom: 1px solid #dddddd;">
        <a href="lectureList?lectypeb=수학1" style="color: black;text-decoration:none; margin-bottom: 1px;">수학1</a>
     </div>
   <div style="padding: 10px 0; border-bottom: 1px solid #dddddd;">
      <a href="lectureList?lectypeb=수학2" style="color: black;text-decoration:none;">수학2</a>
     </div> 
         <div style="padding: 10px 0; border-bottom: 1px solid #dddddd;">
      <a href="lectureList?lectypeb=미적분" style="color: black; text-decoration:none;">미적분</a>
     </div>    
     </div>
          <div class="que">
      <span><i class='fas fa-donate'></i>영어</span>
       <div class="arrow-wrap">
         <span class="arrow-top">↑</span>
        <span class="arrow-bottom">↓</span>
       </div> 
     </div>
     <div class="anw">
     <div style="padding: 10px 0; border-bottom: 1px solid #dddddd;">
      <a href="lectureList?lectypeb=독해" style="color: black; text-decoration:none;">독해</a>
     </div>
   <div style="padding: 10px 0; border-bottom: 1px solid #dddddd;">
       <a href="lectureList?lectypeb=문법" style="color: black; text-decoration:none;">문법</a>
     </div>     
     </div>
     <div class="que">
      <span> <i class='fas fa-balance-scale'></i>  사회</span>
       <div class="arrow-wrap">
         <span class="arrow-top">↑</span>
        <span class="arrow-bottom">↓</span>
       </div> 
     </div>
     <div class="anw">
     <div style="padding: 10px 0; border-bottom: 1px solid #dddddd;">
     <a href="lectureList?lectypeb=경제" style="color: black; text-decoration:none;">경제</a>
     </div>
   <div style="padding: 10px 0; border-bottom: 1px solid #dddddd;">
     <a href="lectureList?lectypeb=사회문화" style="color: black; text-decoration:none;">사회문화</a>
     
     </div>     
     </div>
          <div class="que">
      <span><i class='fas fa-atom'></i>  과학</span>
       <div class="arrow-wrap">
         <span class="arrow-top">↑</span>
        <span class="arrow-bottom">↓</span>
       </div> 
     </div>
     <div class="anw">
     <div style="padding: 10px 0; border-bottom: 1px solid #dddddd;">
    <a href="lectureList?lectypeb=과학" style="color: black; text-decoration:none;">화학</a>
     </div >
   <div style="padding: 10px 0; border-bottom: 1px solid #dddddd;">
   <a href="lectureList?lectypeb=생명과학" style="color: black; text-decoration:none;">생명과학</a>
     </div>     
     </div>
          <div class="que">
      <span><i class='fas fa-book-reader'></i>  그 외</span>
       <div class="arrow-wrap">
         <span class="arrow-top">↑</span>
        <span class="arrow-bottom">↓</span>
       </div> 
     </div>
     <div class="anw">
     <div style="padding: 10px 0; border-bottom: 1px solid #dddddd;">
     <a href="lectureList?lectypeb=한국사" style="color: black; text-decoration:none;">한국사</a>
     </div>
   <div style="padding: 10px 0; border-bottom: 1px solid #dddddd;">
     <a href="lectureList?lectypeb=제2외국어" style="color: black; text-decoration:none;">제2외국어</a>
     </div>     
     </div>
</div>
   			<div class="type">
   			<img src="https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9788954762946.jpg" style=" width: 400px; height: 500px; margin-top: 50px;">         	   			 
		 			<div class="title"> 			
		   			<div class="name">
		    			강의:${dto.lecname}
		   			</div>
		   			<div class=" sangse">
		   			카테고리:${dto.lectypea}>${dto.lectypeb}		  
		  				${dto.teaname}   
					</div>	   			
		   			<div class=" sangse">
		    		${dto.price}원
		   			</div>
				<div  class=" sangse" style="margin-bottom: 100px;">
				평균별점:${dto.avgstar} 
				</div>
				<button  class="btn btn-outline" type="button" onclick='gocart()' id="writecolor" >장바구니</button>
				</div>
				
			</div>
    
		 </div>	
		 	
</div>
<!-- 책관한 설명 -->
<div>
 
 
</div>

<div style="margin: 0 auto; text-align: center;">
<img alt="" src="https://contents.kyobobook.co.kr/sih/fit-in/814x0/dtl/illustrate/946/i9788954762946.jpg">
</div>

    <c:set var="root" value="<%=request.getContextPath()%>"/>
   <div style="margin-top: 50px;">
      <div >
      <div>
         <c:forEach var="redto" items="${list}">
            <div class="review">
               <div>             
               <c:if test="${not empty redto.review}">
                   <div style="color: #f7e600;">   
                   <div>                   	
                   	<c:choose>              
                      <c:when test="${not empty redto.userphoto}">
					  	<img src="../upload/${redto.userphoto}" class="rounded-circle" style="width: 40px; height: 40px;">
					</c:when>            
                    <c:otherwise>
                    	<img src="../upload/noprofilepicture.png" class="rounded-circle" style="width: 40px; height: 40px;" >
                    </c:otherwise>
           
                    </c:choose>
                   </div>
	                  <c:forEach begin="1" end="${redto.star}">      	                
	                   ★             
	                  </c:forEach>  
	                  <div>       
	                 <p style="color: #000; margin-bottom: 0;">
                     작성자:${redto.username}(${redto.paytime})</p>    
                    <div style="color: #000 ">
                  		리뷰 내용:${redto.review}
    				</div>
    				</div>
    				    </div>
    	           </c:if>
 	              </div>
             </div>
         </c:forEach>
      </div>
      <div style="margin: 0 auto ; text-align: center;">
      <button id="writecolor" style=" width: 100%; " class=" load  btn btn-outline"  type="button">
			수강평 더보기</button>
	</div>
</div>
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
            <button  class="btn btn-outline" id="writecolor" type="submit">
               등록하기
            </button>
         </form>
      </c:if>
   </c:forEach>
 </div>
</div>
<script type="text/javascript">

   var test = "${sessionScope.loginok}";
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
      
   $(".review").slice(0,1).show(); // select the first ten
   $(".load").click(function(e){ // click event for load more
	   event.stopPropagation();
      $("div:hidden").slice(0,10).show(); // select next 10 hidden divs and show them
      if($("div:hidden").length == 0){ // check if any hidden divs still exist
    	  
      }	
   });
   $(".que").click(function(e) {
	   $(this).next(".anw").stop().slideToggle(300);
        $(this).toggleClass('on').siblings().removeClass('on');
        $(this).next(".anw").siblings(".anw").slideUp(300); // 1개씩 펼치기
      });
   
</script>



</body>
</html>