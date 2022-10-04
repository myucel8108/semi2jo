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
    <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
<%--     <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>--%>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


    <style type="text/css">

        span.likes {
            cursor: pointer;
        }

        .likeusericon{
            cursor: pointer;
        }
    </style>
    <script>

        $(function(){
           initlike();

           //좋아요 숫자 클릭시 좋아요 누른 아이디+닉네임 보이게 하기
          $(".likeusericon").click(function(){
               var boardnum=${dto.boardnum};
                console.log("boardnum="+boardnum);
               $.ajax({
                   type : "get",
                   url : "likesuser",
                   dataType : "json",
                   data : {"boardnum":boardnum},
                   success : function(res) {
                       var s="";
                       $.each(res,function(i,ids){
                           s+=ids+"\n";
                        });

                        if(res.length==0){
                           s="좋아요한 회원이 없습니다";
                        }
                       swal({
                           title: "이 게시물을 좋아요한 회원들",
                           text: s,
                           icon: "success",
                           button: "닫기",
                       });
                   }
               });


           });
        });
        function initlike(){
            var boardnum=${dto.boardnum};
            var loginok='${sessionScope.loginok}';
            if(loginok=='')
                return;
            $.ajax({
                type : "get",
                url : "likesstate",
                dataType : "json",
                data : {"boardnum":boardnum},
                success : function(res) {
                    if(res==1){
                        $(".fa-thumbs-up").attr("class","fas fa-thumbs-up").css("color","red");
                    }
                }
            });
        }
    </script>

</head>
<body>

<!-- The Modal -->
<%--<div class="modal fade" id="likeuserModal">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">좋아요한 회원들</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>

            <!-- Modal body -->
            <div class="modal-body">
                <div class="like-users">
                </div>
            </div>
        </div>
    </div>
</div>--%>

<div class="container" style="width: 100%; padding: 100px;">
    <table class="table table-bordered" style="width: 600px;">
        <tr>
            <td>
                <h2><b>${dto.subject}</b></h2>
                <b>${dto.nickname}(${dto.userid})</b>
                <span style="color: gray; font-size: 12px;">
					<fmt:formatDate value="${dto.writeday}" pattern="yyyy-MM-dd HH:mm"/>
					&nbsp;&nbsp;
					조회&nbsp; ${dto.readcount}
				</span>
            </td>
        </tr>
        <tr height="200">
            <td>
                <p>${dto.content}</p>
                <c:if test="${dto.photo!='no'}">
                    <c:forTokens var="photo" items="${dto.photo}" delims=",">
                        <img src="../upload/${photo}" width="250"
                             onerror="this.style.display='none'">
                    </c:forTokens>
                </c:if>
                <br><br>
                <span class="likes">
                <i class='far fa-thumbs-up'></i>
				</span>
                좋아요
                &nbsp;
                <span class="likeusericon" data-bs-toggle="modal" data-bs-target="#likeuserModal">
                <i class='fas fa-user-alt' style='font-size:16px'></i>
                </span>
                <b  class="likesuser">
                   ${dto.likes}</b>
                &nbsp;&nbsp;
                <i class="far fa-comment-dots"></i>
                댓글
                <b class="banswer">$</b>
                <br>
                <div class="aform">
                    <form id="aform">
                        <input type="hidden" name="num" value="${dto.boardnum}">
                        <input type="hidden" name="id" value="${sessionScope.loginid}">
                        <input type="hidden" name="name" value="${sessionScope.loginname}">
                        <div class="input-group">
                            <textarea name="message" id="message" style="width: 400px; height: 60px;" class="form-control"></textarea>
                            <button type="button" id="btnasave">등록</button>
                        </div>
                    </form>
                </div>
                <button type="button" onclick="location.href='boardFree?currentPage=${currentPage}'">목록</button>
                <button type="button" onclick="location.href='boardUpdate?boardnum=${dto.boardnum}&currentPage=${currentPage}'">수정</button>
            <button type="button" onclick="location.href='delete?boardnum=${dto.boardnum}&currentPage=${currentPage}'">삭제</button>
            </td>
        </tr>
    </table>
    <script>
        $("span.likes").click(function() {
            var a='${sessionScope.loginok}';
            if(a==''){
                alert("로그인을 해주세요");
                return;
            }
            var thumbs = $(this).find("i").attr("class");
            var likestate;
            if(thumbs=='far fa-thumbs-up'){
                $(this).find("i").attr("class","fas fa-thumbs-up").css("color","red");
                likestate=1;
            } else {
                $(this).find("i").attr("class","far fa-thumbs-up").css("color","black");
                likestate=0;
            }

            var boardnum=${dto.boardnum};

            $.ajax({
                type : "get",
                url : "likes",
                dataType : "json",
                data : {"boardnum":boardnum,"likestate":likestate},
                success : function(res) {
                      //  alert(res);
                        $("b.likesuser").text(res);
                }
            });
        });
    </script>
</div>
</body>
</html>