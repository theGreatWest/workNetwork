<%@ page import="com.multi.mvc.signup.model.mapper.SignupMapper" %>
<%@ page import="com.multi.mvc.signup.model.vo.SignupMember" %>
<%@ page import="java.util.List" %>
<%@ page import="com.multi.mvc.signup.model.vo.Member_info" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header_myPage.jsp" />

<!-- ======================= Author single START -->
<section class="pb-4">
	<div class="container">
		<div class="row g-4">

			<div class="col-lg-8" style="margin-bottom: 30px;">
				<!-- Chart START : 개인정보를 여기 다 출력하게 해야함 member, member_info -->

				<% SignupMember member = (SignupMember) request.getAttribute("member"); %>
				<% Member_info member_info = (Member_info) request.getAttribute("member_info"); %>
				<div class="card border h-100">
					<!-- Card header -->
					<div class="card-header p-3 border-bottom"  style=" background-color: rgb(149, 203, 149); border: 1px solid rgb(149, 203, 149);">
						<h5 class="card-header-title mb-0" style="color: black; text-align: center; font-weight: 900; font-size: 25px;">개인 정보 <span id="time_" v="" style="margin-left: 15px;">00:00:00</span></h5>
					</div>
					
					<!-- Card body -->
					<div class="card-body">
						<div class="d-sm-flex justify-content-sm-between align-items-center mb-4">
							<!-- Avatar detail -->
							<div class="d-flex align-items-center">
								<!-- Avatar -->
								<div class="avatar avatar-lg">
									<img class="avatar-img rounded-circle border border-white border-3 shadow" src="${path}/resources/img/logo_new.png" alt="mypage">
								</div>
								<!-- Info -->
								<div class="ms-3">
									<h5 class="mb-0"><%= member.getName() %></h5>
									<p class="mb-0 small" style="font-size: 15px;"><%=member_info.getCompany_name()%></p>
								</div>
							</div>
							<!-- Tags -->
							<div class="d-flex mt-2 mt-sm-0">
								<!-- bg-danger == 빨간색 + bg-dribbble == 핑크색 + bg-facebook == 현대오일뱅크색 -->
								<h6 class="bg-facebook py-2 px-3 text-white rounded" style="font-size: 18px;"><%=member_info.getWorker_type()%></h6>
								<h6 class="bg-info py-2 px-3 text-white rounded ms-2" style="font-size: 18px;"><%=member_info.getJob()%></h6>
							</div>
						</div>

						<!-- Information START -->
						<div class="row">
							<!-- Information item -->
							<div class="col-md-6">
								<ul class="list-group list-group-borderless">
                  <!-- 직급 -->
									<li class="list-group-item">
										<span style="font-size: 18px;">Position:</span>
										<span class="h6 mb-0" style="font-size: 18px;"><%=member_info.getPosition()%></span>
									</li>
                  <!-- Full Name -->
									<li class="list-group-item">
										<span style="font-size: 18px;">Age:</span>
										<span class="h6 mb-0" style="font-size: 18px;"><%=member_info.getAge()%></span>
									</li>
                  <!-- User Name -->
									<li class="list-group-item">
										<span style="font-size: 18px;">User Name:</span>
										<span class="h6 mb-0" style="font-size: 18px;"><%=member.getId()%></span>
									</li>
								</ul>
							</div>

							<!-- Information item -->
							<div class="col-md-6">
								<ul class="list-group list-group-borderless">
                  <!-- Email ID -->
									<li class="list-group-item">
										<span style="font-size: 18px;">Email ID:</span>
										<span class="h6 mb-0" style="font-size: 18px;"><%=member.getEmail()%></span>
									</li>
                  <!-- Mobile Number -->
									<li class="list-group-item">
										<span style="font-size: 18px;">Mobile Number:</span>
										<span class="h6 mb-0" style="font-size: 18px;"><%=member.getPhone_number()%></span>
									</li>
                  <!-- Joining Date -->
									<li class="list-group-item">
										<span style="font-size: 18px;">Joining Date:</span>
										<span class="h6 mb-0" style="font-size: 18px;"><%=member.getSignupDate()%></span>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<!-- Chart END -->
			</div>

			<div class="col-md-6 col-lg-4" style="margin-bottom: 30px;">
				<!-- Popular blog START -->
				<div class="card border h-100" style="background-color: rgb(242, 95, 95);">
					<!-- Card header -->
					<div class="card-header border-bottom p-3">
						<h5 class="card-header-title mb-0" style="text-align: center; color: white; font-size: 25px;">QR 체크</h5>
					</div>
					<!-- 본인 인증을 하기 위한 id, pwd 저장 공간 -->
					<div id="conf_id" v=<%=member.getId()%>></div>
					<div id="conf_pwd" v=<%=member.getPassword()%>></div>
					<script>
						localStorage.setItem('id', document.getElementById('conf_id').getAttribute('v'));
            			localStorage.setItem('pwd', document.getElementById('conf_pwd').getAttribute('v'));

						function popup(v){
							var whole_width=window.screen.width;
							var whole_height=window.screen.height;
							
							var url = "${path}/workNetwork/qr_check";
							var name = "QRcode";
							var x=(whole_width/2)-400;
							var y=(whole_height/2)-350;
							var option = "width = 800, height = 700, top = "+x+", left = "+y;
							
							localStorage.setItem('mode',v);

							var mode=localStorage.getItem('mode');

							window.open(url, name, option);
							document.getElementById('time_').setAttribute('v',document.getElementById("time_").innerText);
							localStorage.setItem('current_time',document.getElementById("time_").innerText);

							if(mode=='1'){
								document.getElementById('time_').style.color="rgb(242, 95, 95)";
								startClock();
                        	} else if(mode == '2') {
								document.getElementById('time_').style.color="black";
								stopClock();
							} else if(mode == '3') {

								document.getElementById('time_').style.color="black";
								var lastTime = document.getElementById('time_').innerText;

								// Send an AJAX request to the server endpoint
								var xhr = new XMLHttpRequest();
								xhr.open("POST", "/workNetwork/my_page/timecheck", true);
								xhr.setRequestHeader("Content-Type", "application/json");

								xhr.onreadystatechange = function() {
									if (xhr.readyState === 4 && xhr.status === 200) {
										// Request successfully completed
										// You can perform additional actions here if needed
									}
								};

								var data = JSON.stringify({ lastTime: lastTime });
								xhr.send(data);

								resetClock();
							}

						}

					</script>
					<!-- Card body START -->
					<div class="card-body p-3" style="background-color: white;">

						<div class="row">
							<!-- Blog item -->
							<div class="col-12" style="margin-top: 15px; margin-bottom: 15px;">
								<div class="d-flex align-items-center position-relative" >
									<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-qr-code-scan" viewBox="0 0 16 16">
										<path d="M0 .5A.5.5 0 0 1 .5 0h3a.5.5 0 0 1 0 1H1v2.5a.5.5 0 0 1-1 0v-3Zm12 0a.5.5 0 0 1 .5-.5h3a.5.5 0 0 1 .5.5v3a.5.5 0 0 1-1 0V1h-2.5a.5.5 0 0 1-.5-.5ZM.5 12a.5.5 0 0 1 .5.5V15h2.5a.5.5 0 0 1 0 1h-3a.5.5 0 0 1-.5-.5v-3a.5.5 0 0 1 .5-.5Zm15 0a.5.5 0 0 1 .5.5v3a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1 0-1H15v-2.5a.5.5 0 0 1 .5-.5ZM4 4h1v1H4V4Z"/>
										<path d="M7 2H2v5h5V2ZM3 3h3v3H3V3Zm2 8H4v1h1v-1Z"/>
										<path d="M7 9H2v5h5V9Zm-4 1h3v3H3v-3Zm8-6h1v1h-1V4Z"/>
										<path d="M9 2h5v5H9V2Zm1 1v3h3V3h-3ZM8 8v2h1v1H8v1h2v-2h1v2h1v-1h2v-1h-3V8H8Zm2 2H9V9h1v1Zm4 2h-1v1h-2v1h3v-2Zm-4 2v-1H8v1h2Z"/>
										<path d="M12 9h2V8h-2v1Z"/>
									</svg>
									<div class="ms-3" style="box-shadow: 0 0 0 12;">
										<a href="javascript:popup('1');" class="h6 stretched-link" style="font-size: 20px;">근무 시작</a>
									</div>
								</div>
							</div>
							
							<!-- Divider -->
							<hr class="my-3">

							<!-- Blog item -->
							<div class="col-12" style="margin-top: 15px; margin-bottom: 15px;">
								<div class="d-flex align-items-center position-relative" >
									<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-qr-code-scan" viewBox="0 0 16 16">
										<path d="M0 .5A.5.5 0 0 1 .5 0h3a.5.5 0 0 1 0 1H1v2.5a.5.5 0 0 1-1 0v-3Zm12 0a.5.5 0 0 1 .5-.5h3a.5.5 0 0 1 .5.5v3a.5.5 0 0 1-1 0V1h-2.5a.5.5 0 0 1-.5-.5ZM.5 12a.5.5 0 0 1 .5.5V15h2.5a.5.5 0 0 1 0 1h-3a.5.5 0 0 1-.5-.5v-3a.5.5 0 0 1 .5-.5Zm15 0a.5.5 0 0 1 .5.5v3a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1 0-1H15v-2.5a.5.5 0 0 1 .5-.5ZM4 4h1v1H4V4Z"/>
										<path d="M7 2H2v5h5V2ZM3 3h3v3H3V3Zm2 8H4v1h1v-1Z"/>
										<path d="M7 9H2v5h5V9Zm-4 1h3v3H3v-3Zm8-6h1v1h-1V4Z"/>
										<path d="M9 2h5v5H9V2Zm1 1v3h3V3h-3ZM8 8v2h1v1H8v1h2v-2h1v2h1v-1h2v-1h-3V8H8Zm2 2H9V9h1v1Zm4 2h-1v1h-2v1h3v-2Zm-4 2v-1H8v1h2Z"/>
										<path d="M12 9h2V8h-2v1Z"/>
									</svg>
									<div class="ms-3" style="box-shadow: 0 0 0 12;">
										<a href="javascript:popup('2');" class="h6 stretched-link" style="font-size: 20px;">중지</a>
									</div>
								</div>
							</div>
							<!-- Divider -->
							<hr class="my-3">

							<!-- Blog item -->
							<div class="col-12" style="margin-top: 15px;">
								<div class="d-flex align-items-center position-relative" style="margin-bottom: 10px;">
									<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-qr-code-scan" viewBox="0 0 16 16">
										<path d="M0 .5A.5.5 0 0 1 .5 0h3a.5.5 0 0 1 0 1H1v2.5a.5.5 0 0 1-1 0v-3Zm12 0a.5.5 0 0 1 .5-.5h3a.5.5 0 0 1 .5.5v3a.5.5 0 0 1-1 0V1h-2.5a.5.5 0 0 1-.5-.5ZM.5 12a.5.5 0 0 1 .5.5V15h2.5a.5.5 0 0 1 0 1h-3a.5.5 0 0 1-.5-.5v-3a.5.5 0 0 1 .5-.5Zm15 0a.5.5 0 0 1 .5.5v3a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1 0-1H15v-2.5a.5.5 0 0 1 .5-.5ZM4 4h1v1H4V4Z"/>
										<path d="M7 2H2v5h5V2ZM3 3h3v3H3V3Zm2 8H4v1h1v-1Z"/>
										<path d="M7 9H2v5h5V9Zm-4 1h3v3H3v-3Zm8-6h1v1h-1V4Z"/>
										<path d="M9 2h5v5H9V2Zm1 1v3h3V3h-3ZM8 8v2h1v1H8v1h2v-2h1v2h1v-1h2v-1h-3V8H8Zm2 2H9V9h1v1Zm4 2h-1v1h-2v1h3v-2Zm-4 2v-1H8v1h2Z"/>
										<path d="M12 9h2V8h-2v1Z"/>
									</svg>
									<div class="ms-3">
										<a href="javascript:popup('3');" class="h6 stretched-link" style="font-size: 20px;">퇴근: 근무시간 저장</a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- Card body END -->
				</div>
				<!-- Popular blog END -->
			</div>

			<hr>

      		<div class="col-md-6 col-lg-4">
				<!-- Recent comment START -->
				<div class="card border h-100" style="background-color: rgb(52, 141, 205);">
					<!-- Card header -->
					<div class="card-header border-bottom p-3">
						<h5 class="card-header-title mb-0" style="text-align: center; color: white; font-size: 25px;">HOT LINK</h5>
					</div>

					<!-- Card body START -->
					<div class="card-body p-3" style="background-color: white;">

						<div class="row">
							<!-- Comment item -->
							<div class="col-12">
								<div class="d-flex align-items-center position-relative">
									<!-- Avatar -->
									<div class="avatar avatar-lg flex-shrink-0">
										<img class="avatar-img rounded-2" src="${path}/resources/img/week.png" style="width: 55px; height: 55px;" alt="avatar">
									</div>
									<!-- Info -->
									<div class="ms-3">
										<a class="h6 stretched-link" href="javascript:select1();" style="font-size: 20px;"> 주간 근무시간</a>
									</div>
								</div>
							</div>

							<!-- Divider -->
							<hr class="my-3">

							<!-- Comment item -->
							<div class="col-12">
								<div class="d-flex align-items-center position-relative">
									<!-- Avatar -->
									<div class="avatar avatar-lg flex-shrink-0">
										<img class="avatar-img rounded-2" src="${path}/resources/img/year.png" alt="avatar"  style="width: 55px; height: 55px;">
									</div>
									<!-- Info -->
									<div class="ms-3">
										<a class="h6 stretched-link" href="javascript:select3();" style="font-size: 20px;"> 연간 근무시간 </a>
									</div>
								</div>
							</div>

							<!-- Divider -->
							<hr class="my-3">

							<!-- Comment item -->
							<div class="col-12">
								<div class="d-flex align-items-center position-relative">
									<!-- Avatar -->
									<div class="avatar avatar-lg flex-shrink-0">
										<img class="avatar-img rounded-2" src="${path}/resources/img/add_alert.png" alt="avatar"  style="width: 58px; height: 58px;">
									</div>
									<!-- Info -->
									<div class="ms-3">
										<a class="h6 stretched-link" href="javascript:select2();" style="font-size: 20px;"> 월별 근무시간 </a>
									</div>
								</div>
							</div>
							
							<!-- Divider -->
							<hr class="my-3">



						</div>
					</div>
					<!-- Card body END -->
				</div>
				<!-- Recent comment END -->
			</div>

