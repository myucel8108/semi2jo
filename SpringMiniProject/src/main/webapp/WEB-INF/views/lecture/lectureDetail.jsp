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
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
   <!-- iamport.payment.js -->
   <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
   
<link href="/resources/rateit/rateit.css" rel="stylesheet" type="text/css">
</head>
<style>
       #main_menu {
            position: fixed;
            width: 70px;
            height: 210px;
            right: 60px;
            border-radius: 70px;
            top: 35%;
            text-align: center;

        }
.cuz {
    width: 100px;
}

ul {
    padding: 0;
}

li {
    list-style: none;
    line-height: 34px;
}

a {
    text-decoration: none;
    color: black;
    text-align: center;
}

.snd_menu {
    background: #efefef;
}

.sub_menu {
    display: none;
}


.css-uimfca {width: 100%;
    display: flex;
    -webkit-box-pack: justify;
    justify-content: space-between;
    -webkit-box-align: center;
    align-items: center;
    font-size: 14px;
    color: rgb(48, 52, 65);
    font-weight: 700;
    margin-top: 36px;

}

#btnmycart{
       width: 80%;
       height: 50px;
       font-size: 20px;

       color: #3b5a9b;
       background-color: white;
       border-radius: 15px;
       border-color: #3b5a9b;
       margin: 0 auto;
       text-align: center;
   }
   #btnmycart:hover{
       color: #1da1f2;
       border-color: #1da1f2;
   }
     div.alist img{
            width: 40px;
            height: 40px;
            cursor: pointer;
            border: 1px solid gray;
            border-radius: 10px;
            margin-left: 10px;
        }
        #detailbox
        {
            margin: auto;
            margin-bottom: 0px;
        }

        #buttonbox{
            margin: auto;
            text-align: center;
            margin-top: 0;
            margin-bottom: 40px;
        }
        #listing{
            margin: auto;
            text-align: center;
            margin-bottom: 20px;
        }
        #tpst{
            font-size: 15px;
            text-decoration: none;
            color: grey;
            font-style: italic;
        }

