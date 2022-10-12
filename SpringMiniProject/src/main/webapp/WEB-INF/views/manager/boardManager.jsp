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
<link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${root}/css/manager/boardManager.css">

</head>
<style>
    .status>span{
        cursor: pointer;
    }
</style>
<body>
<section class="ftco-section">

<%--    자유 게시판--%>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6 text-center">
                <h2 class="heading-section">Free Board</h2>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="table-wrap">
                    <table class="table table-responsive-xl">
                        <thead>
                        <tr>
                            <th>Subject</th>
                            <th>Writer</th>
                            <th>WriteDay</th>
                            <th>Readcount</th>
                        </tr>
                        </thead>
                        <tbody class="ajax-input-freeboard">
                        <tr class="alert" role="alert">
                            <td class="d-flex align-items-center">
<%--                                <div class="img" style="background-image: url(images/person_1.jpg);"></div>--%>
                                <div class="pl-3 email">
                                    <span></span>
                                    <span></span>
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <div class="free-board-paging"></div>
                </div>
            </div>
        </div>
    </div><%--  /자유 게시판--%>

<%--    질문 게시판--%>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6 text-center">
                <h2 class="heading-section">ASK Board</h2>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="table-wrap">
                    <table class="table table-responsive-xl">
                        <thead>
                        <tr>
                            <th>Subject</th>
                            <th>Writer</th>
                            <th>WriteDay</th>
                            <th>Readcount</th>
                        </tr>
                        </thead>
                        <tbody class="ajax-input-askboard">
                        </tbody>
                    </table>
                    <div class="ask-board-paging"></div>
                </div>
            </div>
        </div>
    </div><%--  /질문 게시판--%>


    <%--    신고 게시판--%>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6 text-center">
                <h2 class="heading-section">Report Board</h2>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="table-wrap">
                    <table class="table table-responsive-xl">
                        <thead>
                        <tr>
<%--                                                        <th>&nbsp;</th>--%>
                            <th>Type</th>
                            <th>Subject</th>
                            <th>Writer</th>
                            <th>Report Count</th>
                            <th>Statue</th>
                        </tr>
                        </thead>
                        <tbody class="ajax-input-reportboard">
                        </tbody>
                    </table>
                    <div class="report-board-paging"></div>
                </div>
            </div>
        </div>
    </div><%--  /신고 게시판--%>
