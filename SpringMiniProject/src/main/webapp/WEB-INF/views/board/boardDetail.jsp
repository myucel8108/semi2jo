<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>

 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Yeon+Sung&display=swap" rel="stylesheet">
    <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
<%--     <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>--%>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


    <style type="text/css">
        *{
            font-family: Noto Sans KR;
        }
        span.likes {
            cursor: pointer;
        }

        .likeusericon{
            cursor: pointer;
        }
        .redelete{
            cursor: pointer;
        }
    </style>
    <script>

        $(function(){

            list();

           initlike();
           //좋아요 숫자 클릭시 좋아요 누른 아이디+닉네임 보이게 하기
          $(".likeusericon").click(function(){
               var boardnum=${dto.boardnum};
                //console.log("boardnum="+boardnum);
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
          $(document).on("click",".redelete", function (){
              var reboardnum=$(this).attr("reboardnum");
              var ans=confirm("댓글을 삭제하시겠습니까?");
              if(ans){
                  $.ajax({
                      type:"get",
                      url:"../reboard/delete",
                      dataType:"text",
                      data:{"reboardnum":reboardnum},
                      success:function(res){
                          list();
                      }
                  });
              }
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
        function list(){
            var loginok = '${sessionScope.loginok}';
            var usernum = '${sessionScope.usernum}';
            var writeuser = '${dto.usernum}';
            var boardnum = ${dto.boardnum};

            var s = "";
            $.ajax({
                type : "get",
                url : "../reboard/list",
                dataType : "json",
                data : {"boardnum":boardnum},
                success : function(res) {
                    $("b.banswer").text(res.length);
                    $.each(res, function (i, elt){
                        s+="<div>"
                        if(elt.photo==null) {
                            s+="<img src='../image/noprofilepicture.png' style='width: 30px; height: 30px;' class='rounded-circle' hspace='10'>";
                        }
                        if(elt.photo!=null) {
                            s+="<img src='../upload/"+"'elt.userphoto'"+"' style='width: 30px; height: 30px;' class='rounded-circle' hspace='10'>";
                        }
                        s+="<b>"+elt.nickname+"</b>";
                        if (writeuser==elt.usernum){
                            s+="<span class='writer'>(작성자)</span>";
                        }
                        s+="<br><br>";
                        s+="<pre>&nbsp;&nbsp;<b>"+elt.recontent+"&nbsp;&nbsp;";
                        s+="</b><span class='day' style='color:gray;'>"+elt.writeday+"&nbsp;";
                        if(loginok=='yes' && usernum==elt.usernum){
                            s+='<i class="fa fa-close redelete" style="font-size:15px; color: black" reboardnum='+elt.reboardnum+'></i>';
                        }
                        s+="</span></pre></div><hr>"
                    });
                    $("div.alist").html(s);
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

<div class="container" style="width: 1000px; padding: 100px;">
    <table class="table table-bordered" style="width: 100%;">
        <tr>
            <td>
                <h2><b>${dto.subject}</b></h2>
                <c:if test="${userphoto!='no'}">
                    <img src="../upload/${userphoto}" width="40" height="40" class="rounded-circle"
                         onerror="this.src='../image/noprofilepicture.png'" hspace="10">
                </c:if>
                <b>${dto.nickname}</b>
                <span style="color: gray; font-size: 12px;">
					<fmt:formatDate value="${dto.writeday}" pattern="yyyy-MM-dd HH:mm"/>
					&nbsp;&nbsp;
					조회&nbsp; ${dto.readcount}
				</span>
            </td>
        </tr>
        <tr height="200">
            <td>
                <pre><b>${dto.content}</b></pre>
                <c:if test="${dto.photo!='no'}">
                    <c:forTokens var="photo" items="${dto.photo}" delims=",">
                        <img src="../upload/${photo}" width="400"
                             onerror="this.style.display='none'">
                    </c:forTokens>
                </c:if>
                <br><br>
                <span class="likes">
                <i class='far fa-thumbs-up'></i>
				</span><b>
                좋아요</b>
                &nbsp;
                <span class="likeusericon" data-bs-toggle="modal" data-bs-target="#likeuserModal">
                <i class='fas fa-user-alt' style='font-size:16px'></i>
                </span>
                <b class="likesuser">
                   ${dto.likes}</b>
                &nbsp;&nbsp;
                <i class="far fa-comment-dots"></i>
                <b class="banswer">0</b>
                <br><hr>
                <div class="alist"></div>
                <c:if test="${sessionScope.loginok!=null}">
                <div class="aform">
                    <form id="aform">
                        <input type="hidden" name="boardnum" value="${dto.boardnum}">
                        <input type="hidden" name="userid" value="${sessionScope.loginid}">
                        <input type="hidden" name="nickname" value="${dto.nickname}">
                        <input type="hidden" name="userphoto" value="${dto.userphoto}">
                        <div class="input-group">
                            <textarea name="recontent" id="recontent" style="width: 400px; height: 100px;" class="form-control"></textarea>
                            <button type="button" id="btnreboard">등록</button>
                        </div>
                    </form>
                </div>
                </c:if>
                <div style="text-align: center; float: bottom;">
                <button type="button" onclick="location.href='boardFree?currentPage=${currentPage}'">목록</button>
                <c:if test="${sessionScope.loginok!=null && sessionScope.loginid==dto.userid}">
                <button type="button" onclick="location.href='boardUpdate?boardnum=${dto.boardnum}&currentPage=${currentPage}'">수정</button>
                <button type="button" onclick="location.href='delete?boardnum=${dto.boardnum}&currentPage=${currentPage}'">삭제</button>
                </c:if>
                </div>
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
        //댓글저장
        $("#btnreboard").click(function() {
            var fdata = $("#aform").serialize();
            $.ajax({
                type : "post",
                url : "../reboard/insert",

                dataType : "text",
                data : fdata,
                success : function(res) {
                   list();
                    $("#recontent").val("");
                }
            });
        });
    </script>
</div>
</body>
</html>