<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/manager/userDetail.css">
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
    <style type="text/css">
        .userdetailphoto {
            text-align: center;
        }
    </style>
</head>
<body>
<c:set var="root" value="<%=request.getContextPath()%>"></c:set>
<section class="detail-section">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 mb-4 mb-sm-5">
                <div class="card card-style1 border-0">
                    <div class="card-body p-1-9 p-sm-2-3 p-md-6 p-lg-7">
                        <div class="row align-items-center">
                            <div class="col-lg-6 mb-4 mb-lg-0 userdetailphoto">
                                <c:if test="${userdto.userphoto!=null}">
                                    <img src="${root}/upload/${userdto.userphoto}" width="350" height="300">
                                </c:if>
                                <c:if test="${userdto.userphoto==null}">
                                    <img src="${root}/image/noimage2.png" alt="이미지가 없습니다." width="300" height="300">
                                </c:if>
                            </div>
                            <div class="col-lg-6 px-xl-10">
                                <div class="bg-secondary d-lg-inline-block py-1-9 px-1-9 px-sm-6 mb-1-9 rounded">
                                    <h3 class="h2 text-white mb-0">${userdto.username}</h3>
                                    <span class="text-white-50">${userdto.nickname}</span>
                                </div>
                                <ul class="list-unstyled mb-1-9">
                                    <li class="mb-2 mb-xl-3 display-28"><span
                                            class="display-26 text-secondary me-2 font-weight-600">Email :</span> ${userdto.email}
                                    </li>
                                    <li class="mb-2 mb-xl-3 display-28"><span
                                            class="display-26 text-secondary me-2 font-weight-600">연락처 :</span> ${userdto.hp}
                                    </li>
                                    <li class="mb-2 mb-xl-3 display-28"><span
                                            class="display-26 text-secondary me-2 font-weight-600">주소 :</span> ${userdto.addr}
                                    </li>
                                    <li class="mb-2 mb-xl-3 display-28"><span
                                            class="display-26 text-secondary me-2 font-weight-600">생년월일 :</span> ${userdto.birth}
                                    </li>
                                </ul>
                                <ul class="social-icon-style1 list-unstyled mb-0 ps-0">
                                    <li><a href="#!"><i class="ti-twitter-alt"></i></a></li>
                                    <li><a href="#!"><i class="ti-facebook"></i></a></li>
                                    <li><a href="#!"><i class="ti-pinterest"></i></a></li>
                                    <li><a href="#!"><i class="ti-instagram"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-12 mb-4 mb-sm-5">
                <div>
                    <span class="section-title text-secondary mb-3 mb-sm-4">수강 중인 강의</span>
                    <c:forEach var="joinlist" items="${joinlist}">
                        <div class="present-lecture${joinlist.mylecnum}">
                            <script>
                                //현재 년월과 비교해서 수강 중인 강의만 출력
                                var date = new Date();
                                var year = date.getFullYear();
                                var month = date.getMonth() + 1;
                                var presentlecture = "";
                                if ("${joinlist.lecyear}" == year && "${joinlist.lecmonth}" == month) {
                                    presentlecture += "<p>[${joinlist.lectypea}]-${joinlist.lectypeb} : ${joinlist.lecname}_${joinlist.teaname} (${joinlist.roomnum}호)";
                                    presentlecture += " <span class='show-lecday${joinlist.mylecnum}'></span>";
                                    presentlecture += " ${joinlist.lectime}교시</p>";
                                }
                                $(".present-lecture${joinlist.mylecnum}").html(presentlecture);

                                // DB에서 숫자로 가져오는 요일을 한글로 바꿔주기
                                var temp = "";
                                var lecday = "${joinlist.lecday}".split(',');
                                for (var yoil = 0; yoil < lecday.length; yoil++) {
                                    // console.log("lecday"+lecday[yoil]);
                                    if (lecday[yoil] == "1") {
                                        temp += "<span>[월]</span>";
                                    } else if (lecday[yoil] == "2") {
                                        temp += "<span>[화]</span>";
                                    } else if (lecday[yoil] == "3") {
                                        temp += "<span>[수]</span>";
                                    } else if (lecday[yoil] == "4") {
                                        temp += "<span>[목]</span>";
                                    } else if (lecday[yoil] == "5") {
                                        temp += "<span>[금]</span>";
                                    } else if (lecday[yoil] == "6") {
                                        temp += "<span>[토]</span>";
                                    } else if (lecday[yoil] == "7") {
                                        temp += "<span>[일]</span>";
                                    }
                                }
                                <%--var result = "${temp}";--%>
                                $(".show-lecday${joinlist.mylecnum}").html(temp);
                            </script>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <div class="col-lg-12">
                <div class="row">
                    <div class="col-lg-12 mb-4 mb-sm-5">
                        <div class="mb-4 mb-sm-5">
                            <span class="section-title text-secondary mb-3 mb-sm-4">만료된 강의</span>
                            <div class="progress-text">
                                <c:forEach var="joinlist" items="${joinlist}">
                                    <div class="row expired-lecture${joinlist.mylecnum}">
                                        <script>
                                            var date = new Date();
                                            var year = date.getFullYear();
                                            var month = date.getMonth() + 1;
                                            var lecture = "";
                                            if ("${joinlist.lecyear}" < year) { //강의 개설 년도가 현재 년도보다 작으면 만료된 강의로 출력
                                                // console.log("tset-sucess");
                                                lecture += "<div><p>[${joinlist.lectypea}]-${joinlist.lectypeb} : ${joinlist.lecname}_${joinlist.teaname}</p></div>";
                                            } else if ("${joinlist.lecyear}" == year && "${joinlist.lecmonth}" < month) { //강의 개설 년도가 현재 년도와 같더라도 지나간 달이면 만료된 강의로 출력
                                                lecture += "<div><p>[${joinlist.lectypea}]-${joinlist.lectypeb} : ${joinlist.lecname}_${joinlist.teaname}</p></div>";
                                            }
                                            console.log(lecture);
                                            $(".expired-lecture${joinlist.mylecnum}").html(lecture);
                                        </script>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>