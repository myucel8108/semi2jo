<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<%--    <script src="https://cdn.jsdelivr.net/npm/chart.js@3.5.1/dist/chart.min.js"></script>--%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>

    <style type="text/css">
        @font-face {
            font-family: 'MICEGothic Bold';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEGothic Bold.woff2') format('woff2');
            font-weight: 700;
            font-style: normal;
        }

        * {
            font-family: 'MICEGothic Bold';
        }
    </style>
</head>
<c:set var="root" value="<%=request.getContextPath() %>"></c:set>

    <!-- Sidebar -->

    <!-- Sidebar -->
            <!-- TopBar -->
            <!-- Topbar -->

            <!-- Container Fluid-->
            <div class="container-fluid" id="container-wrapper">

                <div class="row mb-3">
                    <!-- Card Example-->

                    <!-- 올 한해의 전체 소득 출력 칸-->
                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card h-100">
                            <div class="card-body">
                                <div class="row align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-uppercase mb-1">
                                            Incom (<span id ="nowYear"></span> year)
                                        </div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800" id="print-total-incom">
                                            ${totalincom}
                                        </div>
<%--                                        <div class="mt-2 mb-0 text-muted text-xs">--%>
<%--                                            <span class="text-success mr-2"><i class="fa fa-arrow-up"></i> 3.48%</span>--%>
<%--                                            <span>Since last month</span>--%>
<%--                                        </div>--%>

                                    </div>
                                    <div class="col-auto">
                                        <i class="fas fa-calendar fa-2x text-primary"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 일반 회원 수 출력 란 -->
                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card h-100">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-uppercase mb-1">User</div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800" id="print-total-user"></div>
                                        ${totalUser}
<%--                                        <div class="mt-2 mb-0 text-muted text-xs">--%>
<%--                                            <span class="text-success mr-2"><i class="fas fa-arrow-up"></i> 12%</span>--%>
<%--                                            <span>Since last years</span>--%>
<%--                                        </div>--%>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fas fa-shopping-cart fa-2x text-success"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 진행중인 강좌 수 출력 란 -->
                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card h-100">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-uppercase mb-1">
                                            Lecture (<span id ="nowMonth"></span> month)
                                        </div>
                                        <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800" id="print-total-lectures"></div>
                                        ${totalLecture}
<%--                                        <div class="mt-2 mb-0 text-muted text-xs">--%>
<%--                                            <span class="text-success mr-2"><i class="fas fa-arrow-up"></i> 20.4%</span>--%>
<%--                                            <span>Since last month</span>--%>
<%--                                        </div>--%>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fas fa-users fa-2x text-info"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                    <!-- Area Chart -->
                    <div class="col-xl-8 col-lg-7" >
                        <div class="card mb-4">
                            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                <h6 class="m-0 font-weight-bold text-primary">월별 매출 현황</h6>
                            </div>
                            <div class="card-body">
<%--                                <div class="chart-area">--%>
                                    <canvas id="myChart"></canvas>