<!-- 차트 -->
			<div class="col-lg-8">
				<!-- Chart START -->
				<div class="card border" style="margin-bottom: 10px; height: 450px; border: 3px solid rgb(68, 116, 65); border-bottom-left-radius: 0px; border-bottom-right-radius: 0px;  box-shadow: 0 0 3px rgb(153, 153, 153);">
					<!-- Card header -->
					<div class="card-header p-3 border-bottom" style="background-color: rgb(68, 116, 65);">
						<h5 class="card-header-title mb-0" id="graph_title" style="text-align: center; color: white; font-size: 25px;">근무시간</h5>
					</div>
					
					<canvas id="myChart3" style="width: 100%; height: 100%; display: block; background-color: white; position: absolute; margin-top: 10%; height: 80%;"></canvas>
					<canvas id="myChart2" style="width: 100%; height: 100%; display: block; background-color: white; position: absolute; margin-top: 10%; height: 80%;"></canvas>
					<canvas id="myChart" style="width: 100%; height: 100%; display: block; background-color: white; position: absolute; margin-top: 10%; height: 80%;"></canvas>
					<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
					<script>
					const ctx = document.getElementById('myChart');
						new Chart(ctx, {
						type: 'line',
						data: {
							labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat','Sun'],
							datasets: [{
							label: '주간 근무 시간',
							data: ${week}, // 여기에 근무시간 데이터 (이번주)
							borderWidth: 3
							}]
						},
						options: {
							scales: {
							y: {
								beginAtZero: true
							}
							}
						}
						});

						const ctx2 = document.getElementById('myChart2');
						new Chart(ctx2, {
						type: 'line',
						data: {
							labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun','Jul','Aug','Sept','Oct','Nov','Dec'],
							datasets: [{
							label: '월별 근무 시간',
							data: ${month}, // 이게 월별 근무시간
							borderWidth: 3
							}]
						},
						options: {
							scales: {
							y: {
								beginAtZero: true
							}
							}
						}
						});

						const ctx3 = document.getElementById('myChart3');
						new Chart(ctx3, {
						type: 'line',
						data: {
							labels: ['2016', '2017', '2018', '2019', '2020', '2021','2022'],
							datasets: [{
							label: '연간 근무 시간',
							data: ${year},// 이곳은 한 해 근무시간
							borderWidth: 3
							}]
						},
						options: {
							scales: {
							y: {
								beginAtZero: true
							}
							}
						}
						});
					</script>
				</div>
				<!-- Chart END -->
				<div class="tab" style="height: 20%; margin-bottom: 10px; display: flex; justify-content: space-between; height: 50px;">
					<!-- 탭 버튼이 들어갈 자리 -->
					<button id="tb1" style="background-color: rgb(247, 247, 247); padding: 6px; width: 32%; border: none; outline: none; box-shadow: 0 0 3px rgb(111, 111, 111);">
					  <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="#298AC6" class="bi bi-calendar-day-fill" viewBox="0 0 16 16">
						<path d="M4 .5a.5.5 0 0 0-1 0V1H2a2 2 0 0 0-2 2v1h16V3a2 2 0 0 0-2-2h-1V.5a.5.5 0 0 0-1 0V1H4V.5zM16 14a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V5h16v9zm-4.785-6.145a.428.428 0 1 0 0-.855.426.426 0 0 0-.43.43c0 .238.192.425.43.425zm.336.563h-.672v4.105h.672V8.418zm-6.867 4.105v-2.3h2.261v-.61H4.684V7.801h2.464v-.61H4v5.332h.684zm3.296 0h.676V9.98c0-.554.227-1.007.953-1.007.125 0 .258.004.329.015v-.613a1.806 1.806 0 0 0-.254-.02c-.582 0-.891.32-1.012.567h-.02v-.504H7.98v4.105z"/>
					  </svg>
					  <span class="h6 text-uppercase" style="font-size: 14px; margin-top: 4.5px; padding: 20px; line-height: 40px;">week</span>
					</button>
					<button id="tb2" style="background-color: rgb(247, 247, 247); padding: 6px; width: 32%; border: none; outline: none; box-shadow: 0 0 3px rgb(111, 111, 111);">
					  <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="#21B44B" class="bi bi-calendar-month-fill" viewBox="0 0 16 16">
						<path d="M4 .5a.5.5 0 0 0-1 0V1H2a2 2 0 0 0-2 2v1h16V3a2 2 0 0 0-2-2h-1V.5a.5.5 0 0 0-1 0V1H4V.5zm.104 7.305L4.9 10.18H3.284l.8-2.375h.02zm9.074 2.297c0-.832-.414-1.36-1.062-1.36-.692 0-1.098.492-1.098 1.36v.253c0 .852.406 1.364 1.098 1.364.671 0 1.062-.516 1.062-1.364v-.253z"/>
						<path d="M16 14V5H0v9a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2zM2.56 12.332h-.71L3.748 7h.696l1.898 5.332h-.719l-.539-1.602H3.1l-.54 1.602zm7.29-4.105v4.105h-.668v-.539h-.027c-.145.324-.532.605-1.188.605-.847 0-1.453-.484-1.453-1.425V8.227h.676v2.554c0 .766.441 1.012.98 1.012.59 0 1.004-.371 1.004-1.023V8.227h.676zm1.273 4.41c.075.332.422.636.985.636.648 0 1.07-.378 1.07-1.023v-.605h-.02c-.163.355-.613.648-1.171.648-.957 0-1.64-.672-1.64-1.902v-.34c0-1.207.675-1.887 1.64-1.887.558 0 1.004.293 1.195.64h.02v-.577h.648v4.03c0 1.052-.816 1.579-1.746 1.579-1.043 0-1.574-.516-1.668-1.2h.687z"/>
					  </svg>
					  <span class="h6 text-uppercase" style="font-size: 14px; margin-top: 4.5px; color: black; padding: 20px; line-height: 40px;">Month</span>
					</button>
					<button id="tb3" style="background-color: rgb(247, 247, 247); padding: 6px; width: 32%; border: none; outline: none; box-shadow: 0 0 3px rgb(111, 111, 111);">
					  <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="#D9D601" class="bi bi-calendar2-week-fill" viewBox="0 0 16 16">
						<path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zm9.954 3H2.545c-.3 0-.545.224-.545.5v1c0 .276.244.5.545.5h10.91c.3 0 .545-.224.545-.5v-1c0-.276-.244-.5-.546-.5zM8.5 7a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1zM3 10.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5zm3.5-.5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1z"/>
					  </svg>
					  <span class="h2 text-uppercase" style="font-size: 14px; margin-top: 4.5px; color: black; padding: 20px; line-height: 40px;">year</span>
					</button>
				</div>
				<div style="background-color:white; height: 180px; border-bottom-left-radius: 5px; border-bottom-right-radius: 5px;  box-shadow: 0 0 3px rgb(153, 153, 153); height: 19%; padding-top: 13px;">
					<div class="contents" style="line-height: 40px; background-color: white; height: 100%; border-radius: 10px; padding: 15px; border-top-left-radius: 0px; border-top-right-radius: 0px; display: flex; justify-content: space-between; padding-top: 20px;">
						<!-- 버튼에 따른 내용이 들어갈 자리 -->
						<div>
							<h5 style="text-align: center; font-weight: 900; margin-top: -2px;"><span id="txt1">주간</span> 평균 근로 시간</h5>
							<p style="padding-top: 5px; color: rgb(112, 112, 112); font-size: 14px; text-align: left; margin-top: -10px;">이번 <span id="txt2">주</span> 평균 근무 시간은 <span id="avg" style="font-weight: 900; color: black; font-size: 18px; margin-top: -10px;">10.2</span>시간 입니다.</p>
						</div>
						<div>
							<h5 style="text-align: center; font-weight: 900;">이번 <span id="txt4">주</span> 연장 근로 시간</h5>
							<p style="padding-top: 5px; color: rgb(112, 112, 112); font-size: 14px; text-align: left; margin-top: -10px;">이번 <span id="txt3">주</span> 평균 연장 근로 시간은 <span id="plus" style="font-weight: 900; color: black; font-size: 18px;">5.1</span>시간 입니다.</p>
						</div>
						<div>
							<h5 id="check" style="text-align: center; font-weight: 900;" value="1">오남용 확인</h5>
							<div style="margin-top: -5px;">
								<svg id="check_icon" xmlns="http://www.w3.org/2000/svg" fill="green" width="32" height="32" class="bi bi-check-lg" viewBox="0 0 16 16">
									<path d="M12.736 3.97a.733.733 0 0 1 1.047 0c.286.289.29.756.01 1.05L7.88 12.01a.733.733 0 0 1-1.065.02L3.217 8.384a.757.757 0 0 1 0-1.06.733.733 0 0 1 1.047 0l3.052 3.093 5.4-6.425a.247.247 0 0 1 .02-.022Z"/>
								</svg>
								<span>노사 부조리 신고센터 <a href="https://minwon.moel.go.kr/rptcenterType15/regist.do" target="_blank" style="text-decoration: none; margin-left: 8px; pointer-events: none;"><span id="go" style="color: green;">바로가기
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box-arrow-up-right" viewBox="0 0 16 16" style="margin-top: -5.5px; margin-left: 2px;">
									<path fill-rule="evenodd" d="M8.636 3.5a.5.5 0 0 0-.5-.5H1.5A1.5 1.5 0 0 0 0 4.5v10A1.5 1.5 0 0 0 1.5 16h10a1.5 1.5 0 0 0 1.5-1.5V7.864a.5.5 0 0 0-1 0V14.5a.5.5 0 0 1-.5.5h-10a.5.5 0 0 1-.5-.5v-10a.5.5 0 0 1 .5-.5h6.636a.5.5 0 0 0 .5-.5z"/>
									<path fill-rule="evenodd" d="M16 .5a.5.5 0 0 0-.5-.5h-5a.5.5 0 0 0 0 1h3.793L6.146 9.146a.5.5 0 1 0 .708.708L15 1.707V5.5a.5.5 0 0 0 1 0v-5z"/>
								</svg></span></a></span>
							</div>
						</div>
					</div>
				</div>
				<script>
					document.getElementById('tb1').addEventListener('click',select1);
					document.getElementById('tb2').addEventListener('click',select2);
					document.getElementById('tb3').addEventListener('click',select3);

					function check(){
						check = document.getElementById('check').getAttribute('value');
						if(check == "0"){ // 오남용X
							document.getElementById('check_icon').setAttribute('fill','green');
							document.getElementById('go').style.color="green";
							document.getElementById('go').style.pointerEvents="none";
						}else{ // 오남용O
							document.getElementById('check_icon').setAttribute('fill','red');
							document.getElementById('go').style.color="red";
							document.getElementById('go').style.pointerEvents="auto";
						}
					};
					select1();
					check();

					function select1(){
						document.getElementById('myChart').style.display="block";
						document.getElementById('myChart2').style.display="none";
						document.getElementById('myChart3').style.display="none";
						document.getElementById('txt1').innerHTML="주간";
						document.getElementById('txt2').innerHTML="주";
						document.getElementById('txt3').innerHTML="주";
						document.getElementById('txt4').innerHTML="주";
						document.getElementById('avg').innerText = ${weekTotalHour};
						document.getElementById('plus').innerText = ${weekTotalOverHour};
					};
					function select2(){
						document.getElementById('myChart').style.display="none";
						document.getElementById('myChart2').style.display="block";
						document.getElementById('myChart3').style.display="none";
						document.getElementById('txt1').innerHTML="월간";
						document.getElementById('txt2').innerHTML="달";
						document.getElementById('txt3').innerHTML="달";
						document.getElementById('txt4').innerHTML="달";
						document.getElementById('avg').innerText = ${monthTotalHour};
						document.getElementById('plus').innerText = ${monthTotalOverHour};
					};
					function select3(){
						document.getElementById('myChart').style.display="none";
						document.getElementById('myChart2').style.display="none";
						document.getElementById('myChart3').style.display="block";
						document.getElementById('txt1').innerHTML="연간";
						document.getElementById('txt2').innerHTML="연도";
						document.getElementById('txt3').innerHTML="연도";
						document.getElementById('txt4').innerHTML="연도";
						document.getElementById('avg').innerText = ${yearTotalHour};
						document.getElementById('plus').innerText = ${yearTotalOverHour};
					};
				</script>
			</div>
<!-- /차트 끝 -->
		</div>
	</div>
</section>
<!-- =======================
Main contain END -->
</main>

<jsp:include page="/WEB-INF/views/common/footer_mix.jsp" />