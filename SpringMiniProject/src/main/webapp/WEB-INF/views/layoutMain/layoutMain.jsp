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
        #header{
            background-color: white;
            height: 100px;
        }

        #change {
            width: 100%;
            float: right;
            background-color: white;           
            height : 2090px;   
        }

        #footer {
            background-color: #bac9e0;
            width: 100%;
			height: 50px;
			margin-top: 2140px;
  			    	
        }
        
    </style>
</head>
<body style="background-color: #dce4f0">

	<div>
		<div id="header">
		    <tiles:insertAttribute name="header"/>
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