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
</head>
<body>
<div>home file testing</div>
<<<<<<< HEAD
<c:set var="root" value="<%=request.getContextPath() %>"></c:set>


<button onclick="location.href='${root }/login'">로그인</button>
<button onclick="location.href='${root }/addAccount'">회원가입</button>

=======
<button>
	<c:set var="root" value="<%=request.getContextPath()%>"/>
<a href="${root}/lecture/lectureList">가자!</a>
</button>
>>>>>>> origin/taemin
</body>
</html>