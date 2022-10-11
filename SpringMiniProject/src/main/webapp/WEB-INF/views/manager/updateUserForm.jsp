<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/css/all.min.css" integrity="sha256-2XFplPlrFClt0bIdPgpz8H7ojnk10H69xRqd9+uTShA=" crossorigin="anonymous" />
    <link rel="stylesheet" href="css/manager/updateUserForm.css">
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
    <style type="text/css">
        .container{
            display: flex;
            justify-content: center;
            height: 90vh;
        }

        .last-div{
            margin-bottom: 50px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-12">
            <!-- Page title -->
            <div class="my-5">
                <h3>회원 정보</h3>
                <hr>
            </div>
            <!-- Form START -->
            <form class="file-upload" action="updateuser" method="post" enctype="multipart/form-data">

                <div class="row mb-5 gx-5">
                    <!-- Contact detail -->
                    <div class="col-xxl-8 mb-5 mb-xxl-0">
                        <div class="bg-secondary-soft px-4 py-5 rounded">
                            <div class="row g-3">
                                    <input type="text" hidden="hidden" value="${dto.usernum}" name="usernum">
                                    <input type="text" hidden="hidden" value="${dto.userpass}" name="userpass">
                                <h4 class="mb-4 mt-0">상세 정보</h4>
                                <!-- Email -->
                                <div class="col-md-6">
                                    <label class="form-label">Email</label>
                                    <input type="email" name="email" class="form-control border-info" readonly placeholder="" value="${dto.email}">
                                </div>
                                <!-- name -->
                                <div class="col-md-6">
                                    <label class="form-label">성명</label>
                                    <input type="text" name="username" class="form-control border-info" placeholder="" value="${dto.username}">
                                </div>
                                <!-- nickname -->
                                <div class="col-md-6">
                                    <label class="form-label">닉네임</label>
                                    <input type="text" name="nickname" class="form-control border-info" placeholder="" value="${dto.nickname}">
                                </div>
                                <!-- addr -->
                                <div class="col-md-6">
                                    <label class="form-label">주소</label>
                                    <input type="text" name="addr" class="form-control border-info" placeholder="" value="${dto.addr}">
                                </div>
                                <!-- hp -->
                                <div class="col-md-6">
                                    <label class="form-label">휴대전화</label>
                                    <input type="text" name="hp" oninput="autoHyphen(this)" maxlength="13" class="form-control border-info" value="${dto.hp}">
                                </div>
                                <!-- birth -->
                                <div class="col-md-6">
                                    <label class="form-label">생일</label>

                                    <input type="date" name="birth" class="form-control border-info" placeholder="" value="${dto.birth}">
                                </div>
                            </div> <!-- Row END -->
                        </div>
                    </div>
                    <!-- Upload photo -->
                    <div class="col-xxl-4">
                        <div class="bg-secondary-soft px-4 py-5 rounded">
                            <div class="row g-3">
                                <h4 class="mb-4 mt-0">회원 사진</h4>
                                <div class="text-center">
                                    <!-- Image upload -->
                                    <div class="square position-relative display-2 mb-3 border-info">
                                        <c:if test="${dto.userphoto==null}">
                                            <img src="resources/image/noimage2.png" class="showimg" width="250" height="250">
                                        </c:if>
                                        <c:if test="${dto.userphoto!=null}">
                                            <img src="upload/${dto.userphoto}" class="showimg" width="250" height="250">
                                        </c:if>
                                    </div>
                                    <!-- Button -->
                                    <input type="file" id="uphoto" name="uploadphoto" hidden="">
                                    <label class="btn btn-success-soft btn-block" for="uphoto" id="upphoto">Upload</label>
                                    <button type="button" class="btn btn-danger-soft" id="removephoto" value="${dto.usernum}">Remove</button>
                                    <!-- Content -->
                                    <p class="text-muted mt-3 mb-0"><span class="me-1">최소 사이즈 : </span>300(px) x 300(px) </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div> <!-- Row END -->

                <!-- button -->
                <div class="gap-3 d-md-flex justify-content-md-end text-center last-div">
                    <button type="submit" class="btn btn-success-soft btn-lg">Update profile</button>
                    <button type="button" class="btn btn-danger-soft btn-lg" id="cancelbutton">Cancel</button>
                </div>
            </form> <!-- Form END -->
        </div>
    </div>
</div>
<script>
    //전화번호 입력 정규식
    const autoHyphen = (target) => {
        target.value = target.value
            .replace(/[^0-9]/g, '')
            .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
    }
    //취소 버튼 누르면 뒤로가기
    $("#cancelbutton").click(function () {
        history.back();
    });
    <c:set var="root" value="<%=request.getContextPath()%>"></c:set>
    //경고 후 사진 삭제
    $("#removephoto").click(function () {
       var dephoto = confirm("경고 : 확인을 누르시면 사진이 삭제됩니다!!");
       if(dephoto){
           // console.log($(this).attr("value"));
           var s = $(this).attr("value");
           location.href="${root}/deleteuserphoto?usernum=" + s;
       }
    });
    //사진 불러오면 미리보기하기 (템플릿에 트리거 있어서 주석처리)
    // $("#upphoto").click(function(){
    //     $("#uphoto").trigger("click");
    // });
    $("#uphoto").change(function(){
        var reg = /(.*?)\/(jpg|jpeg|png|bmp|gif)$/; //정규표현식
        var f = $(this)[0].files[0]; //현재 선택한 파일
        if(!f.type.match(reg)){
            alert("확장자가 이미지파일이 아닙니다");
            return; //종료
        }
        if($(this)[0].files[0]){
            var reader = new FileReader();
            reader.onload=function(e){
                $(".showimg").attr("src",e.target.result);
            }
            reader.readAsDataURL($(this)[0].files[0]);
        }
    });
</script>
</body>
</html>