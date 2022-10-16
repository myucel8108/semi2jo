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
  <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
</head>
<style>
  .boardbtn{
    width: 100px;
    height: 40px;
    border-radius: 15px;
    background-color: white;
    border: 1px solid black;
  }
  .boardbtn:hover {
    background-color: lightgrey;
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
<body>
<c:set var="root" value="<%=request.getContextPath() %>"/>
<div class="container" style="width: 800px; padding: 50px; font-family: Noto Sans KR;">
  <form action="update" method="post" enctype="multipart/form-data">
    <input type="hidden" name="boardnum" value="${dto.boardnum}">
    <input type="hidden" name="currentPage" value="${currentPage}">
    <%--    <input type="hidden" name="email" value="${sessionScope.loginid}">--%>
    <input type="hidden" name="usernum" value="${sessionScope.usernum}">
    <table class="table table-bordered">
      <tr>
        <th style="text-align: center;">유형</th>
        <td>
          <label><input type="radio" name="boardtype" value="free" ${dto.boardtype.equals("free")?"checked":""}>&nbsp;자유</label>
          <label><input type="radio" name="boardtype" value="ask" ${dto.boardtype.equals("ask")?"checked":""}>&nbsp;질문</label>
        </td>
      </tr>
      <tr>
        <th style="width: 100px; text-align: center;">제목</th>
        <td>
          <input type="text" name="subject" class="form-control" required="required" value="${dto.subject}">
        </td>
      </tr>
      <tr>
        <th style="width: 100px; text-align: center;">사진</th>
        <td>
          <div class="phototag">
            <input type="file" name="upload" class="form-control" multiple="multiple" id="upload" value="${dto.photo}">
            <%--                        <i class="fa fa-plus photoadd" style="font-size:14px"></i>--%>
          </div>
        </td>
      </tr>
      <tr>
        <td colspan="2">
					<textarea name="content" class="form-control" required="required"
                              style="height: 400px;">${dto.content}</textarea>
        </td>
      </tr>
      <tr>
        <td colspan="2" align="center">
          <button type="submit" class="boardbtn">수정하기</button>
          <button type="button" class="boardbtn" onclick="history.back();">뒤로가기</button>
        </td>
      </tr>
    </table>
  </form>
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
                                                   style="width: 100%;padding-left:10px;">커뮤니티</a></li>
        <br>
        <li><a href="${root}/qna/qnaList"><img src="../image/1ask.png" style="width:130%; padding-right: 25px;">문의하기</a>
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
</html>
<%--<%@ page language="java" contentType="text/html; charset=UTF-8"--%>
<%--         pageEncoding="UTF-8"%>--%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>--%>
<%--<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>--%>
<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
<%--  <meta charset="UTF-8">--%>
<%--  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Yeon+Sung&display=swap" rel="stylesheet">--%>
<%--  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">--%>
<%--  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>--%>
<%--  <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>--%>

<%--  <!-- css  -->--%>
<%--  <c:set var="root" value="<%=request.getContextPath() %>"/>--%>
<%--  <link rel="stylesheet" type="text/css" href="${root}/css/board/boardform.css">--%>

<%--  <title></title>--%>
<%--  <script type="text/javascript">--%>
<%--    $(function () {--%>
<%--      //'글 유형-자유'가 기본값으로 '질문작성' 폼 숨기기--%>
<%--      $("#textarea_qna").hide();--%>

<%--      // 업로드 된 파일명--%>
<%--      $("#file").on("change",function(){--%>
<%--        fileName=$("#file")[0].files;--%>
<%--        fileList="";--%>
<%--        // 최대 업로드 이미지 수 제한--%>
<%--        if(fileName.length>5){--%>
<%--          alert("이미지는 최대 5장까지 첨부 가능합니다.");--%>
<%--          return false;--%>
<%--        }--%>
<%--        var vaildchk=1;      // 유효성 검증 값--%>
<%--        for(i=0; i<fileName.length; i++){--%>
<%--          if(checkFileName(fileName[i].name)==true) {      // 파일명 검증--%>
<%--            fileList +=fileName[i].name+", ";--%>
<%--          } else {--%>
<%--            vaildchk=0;      // 유효성 검증 실패--%>
<%--            break;--%>
<%--          }--%>
<%--        }--%>
<%--        if(vaildchk==1) {--%>
<%--          fileList=fileList.slice(0, -2);--%>
<%--          $("input.filename_list").val(fileList);--%>
<%--        } else {   // vaildchk==0--%>
<%--          fileList="";--%>
<%--          $("input.filename_list").val("파일명(확장자)를 확인 후 재업로드 해주세요");--%>
<%--        }--%>
<%--      });--%>
<%--    });--%>

<%--    //파일명 검증--%>
<%--    function checkFileName(str){--%>
<%--      var ext=str.split(".").pop().toLowerCase();--%>
<%--      if($.inArray(ext, ["bmp","jpg","png","jpeg","gif"]) == -1) {    // 파일 확장자 체크--%>
<%--        //alert(ext);--%>
<%--        alert("이미지 파일만 업로드 가능합니다.\n(업로드 가능 확장자: jpg, png, bmp, gif)");--%>
<%--        return false;--%>
<%--      }--%>
<%--    }--%>

<%--    //라디오 버튼 선택에 따라 본문 textarea 노출--%>
<%--    function setContentType(){--%>
<%--      if($("input:radio[id=contentType_normal]").is(":checked")){--%>
<%--        $("#textarea_common ").attr("placeholder", "자유롭게 작성해주세요.");--%>
<%--        $("#btn_submit").html("등록하기");--%>
<%--      } else if($("input:radio[id=contentType_qna]").is(":checked")){--%>
<%--        $("#textarea_common").attr("placeholder", "질문을 입력해주세요\n선배, 후배 또는 강사로부터 답변을 얻을 수 있습니다.");--%>
<%--        $("#btn_submit").html("질문하기");--%>
<%--      }--%>
<%--    }--%>
<%--  </script>--%>
<%--</head>--%>
<%--<body>--%>
<%--<form action="update" method="post" enctype="multipart/form-data">--%>
<%--  <input type="hidden" name="boardnum" value="${dto.boardnum}">--%>
<%--  <input type="hidden" name="currentPage" value="${currentPage}">--%>
<%--  <div class="title">--%>
<%--    글 수정하기--%>
<%--  </div>--%>
<%--  <div class="container" style="width: 100%;">--%>
<%--    <div class="box">--%>
<%--      <table class="text">--%>
<%--        <tr>--%>
<%--          <td class="text1"> <div style="padding-bottom: 20px; width: 95px;">글 유형</div></td>--%>
<%--          <td colspan="3" class="text2">--%>
<%--            <div class="wrapper">--%>
<%--              <ul>--%>
<%--                <li>--%>
<%--                  <input type="radio" id="contentType_normal" value="free" name="boardtype" checked="checked" onchange="setContentType()">--%>
<%--                  <label for="contentType_normal">자유</label>--%>
<%--                  <div class="check"></div>--%>
<%--                </li>--%>
<%--                <li>--%>
<%--                  <input type="radio" id="contentType_qna" value="ask" name="boardtype" onchange="setContentType()">--%>
<%--                  <label for="contentType_qna">질문</label>--%>
<%--                  <div class="check"><div class="inside"></div></div>--%>
<%--                </li>--%>
<%--              </ul>--%>
<%--            </div>--%>
<%--          </td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--          <td class="text1"><div style="padding-bottom: 20px;">제목</div></td>--%>
<%--          <td colspan="3" class="text2">--%>
<%--            <div class="wrapper">--%>
<%--              <input type="text" class="input" name="subject" placeholder="제목을 입력하세요" required="required" style="width: 520px;" value="${dto.subject}">--%>
<%--              <span class="underline"></span>--%>
<%--            </div>--%>
<%--          </td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--          <td class="text1"><div style="padding-bottom: 20px;">이미지 첨부</div></td>--%>
<%--          <td colspan="3" class="text2" style="padding-bottom: 10px;">--%>
<%--            <div class="filebox">--%>
<%--              <input class="filename_list" style="margin-left: 10px; outline: none;" value="이미지를 첨부하세요" readonly="readonly">--%>

<%--              <input type="file" value="첨부파일" id="file" name="upload" style="width: 520px;" multiple="multiple" value="${dto.photo}">--%>
<%--              <label for="file"><i class='far fa-images' style='font-size:36px'></i></label>--%>
<%--            </div>--%>
<%--          </td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--          <td colspan="4">--%>
<%--            <div class="wrapper_textarea" id="textarea_normal"  style="margin-top: 15px;">--%>
<%--              <div style="position:relative; margin-bottom: 15px; font-size:16px; font-weight: 500; color: #505050;" >본문</div>--%>
<%--              <textarea class="select" id="textarea_common" name="content" style="resize: none;" placeholder="본문 내용을 입력하세요">${dto.content}</textarea>--%>
<%--              <div style="font-size:12px; letter-spacing :-0.1em; position: relative; margin-bottom: 10px; color: #505050">--%>
<%--              </div>--%>
<%--            </div>--%>
<%--          </td>--%>
<%--        </tr>--%>

<%--        <tr>--%>
<%--          <td colspan="4" style="text-align: right;">--%>
<%--            <button type="button" class="btn-large2" style="margin-right: 20px;" onclick="location.href='/board/boardFree'">뒤로가기</button>--%>
<%--            <button type="submit" class="btn-large1" id="btn_submit" style="margin-right: 230px;">수정하기</button>--%>
<%--          </td>--%>
<%--        </tr>--%>

<%--      </table>--%>
<%--    </div>--%>
<%--  </div>--%>
<%--</form>--%>
<%--</body>--%>
<%--</html>--%>
