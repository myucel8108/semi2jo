<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
</head>
<style>
  .four{
    font-family: cursive;
    text-align:center;
    width:550px;
    height:550px;
    box-sizing:box;
    flex-direction: row;
    align-items: center;
    justify-content: center;
    display: flex;
    top:35%;
    left:35%;
    position:absolute;
    border: 1px solid gray;
  }

  .four h1{
    height:20px;
    background-color:;
    line-height: 20px;
    text-align:center;
  }

  #updatebox{
    margin: auto;
    margin-bottom: 20px;
    margin-top: 20px;
  }
</style>
<body>
<c:if test="${sessionScope.loginok==null}">
  <script type="text/javascript">
    alert("먼저 로그인해주세요");
    history.back();
  </script>
</c:if>



<form action="update" method="post" enctype="multipart/form-data">
  <input type="hidden" name="qnanum" value="${dto.qnanum}">
  <input type="hidden" name="currentPage" value="${currentPage}">

  <table class="table table-bordered" style="width: 500px;" id="updatebox">
    <tr>
      <th style="width: 100px;">제목</th>
      <td>
        <input type="text" name="subject" class="form-control" required="required"
               value="${subject }">
      </td>

    </tr>

    <tr>
      <th style="width: 100px;">사진</th>
      <td>
        <h5 style="font-size: 15px;">사진 선택은 안하면 기존사진이 유지됩니다</h5>
        <input type="file" name="upload" class="form-control" multiple="multiple" value="${photo}">
      </td>
    </tr>

    <tr>
      <td colspan="2">
            <textarea name="content" class="form-control" required="required"
                      style="width: 500px; height: 150px;">${dto.content}</textarea>
      </td>
    </tr>

    <tr>
      <td colspan="2" align="center">
        <button type="submit" class="btn btn-outline-secondary">게시물 수정</button>
      </td>
    </tr>
  </table>
</form>
</body>
</html>