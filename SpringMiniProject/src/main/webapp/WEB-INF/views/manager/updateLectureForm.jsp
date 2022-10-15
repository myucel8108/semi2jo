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

    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <style type="text/css">
        .mb-4 {
            font-size: 19px;
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
            line-height: 3;
        }

        .card {
            box-shadow: none;
        }
    </style>
</head>
<body>
<!-- Form Basic -->
<div class="card mb-4">
    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
        <h6 class="m-0 font-weight-bold text-dark">강좌 수정</h6>
    </div>
    <div class="card-body">
        <form action="updatelecture?lecnum=${dto.lecnum}" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label>강좌명</label>
                <input type="text" class="form-control btn-outline-secondary" name="lecname"
                       aria-describedby="emailHelp"
                       placeholder="과목명 입력" value="${dto.lecname}">
            </div>
            <div class="form-group">
                <label>강사명</label>
                <input type="text" class="form-control btn-outline-secondary" name="teaname" placeholder="강사명 입력"
                       value="${dto.teaname}">
            </div>
            <div class="form-group">
                <label for="lectypea">강좌 대분류</label>
                <select id="lectypea" name="lectypea" class="form-control btn-outline-secondary">
                    <option class="none" value="none">대분류</option>
                    <option class="korean" value="국어" ${dto.lectypea=='국어'?'selected':''}>국어</option>
                    <option class="math" value="수학" ${dto.lectypea=='수학'?'selected':''}>수학</option>
                    <option class="english" value="영어" ${dto.lectypea=='영어'?'selected':''}>영어</option>
                    <option class="society" value="사회탐구" ${dto.lectypea=='사회탐구'?'selected':''}>사회탐구</option>
                    <option class="science" value="과학탐구" ${dto.lectypea=='과학탐구'?'selected':''}>과학탐구</option>
                    <option class="foreign" value="제2외국어" ${dto.lectypea=='제2외국어'?'selected':''}>제2외국어</option>
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
                <button type="submit" id="update-button" class="btn btn-dark">강좌 수정</button>
                <button type="button" id="cancelbutton" class="btn btn-outline-secondary">강좌 수정 취소</button>
            </div>
        </form>
    </div>
</div>
</body>
<script>
    $(function () {
        calltype();

    });

    //DB에서 typeA 값 가져오면 typeB 값도 가져오기(상단 스크립트에서 페이지 로드 될 때 함수 실행)
    function calltype() {
        var a = $("#lectypea").val();

        var korean = ["독서·문학·화법과 작문", "국어종합", "독해", "문법"];
        var math = ["수학종합", "수학기초", "수학심화"];
        var english = ["영어", "영어듣기"];
        var society = ["역사", "지리", "경제", "윤리", "정치와 법", "사회·문화"];
        var science = ["물리", "화학", "생명과학", "지구과학"];
        var foreign = ["아시아", "유럽", "한문"]
        var none = ["중분류"];
        var selected = [];

        if (a == "국어") {
            selected = korean;
        } else if (a == "수학") {
            selected = math;
        } else if (a == "사회탐구") {
            selected = society;
        } else if (a == "과학탐구") {
            selected = science;
        } else if (a == "영어") {
            selected = english;
        } else if (a == "제2외국어") {
            selected = foreign;
        } else if (a == "none") {
            selected = none;
        }
        option(selected);
        // console.log("test1");
        // console.log("test-selected"+selected);
    }

    function option(selected) {
        var s = "";
        // console.log("function options");
        // console.log(selected);
        $.each(selected, function (i, subject) {
            var ii = '${dto.lectypeb}';
            // console.log("subject");
            // console.log("111="+sub+","+ii);
            if (subject == ii) {
                s += "<option class='a' selected value='" + subject + "'>" + subject + "</option>";
            } else {
                s += "<option class='a' value='" + subject + "'>" + subject + "</option>";

            }
        });
        $("#lectypeb").html(s);
    }

    $("#update-button").click(function () {
        alert("강좌가 수정되었습니다");
    });
    $("#cancelbutton").click(function () {
        history.back();
    });

    //분류 DB에서 가져오기 시도하다가 포기
    <%--var temp = document.getElementById('lectypea');--%>
    <%--for (var i=1; i<temp.options.length; i++){--%>
    <%--    if ("${dto.lectypea}"==temp.options[i].value){--%>
    <%--        temp.options[i].selected="true";--%>
    <%--    }--%>
    <%--}--%>

    <%--$(function () {--%>
    <%--    $(document).on('change', '#lectypea', function () {--%>
    <%--        if ("#lectypea"=="${dto.lectypea}"){--%>
    <%--            getTypeb();--%>
    <%--        }--%>
    <%--    });--%>
    <%--});--%>

    <%--function getTypeb() {--%>
    <%--    var temp2 = document.getElementById('lectypeb');--%>
    <%--    for (var i=1; i<temp2.options.length; i++){--%>
    <%--        if ("${dto.lectypeb}"==temp2.options[i].value){--%>
    <%--            temp2.options[i].selected="true";--%>
    <%--        }--%>
    <%--    }--%>
    <%--}--%>
</script>
</html>