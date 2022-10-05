<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Management Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
    <style type="text/css">
    @font-face {
	    font-family: 'MICEGothic Bold';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEGothic Bold.woff2') format('woff2');
	    font-weight: 700;
	    font-style: normal;
	}
	
	* {
		font-family: 'MICEGothic Bold';
	}
	
	div.mainlayout1 div.main{
    	border: 1px solid gray;
    }
    
    #header {
    	width: 100%;
    	height: 100px;
    	line-height: 100px;
    	display: flex;
    	justify-content: center;
    	float: right;
    	border: 1px solid blue;
    }
    
    #menu {
    	font-size: 26px;
    	float: left;
    	width: 10%;
    	height: 80%;
    	line-height: 150px;
    	display: flex;
    	align-items: center;
    	border: 1px solid magenta;
    	justify-content: center;
    }
    
    #change {
    	float: right;
    	width: 90%;
    	height: 80%;
    	border: 1px solid aqua;
		background-color: lightgray;
    }
    
    a:link a:visited {
    	text-decoration: none;
    }
    
    a:hover {
    	cursor: pointer;
    }
    </style>
</head>
<body>
	<div class="layoutManager">
		<div class="change" id="header">
			<tiles:insertAttribute name="header"/>
		</div>
		<div class="change" id="menu">
			<tiles:insertAttribute name="menu"/>
		</div>
		<div class="change" id="change">
			<tiles:insertAttribute name="change"/>
		</div>
	</div>
</body>
</html>