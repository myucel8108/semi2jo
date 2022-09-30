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
        <style>
                *{
            font-family: 'Jua';
        }
        
        a{
        	text-decoration: none;
        }
        

        ul{
        	list-style: none;
        	text-align: center;

        }
    
        li.main{
        	float: left;
        	margin: auto;
        }
        
        li.main>a{
            display: block;
            color: #333;
            font-weight: bold;
    		width: 180px;
        }
        li.main>a:hover{
            cursor: pointer;
        }
        ul.submenu{
            font-size: 14px;
            padding-left: 0px;
        }
 
        ul.submenu>li{
            width: 180px;
            height: 20px;
            color: #333;
        }
 
        ul.submenu>li:hover{
            color:#ff720b;
            cursor: pointer;
        }
    </style>
    <script>
        $(function(){
            $("li.main>a").hover(function(){
                $(this).css("color","red");
            },function(){
                $(this).css("color","black");
            });
 
            //서브메뉴는 처음에 안보이게 처리
            $("ul.submenu").hide();
 
            //메인 제목 클릭시 서브메뉴가 나타낫다 사라졌다 하기
            $("li.main>a").click(function(){
                $(this).siblings().slideToggle('fast');
            });
 
            $("ul.submenu").hover(function(){
                $(this).slideDown();
            },function(){
                $(this).slideUp();
            });
       });
    </script>
</head>
<body>
	<c:set var="root" value="<%=request.getContextPath()%>"/> 
<p>로고위치</p>
	<div style=" margin-left: auto; margin-right: auto;">
	    <ul>
	        <!--1번째 메뉴-->
	        <li class="main">
	            <a >강의</a>
	            <ul class="submenu">
	                <li><a href="${root}/student/myCart">국어</a></li>                
	                <li><a>수학</a></li>                
	            </ul>
	        </li> 
	        <!--2번째 메뉴-->
	        <li class="main">
	            <a class="test">회원전용</a>
	            <ul class="submenu">
	                <li><a href="${root}/member/list">회원목록</a></li>
	                <li><a href="${root}/member/form">회원가입</a></li>
	                <li></li>
	            </ul>
	        </li>
	 
	         <!--3번째 메뉴-->
	         <li class="main">
	            <a class="test">게시판</a>
	            <ul class="submenu">
	                <li><a href="${root}/board/list">게시판목록</a></li>
	                <li><a href="${root}/board/form">글쓰기</a></li>
	            </ul>
	        </li>
	    	 <!--4번째 메뉴-->
	         <li class="main">        
	              <a class="test">공지사항</a>  
	    </ul>
	</div>
<div>
  <div class="container-1">
      <span class="icon"><i class="fa fa-search"></i></span>
      <input type="search" id="search" placeholder="Search..." />

	<button style=" right:0; position: absolute ;">로그인버튼</button>
	<button style=" right:90px; position: absolute ;">회원가입</button>
	</div>
</div>

</body>
</html>