.css-1ptxp8z {
    width: 300px;
    background-color: rgb(255, 255, 255);
    z-index: 1;
    position: sticky;
    top: 0px;

    
}
.css-1bmzgfy {
    position: relative;
    -webkit-flex: 1;
    -ms-flex: 1;
    flex: 1;
    /*-webkit-box-pack: space-around;*/
    /*-ms-flex-pack: space-around;*/
    -webkit-justify-content: space-around;
    justify-content: space-around;
    display: -webkit-box;
    display: -webkit-flex;
    display: -ms-flexbox;
    display: flex;
    -webkit-align-items: center;
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center;
    color: #555969;
    font-size: 14px;
    background-color: #fafafc;
    cursor: pointer;
    height: 60px;
    padding: 0 4px;
    border-top: 1px solid #e4e5ed;
    border-right: 1px solid #e4e5ed;
    border-bottom: 1px solid #000000;
    
}
.css-k008qs {
    display: -webkit-box;
    display: -webkit-flex;
    display: -ms-flexbox;
    display: flex;

}
.product_view { position: relative; padding: 0 0 0 50px; width: 400px; box-sizing: border-box; 
}
.product_view h2 { margin: 0 0 15px; padding: 0 0 20px; font-size:24px; color:#232323; line-height: 26px;
}
.product_view table th,
.product_view table td { padding:14px 0; font-size: 15px; color:#444; text-align: left;
}
.product_view table td.price { font-size: 22px;
}
.product_view table td.total { font-size:19px; color:#0a56a9;
}
.product_view table td.total b { font-size: 22px;
}
.product_view table .length { position: relative; width: 71px; height: 32px; border:1px solid #c6c6c6;
}
.product_view table .length input { width:44px; height: 30px; border:none;border-right:1px solid #c6c6c6; text-align:center; 
}
.product_view table .length a {position: absolute; right: 0; width: 26px; height: 16px; color:transparent;
}
.product_view table select { width:100%; border:1px solid #c6c6c6; box-sizing: border-box; no-repeat: right 11px center;appearance:none; -webkit-appearance:none; -moz-appearance:none;
}
.product_view table select::-ms-expand { display: none;
}
.product_view .btns { padding: 45px 0 0; text-align: center;
}
.product_view .btns > a { display: inline-block; width: 136px; height: 42px;border-radius: 2px; font-size: 16px; color:#fff; line-height: 42px; 
}
.product_view .btns > a.btn1 { background: #666;
}
.product_view .btns > a.btn2 { background: #0a56a9;
}
table { border-collapse:collapse; border-spacing:0; width:100%;
}
.rounded-circle {
    border-radius: 50%!important;
}
.review {
 display:none; 
 margin-bottom: 20px;
 width: 800px;

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
    flex-wrap: wrap;
    align-items: center;
    float: left;
    position: relative;
    display: flex;
    margin: 0 auto;
}
.title{
      line-height: 1.5;
    letter-spacing: -.3px;
    margin-bottom: 30px;
    align-items: center;
    margin-top:  30px;
   
}
  .star {
    position: relative;
    font-size: 2rem;
    color: #ff8c00;;
  }
  
  .star input {
    width: 100%;
    height: 100%;
    position: absolute;
    left: 0;
    opacity: 0;
    cursor: pointer;
  }
 .css-1ptxp8z {
    width: 100%;
    background-color: rgb(255, 255, 255);
    z-index: 1;
    top: 0px;
}
  
  .star span {
    width: 0;
    position: absolute; 
    left: 0;
    color: red;
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

#Accordion_wrap{
position: relative;
}      
 .fa-star{
	color:#ff8c00;;
}
.rating .star2{
       width:0;
       overflow: hidden;
}
 .rating .star-wrap{
      width:18px; 
       display: inline-block;
         
}

</style>
<body>
<c:set var="root" value="<%=request.getContextPath() %>"></c:set>
    <div class="container" style="width: 1000px; margin: 0 auto; text-align: center;" id="div0">
            <div class="type">
            <img src="../upload/lecture/${dto.lecphoto}" style=" width: 380px; height: 500px; margin-top: 50px; margin-bottom: 50px; margin-left: 100px;">                         
                <div class="title">
          <div class="product_view">   
            <h2>${dto.lecname}</h2>
      <table>
         <colgroup>
         <col style="width:173px;">
         <col>
         </colgroup>
         <tbody>
         <tr>
            <th>가격</th>
            <td class="price"> ₩<span id="i_result"> </span></td>
         </tr>
         <tr>
            <th>카테고리</th>
            <td>${dto.lectypea}>${dto.lectypeb}</td>
         </tr>
         <tr>
            <th>강사명</th>
            <td>${dto.teaname}                          
            </td>
         </tr>
         <tr>
            <th>별점</th>
            <td>
            <div class="review2">      
            	<div class="rating" data-rate="${dto.avgstar}">            	
	            	<div class="star-wrap"><div class="star2"><i class="fas fa-star"></i></div></div>
	            	<div class="star-wrap"><div class="star2"><i class="fas fa-star"></i></div></div>
	            	<div class="star-wrap"><div class="star2"><i class="fas fa-star"></i></div></div>
	            	<div class="star-wrap"><div class="star2"><i class="fas fa-star"></i></div></div>
	            	<div class="star-wrap"><div class="star2"><i class="fas fa-star"></i></div></div>            			
            	</div>
            </div>            
            </td>
         </tr>
          <tr>
            <th>개강</th>
            <td>
            ${dto.lecmonth}월
            </td>  
          </tr>
          <tr>
            <th>강의요일</th>
            <td>  <div id="i_result2">                 
                            <script>
                                // DB에서 숫자로 가져오는 요일을 한글로 바꿔주기
                                var temp = "";
                                var lecday = "${dto.lecday}".split(',');
                                console.log(lecday);
                                for (var yoil = 0; yoil < lecday.length; yoil++) {
                                    // console.log("lecday"+lecday[yoil]);
                                    if (lecday[yoil] == "1") {
                                        temp += "<span>[월]</span>";
                                    } else if (lecday[yoil] == "2") {
                                        temp += "<span>[화]</span>";
                                    } else if (lecday[yoil] == "3") {
                                        temp += "<span>[수]</span>";
                                    } else if (lecday[yoil] == "4") {
                                        temp += "<span>[목]</span>";
                                    } else if (lecday[yoil] == "5") {
                                        temp += "<span>[금]</span>";
                                    } else if (lecday[yoil] == "6") {
                                        temp += "<span>[토]</span>";
                                    } else if (lecday[yoil] == "7") {
                                        temp += "<span>[일]</span>";
                                    }
                                }
                                const result3 = temp;
                                console.log(result3);
                                document.getElementById("i_result2").innerHTML=(result3);
                            </script>                          
                </div>                    
            </td>
         </tr>
         <tr>
            <th>강의시간</th>
            <td>${dto.lectime} 교시                          
            </td>
         </tr>
        
         </tbody>
  		<tr>
  		<td>
  		
  		</tr>    
      </table>

      </div>
       <button id="btnmycart" class="btn btn-outline"  type="button" onclick="gocart(event)" ><i class="fa fa-shopping-cart"></i>&nbsp;장바구니</button>
      </div>      
   </div>   
