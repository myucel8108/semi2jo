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

		 body { margin:0; padding:0; font-family:'맑은 고딕', verdana; }
		 a { color:#05f; text-decoration:none; }
		 a:hover { text-decoration:underline; }
		 
		 h1, h2, h3, h4, h5, h6 { margin:0; padding:0; }
		 ul, lo, li { margin:0; padding:0; list-style:none; }
		
		 aside#aside h3 { font-size:22px; margin-bottom:20px; text-align:center; }
		 aside#aside li { font-size:16px; text-align:center; }
		 aside#aside li a { color:#000; display:block; padding:10px 0; }
		 aside#aside li a:hover { text-decoration:none; background:#eee; }

</style>
</head>
<body>
	<div class="container" style=" display: flex;">

	<div style="width: 300px;">
		<ul>
			<li> 국어
			<ul class="low">
			<li><a href="lecture?lectypeb=문학" style="color: black;">문학</a></li>
			<li>><a href="lecture?lectypeb=비문학" style="color: black;">비문학</a></li>
			</ul>						
			</li>
			
			<li> 수학
			<ul class="low">
			<li>><a href="lecture?lectypeb=수학1" style="color: black;">수학1</a></li>
			<li>><a href="lecture?lectypeb=수학2" style="color: black;">수학2</a></li>
			<li>><a href="lecture?lectypeb=미적분" style="color: black;">미적분</a></li>
			</ul>						
			</li>
			<li> 영어
			<ul class="low">
			<li>><a href="lecture?lectypeb=독해" style="color: black;">독해</a></li>
			<li>><a href="lecture?lectypeb=문법" style="color: black;">문법</a></li>
			</ul>						
			</li>
			<li>사회
			<ul class="low">
			<li>><a href="lecture?lectypeb=경제" style="color: black;">경제</a></li>
			<li>><a href="lecture?lectypeb=사회문화" style="color: black;">사회문화</a></li>
			</ul>						
			</li>
			<li>과학
			<ul class="low">
			<li>><a href="lecture?lectypeb=과학" style="color: black;">화학</a></li>
			<li>><a href="lecture?lectypeb=생명과학" style="color: black;">생명과학</a></li>
			</ul>						
			</li>	
	<li>><a href="lecture?lectypeb=한국사" style="color: black;">한국사</a></li>
	<li>><a href="lecture?lectypeb=제2외국어" style="color: black;">제2외국어</a></li>
		</ul>	                  
	</div>
		<table class="table table-bordered">
		<c:forEach var="dto" items="${list}">
			<tr>
				<td style="width: 250px" align="center" rowspan="5">
					<a href="lectureDetail?lecdenum=${dto.lecdenum}" style="color: black;">
					<img src=" " width="230px" height="250" border="1" id="showimg">
					</a>
					<br>					
				</td>
				<td style="width: 300px">강사명 : ${dto.teaname}</td>
			</tr>
			<tr>
		 <td>	강의명 : ${dto.lecname}</td>
			
			</tr>
			<tr>
				<td>강의 과목 : ${dto.lectypea}</td>
			</tr>
			<tr>
				<td>강의 상세 과목 : ${dto.lectypeb}</td>
			</tr>
			<tr>
				<td>주소 :</td>
			</tr>
		</c:forEach>	
	</table>
	</div>
</body>
</html>