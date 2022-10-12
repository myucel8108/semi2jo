<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" type="text/css" href="${root}/css/qna.css">
<link rel="stylesheet" type="text/css" href="${root}/css/taeminfont.css">
<link rel="stylesheet" type="text/css" href="${root}/css/TeachMeStyle.css">
<script src="${pageContext.request.contextPath}/resources/javascript/taemin.js"></script>
<%--<script src="${pageContext.request.contextPath}/taemin.js"></script>--%>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
</head>
<style>

    #go{
        background-color: white;
        border-color: white;
        margin-top: 100px;
        color: black;
    }

    #tctext{
        background: linear-gradient(to right, #25aae1, #4481eb, #04befe, #3f86ed);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
    }


    #go:hover{
        background: linear-gradient(to right, #25aae1, #4481eb, #04befe, #3f86ed);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        /*background-color: #3f86ed;*/
        border-color: grey;
        outline-color: grey;
    }



    .wrap {
        top: 50%;
        left:50%;
        transform: translate(-50%, -50%);
        position: absolute;
        text-align: center;

    }

    #dynamic{
        position: relative;
        display: inline-block;
        color: black;
    }

    #dynamic::after{
        content:"";
        display: block;
        position: absolute;
        top: 0;
        right: -10px;
        width: 4px;
        height: 100%;
        background-color: black;
        color: black;
    }

    #dynamic.active::after{
        display: none;

    }

    .lg-text{
        background: linear-gradient(to right, #25aae1, #4481eb, #04befe, #3f86ed);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
    }



/*------------------아래는 원본 위에는 테스트 중 ------------------*/

/*#tp {*/
/*    font-size: 20px;*/
/*    min-width:5px;*/
/*    white-space: nowrap;*/
/*    !*position: fixed;*!*/
/*    color: transparent;*/
/*    left:50%;*/
/*    bottom: 25%;*/
/*    transform: translate(-50%, -50%);*/
/*    position: absolute;*/
/*    text-align: center;*/
/*}*/

/*    #tp::before {*/
/*        content: "Teach me how to study!";*/
/*        position: absolute;*/
/*        top: 14px;*/
/*        left: 15px;*/
/*        width: 100%;*/
/*        text-align: center;*/
/*        height: 50%;*/
/*        color: black;*/
/*        overflow: hidden;*/
/*        border-right: 1px solid black;*/
/*        animation: cursor 5s steps(21) infinite;*/
/*    }*/

/*    @keyframes cursor{*/
/*        0% {*/
/*            width: 0%;*/
/*        }*/
/*        50% {*/
/*            width: 50%;*/
/*        }*/
/*        100% {*/
/*            width: 100%;*/
/*        }*/
/*    }*/
















</style>
<body>
  <!--Section-1-->
    <section class="section-1">
        <div class="jumbotron d-flex align-items-center">
            <div class="gradient" ></div>
            <div class="container-fluid content" style="height: 150px; padding-bottom: 380px;" >
                <h1 data-aos="fade-up" data-aos-delay="100" style="margin-bottom: 50px; color: white; font-family: 'BM Dohyeon';">국내 최다 합격률 <span style="color:#3f86ed;" id="tctext">티치미</span> 입시학원</h1>
                <h2 data-aos="fade-up" data-aos-delay="300" style="margin-bottom: 50px; color: lightgray;">국내 최고의 강사진과 함께하는 체계적인 커리큘럼</h2>
                <div class="wrap">
                <h4 data-aos="fade-up" data-aos-delay="500" style="background-color: white; color: black; margin-top: 250px; border-radius: 15px;" id="tp"><b id="dynamic" class="lg-text"></b></h4>
                </div>
                <p data-aos="fade-up" data-aos-delay="700"><a href="/mini/" class="btn btn-success" id="go" >학습하기</a></p>
            </div>
            <!--container-fluid end-->
        </div>
    </section>
    <!--Section-2-->
    <section class="section-2">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-sm-12 col-12 box-1">
                    <div class="row box" data-aos="fade-left" data-aos-delay="300">
                        <div class="col-lg-2 col-sm-12">
                            <i class="fa fa-desktop" aria-hidden="true"></i>
                        </div>
                        <div class="col-lg-10 col-sm-12">
                            <h3><a href="services.html">첫 번째</a></h3>
                            <p>교육의 본질은 쌍방향의 소통입니다. 직업 윤리를 떠나 학생들을 가르침에 따라 모든 선생님들은 보람을 느끼고 힘을 얻습니다. 저희는 상호간의 이해와 관계의 공유에서 많은 변화를 만들어 낼 것 입니다. </p>
                            <p><a href="services.html"><img src="image/plus.png" alt="plus"></a></p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-sm-12 col-12 box-2">
                    <div class="row box" data-aos="fade-left" data-aos-delay="500">
                        <div class="col-lg-2 col-sm-12">
                            <i class="fa fa-code" aria-hidden="true"></i>
                        </div>
                        <div class="col-lg-10 col-sm-12">
                            <h3><a href="services.html">두 번째</a></h3>
                            <p>내신과 수능 모두를 겸비할 수 있는 학원이 되겠습니다. 한달의 한번씩 있는 학교 자체 모의고사를 통해 현재 자신의 위치와 전략을 만들어가면서 향후 미래에 좋은 입시 결과를 만들어 낼 것 입니다.</p>
                            <p><a href="services.html"><img src="image/plus.png" alt="plus"></a></p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-sm-12 col-12 box-3">
                    <div class="row box" data-aos="fade-left" data-aos-delay="700">
                        <div class="col-lg-2 col-sm-12">
                            <i class="fa fa-comments-o" aria-hidden="true"></i>
                        </div>
                        <div class="col-lg-10 col-sm-12">
                            <h3><a href="services.html">세 번째</a></h3>
                            <p>매 해 바뀌는 입시제도 하에서 학생 개개인에게 맞는 학습방법과 전략을 짜기 위해선 학생이 원하는 수강 목록과 선생님을 고르되 자신이 책임지고 수업에 임해야 한다는 점을 강조하며 만든 시스템입니다.
                           		멋진 도전을 위해 함께한다면 결코 후회없는 1년이 될 것 입니다. </p>
                            <p><a href="services.html"><img src="image/plus.png" alt="plus"></a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="section-3">
        <div class="container">
            <div class="row m-0">
                <div class="col-lg-5 col-md-12 p-0" data-aos="fade-right" data-aos-delay="300">
                    <h2> 왜 TeachMe <span>선택해야 하는가?</span></h2>
                    <ul>
                        <li><a href="services.html"><i class="fa fa-angle-right" aria-hidden="true"></i>학원 자체의 모의고사를 실전처럼</a></li>
                        <li><a href="services.html"><i class="fa fa-angle-right" aria-hidden="true"></i>다른 학생들과 커뮤니티를 통한 정보교환</a></li>
                        <li><a href="services.html"><i class="fa fa-angle-right" aria-hidden="true"></i>자유로운 수강 선택</a></li>
                        <li><a href="services.html"><i class="fa fa-angle-right" aria-hidden="true"></i>책임감과 노하우가 있는 강사진과 시스템</a></li>                    
                    </ul>
                </div>
                <div class="col-lg-7 col-md-12 p-0" data-aos="fade-left" data-aos-delay="300">
                    <figure>
                        <img class="inner-img" src="" alt="services">
                        <img class="out-sideimg" src="" alt="services">
                    </figure>
                </div>
            </div>
        </div>
    </section>
   
    <!--Section-5-->
    <section class="section-5">
        <div class="container">
            <div class="row">
                <div class="col-lg-7 col-sm-8">
                    <h3> <span>국내 최고의 강사들이 한 곳에</span></h3>
                </div>
                <div class="col-lg-5 col-sm-4">
                    <a href="portfolio.html" class="btn btn-success">강사진 확인</a>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row"  data-aos="fade-up" data-aos-delay="300">
                <a href="image/portfolio-2.jpg" data-toggle="lightbox" data-gallery="example-gallery" class="col-sm-3 box">
                  <img src="image/tea/tea4.png" class="img-fluid">
                  <div class="overlay">
                  <img src="" alt="plus-icon">
                  <div class="inner-text"><h4>국어 김젬마<span>top view</span></h4></div>
                  </div>
                </a>
                <a href="images/portfolio-3.jpg" data-toggle="lightbox" data-gallery="example-gallery" class="col-sm-3 box">
                  <img src="image/tea/tea1.png" class="img-fluid">
                  <div class="overlay">
                  <img src="" alt="plus-icon">
                  <div class="inner-text"><h4>수학 한석원<span>top view</span></h4></div>
                  </div>
                </a>
                <a href="image/portfolio-4.jpg" data-toggle="lightbox" data-gallery="example-gallery" class="col-sm-3 box">
                  <img src="image/tea/tea2.png" class="img-fluid">
                  <div class="overlay">
                  <img src="" alt="plus-icon">
                  <div class="inner-text"><h4>역사 이다지 <span>top view</span></h4></div>
                  </div>
                </a>
                <a href="image/portfolio-5.jpg" data-toggle="lightbox" data-gallery="example-gallery" class="col-sm-3 box">
                  <img src="image/tea/tea3.png" class="img-fluid">
                  <div class="overlay">
                  <img src="" alt="plus-icon">
                  <div class="inner-text"><h4>영어 원정의<span>top view</span></h4></div>
                  </div>
                </a>
            </div>
            <!--/row-->
        </div>
        <!--container-->
    </section>
    
   
    <section class="section-7">
        <!-- Footer -->
        <footer class="page-footer font-small stylish-color-dark">

            <!-- Footer Links -->
            <div class="container text-center text-md-left">

                <!-- Grid row -->
                <div class="row">

                    <!-- Grid column -->
                    <div class="col-lg-5 col-sm-12 mx-auto box-1">

                        <!-- Content -->
                        <p>인간은 사실 따지고 보면 능력이 다 비슷비슷하다. 하지만 속으로 자신이 천재라고 숨겨진 재능이 있다고 생각하지 말자 이런 비슷한 사람들 속에서 살아남을려면
                        	남들 놀 때 공부하는 수 밖에 없다.
                         </p>

                    </div>
                    <!-- Grid column -->

                    <hr class="clearfix w-100 d-md-none">

                    <!-- Grid column -->
                    <div class="col-lg-2 col-sm-4 box-2 mx-auto">

                        <!-- Links -->
                        <h5>Site Navigation</h5>

                        <ul class="list-unstyled">
					<li>
                        <a href="/mini/">Home</a>
                    </li>
                    <li >
                        <a  href="about.html">About us</a>
                    </li>
                    <li >
                        <a  href="${root}/lecture/lectureList">lecture</a>
                    </li>
                    <li>
                        <a  href="${root}/board/boardFree">community</a>
                    </li>
                    <li >
                        <a href="${root}/layoutMypage/change">My page</a>
                    </li>
                    <li >
                        <a  href="${root}/qna/qnaList">Q & A</a>
                    </li>
                    <li>
                            
		   </ul>

                    </div>
                    <!-- Grid column -->

                    <hr class="clearfix w-100 d-md-none">

                    <!-- Grid column -->
                    <div class="col-lg-2 col-sm-4 box-3 mx-auto">

                        <!-- Links -->
                        <h5>information</h5>

                        <ul class="list-unstyled">
                            <li>
                                <a href="#!">user login</a>
                            </li>
                            <li>
                            </li>
                            <li>
                                <a href="#!">checkout</a>
                            </li>
                            <li>
                                <a href="#!">my cart</a>
                            </li>
                            <li>
                                <a href="#!">other information</a>
                            </li>
                        </ul>

                    </div>
                    <!-- Grid column -->

                    <hr class="clearfix w-100 d-md-none">

                    <!-- Grid column -->
                    <div class="col-lg-2 col-sm-4 box-4 mx-auto">

                        <!-- Links -->
                        <h5>policies & Info</h5>

                        <ul class="list-unstyled">
                            <li>
                                <a href="#!">Terms Conditions </a>
                            </li>
                            <li>
                                <a href="#!">website polocy</a>
                            </li>
                            <li>
                                <a href="#!">Policy for Sellers </a>
                            </li>
                            <li>
                                <a href="#!">Policy for Buyers</a>
                            </li>
                            <li>
                                <a href="#!">Shipping & Refund </a>
                            </li>
                            <li>
                                <a href="#!">Wholesale Policy</a>
                            </li>
                        </ul>

                    </div>
                    <!-- Grid column -->

                </div>
                <!-- Grid row -->

            </div>

        </footer>
    </section>

</body>
<script>

    let target = document.querySelector("#dynamic");



    function randomString(){
        let stringArr = ["대한민국 입시 부동의 1위","Teach you how to study", "2021년도 합격률 98%",
            "학생 맞춤형 공부법","2021년도 합격률 97%","10년 연속 합격률 95% 달성"];
        let selectString = stringArr[Math.floor(Math.random()* stringArr.length)];
        let selectStringArr = selectString.split("");

        return selectStringArr;
    }


    function resetTyping(){
        target.textContent= "";

        dynamic(randomString());
    }



    function dynamic(randomArr){

        if(randomArr.length > 0){
            target.textContent += randomArr.shift();
            setTimeout(function(){
                dynamic(randomArr);
            },80);
        }else{
            setTimeout(resetTyping, 3000);
        }

    }

    dynamic(randomString());




    function blink(){
        target.classList.toggle("active");

    }
    setInterval(blink, 500);






















    // let target = document.querySelector("#dynamic");
    // function randomString() {
    //     let stringArr = ["대한민국 입시 부동의 1위", "꿈을 이룰 수 있는 유일한 곳", "2021년도 합격률 98%",
    //         "학생 맞춤형 공부법", "2020년도 합격률 97%", "10년 연속 합격률 95% 달성"];
    //     let selectString = stringArr[Math.floor(Math.random() * stringArr.length)];
    //     let selectStringArr = selectString.split("");
    //
    //     return selectStringArr;
    //
    //
    //     function resetTyping() {
    //         target.textContent = "";
    //         dynamic(randomString());
    //     }
    //
    //
    //     function dynamic(randomArr) {
    //
    //         if (randomArr.length > 0) {
    //             target.textContent += randomArr.shift();
    //             setTimeout(function () {
    //                 dynamic(randomArr);
    //             }, 80);
    //         } else {
    //             setTimeout(resetTyping, 3000);
    //         }
    //     }
    //
    //     dynamic(randomString());
    //
    //
    //     //커서 깜빡임 효과
    //     function blink() {
    //         target.classList.toggle("active");
    //     }
    //     setInterval(blink, 500);
    // }

    // let horizontalUnderLine = document.getElementById("horizontal-underline");
    // let horizontalMenus = document.querySelectorAll("nav2:first-child a");
</script>










</html>