</div>

<div style="margin: 0 auto;  display: inline-block; ">

   <nav class="css-1ptx8z" style="display: flex; Position: Sticky ; top:0;" >
         <a href="#div0" class=" css-1bmzgfy" id="scroll_move">
         
         <li style="list-style: none;">강의 확인</li>
           </a>
      <a href="#div1" id="scroll_move" class=" css-1bmzgfy">
         <li style="list-style: none;">상세 설명</li>
           </a>
           <a href="#div2" id="scroll_move" class=" css-1bmzgfy">
            <li style="list-style: none;">취소 및 환불규정</li>
                     </a>
            <a href="#div3" id="scroll_move" class=" css-1bmzgfy">
         <li style="list-style: none;">후기</li>         
     </a>
   </nav>   
   
   
<img id="div1" alt="" src="https://contents.kyobobook.co.kr/sih/fit-in/814x0/dtl/illustrate/946/i9788954762946.jpg">
    <c:set var="root" value="<%=request.getContextPath()%>"/>  
      
      <div id="div2" style=" width: 800px; height: 600px; margin-top: 150px;">
        <br>  <br>  <br>  <br>  <br>
      취소 및 환불 규정<br>
      <br>
      가. 기본 환불 규정<br>
      1. 학원과 학생의 상호 협의하에 청약 철회 및 환불이 가능합니다.<br>
      2. 수업이 완료된 이후 또는 자료, 프로그램 등 서비스가 제공된 이후에는 환불이 불가합니다.<br>
      ( 소비자보호법 17조 2항의 5조. 용역 또는 <br>「문화산업진흥 기본법」 제2조 제5호의 디지털콘텐츠의 제공이 개시된 경우에 해당)<br>
      <br>
      나. 학원 책임 사유<br>
      1. 학원의 귀책사유로 당초 약정했던 서비스 미이행 혹은 보편적인 관점에서 심각하게 잘못 이행한 경우<br> 결제 금액 전체 환불이 가능합니다.<br>
      <br>
      다. 학생 책임 사유<br>
      1. 수업 진행 도중 의뢰인의 귀책사유로 인해 환불을 요청할 경우, 사용 금액을 아래와 같이 계산 후<br> 총 금액의 10%를 공제하여 환불합니다.<br>
      <br>
      총 수업의 1/3 경과 전 : 이미 납부한 요금의 2/3해당액<br>
      <br>
      총 수업의 1/2 경과 전 : 이미 납부한 요금의 1/2해당액<br>
      <br>
      총 수업의 1/2 경과 후 : 반환하지 않음<br>

