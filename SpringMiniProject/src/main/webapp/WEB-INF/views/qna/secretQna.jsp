<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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


<%--<script>--%>
<%--    function check_pw(){--%>

<%--        var pw = document.getElementById('pass1').value;--%>
<%--        var SC = ["!","@","#","$","%"];--%>
<%--        var check_SC = 0;--%>

<%--        if(pw.length>4){--%>
<%--            window.alert('비밀번호는 4글자 이하만 가능합니다');--%>
<%--            document.getElementById('pass1').value='';--%>
<%--        }--%>
<%--        for(var i=0;i<SC.length;i++){--%>
<%--            if(pw.indexOf(SC[i]) != -1){--%>
<%--                check_SC = 1;--%>
<%--            }--%>
<%--        }--%>

<%--        }--%>
<%--        if(document.getElementById('pass1').value !=''){--%>
<%--            if(document.getElementById('pass1').value){--%>
<%--                document.getElementById('check').innerHTML='비밀번호가 일치합니다.'--%>
<%--                document.getElementById('check').style.color='blue';--%>
<%--            }--%>
<%--            else{--%>
<%--                document.getElementById('check').innerHTML='비밀번호가 일치하지 않습니다.';--%>
<%--                document.getElementById('check').style.color='red';--%>
<%--            }--%>
<%--    }--%>
<%--</script>--%>












<%--<c:if test="${sessionScope.email=='admin@gmail.com'}">--%>
<%--&lt;%&ndash;    <meta http-equiv="Accept" content="0;url=secretQna?qnanum=${dto.qnanum}&currentPage=${currentPage} ">&ndash;%&gt;--%>
<%--</c:if>--%>
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


<div style="border: 1px solid black; width: 500px; height: 300px; margin: 0 auto; margin-bottom: 50px; margin-top: 50px; text-align: center; border-radius: 15px; ">
    <h2 style="text-align: center; margin-top: 70px; margin-bottom: 45px;" >비밀번호 확인</h2>

    <form action="qnaDetail" name="frm" method="get" style="text-align: center;">
        <input type="hidden" name="qnanum" value="${dto.qnanum}">
        <input type="hidden" name="currentPage" value="${currentPage}">
<%--        <input type="hidden" name="pass" value="${dto.pass}">--%>

<%--        <input type="hidden" name="pass" value="${dto.secret}" style="text-align: center;">--%>


            <div id="allbs">

          <table style="text-align: center; align-items: center; display: block; margin: 0 auto;" >
              <tr>
                  <th style="text-align: center; display: block; align-items: center; margin-right: 10px;" > 비밀번호 </th>
                  <td>
<%--                      <input type="password" name="pass" size="14" maxlength="4" placeholder="숫자 4자리 입력" pattern="[0-9]+" style="text-align: center;" id="pass1" required="required" onkeyup="printName()"/>--%>
                      <input type="password" name="pass" size="14" maxlength="4" placeholder="숫자 4자리 입력" pattern="[0-9]+" style="text-align: center;" id="pass1" required="required">
                  </td>
              </tr>
          </table>

            </div>


<%--        <button type="button" onclick="location.href='secretQna?qnanum=${dto.qnanum}&currentPage=${currentPage}'" style="width: 50px; margin-bottom: 20px; background-color: white; border-radius: 15px; border: 1px solid grey;" id="checkpass">확인</button>--%>
       <div style="padding-top: 20px;">
        <button type="button" onclick="printName()" style="width: 50px; margin-bottom: 20px; background-color: white; border-radius: 15px; border: 1px solid grey;" id="checkpass">확인</button>
        <button type="button" onclick="location.href='qnaList' " style="width: 50px; margin-bottom: 20px; background-color: white; border-radius: 15px; border: 1px solid grey; margin-left: 5px;">취소</button>
       </div>

    </form>
</div>

<script>
    function printName() {
        const pass1=
            document.getElementById('pass1').value;
            if (pass1==${dto.pass})
            <%--if (pass1==${dto.pass})--%>
            location.href="secretQna?qnanum=${dto.qnanum}&currentPage=${currentPage}";
            else
        {
            alert("비밀번호가 맞지 않습니다");
            location.reload();
        }
    }



</script>


</body>
</html>
