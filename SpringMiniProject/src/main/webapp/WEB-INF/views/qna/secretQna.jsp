<%--
  Created by IntelliJ IDEA.
  User: taemin
  Date: 2022/10/08
  Time: 5:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<html>
<head>
    <title>Title</title>
</head>
<%--    <meta http-equiv="Refresh" content="2;url=qnaDetail?qnanum=${dto.qnanum}&currentPage=${currentPage} ">--%>
<style>
    #allbs{
        text-align: center;
        display: block;
        display: flex;
        margin-bottom: 30px;
        margin-top: 20px;
    }
</style>
<body>


<div >
    <h1 style="text-align: center; margin-top: 70px; margin-bottom: 45px;" >비밀번호 확인</h1>

    <form action="qnaDetail" name="frm" method="get" style="text-align: center;">
        <input type="hidden" name="qnanum" value="${dto.qnanum}">
        <input type="hidden" name="currentPage" value="${currentPage}">

<%--        <input type="hidden" name="pass" value="${dto.secret}" style="text-align: center;">--%>


            <div id="allbs">

          <table style="text-align: center; align-items: center; display: block; margin: 0 auto;" >
              <tr>
                  <th style="text-align: center; display: block; align-items: center; margin-right: 10px;" > 비밀번호 </th>
                  <td>
                      <input type="password" name="pass" size="14" maxlength="4" placeholder="숫자 4자리 입력" pattern="[0-9]+" style="text-align: center;">
                  </td>
              </tr>
          </table>

            </div>

<%--            <input type="submit" VALUE="확인" style="margin-bottom: 80px;">--%>
        <button type="button" onclick="location.href='secretQna?qnanum=${dto.qnanum}&currentPage=${currentPage}'" style="width: 50px;">확인</button>

    </form>
</div>
<%--<script>--%>
<%--    alert("성공!");--%>

<%--</script>--%>


</body>
</html>
