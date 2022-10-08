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
<body>
<section class="ftco-section">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6 text-center mb-5">
                <h2 class="heading-section">Free Board</h2>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="table-wrap">
                    <table class="table table-responsive-xl">
                        <thead>
                        <tr>
<%--                            <th>&nbsp;</th>--%>
                            <th>Subject</th>
                            <th>Writer</th>
                            <th>WriteDay</th>
                            <th>Readcount</th>
<%--                            <th>&nbsp;</th>--%>
                        </tr>
                        </thead>
                        <tbody class="ajax-input-freeboard">
                        <tr class="alert" role="alert">
<%--                            <td>--%>
<%--                                <label class="checkbox-wrap checkbox-primary">--%>
<%--                                    <input type="checkbox" checked>--%>
<%--                                    <span class="checkmark"></span>--%>
<%--                                </label>--%>
<%--                            </td>--%>
                            <td>Markotto89</td>
                            <td class="d-flex align-items-center">
                                <div class="img" style="background-image: url(images/person_1.jpg);"></div>
                                <div class="pl-3 email">
                                    <span>markotto@email.com</span>
                                    <span>Added: 01/03/2020</span>
                                </div>
                            </td>
                            <td>작성일</td>
                            <td>조회수</td>

<%--                            <td class="status"><span class="active">Active</span></td>--%>
<%--                            <td>--%>
<%--                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">--%>
<%--                                    <span aria-hidden="true"><i class="fa fa-close"></i></span>--%>
<%--                                </button>--%>
<%--                            </td>--%>
                        </tr>
                        </tbody>
                    </table>
                    <div class="free-board-paging"></div>
                </div>
            </div>
        </div>
    </div>
</section>
<script>
    $(function () {
        var currentPage = 1;
        freeBoardList(currentPage);

        //페이징 번호 클릭시 이벤트
        $(document).on('click','.page-item',function (){
            var currentPage = $(this).attr('currentPage');
            var type = $(this).attr('boardtype');
            if (type=="free")
                freeBoardList(currentPage);
        });
    })

    // 자유 커뮤니티 게시판 출력 함수
    function freeBoardList(currentPage){
        var temp = "";
        $.ajax({
            type:"get",
            url:"${root}/manager/freeBoardList",
            data:{"currentPage":currentPage},
            dataType:"json",
            success:function(res){
                $.each(res.list,function (idx,ele) {
                    console.log("ajaxsucess");
                    temp+="<tr class='alert' role='alert'>";
                    temp+="<td>"+ele.subject+"</td>";
                    temp+="<td class='d-flex align-items-center'>";
                    temp+="<div class='pl-3 email'>";
                    temp+="<span>"+ele.nickname+"</span>"
                    temp+="<td>"+ele.writeday+"</td>";
                    temp+="<td>"+ele.readcount+"</td>";
                    temp+="</tr>";
                })//반복으로 데이터 출력

                $(".ajax-input-freeboard").html(temp);
                //페이징 처리 함수 호출
                var startPage = res.startPage;
                var endPage = res.endPage;
                var currentPage = res.currentPage;
                var totalPage = res.totalPage;
                var boardtype = "free"; //페이징 처리에서 페이지번호 클릭시 어느 게시판에 적용되야 하는지 판단하기 위해 추가해줌
                var temp = paging(startPage,endPage,currentPage,totalPage,boardtype);
                $(".free-board-paging").html(temp);
            },
        });
    }

    //페이징 처리 함수
    function paging(startPage, endPage, currentPage, totalPage, boardtype) {
        console.log("paging boardtype"+boardtype);
        var page ="";
        page += '<ul class="pagination">';
        if (startPage>1){
            page += '<li ><a class="page-item" currentPage="'+(currentPage-1)+'" boardtype="'+boardtype+'">이전</a></li>';
        }
        for(var pp = startPage; pp<=endPage; pp++){
            if(pp==currentPage)
                page += '<li class=" active"><a class="page-item" currentPage="'+pp+'" boardtype="'+boardtype+'" >'+pp+'</a></li>';
            else
                page += '<li><a class="page-item" currentPage="'+pp+'" boardtype="'+boardtype+'">'+pp+'</a></li>';
        }
        if(endPage<totalPage)
            page += '<li><a class="page-item" currentPage="'+(endpage+1)+'" boardtype="'+boardtype+'">다음</a></li>';
        page += '</ul>';
        return page;
    }
</script>
</body>
</html>


