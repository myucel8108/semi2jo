<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
<style>
img {
  vertical-align: top;
}
.banner_img, .banner_bg{
  display:inline-block;
  position: relative;
}
.banner_img:hover:after,
.banner_img:hover > .hover_text,
.banner_bg:hover:after,
.banner_bg:hover > .hover_text
{
  display:block;
}
.banner_img:after,.banner_bg:after,.hover_text{
  display:none;
}
.banner_img:after,.banner_bg:after{
  content:'';
  position: absolute;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  background: rgba(0, 0, 0, 0.3);
  z-index: 10;
}
.banner_img {
  overflow: hidden;
}
.banner_img img{
  height: 340px;
}
.banner_img:hover img{
  transform: scale(1.2);
  transition: 1s;
}
.hover_text {
  position: absolute;
  top: 100px;
  left: 25px;
  color: #fff;
  z-index: 20;
  font-weight: 600;
  font-size: 20px;
}

#Accordion_wrap{
position: relative;
}
h1+p {
  font-weight: 300;
}
h1+p a {
  color: #333;
}
h1+p a:hover {
  text-decoration: none;
}
h2 {
  padding: 0;
  font-weight: 300;
}
h2 span {
  margin-left: 1em;
  color: #aaa;
  font-size: 85%;
}
.column {
  margin: 15px 15px 0;
  padding: 0;
}
.column:last-child {
  padding-bottom: 60px;
}
.column::after {
  content: '';
  clear: both;
  display: block;
}
.column div {
  position: relative;
  float: left;
  width: 300px;
  height: 200px;
  margin: 0 0 0 25px;
  padding: 0;
}
.column div:first-child {
  margin-left: 0;
}
.column div span {
  position: absolute;
  bottom: -20px;
  left: 0;
  z-index: -1;
  display: block;
  width: 300px;
  margin: 0;
  padding: 0;
  color: #444;
  font-size: 18px;
  text-decoration: none;
  text-align: center;
  -webkit-transition: .3s ease-in-out;
  transition: .3s ease-in-out;
  opacity: 0;
}
figure {
  width: 300px;
  height: 200px;
  margin: 0;
  padding: 0;
  background: #fff;
  overflow: hidden;
}
figure
/* Opacity #1 */
.hover11 figure img {
  opacity: 1;
  -webkit-transition: .3s ease-in-out;
  transition: .3s ease-in-out;
}
.hover11 figure:hover img {
  opacity: .5;
}
   *{
     box-sizing: border-box; 
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
   position: absolute;
 
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
</style>
</head>
<body>
   <div class="container" style=" display: flex; min-height: 1000px;">
   <div id="Accordion_wrap" style="width: 300px; margin-top: 50px; margin-left: 100px; ">
     <div class="que">
      <span><i class='fas fa-book-open'></i> 국어</span>
       <div class="arrow-wrap">
         <span class="arrow-top">↑</span>
        <span class="arrow-bottom">↓</span>
       </div> 
     </div>
     <div class="anw">
       <div style="padding: 10px 0; border-bottom: 1px solid #dddddd;">
     <a href="lectureList?lectypea=국어" style="color: black; text-decoration:none; margin-bottom: 5px;">국어</a>
   </div>
     <div style="padding: 10px 0; border-bottom: 1px solid #dddddd;">
     <a href="lectureList?lectypeb=문학" style="color: black; text-decoration:none; margin-bottom: 5px;">문학</a>
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
     <a href="lectureList?lectypea=수학" style="color: black; text-decoration:none; margin-bottom: 5px;">수학</a>
   </div>
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
     <a href="lectureList?lectypea=영어" style="color: black; text-decoration:none; margin-bottom: 5px;">영어</a>
   </div>
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
     <a href="lectureList?lectypea=사회" style="color: black; text-decoration:none; margin-bottom: 5px;">사회</a>
   </div>
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
     <a href="lectureList?lectypea=과학" style="color: black; text-decoration:none; margin-bottom: 5px;">과학</a>
   </div>
     <div style="padding: 10px 0; border-bottom: 1px solid #dddddd;">
    <a href="lectureList?lectypeb=화학" style="color: black; text-decoration:none;">화학</a>
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

   <div style="width:2500px; margin-top: 50px; margin-left: 50px; margin-bottom: 30px; ">   
     
      <c:forEach var="dto" items="${list}">
        <div style= "float:left; padding: 30px;">
      <a class="banner_img"  href="lectureDetail?lecdenum=${dto.lecdenum}" style="text-decoration:none;">                         
                     <img src="https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9788954762946.jpg" style=" width:200px ;height:200px; border:1px; "id="showimg">                        	
               
               <p class="hover_text">${dto.teaname}</p>
                </a>
               
                 <p>과목명:${dto.lecname}</p>
               </div>
              
      </c:forEach>   
      </div>
</div>
   <script type="text/javascript">
   
   $(".que").click(function() {
         $(this).next(".anw").stop().slideToggle(300);
        $(this).toggleClass('on').siblings().removeClass('on');
        $(this).next(".anw").siblings(".anw").slideUp(300); // 1개씩 펼치기
      });
   
   $(document).ready(function(){
	   var currentPosition = parseInt($("#Accordion_wrap").css("top"));
	   $(window).scroll(function() {
	     var position = $(window).scrollTop(); 
	     $("#Accordion_wrap").stop().animate({"top":position+currentPosition+"px"},300);
	   });
	 });
   
   
   
   </script>
</body>
</html>
