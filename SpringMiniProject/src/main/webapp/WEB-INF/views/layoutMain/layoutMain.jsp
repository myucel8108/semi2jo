<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
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
</head>

     <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<link href="${pageContext.request.contextPath}/resources/css/animate.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet" type="text/css">	
	<script src="${pageContext.request.contextPath}/resources/javascript/animate.js"></script>
    <script src="${pageContext.request.contextPath}/resources/javascript/custom.js"></script>
    <script src="${pageContext.request.contextPath}/resources/javascript/bootstrap.js"></script>

</head>
<body>
	<div>
		<div id="header">
		    <tiles:insertAttribute name="header"/>
		</div>
		<div  id="menu">
		    <tiles:insertAttribute name="menu"/>
		</div>
		<div  id="change">
		    <tiles:insertAttribute name="change"/>
		</div>
		<div  id="footer">
		    <tiles:insertAttribute name="footer"/>
		</div>	
	</div>

</body>
</html>