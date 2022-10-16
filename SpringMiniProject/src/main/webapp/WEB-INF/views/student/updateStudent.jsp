<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Yeon+Sung&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>

    <!-- css  -->
    <c:set var="root" value="<%=request.getContextPath() %>"/>
    <link rel="stylesheet" type="text/css" href="${root}/css/stupagechange.css">
    <style type="text/css">
        #showimg{
            width: 150px;
            height: 150px;
            border-radius: 100px;
            margin-bottom: 20px;
        }

    </style>
    <script type="text/javascript">

    $(function(){

        //버튼 클릭시 사진 불러오기
        $("#btnphoto").click(function(){
            $("#myphoto").trigger("click");
        });

        //사진 불러오면 미리보기하기
        $("#myphoto").change(function(){

            //정규표현식
            var reg = /(.*?)\/(jpg|jpeg|png|bmp|gif)$/;
            var f=$(this)[0].files[0];//현재 선택한 파일
            if(!f.type.match(reg)){
                alert("확장자가 이미지파일이 아닙니다");
                return; //종료
            }
            if($(this)[0].files[0]){
            var reader=new FileReader();
            reader.onload=function(e){
                    $("#showimg").attr("src",e.target.result);
                }
                    reader.readAsDataURL($(this)[0].files[0]);
                }
        });



        // 2번째 비밀번호 입력시 체크
        $("#pass2").keyup(function(){
            var p1=$("#pass").val();
            var p2=$(this).val();
            if(p1==p2){
                $(".passsuccess").text("비밀번호 일치");
                $(".passsuccess").css("color","green");
            }else{
                $(".passsuccess").text("비밀번호 불일치");
                $(".passsuccess").css("color","red");
            }
        });

        //회원탈퇴버튼
        $("#btn_delete").click(function (){
            var ans=confirm("정말 탈퇴하시겠습니까?");
            var usernum=${sessionScope.usernum};
            if(ans)
            {
                $.ajax({
                    type: "get",
                    dataType:"text",
                    url:"delete",
                    data:{"usernum":usernum},
                    success:function(res){
                        alert("탈퇴하였습니다");
                        location.href='${root}/';
                    }
                });
            }
        });

    }); //function

    //submit 전에 호출
    function check(){

        //비밀번호
        if($(".passsuccess").text()!="비밀번호 일치"){
            alert("비밀번호가 서로 다릅니다");
            return false;
        }
    }

    </script>
</head>
<body>
<div class="sttitle">
    회원정보수정
</div>
<div class="stcontainer">
    <form action="update" method="post" enctype="multipart/form-data" onsubmit="return check()">
        <input type="hidden" name="usernum" value="${sessionScope.usernum}">
        <table class="text">
            <tr>
                <td rowspan="5" colspan="2" align="center" style="padding-right: 50px;">
                    <input type="file" id="myphoto" name="myphoto" style="display: none;">
                    <img id="showimg" src="../resources/upload/${dto.userphoto==null?'noprofilepicture.png':dto.userphoto}">
                    <br>
                    <button type="button" id="btnphoto" class="basicbtn">사진선택</button>
                </td>
                <td class="text1"> <div style="padding-bottom: 0px; width: 120px;">아이디</div></td>
                <td class="text2">
                    <div class="wrapper">
                        <input type="text" class="input" readonly name="email" value="${dto.email}" style="width: 170px;">
                    </div>
                </td>
            </tr>
            <tr>
                <td class="text1"><div style="padding-bottom: 0px;">비밀번호</div></td>
                <td class="text2">
                    <div class="wrapper">
                        <input type="password" class="input" id="pass" placeholder="새 비밀번호 입력" required="required" style="width: 170px;">
                        <span class="underline"></span>
                    </div>
                </td>
            </tr>
            <tr>
                <td class="text1"><div style="padding-bottom: 10px;">비밀번호 확인</div></td>
                <td class="text2">
                    <div class="wrapper">
                        <input type="password" class="input" id="pass2" name="userpass" placeholder="새 비밀번호 확인" required="required" style="width: 170px;">
                        <span class="underline"></span>
                        <div class="passsuccess"></div>
                    </div>
                </td>
            </tr>
            <tr>
                <td class="text1"> <div style="padding-bottom: 0px;">이름</div></td>
                <td class="text2">
                    <div class="wrapper">
                        <input type="text" class="input" name="username"
                               value="${dto.username}" placeholder="이름 입력" style="width: 170px;" required>
                        <span class="underline"></span>
                    </div>
                </td>
            </tr>
            <tr>
                <td class="text1"> <div style="padding-bottom: 0px;">닉네임</div></td>
                <td class="text2">
                    <div class="wrapper">
                        <input type="text" class="input" name="nickname"
                               value="${dto.nickname}" placeholder="닉네임 입력" style="width: 170px;" required>
                        <span class="underline"></span>
                    </div>
                </td>
            </tr>
            <tr>
                <td class="text1"> <div style="padding-bottom: 0px; width: 120px;">생년월일</div></td>
                <td class="text2">
                    <div class="wrapper">
                        <input type="text" class="input" name="birth"
                               value="${dto.birth}" placeholder="생년월일 입력" style="width: 170px;">
                        <span class="underline"></span>
                    </div>
                </td>
                <td class="text1"> <div style="padding-bottom: 0px;">핸드폰번호</div></td>
                <td class="text2">
                    <div class="wrapper">
                        <input type="text" class="input" name="hp"
                               value="${dto.hp}" placeholder="핸드폰번호 입력" style="width: 170px;">
                        <span class="underline"></span>
                    </div>
                </td>
            </tr>
            <tr>
                <td class="text1"> <div style="padding-bottom: 0px;">주소</div></td>
                <td colspan="2" class="text2">
                    <div class="wrapper">
                        <input type="text" class="input" name="addr"
                               value="${dto.addr}" placeholder="주소 입력" style="width: 280px;">
                        <span class="underline" style="width: 280px;"></span>
                    </div>
                </td>
                <td>
                <button type="button" class="basicbtn" style="margin-right: 20px;" onclick="location.href='${root}/student/timeTable'">취소하기</button>
                <button type="submit" class="basicbtn" id="btn_submit">수정하기</button>
                </td>
            </tr>
            <tr>
                <td colspan="4" style="text-align: right">
                    <button type="button" style="color: gray; border: 1px solid gray; margin-right: 25px;" class="basicbtn" id="btn_delete">탈퇴하기</button>
                </td>
            </tr>
        </table>
    </form>
</div>

</div>
</body>
</html>