</div>

<div  style="display: flex; flex-direction: column; width: 800px; margin-top: 200px; text-align: left;" id="div3" >
<br> <br> <br> <br>
<div  style="font-size: 18px; font-weight: 700; color: rgb(48, 52, 65);">
강의 평가
</div>
		 <div class="review2">
            	<div class="rating" data-rate="${dto.avgstar}">		
	            	<div class="star-wrap">${dto.avgstar}	<div class="star2"><i class="fas fa-star"></i></div></div>
	            	<div class="star-wrap"><div class="star2"><i class="fas fa-star"></i></div></div>
	            	<div class="star-wrap"><div class="star2"><i class="fas fa-star"></i></div></div>
	            	<div class="star-wrap"><div class="star2"><i class="fas fa-star"></i></div></div>
	            	<div class="star-wrap"><div class="star2"><i class="fas fa-star"></i></div></div>
            	</div>
            </div>  
<div  style="color: rgb(154, 155, 167);  font-size: 12px; padding-bottom: 24px; border-top: 1px solid rgb(48, 52, 65);">
실제 강의자들이 남긴 평가입니다.
</div>
<div class="css-uimfca" style="color: rgb(154, 155, 167);  font-size: 12px;">
강의 후기
</div>
</div>

   <div style="margin-top: 30px; color: rgb(154, 155, 167);  font-size: 12px;  text-align: left; ">
      <div>
      <div>
         <c:forEach var="redto" items="${list}">
            <div class="review" style="border-top: 1px solid black;">
               <div>             
               <c:if test="${not empty redto.review}">
                   <div style="color: #f7e600;">   
                   <div>                      
                      <c:choose>              
                      <c:when test="${not empty redto.userphoto}">
                    <img src="../resources/upload/${redto.userphoto}" class="rounded-circle" style="width: 40px; height: 40px;  margin-top: 15px;">
               </c:when>            
                    <c:otherwise>
                       <img src="/upload/noprofilepicture.png" class="rounded-circle" style="width: 40px; height: 40px; margin-top: 15px;" >
                    </c:otherwise>           
                    </c:choose>
                   </div>                                        
                 <div class="review2">
            		<div class="rating" data-rate="${redto.star}">
	            	<div class="star-wrap"><div class="star2"><i class="fas fa-star"></i></div></div>
	            	<div class="star-wrap"><div class="star2"><i class="fas fa-star"></i></div></div>
	            	<div class="star-wrap"><div class="star2"><i class="fas fa-star"></i></div></div>
	            	<div class="star-wrap"><div class="star2"><i class="fas fa-star"></i></div></div>
	            	<div class="star-wrap"><div class="star2"><i class="fas fa-star"></i></div></div>
            	</div>
            </div>                            
                     <div>       
                    <p style="color: #000; margin-bottom: 10px;">
                     ${redto.username} (${redto.paytime})</p>    
                    <div style="color: #000; font-size: 18px;">
                        ${redto.review}
                </div>
                </div>
                    </div>
                  </c:if>
                  </div>
             </div>
         </c:forEach>
      </div>
</div>

<div style="margin: 0 auto; text-align: center; align-items: center;">
<button  class="load btn btn-outline" type="button">후기 보기</button>
<button  class="fold btn btn-outline" type="button" style="display: none;">접기</button>

</div>
 
