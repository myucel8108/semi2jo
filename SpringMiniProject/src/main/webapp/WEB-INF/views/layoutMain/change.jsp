<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link
            href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap"
            rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
    <style type="text/css">
        *{
            font-family: 'Jua';
        }
    </style>
   	<script type="text/javascript">  			
   			$(function (){
   				
   				$("#btn_toggle1").click(function (){
   			  	$("#Toggle1").toggle();
   			  });
   				$("#btn_toggle2").click(function (){
   	   			  	$("#Toggle2").toggle();
   	   			  });
   				$("#btn_toggle3").click(function (){
   	   			  	$("#Toggle3").toggle();
   	   			  });
   				$("#btn_toggle4").click(function (){
   	   			  	$("#Toggle4").toggle();
   	   			  });
   				$("#btn_toggle5").click(function (){
   	   			  	$("#Toggle5").toggle();
   	   			  });
   				$("#btn_toggle6").click(function (){
   	   			  	$("#Toggle6").toggle();
   	   			  });
   				
   			});
   			

   	</script>
</head>
<body>
<div>
	<!-- 메인 이미지 -->
	<img alt="" src="https://vrthumb.imagetoday.co.kr/2022/07/20/ta0142t0005w13.jpg" style=" width:100%; height: 400px;">
	
	
	<div><!--과목파트-->
	
	</div>
	<div> <!-- 학원 특장점 -->
		<div style="float: left;">	
			<div id="Toggle1" style="display:none">국어설명</div>
			<div id="Toggle2" style="display:none">수학설명</div>
			<div id="Toggle3" style="display:none">영어설명</div>
			<div id="Toggle4" style="display:none">사회설명</div>
			<div id="Toggle5" style="display:none">과학설명</div>
			<div id="Toggle6" style="display:none">제2 외국어설명</div>
		</div>	
		<div style="margin-left: 50%;">	
			<button id="btn_toggle1">국어</button>
			<button id="btn_toggle2">수학</button>
			<button id="btn_toggle3">영어</button>
			<button id="btn_toggle4">사회</button>
			<button id="btn_toggle5">과학</button>
			<button id="btn_toggle6">제2 외국어</button>
		</div>
	</div>
	<div><!--  수강후기 -->
	
	
	</div>
	<div><!-- 학교 로고 -->
	
	
	 </div>
 </div>
</body>
</html>