<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/manager/all.min.css" type="text/css">
    <link rel="stylesheet" href="css/manager/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/manager/ruang-admin.min.css">

    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <style type="text/css">
        .mb-4 {
            font-size: 19px;
            width: 87.1vw;
        }

        .m-0 {
            font-size: 25px;
        }

        .button-container {
            display: flex;
            justify-content: right;
        }

        .card {
            width: 500px;
            margin: auto;
            margin-top: 50px;
            box-shadow: none;
            line-height: 3;
        }
    </style>
</head>
<body>
<!-- Form Basic -->
<div class="card mb-4">
    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
        <h6 class="m-0 font-weight-bold text-dark">강좌 등록</h6>
    </div>
    <div class="card-body">
        <form action="insertlecture" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label>강좌명</label>
                <input type="text" class="form-control btn-outline-secondary" name="lecname"
                       aria-describedby="emailHelp"
                       placeholder="과목명 입력">
            </div>
            <div class="form-group">
                <label>강사명</label>
                <input type="text" class="form-control btn-outline-secondary" name="teaname" placeholder="강사명 입력">
            </div>
            <div class="form-group">
                <label for="lectypea">강좌 대분류</label>
                <select id="lectypea" name="lectypea" class="form-control btn-outline-secondary">
                    <option value="none" selected>대분류</option>
                    <option value="국어">국어</option>
                    <option value="수학">수학</option>
                    <option value="영어">영어</option>
                    <option value="사회탐구">사회탐구</option>
                    <option value="과학탐구">과학탐구</option>
                    <option value="제2외국어">제2외국어</option>
                </select>
            </div>
            <div class="form-group">
                <label for="lectypeb">강좌 중분류</label>
                <select id="lectypeb" name="lectypeb" class="form-control btn-outline-secondary">
                    <option value="none" selected>중분류</option>
                </select>
            </div>
            <div class="form-group">
                <label for="photoupload">사진</label>
                <input type="file" class="form-control btn-outline-secondary" id="photoupload" name="photoupload">
            </div>
            <br>
            <div class="button-container">
                <button type="submit" id="insertbutton" class="btn btn-dark">강좌 등록</button>
                <button type="button" id="cancelbutton" class="btn btn-outline-secondary">강좌 등록 취소</button>
            </div>
        </form>
    </div>
</div>
</body>
<script>
    $("#lectypea").change(function () {
        var korean = ["독서·문학·화법과 작문", "국어종합", "독해", "문법"];
        var math = ["수학종합", "수학기초", "수학심화"];
        var english = ["영어", "영어듣기"];
        var society = ["역사", "지리", "경제", "윤리", "정치와 법", "사회·문화"];
        var science = ["물리", "화학", "생명과학", "지구과학"];
        var foreign = ["아시아", "유럽", "한문"]
        var none = ["중분류"]; //중분류 원래값으로 못돌려놔서 짜치는 방법으로 어거지로 쑤셔박았음. 수정 요망.
        var selected;
        if ($(this).val() == "국어") {
            selected = korean;
        } else if ($(this).val() == "수학") {
            selected = math;
        } else if ($(this).val() == "영어") {
            selected = english;
        } else if ($(this).val() == "사회탐구") {
            selected = society;
        } else if ($(this).val() == "과학탐구") {
            selected = science;
        } else if ($(this).val() == "제2외국어") {
            selected = foreign;
        } else if ($(this).val() == "none") { //중분류 원래값으로 못돌려놔서 짜치는 방법으로 어거지로 쑤셔박았음. 수정 요망.
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

    $("#insertbutton").click(function () {
        alert("강좌가 등록되었습니다");
    });
    $("#cancelbutton").click(function () {
        history.back();
    });
</script>
</html>