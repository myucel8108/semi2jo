<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
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
		#addform {
			border: 1px solid gray;
			width: 500px;
			margin: auto;
			margin-top: 100px;
			font-size: 20px;
		}

		.addinner {
			border: 1px solid red;
			height: 110px;
		}

		.sort {
			width: 50%;
			border: 1px solid blue;
			display: flex;
			float: left;
			justify-content: center;
			height: 100%;
		}

		.input {
			width: 50%;
			border: 1px solid pink;
			display: flex;
			float: right;
			height: 100%;
		}

		.title {
			width: 100%;
			height: 110px;
			border: 1px solid aqua;
			text-align: center;
			line-height: 110px;
		}

		#insertbutton{
			display: none;
		}

		#insertspan{
			cursor: pointer;
		}
	</style>
</head>
<body>
<div id="addform">
	<form action="insertlecture" method="post" enctype="multipart/form-data">
		<div class="title">
			강의 등록
		</div>
		<div class="addinner">
			<div class="sort">
				강의명
			</div>
			<div class="input">
				<input type="text" placeholder="강의명 입력" id="lecname" name="lecname"
					   required="required">
			</div>
		</div>
		<div class="addinner">
			<div class="sort">
				강사명
			</div>
			<div class="input">
				<input type="text" placeholder="강사명 입력" id="teaname" name="teaname"
					   required="required">
			</div>
		</div>
		<div class="addinner">
			<div class="sort">
				강의 대분류
			</div>
			<div class="input">
				<select id="lectypea" name="lectypea">
					<option value="none" selected>대분류</option>
					<option value="국어">국어</option>
					<option value="수학">수학</option>
					<option value="사회">사회</option>
					<option value="과학">과학</option>
					<option value="영어">영어</option>
				</select>
			</div>
		</div>
		<div class="addinner">
			<div class="sort">
				강의 중분류
			</div>
			<div class="input">
				<select id="lectypeb" name="lectypeb">
					<option value="none" selected>중분류</option>
				</select>
			</div>

			<script>
				$("#lectypea").change(function(){
					var korean = ["문학", "비문학"];
					var math = ["수학1", "수학2", "미적분"];
					var society = ["경제", "사회문화"];
					var science = ["화학", "생명과학"];
					var english = ["독해", "문법"];
					var none = ["중분류"]; //중분류 원래값으로 못돌려놔서 짜치는 방법으로 어거지로 쑤셔박았음. 수정 요망.
					var selected;
					if($(this).val() == "국어"){
						selected = korean;
					} else if($(this).val() == "수학"){
						selected = math;
					} else if($(this).val() == "사회"){
						selected = society;
					} else if($(this).val() == "과학"){
						selected = science;
					} else if($(this).val() == "영어"){
						selected = english;
					} else if($(this).val() == "none"){ //중분류 원래값으로 못돌려놔서 짜치는 방법으로 어거지로 쑤셔박았음. 수정 요망.
						selected = none;
					}
					option(selected);
				});

				function option(selected) {
					var s = "";

					$.each(selected, function (i, subject) {
						s += "<option class='a' value='" + subject + "'>" + subject + "</option>";
					});

					$("#lectypeb").html(s);
				}
			</script>

		</div

		<div class="addinner">
			<span id="insertspan">강의 등록</span>
			<button type="submit" id="insertbutton">강의 등록</button>
		</div>

		<script>
			$("#insertspan").click(function () {
				$("#insertbutton").click();
				alert("강의가 등록되었습니다");
			});
		</script>

	</form>
</div>
</body>
</html>