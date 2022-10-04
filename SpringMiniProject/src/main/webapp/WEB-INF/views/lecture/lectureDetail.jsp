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

</head>
<body>
	<div style="display: flex;  justify-content: center; align-items: center;  background-color: black; ">    
	 <img alt="" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcReSrvKEoni0lh83iBv2RaoBWH3upjHMsg4JHdN8OYkrA&s">

	 <div>
	 야 여기 써야하는 곳이야 저리 비켜
	 </div>
	
	</div>
	<c:set  var="dto">
	<div class="container" style="float: left;">
		<div>
			강사명 : ${dto.teaname}
			위치조정
		</div>
		<div>
		강사명 : ${dto.teaname}
			위치조정		
		</div>
	</div>	
	</c:set>
</body>
</html>