<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>

    <c:set var="root" value="<%=request.getContextPath()%>"/>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link
            href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap"
            rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<%--    <link href="${root}/css/boardManager.scss" rel="stylesheet">--%>
<%--<link rel="stylesheet" href="${root}/css/boardManager/fontsicomoonstyle.css">--%>

<%--<link rel="stylesheet" href="css/owl.carousel.min.css">--%>

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="${root}/css/boardManager/bootstrap.min.css">

<!-- Style -->
<link rel="stylesheet" href="${root}/css/boardManager/style.css">

<title>Table #5</title>
</head>
<body>


<%--<div class="content">--%>

<%--    <div class="container">--%>



        <div class="table-responsive custom-table-responsive" id="free-board-control">

            <h2 class="mb-5">자유 커뮤니티</h2>
            <table class="table custom-table">
                <thead>
                <tr>

<%--                    <th scope="col">--%>
<%--                        <label class="control control--checkbox">--%>
<%--                            <input type="checkbox"  class="js-check-all"/>--%>
<%--                            <div class="control__indicator"></div>--%>
<%--                        </label>--%>
<%--                    </th>--%>

                    <th scope="col">Number</th>
                    <th scope="col">Subject</th>
                    <th scope="col">Writer</th>
                    <th scope="col">Writeday</th>
                    <th scope="col">Readcount</th>
                </tr>
                </thead>
                <tbody class="ajax-input-freeboard">
<%--                    <tr class="">--%>
<%--                        <th scope="row">--%>
<%--                            <label class="control control--checkbox">--%>
<%--                                <input type="checkbox"/>--%>
<%--                                <div class="control__indicator"></div>--%>
<%--                            </label>--%>
<%--                        </th>--%>
<%--                        <td>--%>
<%--                            1392--%>
<%--                        </td>--%>
<%--                        <td><a href="#">James Yates</a></td>--%>
<%--                        <td>--%>
<%--                            Web Designer--%>
<%--                            <small class="d-block">Far far away, behind the word mountains</small>--%>
<%--                        </td>--%>
<%--                        <td>+63 983 0962 971</td>--%>
<%--                        <td>NY University</td>--%>
<%--                    </tr>--%>

<%--                <tr class="spacer"><td colspan="100"></td></tr>--%>
<%--                <tr>--%>
<%--                    <th scope="row">--%>
<%--                        <label class="control control--checkbox">--%>
<%--                            <input type="checkbox"/>--%>
<%--                            <div class="control__indicator"></div>--%>
<%--                        </label>--%>
<%--                    </th>--%>

<%--                    <td>9841</td>--%>
<%--                    <td><a href="#">Sampson Murphy</a></td>--%>
<%--                    <td>--%>
<%--                        Mobile Dev--%>
<%--                        <small class="d-block">Far far away, behind the word mountains</small>--%>
<%--                    </td>--%>
<%--                    <td>+01 352 1125 0192</td>--%>
<%--                    <td>Senior High</td>--%>
<%--                </tr>--%>

                </tbody>
            </table>
        </div>


<div class="table-responsive custom-table-responsive" id="ask-board-control">
    <h2 class="mb-5">질문 커뮤니티</h2>
    <table class="table custom-table">
        <thead>
        <tr>
            <th scope="col">Number</th>
            <th scope="col">Subject</th>
            <th scope="col">Writer</th>
            <th scope="col">Writeday</th>
            <th scope="col">Readcount</th>
        </tr>
        </thead>
        <tbody class="ajax-input-askboard">

<%--        여기에 ajax로 불러드린 값을 넣는다--%>
        </tbody>
    </table>
</div>


<%--    </div>--%>

<%--</div>--%>

<script src="${root}/js/boardManager.js"></script>
</body>
<script>
    $(function () {
        freeBoardList();
    })

    function freeBoardList(){
        var temp = "";
        var page = "";
        $.ajax({
            type:"get",
            url:"${root}/manager/freeBoardList",
            dataType:"json",
            success:function(res){
                $.each(res.list,function (idx,ele) {
                    var num = idx+1;
                    temp+="<tr>";
                    temp+="<td>"+num+"</td>";
                    temp+="<td>"+ele.subject+"</td>";
                    temp+="<td>"+ele.nickname+"</td>";
                    temp+="<td>"+ele.writeday+"</td>";
                    temp+="<td>"+ele.readcount+"</td>";
                    temp+="</tr>";
                })//반복으로 데이터 출력

                $(".ajax-input-freeboard").html(temp);
            },
        });
    }

</script>
</html>