<%--                                </div>--%>
                            </div>
                        </div>
                    </div>

                    <!-- Pie Chart -->
                    <div class="col-xl-4 col-lg-5">
                        <div class="card mb-4">
                            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                <h6 class="m-0 font-weight-bold text-primary">과목별 매출 현황</h6>
                            </div>
                            <div class="card-body">
                                <canvas id="chartPie" height="300px"></canvas>
                            </div>
                        </div>
                    </div>

                    <!-- Invoice Example -->
                    <div class="col-xl-8 col-lg-7 mb-4">
                        <div class="card">
                            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                <h6 class="m-0 font-weight-bold text-primary">Invoice</h6>
                                <a class="m-0 float-right btn btn-danger btn-sm" href="#">View More <i
                                        class="fas fa-chevron-right"></i></a>
                            </div>
                            <div class="table-responsive">
                                <table class="table align-items-center table-flush">
                                    <thead class="thead-light">
                                    <tr>
                                        <th>Order ID</th>
                                        <th>Customer</th>
                                        <th>Item</th>
                                        <th>Status</th>
                                        <th>Action</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td><a href="#">RA0449</a></td>
                                        <td>Udin Wayang</td>
                                        <td>Nasi Padang</td>
                                        <td><span class="badge badge-success">Delivered</span></td>
                                        <td><a href="#" class="btn btn-sm btn-primary">Detail</a></td>
                                    </tr>
                                    <tr>
                                        <td><a href="#">RA5324</a></td>
                                        <td>Jaenab Bajigur</td>
                                        <td>Gundam 90' Edition</td>
                                        <td><span class="badge badge-warning">Shipping</span></td>
                                        <td><a href="#" class="btn btn-sm btn-primary">Detail</a></td>
                                    </tr>
                                    <tr>
                                        <td><a href="#">RA8568</a></td>
                                        <td>Rivat Mahesa</td>
                                        <td>Oblong T-Shirt</td>
                                        <td><span class="badge badge-danger">Pending</span></td>
                                        <td><a href="#" class="btn btn-sm btn-primary">Detail</a></td>
                                    </tr>
                                    <tr>
                                        <td><a href="#">RA1453</a></td>
                                        <td>Indri Junanda</td>
                                        <td>Hat Rounded</td>
                                        <td><span class="badge badge-info">Processing</span></td>
                                        <td><a href="#" class="btn btn-sm btn-primary">Detail</a></td>
                                    </tr>
                                    <tr>
                                        <td><a href="#">RA1998</a></td>
                                        <td>Udin Cilok</td>
                                        <td>Baby Powder</td>
                                        <td><span class="badge badge-success">Delivered</span></td>
                                        <td><a href="#" class="btn btn-sm btn-primary">Detail</a></td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="card-footer"></div>
                        </div>
                    </div>
                    <!-- Message From Customer-->
                    <div class="col-xl-4 col-lg-5 ">
                        <div class="card">
                            <div class="card-header py-4 bg-primary d-flex flex-row align-items-center justify-content-between">
                                <h6 class="m-0 font-weight-bold text-light">Message From Customer</h6>
                            </div>
                            <div>
                                <div class="customer-message align-items-center">
                                    <a class="font-weight-bold" href="#">
                                        <div class="text-truncate message-title">Hi there! I am wondering if you can help me with a
                                            problem I've been having.</div>
                                        <div class="small text-gray-500 message-time font-weight-bold">Udin Cilok · 58m</div>
                                    </a>
                                </div>
                                <div class="customer-message align-items-center">
                                    <a href="#">
                                        <div class="text-truncate message-title">But I must explain to you how all this mistaken idea
                                        </div>
                                        <div class="small text-gray-500 message-time">Nana Haminah · 58m</div>
                                    </a>
                                </div>
                                <div class="customer-message align-items-center">
                                    <a class="font-weight-bold" href="#">
                                        <div class="text-truncate message-title">Lorem ipsum dolor sit amet, consectetur adipiscing elit
                                        </div>
                                        <div class="small text-gray-500 message-time font-weight-bold">Jajang Cincau · 25m</div>
                                    </a>
                                </div>
                                <div class="customer-message align-items-center">
                                    <a class="font-weight-bold" href="#">
                                        <div class="text-truncate message-title">At vero eos et accusamus et iusto odio dignissimos
                                            ducimus qui blanditiis
                                        </div>
                                        <div class="small text-gray-500 message-time font-weight-bold">Udin Wayang · 54m</div>
                                    </a>
                                </div>
                                <div class="card-footer text-center">
                                    <a class="m-0 small text-primary card-link" href="#">View More <i
                                            class="fas fa-chevron-right"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--Row-->
                <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabelLogout"
                     aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabelLogout">Ohh No!</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <p>Are you sure you want to logout?</p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-outline-primary" data-dismiss="modal">Cancel</button>
                                <a href="login.html" class="btn btn-primary">Logout</a>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <!---Container Fluid-->
        </div>
        <!-- Footer -->
        <footer class="sticky-footer bg-white">
            <div class="container my-auto">
                <div class="copyright text-center my-auto">
            <span>copyright &copy; <script> document.write(new Date().getFullYear()); </script> - developed by
              <b><a href="https://indrijunanda.gitlab.io/" target="_blank">indrijunanda</a></b>
            </span>
                </div>
            </div>
        </footer>
        <!-- Footer -->
    </div>
</div>

<!-- Scroll to top -->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

