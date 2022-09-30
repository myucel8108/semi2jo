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

    #logo {
    	font-weight: bold;
    	width: 20%;
    	height: 200px;
    	line-height: 200px;
    	background-color: white;
    	display: flex;
    	justify-content: center;
    	float: left;
    	border: 1px solid red;
    }
    
    #header {
    	width: 80%;
    	height: 200px;
    	line-height: 200px;
    	display: flex;
    	justify-content: center;
    	float: right;
    	border: 1px solid blue;
    }
    
    #menu {
    	float: left;
    	width: 20%;
    	height: 760px;
    	display: flex;
    	align-items: center;
    	color: gray;
    	border: 1px solid magenta;
    	justify-content: center;
    }
    
    #change {
    	float: right;
    	width: 80%;
    	height: 760px;
    	border: 1px solid aqua;
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
		<div class="change" id="logo">
			<tiles:insertAttribute name="logo"/>
		</div>
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