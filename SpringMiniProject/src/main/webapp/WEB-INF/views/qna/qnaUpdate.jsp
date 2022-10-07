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
<%--    <tr>--%>
<%--      <th style="width: 100px;">제목</th>--%>
<%--      <td>--%>
<%--        <input type="text" name="subject" class="form-control" required="required"--%>
<%--               value="${dto.subject}">--%>
<%--      </td>--%>

<%--    </tr>--%>

    <tr>

      <th style="width: 100px; text-align: center; padding-top: 15px;" >사진</th>

      <td>
          <div class="phototag">
              <div class="input-group">

        <input type="file" name="upload" class="form-control" multiple="multiple" value="${dto.photo}">

          <i class="fa fa-plus photoadd" style="font-size:14px; margin-left: 8px; margin-top: 10px;"></i>
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
                  tag+="<i class='fa fa-minus photodel' style='font-size:14px; margin-left: 8px; margin-top: 10px;' ></i>";
                  tag+="</div>";
                  $("div.phototag").append(tag);
              });

              $(document).on("click",".photodel",function(){
                  $(this).prev().remove();
                  $(this).remove();
              });

          </script>
        <tr>
<%--    <td style="width: 100px; text-align: center; padding-top: 5px; font-style: ">기존사진</td>--%>
    <td colspan="2" style="text-align: center; font-style: italic; color: grey"  >사진 선택 없을 시 기존사진이 저장됩니다</td>
</tr>
    </tr>
<%--    <td>${dto.content}</td>--%>
    <tr>
      <td colspan="2">
            <textarea name="content" class="form-control" required="required"
                      style="width: 500px; height: 350px;" value="${dto.content}">${dto.content}</textarea>
      </td>
    </tr>

    <tr>
      <td colspan="2" align="center">
        <button type="submit" class="btn btn-outline" style="color: black; text-decoration: none; background-color: white; border: 1px solid black;">수정등록</button>
      </td>
    </tr>
  </table>
</form>
</body>
</html>