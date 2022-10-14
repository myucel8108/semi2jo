<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<%--  <link--%>
<%--          href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap"--%>
<%--          rel="stylesheet">--%>
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Yeon+Sung&display=swap" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
  <style>
    body{
      font-family: 'Noto Sans KR';
    }
    .boardbtn{
      width: 150px;
      height: 40px;
      border-radius: 15px;
      background-color: white;
      border: 1px solid black;
    }
    .boardbtn:hover {
      background-color: lightgrey;
      color: #0a56a9;
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
          s+="<h4>작성한 게시물</h4>";
          s+='<table class="table table-bordered">';
          s+='<tr>';
          s+='<th style="text-align: center; width: 50%;">제목</th>';
          s+='<th style="text-align: center; width: 20%;">작성자</th>';
          s+='<th style="text-align: center; width: 30%;">작성일</th>';
          s+='</tr>';
          $.each(res, function (i, elt){
            s+="<tr>";
            s+="<td><a href='../board/boardDetail?boardnum="+elt.boardnum+"'>"+elt.subject+"</a></td>";
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
<h1>커뮤니티</h1>
<br>
<div class="btn-group">
  <button type="button" id="myboard" class="boardbtn">작성한 게시물</button>
  <button type="button" id="myreboard" class="boardbtn">댓글 단 게시물</button>
  <button type="button" id="mylikeboard" class="boardbtn">좋아요 한 게시물</button>
</div>
<br>
  <h3 class="listcount"></h3>
  <div class="mylist"></div>
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
        s+="<h4>작성 한 게시물</h4>";
        s+='<table class="table table-bordered">';
        s+='<tr>';
        s+='<th style="text-align: center; width: 50%;">제목</th>';
        s+='<th style="text-align: center; width: 20%;">작성자</th>';
        s+='<th style="text-align: center; width: 30%;">작성일</th>';
        s+='</tr>';
        $.each(res, function (i, elt){
          s+="<tr>";
          s+="<td><a href='../board/boardDetail?boardnum="+elt.boardnum+"'>"+elt.subject+"</a></td>";
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
          s+="<h4>댓글 단 게시물</h4>";
          s+='<table class="table table-bordered">';
          s+='<tr>';
          s+='<th style="text-align: center; width: 50%;">제목</th>';
          s+='<th style="text-align: center; width: 20%;">작성자</th>';
          s+='<th style="text-align: center; width: 30%;">작성일</th>';
          s+='</tr>';
          $.each(res, function (i, elt){
            s+="<tr>";
            s+="<td><a href='../board/boardDetail?boardnum="+elt.boardnum+"'>"+elt.subject+"</a></td>";
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
        s+="<h4>좋아요 한 게시물</h4>";
        s+='<table class="table table-bordered">';
        s+='<tr>';
        s+='<th style="text-align: center; width: 50%;">제목</th>';
        s+='<th style="text-align: center; width: 20%;">작성자</th>';
        s+='<th style="text-align: center; width: 30%;">작성일</th>';
        s+='</tr>';
        $.each(res, function (i, elt){
          s+="<tr>";
          s+="<td><a href='../board/boardDetail?boardnum="+elt.boardnum+"'>"+elt.subject+"</a></td>";
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
