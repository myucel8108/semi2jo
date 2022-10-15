<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Yeon+Sung&display=swap" rel="stylesheet">
    <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
<style>

    img {
        vertical-align: top;
    }

    .banner_img, .banner_bg {
        display: inline-block;
        position: relative;
    }

    .banner_img:hover:after,
    .banner_img:hover > .hover_text,
    .banner_bg:hover:after,
    .banner_bg:hover > .hover_text {
        display: block;
    }

    .banner_img:after, .banner_bg:after, .hover_text {
        display: none;
    }

    .banner_img:after, .banner_bg:after {
        content: '';
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

    .banner_img img {
        height: 340px;
    }

    .banner_img:hover img {
        transform: scale(1.5);
        transition: 1s;
    }

    .hover_text {
        position: absolute;
        top: 60px;
        left: 25px;
        color: #fff;
        z-index: 20;
        font-weight: 600;
        font-size: 20px;
    }

    #Accordion_wrap {
        position: absolute;
        
    	}

    h1 + p {
        font-weight: 300;
    }

    h1 + p a {
        color: #333;
    }

    h1 + p a:hover {
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

    * {
        box-sizing: border-box;
    }

    .que:first-child {
        border-top: 1px solid black;
    }

    .que {
        position: relative;
        padding: 12px 0;
        cursor: pointer;
        font-size: 14px;
        border-bottom: 1px solid black;

    }

    .que::before {
        display: inline-block;
        /*content: ;*/
        font-size: 14px;
        margin: 0 5px;
    }

    .que.on > span {
        font-weight: bold;
    }

    .anw {
        display: none;
        overflow: hidden;
        font-size: 14px;
        text-align: center;
        border-bottom: 1px solid #e4e4e4;
        border-radius: 4px;
        font-size: 1rem;

    }

    #explain {
        opacity: 0;
        position: absolute;

    }

    .text_photo:hover #explain {
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
        top: 50%;
        right: 10px;
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
     .fa-star{
	color:#F05522;
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
</head>
<body class="test">
<div class="container" style=" display: flex; ">
    <div id="Accordion_wrap" style="width: 150px; margin-top: 50px; text-align: center;">
        <div>

            <div class="que">
                <a href="lectureList"><i class='fas fa-list'></i>&nbsp;<b>전체보기</b></a>
            </div>

            <div class="que">
                <span><i class='fas fa-book-open'></i>&nbsp;&nbsp;국어</span>
                <div class="arrow-wrap">
                    <span class="arrow-top"><i class='fas fa-angle-up'></i></span>
                    <span class="arrow-bottom"><i class='fas fa-angle-down'></i></span>
                </div>
            </div>
            <div class="anw">
                <div style="padding: 10px 0; border-bottom: 1px solid #dddddd;">
                    <a href="lectureList?lectypeb=국어종합" style="color: black; text-decoration:none; margin-bottom: 5px;">국어종합</a>
                </div>
                <div style="padding: 10px 0; border-bottom: 1px solid #dddddd;">
                    <a href="lectureList?lectypeb=독해"
                       style="color: black; text-decoration:none; margin-bottom: 5px;">독해</a>
                </div>
                <div style="padding: 10px 0; border-bottom: 1px solid #dddddd;">
                    <a href="lectureList?lectypeb=문법" style="color: black; text-decoration:none;">문법</a>
                </div>
            </div>


            <div class="que">
                <span><i class='fas fa-calculator'></i>&nbsp;&nbsp;수학</span>
                <div class="arrow-wrap">
                    <span class="arrow-top"><i class='fas fa-angle-up'></i></span>
                    <span class="arrow-bottom"><i class='fas fa-angle-down'></i></span>
                </div>
            </div>
            <div class="anw">
                <div style="padding: 10px 0; border-bottom: 1px solid #dddddd;">
                    <a href="lectureList?lectypeb=수학종합"
                       style="color: black; text-decoration:none; margin-bottom: 5px;">수학종합</a>
                </div>
                <div style="padding: 10px 0; border-bottom: 1px solid #dddddd;">
                    <a href="lectureList?lectypeb=수학기초"
                       style="color: black;text-decoration:none; margin-bottom: 1px;">수학기초</a>
                </div>
                <div style="padding: 10px 0; border-bottom: 1px solid #dddddd;">
                    <a href="lectureList?lectypeb=수학심화" style="color: black;text-decoration:none;">수학심화</a>
                </div>
            </div>


            <div class="que">
                <span><i class='fab fa-amilia'></i>&nbsp;&nbsp;영어</span>
                <div class="arrow-wrap">
                    <span class="arrow-top"><i class='fas fa-angle-up'></i></span>
                    <span class="arrow-bottom"><i class='fas fa-angle-down'></i></span>
                </div>
            </div>
            <div class="anw">
                <div style="padding: 10px 0; border-bottom: 1px solid #dddddd;">
                    <a href="lectureList?lectypeb=영어" style="color: black; text-decoration:none; margin-bottom: 5px;">영어</a>
                </div>
                <div style="padding: 10px 0; border-bottom: 1px solid #dddddd;">
                    <a href="lectureList?lectypeb=영어듣기" style="color: black; text-decoration:none;">영어듣기</a>
                </div>
            </div>


            <div class="que">
                <span> <i class='fas fa-balance-scale'></i>&nbsp;&nbsp;사회</span>
                <div class="arrow-wrap">
                    <span class="arrow-top"><i class='fas fa-angle-up'></i></span>
                    <span class="arrow-bottom"><i class='fas fa-angle-down'></i></span>
                </div>
            </div>
            <div class="anw">
                <div style="padding: 10px 0; border-bottom: 1px solid #dddddd;">
                    <a href="lectureList?lectypea=역사"
                       style="color: black; text-decoration:none; margin-bottom: 5px;">역사</a>
                </div>
                <div style="padding: 10px 0; border-bottom: 1px solid #dddddd;">
                    <a href="lectureList?lectypeb=지리" style="color: black; text-decoration:none;">지리</a>
                </div>
                <div style="padding: 10px 0; border-bottom: 1px solid #dddddd;">
                    <a href="lectureList?lectypeb=경제" style="color: black; text-decoration:none;">경제</a>
                </div>
                <div style="padding: 10px 0; border-bottom: 1px solid #dddddd;">
                    <a href="lectureList?lectypeb=윤리" style="color: black; text-decoration:none;">윤리</a>
                </div>
                <div style="padding: 10px 0; border-bottom: 1px solid #dddddd;">
                    <a href="lectureList?lectypeb=정치와 법" style="color: black; text-decoration:none;">정치와법</a>
                </div>
                <div style="padding: 10px 0; border-bottom: 1px solid #dddddd;">
                    <a href="lectureList?lectypeb=사회·문화" style="color: black; text-decoration:none;">사회·문화</a>
                </div>
            </div>


            <div class="que">
                <span><i class='fas fa-atom'></i>&nbsp;&nbsp;과학</span>
                <div class="arrow-wrap">
                    <span class="arrow-top"><i class='fas fa-angle-up'></i></span>
                    <span class="arrow-bottom"><i class='fas fa-angle-down'></i></span>
                </div>
            </div>
            <div class="anw">
                <div style="padding: 10px 0; border-bottom: 1px solid #dddddd;">
                    <a href="lectureList?lectypeb=생명과학" style="color: black; text-decoration:none; margin-bottom: 5px;">생명과학</a>
                </div>
                <div style="padding: 10px 0; border-bottom: 1px solid #dddddd;">
                    <a href="lectureList?lectypeb=지구과학" style="color: black; text-decoration:none;">지구과학</a>
                </div>
                <div style="padding: 10px 0; border-bottom: 1px solid #dddddd;">
                    <a href="lectureList?lectypeb=화학" style="color: black; text-decoration:none;">화학</a>
                </div>
                <div style="padding: 10px 0; border-bottom: 1px solid #dddddd;">
                    <a href="lectureList?lectypeb=물리" style="color: black; text-decoration:none;">물리학</a>
                </div>
            </div>


            <div class="que">
                <span><i class='fas fa-language'></i>&nbsp;&nbsp;제2외국어</span>
                <div class="arrow-wrap">
                    <span class="arrow-top"><i class='fas fa-angle-up'></i></span>
                    <span class="arrow-bottom"><i class='fas fa-angle-down'></i></span>
                </div>
            </div>
            <div class="anw">
                <div style="padding: 10px 0; border-bottom: 1px solid #dddddd;">
                    <a href="lectureList?lectypeb=아시아" style="color: black; text-decoration:none;">아시아</a>
                </div>
                <div style="padding: 10px 0; border-bottom: 1px solid #dddddd;">
                    <a href="lectureList?lectypeb=유럽" style="color: black; text-decoration:none;">유럽</a>
                </div>
                <div style="padding: 10px 0; border-bottom: 1px solid #dddddd;">
                    <a href="lectureList?lectypeb=한문" style="color: black; text-decoration:none;">한문</a>
                </div>
            </div>
        </div>
    </div>

    <div style="width:100%; height:100%; margin-top: 25px; margin-left: 150px; margin-bottom: 30px; ">
        <c:forEach var="lecdto" items="${list}">
        
            <div style="float:left; padding: 30px;">
                <a class="banner_img" href="lectureDetail?lecdenum=${lecdto.lecdenum}">
                    <img src="../upload/lecture/${lecdto.lecphoto}"
                         style=" width:240px ;height:320px;" id="showimg">                
                <div class="review2 hover_text" style="margin-left: 50px; margin-top: 5px;">
                	<p class="" style="padding: 0 auto;">${lecdto.teaname} 강사 <br>${lecdto.lectypea}<br>${lecdto.lectypeb}
            		 <p style="font-size: 12px;">별점:${lecdto.avgstar}</p></p>
            		<div class="rating" data-rate="${lecdto.avgstar}">
	            	<div class="star-wrap"><div class="star2"><i class="fas fa-star"></i></div></div>
	            	<div class="star-wrap"><div class="star2"><i class="fas fa-star"></i></div></div>
	            	<div class="star-wrap"><div class="star2"><i class="fas fa-star"></i></div></div>
	            	<div class="star-wrap"><div class="star2"><i class="fas fa-star"></i></div></div>
	            	<div class="star-wrap"><div class="star2"><i class="fas fa-star"></i></div></div>
	            
            	</div>           
            </div>              
                </a>
                <div>
                <p style="text-align: center; margin: 0 auto;">${lecdto.lecname}<br>₩${lecdto.price} </p>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
<script type="text/javascript">
    $(".que").click(function () {
        $(this).next(".anw").stop().slideToggle(300);
        $(this).toggleClass('on').siblings().removeClass('on');
        $(this).next(".anw").siblings(".anw").slideUp(300); // 1개씩 펼치기
    });

    $(document).ready(function () {
        var currentPosition = parseInt($("#Accordion_wrap").css("top"));
        $(window).scroll(function () {
        	
        	var position = $(window).scrollTop();
            $("#Accordion_wrap").stop().animate({"top": position + currentPosition + "px"}, 300);
            
            
        });
        
        
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

    
</script>
</body>
</html>
