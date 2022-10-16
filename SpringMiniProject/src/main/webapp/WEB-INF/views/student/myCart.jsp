<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Yeon+Sung&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    <!-- css  -->
    <c:set var="root" value="<%=request.getContextPath() %>"/>
    <link rel="stylesheet" type="text/css" href="${root}/css/stupagechange.css">

    <style type="text/css">

        .lectd th,td{
            text-align: center;
        }
        .lectdbox{
            width: 850px;
            height: auto;

            padding: 10px 10px 10px 10px;
        }
        .total{
            text-align: end;
            padding-right: 15px !important;
            font-size: 20px;
        }

        #main_menu {
            position: fixed;
            width: 70px;
            height: 210px;
            right: 60px;
            border-radius: 70px;
            top: 35%;
            text-align: center;

        }
        .cuz {
            width: 100px;
        }

        ul {
            padding: 0;
        }

        li {
            list-style: none;
            line-height: 34px;
        }

        a {
            text-decoration: none;
            color: black;
            text-align: center;
        }

        .snd_menu {
            background: #efefef;
        }

        .sub_menu {
            display: none;
        }

    </style>

</head>
<body>
<div class="sttitle">
    장바구니
</div>
<div class="stcontainer">
<div class="lectdbox">
    <table class="table table-bordered lectd">
        <tr>
            <th style="width: 30px"><input id="allCheck" type="checkbox"/></th>
            <th style="width: 70px">과목분류</th>
            <th style="width: 150px">강의명</th>
            <th style="width: 80px">강사</th>
            <th style="width: 80px">강의실</th>
            <th style="width: 80px">강의교시</th>
            <th style="width: 100px">강의요일</th>
            <th style="width: 60px">수강연월</th>
            <th style="width: 60px">가격</th>
        </tr>
        <c:set var="totalPrice" value="0"/>
        <c:set var="totalLecname" value=""/>
        <c:forEach var="dto" items="${list}">
            <tr>
                <td><input class="aCheck" type="checkbox" value="${dto.lecdenum}"/></td>
                <td>${dto.lectypea}</td>
                <td>
                    <a class="lecdego" href="${root}/lecture/lectureDetail?lecdenum=${dto.lecdenum}">
                    ${fn:substring(dto.lecname,0,14)}
                    <c:if test="${fn:length(dto.lecname)>14}">..</c:if>
                    </a>
                </td>
                <td>${dto.teaname}</td>
                <td>${dto.roomnum}</td>
                <td>${dto.lectime}교시</td>
                <td>
                    <c:if test="${fn:contains(dto.lecday,1)}">
                        월
                    </c:if>
                    <c:if test="${fn:contains(dto.lecday,2)}">
                        화
                    </c:if>
                    <c:if test="${fn:contains(dto.lecday,3)}">
                        수
                    </c:if>
                    <c:if test="${fn:contains(dto.lecday,4)}">
                        목
                    </c:if>
                    <c:if test="${fn:contains(dto.lecday,5)}">
                        금
                    </c:if>
                    <c:if test="${fn:contains(dto.lecday,6)}">
                        토
                    </c:if>
                    <c:if test="${fn:contains(dto.lecday,7)}">
                        일
                    </c:if>
                </td>
                <td>${dto.lecyear}/${dto.lecmonth}</td>
                <td><fmt:formatNumber pattern="￦#,###" value="${dto.price}"/></td>
            </tr>
            <c:set var="totalPrice" value="${totalPrice+dto.price}"/>
            <c:set var="totalLecname" value="${totalLecname} [${dto.lecname}]"/>
            <c:set var="usernum" value="${dto.usernum}"/>
        </c:forEach>
        <tr>
            <td colspan="9" class="total">
                총 결제 예정 금액 : <fmt:formatNumber pattern="￦#,###" value="${totalPrice}"/>
            </td>
        </tr>
    </table>
    <button type="button" class="basicbtn" id="selectDel">선택삭제</button>&nbsp;&nbsp;&nbsp;&nbsp;
    <button type="button" class="basicbtn" onclick="payment('kcp','test','card')" style="float: right">결제하기</button>
