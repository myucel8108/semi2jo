<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
    <style>
        @font-face {
            font-family: 'MICEGothic Bold';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEGothic Bold.woff2') format('woff2');
            font-weight: 700;
            font-style: normal;
        }

        * {
            font-family: 'MICEGothic Bold';
        }

        div>div{
        	width: 100%;        	
        }
        
        .atag{
        	text-decoration: none;
        	color: gray;
        }
        
        .menu {
        	vertical-align: middle;
        	text-align:center;
        }
    </style>
    <script>
        $(function(){
            $(".agag").hover(function(){
                $(this).css("color","orange");
            },function(){
                $(this).css("color","black");
            });
       });
    </script>
</head>
<body>
	<c:set var="root" value="<%=request.getContextPath()%>"/> <!-- 자기 주소 얻어오기 -->
	<div class="menu">		
		<div><a class="atag">학생 관리</a></div>	
		<div><a class="atag" href="${root}/lecturelist">강의 관리</a></div>
		<div><a class="atag">게시판 관리</a></div>		        
		<div><a class="atag">Q&A 관리</a></div>
	</div>
</body>
</html>

