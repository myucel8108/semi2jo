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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>

</head>
<style>
    #formbox{
        margin: auto;
        margin-top: 20px;
        margin-bottom: 20px;
    }
</style>

<body>
<form action="insert" method="post" enctype="multipart/form-data">

    <input type="hidden" name="usernum" value="${sessionScope.usernum}">
    <input type="hidden" name="username" value="${sessionScope.username}">
    <input type="hidden" name="qnanum" value="${qnanum}">
    <input type="hidden" name="regroup" value="${regroup}">
    <input type="hidden" name="relevel" value="${relevel}">
    <input type="hidden" name="restep" value="${restep}">
    <input type="hidden" name="currentPage" value="${currentPage}">


    <table class="table table-bordered" style="width: 500px;" id="formbox">

        <c:if test="${qnanum==0}">
            <tr>
                <th style="width: 100px; text-align: center;">문의유형</th>
                <td>
                    <select type="select" name="qnatype" required="required">
                        <option>결제문의</option>
                        <option>상품문의</option>
                        <option>강사문의</option>
                        <option>학원문의</option>
                        <option>취소문의</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th style="width: 100px; text-align: center; padding-top: 12px;">비밀번호</th>
                <td>
                    <input type="password" name="pass" class="form-control" required="required">
                </td>
            </tr>


        </c:if>

        <c:if test="${qnanum>0}">
            <input type="hidden" name="pass">
            <input type="hidden" name="qnatype">

        </c:if>
        <tr>
            <th style="width: 100px;  text-align: center; padding-top: 15px;">사진</th>
            <td>
                <div class="phototag">
                    <div class="input-group">
<%--                        <input type="file" name="upload" class="form-control" multiple="multiple" id="upload">--%>
                        <input type="file" name="upload" class="form-control" id="upload">
                        &nbsp;
                        <i class="fa fa-plus photoadd" style="font-size:14px; margin-left: 3px; margin-right:0px; margin-top: 10px;"></i>
                    </div>
                </div>
                <script>
                    $("i.photoadd").click(function(){
                        if($("input[name='upload']").length==4){
                            alert("더이상 추가할수 없습니다");
                            return;
                        }
                        var tag="";
                        tag=' <div class="input-group">';
                        tag+='<input type="file" name="upload" class="form-control" multiple="multiple" >';
                        tag+="<i class='fa fa-minus photodel' style='font-size:14px; margin-left: 8px; margin-top: 10px;'></i>"
                        tag+="</div>";
                        $("div.phototag").append(tag);
                    });

                    $(document).on("click",".photodel",function(){
                        $(this).prev().remove();
                        $(this).remove();
                    });

                </script>
            </td>
        </tr>


        <tr>


            <td colspan="2">

                <c:if test="${qnanum>0}">
                    <div name="content" class="form-control" style="width: 500px; height: 100px; margin-bottom: 15px;">${content}</div>
                </c:if>

               <textarea name="content" class="form-control" required="required"
                         style="width: 500px; height: 400px;"></textarea>


                <div style="text-align: center; margin-bottom: 10px;">
                <input type="radio" name="opens" id="open" value="Y" class="radio"/><span class="ml_10">&nbsp;게시물 공개</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="radio" name="opens" id="open" value="N" class="radio"/><span class="ml_10">&nbsp;게시물 비공개</span>
                </div>
            </td>
        </tr>

        <tr>
            <td colspan="2" align="center">
                <button type="submit" class="btn btn-outline insert2" style="color: black; text-decoration: none; background-color: white; border: 1px solid black;" >등록</button>
                <button type="button" class="btn btn-outline"  style="color: black; text-decoration: none; background-color: white; border: 1px solid black;" onclick="location.href='qnaList?currentPage=${currentPage}'">취소</button>
            </td>


        </tr>
    </table>


    <script>


            //등록 이벤트
            $(document).on("click", ".insert2", function () {
                var idx = $(this).attr("idx");
                var a = alert("등록되었습니다");
                if (a) {
                    var idx = $(this).attr("idx");

                    $.ajax({
                        type: "get",
                        url: "../qna/insert",
                        dataType: "text",
                        data: {"idx": idx},
                        success: function (res) {
                            list();
                        }//success
                    });//ajax

                }//if


            });//onclick











    </script>
</form>
</body>
</html>