</div>
</div>
<nav class="cuz">
    <ul id="main_menu">
        <div class="btn_gotop"><a href="#"><img src="../image/tttt.png"
                                                style="width: 70%; background-color:transparent; color: black;"></a>
        </div>
        <br>
        <br>
        <li><a href="javascript:dos()" style="color: black;"><img src="../image/pointt.png"
                                                                  style="width: 80%; background-color:transparent; color: black;"></a>
            <ul class="snd_menu sub_menu" style=" background-color:transparent;">
                <br>
                <li><a href="${root}/lecture/lectureList"><img src="../image/yu.png"
                                                               style="width: 100%; background-color:transparent; color: black;">강의</a>
                </li>
                <br>
                <li><a href="${root}/board/boardFree"><img src="../image/cccb.png"
                                                           style="width: 100%;padding-left:10px;  ">커뮤니티</a></li>
                <br>
                <li><a href="${root}/qna/qnaList"><img src="../image/1ask.png" style="width:130%; padding-right: 25px;">문의하기</a>
                </li>
            </ul>
        </li>
    </ul>
</nav>

<script type="text/javascript">

    var IMP = window.IMP;

    var name = "${sessionScope.loginname}";
    var email = "${sessionScope.email}";
	var usernum= "${sessionScope.usernum}";
	usernum +="";
    function payment(pg_provider,mode,payment_method) {
    	var usernum = "${sessionScope.usernum}";
        IMP.init("imp32541741");
        var pg_mid;
        if(pg_provider =='kcp'){
            if(mode=='test'){
                pg_mid ='kcp';
            }
            else{

                pg_mid ='kcp.IOfds34' ;

            }

        }

        const data = {
            pg: pg_mid ,
            pay_method:  payment_method,
            merchant_uid: "${totalLecname} ${sessionScope.loginname}",
            name : "${totalLecname}",
            amount : "${totalPrice}",
            buyer_email : '${sessionScope.email}',
            buyer_name : '${sessionScope.loginname}',
 			usernum : "${sessionScope.usernum}"
        };
        
        
        IMP.request_pay(data, response => {
            alert('callback!:' +JSON.stringify(response)),
                $.ajax({
                    url: "../payment/callback_receive",
                    method: "POST",
                    headers: { "Content-Type": "application/json" },
                    datetype:"text",
                    data: JSON.stringify(response),
                	success: function(res) {
                    // 가맹점 서버 결제 API 성공시 로직'
                    location.reload();
                	}
                })
        })
    };

    $(function (){

        //전체 선택 클릭 시 체크값 얻어서 모든 체크값 전달하기
        $("#allCheck").click(function(){
            //전체 선택의 체크값 얻기
            var chk = $(this).is(":checked");//true 또는 false

            //전체 선택의 체크값을 글 앞으 체크에 일괄 전달
            $(".aCheck").prop("checked", chk);

        });
        //하나라도 선택하면 모두선택 체크박스 해제
        $(".aCheck").click(function(){
            $("#allCheck").prop("checked", false);
        });

        //선택삭제 버튼 클릭 시 삭제
        $("#selectDel").click(function(){

            //체크된 길이 구하기
            var len=$(".aCheck:checked").length;
            //체크 안했을 경우
            if(len==0){
                alert("최소 1개 이상의 글을 선택해주세요");
            }else{ //체크 했을 경우
                var a=confirm(len+"개의 강의를 장바구니에서 삭제하시겠습니까?");

                if(a){
                    //체크된 곳의 value값(lecdenum) 얻어서 nums에 넣기(반복)
                    var nums="";
                    $(".aCheck:checked").each(function(idx){
                        nums+=$(this).val()+","
                    });
                    //마지막 컴마 제거하기
                    nums=nums.substring(0,nums.length-1);
                    console.log(nums);
                    //삭제컨트롤러로 전송
                    $.ajax({
                        url : "deleteMyCart",
                        type : "post",
                        data : {"nums":nums},
                        success : function(){
                            alert("삭제되었습니다");
                            location.reload();
                        }
                    });

                }
            }
        });
    });
    $(document).ready(function dos() {
        $('#main_menu > li > a').click(function () {
            $(this).next($('.snd_menu sub_menu')).slideToggle('fast');
            // $(this).show($('.snd_menu sub_menu')("slide",{direction:'left'},1000));
        })
        // e.stopPropagation();

    })

</script>
</body>
</html>