<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
  <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Yeon+Sung&display=swap" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
  <!-- css  -->
  <c:set var="root" value="<%=request.getContextPath() %>"/>
  <link rel="stylesheet" type="text/css" href="${root}/css/stupagechange.css">
  <style>
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

    .snd_menu {
      background: #efefef;
    }

    .sub_menu {
      display: none;
    }

    .boardbtn{
      width: 120px;
      height: 30px;
      border-radius: 15px;
      background-color: white;
      border: 1px solid black;
    }
    .boardbtn:hover {
      background-color: #eeeeee;
    }
  </style>
  <script>
    $(function (){
      list1();
    });

    function list1(){
      var loginok = '${sessionScope.loginok}';
      if(loginok=='')
        return;
      var usernum = '${sessionScope.usernum}';
      // console.log("usernum="+usernum);
      var s = "";
      $.ajax({
        type : "get",
        url : "mylist1",
        dataType : "json",
        data : {"usernum":usernum},
        success : function(res) {
          // $("h3.listcount").text(res.length);
          s+="<h4><i class='fas fa-edit'></i>&nbsp;작성한 게시물</h4>";
          s+='<table class="table table-bordered">';
          s+='<tr>';
          s+='<th style="text-align: center; width: 300px;">제목</th>';
          s+='<th style="text-align: center; width: 100px;">작성자</th>';
          s+='<th style="text-align: center; width: 200px;">작성일</th>';
          s+='</tr>';
          $.each(res, function (i, elt){
            s+="<tr>";
            s+="<td><a class='lecdego' href='../board/boardDetail?boardnum="+elt.boardnum+"'>"+elt.subject+"</a></td>";
            s+="<td style='text-align: center;'>"+elt.nickname+"</td>";
            s+="<td style='text-align: center;'>"+elt.writeday+"</td>";
            s+="</tr>"
          });
          s+='</table>';
          $("div.mylist").html(s);
        }
      });
    }
  </script>
</head>
<body>
<c:set var="root" value="<%=request.getContextPath() %>"/>
<div class="sttitle">
  마이커뮤니티
</div>
<br>
<div class="stcontainer">
<div class="btn-group">
  <button type="button" id="myboard" class="boardbtn">작성한 게시물</button>&nbsp;&nbsp;
  <button type="button" id="myreboard" class="boardbtn">댓글 단 게시물</button>&nbsp;&nbsp;
  <button type="button" id="mylikeboard" class="boardbtn">좋아요 한 게시물</button>
</div>
</div>
<br>
<div class="stcontainer">
  <h3 class="listcount"></h3>
  <div class="mylist"></div>
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
        <li><a class="quick" href="${root}/lecture/lectureList"><img src="../image/yu.png"
                                                       style="width: 100%; background-color:transparent; color: black;">강의</a>
        </li>
        <br>
        <li><a class="quick" href="${root}/board/boardFree"><img src="../image/cccb.png"
                                                   style="width: 100%;padding-left:10px;">커뮤니티</a></li>
        <br>
        <li><a class="quick" href="${root}/qna/qnaList"><img src="../image/1ask.png" style="width:130%; padding-right: 25px;">문의하기</a>
        </li>
      </ul>
    </li>
  </ul>
</nav>

<script>
  $(document).ready(function dos() {
    $('#main_menu > li > a').click(function () {
      $(this).next($('.snd_menu sub_menu')).slideToggle('fast');
      // $(this).show($('.snd_menu sub_menu')("slide",{direction:'left'},1000));
    })
    // e.stopPropagation();
  })
</script>
</body>
<script>
  $("#myboard").click(function (){
    var loginok = '${sessionScope.loginok}';
    if(loginok=='')
      return;
    var usernum = '${sessionScope.usernum}';
    // console.log("usernum="+usernum);
    var s = "";
    $.ajax({
      type : "get",
      url : "mylist1",
      dataType : "json",
      data : {"usernum":usernum},
      success : function(res) {
        // $("h3.listcount").text(res.length);
        s+="<h4><i class='fas fa-edit'></i>&nbsp;작성 한 게시물</h4>";
        s+='<table class="table table-bordered">';
        s+='<tr>';
        s+='<th style="text-align: center; width: 300px;">제목</th>';
        s+='<th style="text-align: center; width: 100px;">작성자</th>';
        s+='<th style="text-align: center; width: 200px;">작성일</th>';
        s+='</tr>';
        $.each(res, function (i, elt){
          s+="<tr>";
          s+="<td><a class='lecdego' href='../board/boardDetail?boardnum="+elt.boardnum+"'>"+elt.subject+"</a></td>";
          s+="<td style='text-align: center;'>"+elt.nickname+"</td>";
          s+="<td style='text-align: center;'>"+elt.writeday+"</td>";
          s+="</tr>"
        });
        s+='</table>';
        $("div.mylist").html(s);
      }
    });
  })
  $("#myreboard").click(function (){
      var loginok = '${sessionScope.loginok}';
      if(loginok=='')
        return;
      var usernum = '${sessionScope.usernum}';
      // console.log("usernum="+usernum);
      var s = "";
      $.ajax({
        type : "get",
        url : "mylist2",
        dataType : "json",
        data : {"usernum":usernum},
        success : function(res) {
          // $("h3.listcount").text(res.length);
          s+="<h4><i class='far fa-comment-dots'></i>&nbsp;댓글 단 게시물</h4>";
          s+='<table class="table table-bordered">';
          s+='<tr>';
          s+='<th style="text-align: center; width: 300px;">제목</th>';
          s+='<th style="text-align: center; width: 100px;">작성자</th>';
          s+='<th style="text-align: center; width: 200px;">작성일</th>';
          s+='</tr>';
          $.each(res, function (i, elt){
            s+="<tr>";
            s+="<td><a class='lecdego' href='../board/boardDetail?boardnum="+elt.boardnum+"'>"+elt.subject+"</a></td>";
            s+="<td style='text-align: center;'>"+elt.nickname+"</td>";
            s+="<td style='text-align: center;'>"+elt.writeday+"</td>";
            s+="</tr>"
          });
          s+='</table>';
          $("div.mylist").html(s);
        }
      });
  })
  $("#mylikeboard").click(function (){
    var loginok = '${sessionScope.loginok}';
    if(loginok=='')
      return;
    var usernum = '${sessionScope.usernum}';
    // console.log("usernum="+usernum);
    var s = "";
    $.ajax({
      type : "get",
      url : "mylist3",
      dataType : "json",
      data : {"usernum":usernum},
      success : function(res) {
        // $("h3.listcount").text(res.length);
        s+="<h4><i class='far fa-thumbs-up'></i>&nbsp;좋아요 한 게시물</h4>";
        s+='<table class="table table-bordered">';
        s+='<tr>';
        s+='<th style="text-align: center; width: 300px;">제목</th>';
        s+='<th style="text-align: center; width: 100px;">작성자</th>';
        s+='<th style="text-align: center; width: 200px;">작성일</th>';
        s+='</tr>';
        $.each(res, function (i, elt){
          s+="<tr>";
          s+="<td><a class='lecdego' href='../board/boardDetail?boardnum="+elt.boardnum+"'>"+elt.subject+"</a></td>";
          s+="<td style='text-align: center;'>"+elt.nickname+"</td>";
          s+="<td style='text-align: center;'>"+elt.writeday+"</td>";
          s+="</tr>"
        });
        s+='</table>';
        $("div.mylist").html(s);
      }
    });
  })


</script>
</html>