<script>

    var date = new Date();
    var year = date.getFullYear();
    var month = date.getMonth();
    document.getElementById("nowMonth").innerText=month;
    document.getElementById("nowYear").innerText=year;


    //페이지 로드 되자마자 출력되는 함수들
    $(function () {
        chartPie();

        <!-- 차트 script-->
        // 차트를 그럴 영역을 dom요소로 가져온다.
        var chartArea = document.getElementById('myChart').getContext('2d');
        // 차트를 생성한다.
        var myChart = new Chart(chartArea, {
            // ①차트의 종류(String)
            type: 'bar',
            // ②차트의 데이터(Object)
            data: {
                // ③x축에 들어갈 이름들(Array)
                labels: ['1', '2', '3', '4', '5', '6',"7",'8','9','10','11','12'],
                // ④실제 차트에 표시할 데이터들(Array), dataset객체들을 담고 있다.
                datasets: [{
                    // ⑤dataset의 이름(String)
                    label: '월별매출(단위:원)',
                    // ⑥dataset값(Array)
                    data: [${incom1}, ${incom2}, ${incom3}, ${incom4}, ${incom5}, ${incom6},
                        ${incom7}, ${incom8}, ${incom9}, ${incom10}, ${incom11}, ${incom12}],
                    // ⑦dataset의 배경색(rgba값을 String으로 표현)
                    backgroundColor: 'rgba(255, 99, 132, 0.2)',
                    // ⑧dataset의 선 색(rgba값을 String으로 표현)
                    borderColor: 'rgba(255, 99, 132, 1)',
                    // ⑨dataset의 선 두께(Number)
                    borderWidth: 1
                }]
            },
            // ⑩차트의 설정(Object)
            options: {
                // ⑪축에 관한 설정(Object)
                scales: {
                    // ⑫y축에 대한 설정(Object)
                    y: {
                        // ⑬시작을 0부터 하게끔 설정(최소값이 0보다 크더라도)(boolean)
                        beginAtZero: true
                    }
                }
            }
        });

        <%--for(var i =0; i<${leclist.size()}; i++){--%>
        <%--    --%>
        <%--}--%>

        function chartPie() {
            // 차트를 그럴 영역을 dom요소로 가져온다.
            var pieChartArea = document.getElementById('chartPie').getContext('2d');
            // 차트 x 축 데이터 (lectypea)
            var lecType = "${lectureType}".split(",");
            var res0=0; var res1=0; var res2=0; var res3=0; var res4=0;
            <%--$.each(${list},function (idx, ele) {--%>
            <%--    console("test");--%>

            <%--})--%>
            <%--for(var i=0; i<${list.size()}; i++){--%>
            <%--    console.log(i);--%>
            <%--    console.log(${list.get(i).lecmonth});--%>
            <%--    console.log(${list.get(i).price});--%>
            <%--    if("${list.get(i).lecmonth}"==month){--%>
            <%--        if("${list.get(i).lectypea}"=="국어"){--%>
            <%--            res0+=${list.get(i).price};--%>
            <%--            console.log(res0);--%>
            <%--        }--%>
            <%--        if("${list.get(i).lectypea}"=="수학"){--%>
            <%--            res1+=${list.get(i).price};--%>
            <%--            console.log("res1"+res1);--%>
            <%--        }--%>
            
            <%--    }--%>
            
            <%--}--%>

            //차트 생성
            var chartPie = new Chart(pieChartArea, {
                // ①차트의 종류(String)
                type: 'pie',
                // ②차트의 데이터(Object)
                data: {
                    // ③x축에 들어갈 이름들(Array)
                    labels:["국어","영어","수학","사회","과학"]
                        // $.each(lecType,function (idx, ele) {
                        // })
                    ,
            // ④실제 차트에 표시할 데이터들(Array), dataset객체들을 담고 있다.
            datasets: [{
                // ⑤dataset의 이름(String)
                label: month+'월 과목별 매출(단위:원)',
                // ⑥dataset값(Array)
                data: [${val0},${val1},${val2},${val3},${val4}],
                // ⑦dataset의 배경색(rgba값을 String으로 표현)
                backgroundColor: ['rgba(255, 99, 132, 0.2)','rgba(76, 193, 192, 0.2)','rgba(255, 205, 86, 0.2)','rgba(54, 153, 224, 0.2)','rgba(201, 203, 207, 0.2)'],
                // ⑧dataset의 선 색(rgba값을 String으로 표현)
                borderColor: 'rgba(255, 99, 132, 1)',
                // ⑨dataset의 선 두께(Number)
                borderWidth: 1
            }]
        },
            // ⑩차트의 설정(Object)
            options: {
                // ⑪축에 관한 설정(Object)
                scales: {
                    // ⑫y축에 대한 설정(Object)
                    y: {
                        // ⑬시작을 0부터 하게끔 설정(최소값이 0보다 크더라도)(boolean)
                        beginAtZero: true
                    }
                }
            }
        });
        }
        document.getElementById("myChart").onclick = function(evt) {
            var activePoints = myChart.getElementsAtEvent(evt);

            if(activePoints.length > 0)
            {
                var clickedElementindex = activePoints[0]["_index"];
                var month = myChart.data.labels[clickedElementindex];
                console.log("label : " + month);

                var value = myChart.data.datasets[0].data[clickedElementindex];
                console.log("value : " + value);
                chartPie(month);
            }
        }

        // var w = $("#myChart").attr("height");
        // console.log(w);
        // $("#chartPie").attr("height",w);
    });//function

</script>
</body>

</html>