<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
    <link rel="stylesheet" href="resources/css/manager/insertLectureDetailForm.css">
    <style type="text/css">
        .select-room {
            width: 150px;
            height: 32px;
            border: 1px solid lightgray;
            border-radius: 2px;
        }

        .container {
            margin-top: 50px;
            height: 81vh;
        }

        .margin-box {
            margin-bottom: 20px;
        }

        label {
            margin-bottom: 10px;
        }

        .body-check {
            line-height: 30px;
        }

        .title-box {
            margin-bottom: 30px;
        }

        .button-box {
            display: flex;
            justify-content: end;
        }

        .data-box {
            padding: 90px 90px 30px 90px;
        }
    </style>
</head>
<body class="body-check">
<div class="container">
    <form action="updateLectureDetail?lecdenum=${dto.lecdenum}" method="post">
        <input hidden="hidden" name="lecnum" value="${dto.lecnum}">
        <input hidden="hidden" name="lecname" value="${dto.lecname}">
        <div class="row gutters">
            <div class="col-xl-3 col-lg-3 col-md-12 col-sm-12 col-12">
                <div class="card h-100">
                    <div class="card-body">
                        <div class="account-settings">
                            <div class="user-profile">
                                <br>
                                <br>
                                <br>
                                <div class="user-avatar">
                                    <c:if test="${dto.lecphoto!=null}">
                                        <img src="upload/lecture/${dto.lecphoto}" class="img-full">
                                    </c:if>
                                    <c:if test="${dto.lecphoto==null}">
                                        <img src="resources/image/noimage2.png" class="img-full">
                                    </c:if>
                                </div>
                                <br>
                                <h4 class="user-name">${dto.lecname}</h4>
                                <h6 class="user-email">[${dto.lectypea}]-${dto.lectypeb}</h6>
                            </div>
                            <div class="about">
                                <h5 class="text-dark">${dto.teaname}</h5>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-9 col-lg-9 col-md-12 col-sm-12 col-12">
                <div class="card h-100">
                    <div class="card-body data-box">
                        <div class="row gutters">
                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 title-box">
                                <h3 class="mb-2 text-dark">강의 등록</h3>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12 margin-box">
                                <div class="form-group">
                                    <label for="fullName" id="room-label" name="roomnum">강의실</label>
                                    <br>
                                    <select class="select-room" id="fullName" style="font-size: 13px" name="roomnum">
                                        <option class="room-option" value="101">101</option>
                                        <option class="room-option" value="102">102</option>
                                        <option class="room-option" value="201">201</option>
                                        <option class="room-option" value="202">202</option>
                                        <option class="room-option" value="301">301</option>
                                        <option class="room-option" value="302">302</option>
                                        <option class="room-option" value="401">401</option>
                                        <option class="room-option" value="402">402</option>
                                        <option class="room-option" value="501">501</option>
                                        <option class="room-option" value="502">502</option>
                                        <option class="room-option" value="601">601</option>
                                        <option class="room-option" value="602">602</option>
                                        <option class="room-option" value="701">701</option>
                                        <option class="room-option" value="702">702</option>
                                        <option class="room-option" value="801">801</option>
                                        <option class="room-option" value="802">802</option>
                                        <option class="room-option" value="901">901</option>
                                        <option class="room-option" value="902">902</option>
                                        <option class="room-option" value="1001">1001</option>
                                        <option class="room-option" value="1002">1002</option>
                                        <option class="room-option" value="1101">1101</option>
                                        <option class="room-option" value="1102">1102</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label>수강료</label>
                                    <input type="text" class="form-control lec-price" oninput="numberOnly(this)" name="price" placeholder="수강료 입력"
                                           value="${dto.price}">
                                </div>
                                <br>
                                <br>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12 margin-box">
                                <div class="form-group">
                                    <label>수강일</label>
                                    <br>
                                    <label><input type="checkbox" class="lecday" name="lecday" value="1"> 월요일</label>
                                    <label><input type="checkbox" class="lecday" name="lecday" value="2"> 화요일</label>
                                    <label><input type="checkbox" class="lecday" name="lecday" value="3"> 수요일</label>
                                    <label><input type="checkbox" class="lecday" name="lecday" value="4"> 목요일</label>
                                    <label><input type="checkbox" class="lecday" name="lecday" value="5"> 금요일</label>
                                    <br>
                                    <label><input type="checkbox" class="lecday" name="lecday" value="6"> 토요일</label>
                                    <label><input type="checkbox" class="lecday" name="lecday" value="7"> 일요일</label>
                                </div>
                                <span name="showLecday"></span>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <div style="margin-bottom: 10px">강의 시간</div>
                                    <span id="lec-time">
                                    </span>
                                </div>
                            </div>
                        </div>
                        <br>
                        <div class="row gutters">
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12 margin-box">
                                <div class="form-group">
                                    <label>강의월</label>
                                    <br>
                                    <select class="select-room lec-month" name="lecmonth" style="font-size: 13px">
                                    </select>
                                </div>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label for="lecture-year">강의 년도</label>
                                    <input type="number" class="form-control" id="lecture-year" name="lecyear"
                                           oninput="numberOnly(this)" placeholder="강의 년도" value="${dto.lecyear}">
                                </div>
                            </div>
                        </div>
                        <br>
                        <br>
                        <br>
                        <div class="row gutters">
                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                <div class="text-right button-box">
                                    <button type="submit" name="updateDetail" class="btn btn-outline-dark">수정하기
                                    </button> &nbsp;
                                    <button type="button" id="detail-Back" class="btn btn-outline-secondary">돌아가기
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
<script>
    var temp = document.getElementById('fullName');
    for (var i = 1; i < temp.options.length; i++) {
        if ("${dto.roomnum}" == temp.options[i].value) {
            temp.options[i].selected = "true";
        }
    }

    //수강일 DB값 얻어와서 출력
    var lecday = "${dto.lecday}";
    var lecday_arr = lecday.split(",");
    console.log(lecday_arr);
    $("input[name='lecday']").each(function () {
        for (var j=0; j<lecday_arr.length; j++){
            if (lecday_arr[j]==this.value){
                $(this).attr("checked", true);
            };
        };
    })

    //강의 시간 반복문
    var lecHtml = '';
    // $("#lecTime-button").click(function () {
    for (var i = 1; i <= 10; i++) {
        lecHtml += "<label><input type='checkbox' name='lectime' value = '" + i + "'> " + i + "교시</input></label>&nbsp;&nbsp;";
    };

    $("#lec-time").html(lecHtml);

    //강의 시간 DB값 얻어와서 출력
    var lectime = "${dto.lectime}";
    var lectime_arr = lectime.split(",");
    console.log(lectime_arr);
    $("input[name='lectime']").each(function () {
        for (var j=0; j<lectime_arr.length; j++){
            if (lectime_arr[j]==this.value){
                $(this).attr("checked", true);
            };
        };
    })

    //DB에서 강의월 얻어와서 강의월에 출력
    var html = '';
    for (var i = 1; i <= 12; i++) {
        html += "<option value = '" + i + "'>" + i + "월</option>";
    }
    $(".lec-month").append(html);
    $(".lec-month").val(${dto.lecmonth});

    $(".lec-month option").filter(function () {
        //may want to use $.trim in here
        return $(this).text() == ${dto.lecmonth};
    }).attr('selected', true);

    //년도에 숫자만 들어가게
    const numberOnly = (target) => {
        // 숫자만 남긴 후 포맷
        target.value = Number(target.value
            .replace(/[^0-9]/g, ''))
    }

    //돌아가기 버튼 누르면 뒤로가기
    $("#detail-Back").click(function () {
        history.back();
    });
</script>
</body>
</html>