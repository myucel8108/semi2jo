<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
 <!--    <style>
        *{
            font-family: 'abster';
        }
        .searcharea{
            margin-top: 50px;
            margin-left: 50px;
        }
        .menulist{
            width: 300px;
            /*height: 450px;*/
            height: 100%;
            border: 1px solid gray;
            text-align: center;
            margin-top: 50px;
            padding-top: 10px;
            font-size: 30px;
            background-color: darkblue;
            margin-left: 0%;
            color: white;
        }
        .menulist a{
            cursor: pointer;
        }

        .box
        {
            width: 900px;
            height: 100%;
            border: 1px solid gray;
            text-align: center;
            line-height: 900px;
            margin-bottom: 300px;

        }
        .superbox{
            vertical-align: middle;
        }
    </style> -->
<style>
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
	  border-bottom: 1px solid #dddddd;
	  
	}
	  
	.que::before{
	  display: inline-block;
	  content: '과목';
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
		position: absolute; opacity: 0; 
		} 
		
		.text_photo:hover #explain{ 
		opacity: 1; 
		}
	.anw::before {
	  display: inline-block;
	  content: ;
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
		 body { margin:0; padding:0; font-family:'맑은 고딕', verdana; }
		 
		 h1, h2, h3, h4, h5, h6 { margin:0; padding:0; }
		 ul, lo, li { margin:0; padding:0; list-style:none; }
</style>
</head>
<body>
	<div class="container" style=" display: flex; min-height: 2500px;">

	<div id="Accordion_wrap" style="width: 150px; ">
     <div class="que">
      <span>국어</span>
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
      <span>수학</span>
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
		<a href="lectureList?lectypeb=미적분" style="color: black;text-decoration:none;">미적분</a>
     </div>    
     </div>
          <div class="que">
      <span>영어</span>
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
      <span>사회</span>
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
      <span>과학</span>
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
      <span>그 외</span>
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

	<div style="width:1500px; margin-top: 30px; margin-left: 30px; margin-bottom: 30px; ">	
		<c:forEach var="dto" items="${list}">
					<div  class="text_photo" style="padding-left: 30px; padding-top: 30px; float: left; ">
					<p id = 'explain'>${dto.lecname}</p> 
						<a href="lectureDetail?lecdenum=${dto.lecdenum}" style="text-decoration:none;">
						
							<img src=" " width="230px" height="250" border="1" id="showimg"></a>
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
	
	</script>
</body>
</html>