</section>
<script>
    $(function () {
        var currentPage = 1;

        freeBoardList(currentPage);
        askBoardList(currentPage);
        reportBoardList(currentPage);

        //페이징 번호 클릭시 이벤트
        $(document).on('click','.page-item',function (){
            var currentPage = $(this).attr('currentPage');
            var type = $(this).attr('boardtype');
            if (type=="free")
                freeBoardList(currentPage);
            if (type=="ask")
                askBoardList(currentPage);
            if (type=="report")
                reportBoardList(currentPage);
        });

        //report board 에서 revert 와 delete 버튼 기능 작동
        $(document).on('click','#btn-revert-reportboard',function () {
            alert("btn revert");
            var num = $(this).attr('num');
            alert(num);
            $.ajax({
                type:"get",
                url:"${root}/manager/revertReport",
                dataType:"text",
                data:{"boardnum":num},
                success:function(res){
                    alert("ajax - sucess");
                },
            });
        })


        $(document).on('click','#btn-delete-reportboard',function () {
            alert("btn delete");
        })
    })

    // 자유 커뮤니티 게시판 출력 함수
    function freeBoardList(currentPage){
        var temp = "";
        $.ajax({
            type:"get",
            url:"${root}/manager/boardList",
            data:{"currentPage":currentPage,"boardtype":"free"},
            dataType:"json",
            success:function(res){
                $.each(res.list,function (idx,ele) {
                    temp+="<tr class='alert' role='alert'>";
                    temp+="<td><a href='${root}/board/boardDetail?boardnum="+ele.boardnum+"' target='_blank'>"+ele.subject+"</a></td>";
                    temp+="<td class='d-flex align-items-center'>";
                    temp+="<div class='pl-3 email'>";
                    temp+="<span><a href='${root}/userdetail?usernum="+ele.usernum+"' target='_blank'>"+ele.nickname+"</a></span>"
                    temp+="<td>"+ele.writeday+"</td>";
                    temp+="<td>"+ele.readcount+"</td>";
                    temp+="</tr>";
                })//반복으로 데이터 출력

                $(".ajax-input-freeboard").html(temp);
                //페이징 처리 함수 호출
                var boardtype = "free"; //페이징 처리에서 페이지번호 클릭시 어느 게시판에 적용되야 하는지 판단하기 위해 추가해줌
                var temp = paging(res.startPage,res.endPage,res.currentPage,res.totalPage,boardtype);
                $(".free-board-paging").html(temp);
            },
        });
    }


    // 질문 커뮤니티 게시판 출력 함수
    function askBoardList(currentPage){
        var temp = "";
        $.ajax({
            type:"get",
            url:"${root}/manager/boardList",
            data:{"currentPage":currentPage,"boardtype":"ask"},
            dataType:"json",
            success:function(res){
                $.each(res.list,function (idx,ele) {
                    temp+="<tr class='alert' role='alert'>";
                    temp+="<td><a href='${root}/board/boardDetail?boardnum="+ele.boardnum+"' target='_blank'>"+ele.subject+"</a></td>";
                    temp+="<td class='d-flex align-items-center'>";
                    temp+="<div class='pl-3 email'>";
                    temp+="<span><a href='${root}/userdetail?usernum="+ele.usernum+"' target='_blank'>"+ele.nickname+"</a></span>"
                    temp+="<td>"+ele.writeday+"</td>";
                    temp+="<td>"+ele.readcount+"</td>";
                    temp+="</tr>";
                })//반복으로 데이터 출력
                $(".ajax-input-askboard").html(temp);
                //페이징 처리 함수 호출
                var boardtype = "ask"; //페이징 처리에서 페이지번호 클릭시 어느 게시판에 적용되야 하는지 판단하기 위해 추가해줌
                var temp = paging(res.startPage,res.endPage,res.currentPage,res.totalPage,boardtype);
                $(".ask-board-paging").html(temp);
            },
        });
    }

    // 신고 커뮤니티 게시판 출력 함수
    function reportBoardList(currentPage){
        console.log("ajax- test1");
        var temp = "";
        $.ajax({
            type:"get",
            url:"${root}/manager/reportBoardList",
            data:{"currentPage":currentPage},
            dataType:"json",
            success:function(res){
                console.log("ajax-test2");
                $.each(res.list,function (idx,ele) {
                    temp+="<tr class='alert' role='alert'>";
                    temp+="<td>"+ele.boardtype+"</td>"
                    temp+="<td><a href='${root}/board/boardDetail?boardnum="+ele.boardnum+"'>"+ele.subject+"</a></td>"
                    temp+="<td>"+ele.nickname+"</td>"
                    temp+="<td>"+ele.reportcount+"</td>"
                    temp+="<td class='status'>";
                    temp+="<span class='active' id='btn-revert-reportboard' num='"+ele.boardnum+"'>Revert</span>";
                    temp+="<span class='waiting' id='btn-delete-reportboard' num='"+ele.boardnum+"'>Delete</span>";
                    temp+="</td>";
                    temp+="</tr>";
                })//반복으로 데이터 출력

                $(".ajax-input-reportboard").html(temp);
                // //페이징 처리 함수 호출
                var boardtype = "report"; //페이징 처리에서 페이지번호 클릭시 어느 게시판에 적용되야 하는지 판단하기 위해 추가해줌
                var temp = paging(res.startPage,res.endPage,res.currentPage,res.totalPage,boardtype);
                $(".report-board-paging").html(temp);
            },
        });
    }

    //페이징 처리 함수
    function paging(startPage, endPage, currentPage, totalPage, boardtype) {
        var page ="";
        page += '<div class="pagination">';
        if (startPage>1){
            page += '<span ><a class="page-item" currentPage="'+(currentPage-1)+'" boardtype="'+boardtype+'">이전</a></span>';
        }
        for(var pp = startPage; pp<=endPage; pp++){
            if(pp==currentPage)
                page += '<span class=" active"><a class="page-item" currentPage="'+pp+'" boardtype="'+boardtype+'" >'+pp+'</a></span>';
            else
                page += '<span><a class="page-item" currentPage="'+pp+'" boardtype="'+boardtype+'">'+pp+'</a></span>';
        }
        if(endPage<totalPage)
            page += '<span><a class="page-item" currentPage="'+(endPage+1)+'" boardtype="'+boardtype+'">다음</a></span>';
        page += '</div>';
        return page;
    }
</script>
</body>
</html>