<div style="float: left; width: 800px; margin-bottom: 100px;">
   <%--별점 및 수강평 입력 부분(로그인한 수강생이 해당강의를 수강한 학생일때만 보이게 하기--%>
   <c:set var="inmylec" value=""/> <%--내가 수강중인 lecdenum 합치기--%>
   <c:forEach var="jdto" items="${jlist}">
      <c:set var="inmylec" value="${inmylec} [${jdto.lecdenum}]"/> <%--내가 수강중인 lecdenum 합치기--%>
      <c:if test="${jdto.lecdenum==dto.lecdenum}"> <%--내 수강목록의 lecdenum과 현재 상세페이지의 lecdenum이 같아야 출력--%>
         <span class="star">
  
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
</div>
</div>
<nav class="cuz">
    <ul id="main_menu">
        <div class="btn_gotop"><a href="#"><img src="../image/tttt.png"
                                                style="width: 70%; background-color:transparent; color: black;"></a>
        </div>
        <br>
        <br>
        <li><a href="javascript:dos()" style="color: black;"><img src="../image/pointt.png"
                                                                  style="width: 80%; background-color:transparent; color: black;"></a>
            <ul class="snd_menu sub_menu" style=" background-color:transparent;">
                <br>
                <li><a href="${root}/lecture/lectureList"><img src="../image/yu.png"
                                                               style="width: 100%; background-color:transparent; color: black;">강의</a>
                </li>
                <br>
                <li><a href="${root}/board/boardFree"><img src="../image/cccb.png"
                                                           style="width: 100%;padding-left:10px;  ">커뮤니티</a></li>
                <br>
                <li><a href="${root}/qna/qnaList"><img src="../image/1ask.png" style="width:130%; padding-right: 25px;">문의하기</a>
                </li>
            </ul>
        </li>
    </ul>
</nav>
<script type="text/javascript">
   var test = "${sessionScope.loginok}";
      function gocart(e) {
           e.stopImmediatePropagation();
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
         e.stopImmediatePropagation();
      }
      
      //리뷰 내리기
      $(".review").slice(0,5).show(); // select the first ten
      $(".load").click(function(e){ // click event for load more  
	    $("div:hidden").slice(0,10).show(); // select next 10 hidden divs and show them
	    e.stopImmediatePropagation();
	      if($("div:hidden").length == 0){ // check if any hidden divs still exist   
	         $('.load').hide();
	      	 $('.fold').show();
	      }       
   		});  
      
      $(".fold").click(function(e){ // click event for load more  
    	    $(".review").slice(0,10).hide(); // select next 10 hidden divs and show them
    	    e.stopImmediatePropagation();
    	      if($("div:hidden").length != 0){ // check if any hidden divs still exist   
    	         $('.fold').hide();
    	      	 $('.load').show();
    	      }       
   	   });    
      
      
      $(document).ready(function($) {     	  
        $(".scroll_move").click(function(event){         

                event.preventDefault();

                $('html,body').animate({scrollTop:$(this.hash).offset().top}, 500);

        });
        //price 정규식
         const price = ${dto.price};
         const result = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
         document.getElementById("i_result").innerHTML=(result);

         //별 소수점까지 나타내기
         const rating =$('.rating');
         rating.each(function () {
        	const $this = $(this);
        	//정수와 소수점 구분
        	const targetScore =$this.attr('data-rate');		
        	const firstdigit =targetScore.split('.');
        	if(firstdigit.length > 1){
           		for(var i=0 ; i < firstdigit[0] ; i++){
        			$this.find('.star2').eq(i).css({width:'100%'}); 			     			
        		}	
           		$this.find('.star2').eq(firstdigit[0]).css({width:firstdigit[1]+'0%'});
        	}
        	else{
        		for(var i=0 ; i<  targetScore; i++){
        			$this.find('.star2').eq(i).css({width:'100%'}); 			     			
        		}	
        		
        	}
			
		});     
    
      
      });      
      
      $(document).ready(function dos() {
    	    $('#main_menu > li > a').click(function () {
    	        $(this).next($('.snd_menu sub_menu')).slideToggle('fast');
    	        // $(this).show($('.snd_menu sub_menu')("slide",{direction:'left'},1000));
    	    })
    	    // e.stopPropagation();

    	})
  
      
</script>
</body>
</html>