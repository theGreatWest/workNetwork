<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header_main.jsp" />

<section class="d-flex align-items-center dark-overlay bg-cover" style="background-image: url(${path}/resources/img/07.jpeg);">
      <div class="container py-6 py-lg-7 text-white overlay-content">
        <div class="row">
          <div class="col-xl-8">
            <h1 class="display-3 fw-bold text-shadow">workNetwork</h1>
            <p class="text-lg text-shadow" style="margin-bottom: 50px;">Find our rigts: 직장인을 위한 <span style="color: rgb(74, 226, 135);">근무 시간 통합 관리 시스템</span></p>
          </div>
        </div>
      </div>
    </section>
    <div class="container position-relative mt-n6 z-index-20">
      <ul class="nav nav-tabs search-bar-nav-tabs" role="tablist">
        <li class="nav-item me-2"><a class="nav-link active" href="#article" data-bs-toggle="tab" role="tab" style="color:rgb(44, 131, 79); font-size: 20px;">Article</a></li>
        <li class="nav-item me-2"><a class="nav-link" href="#faq" data-bs-toggle="tab" role="tab" style="color:rgb(44, 131, 79); font-size: 20px;">FAQ</a></li>
      </ul>
      <!-- 검색창에 그림자 효과 추가 -->
      <div class="search-bar search-bar-with-tabs p-3 p-lg-4" style="box-shadow: 0px 0px 10px 1px rgb(148, 148, 148);">
        <div class="tab-content">
          <div class="tab-pane fade show active" id="article" role="tabpanel">
<!-- 검색창1 -->
            <form id="index_search_article1" name="index_search_article1" method="get" action="${path}/workNetwork/searchArticleForm">
              <div class="row">
                <div class="col-lg-3 d-flex align-items-center form-group no-divider" style="border-right: 2px solid rgb(186, 186, 186);">
                      <!-- article 사이트 목록 -->
                      <select class="selectpicker form-control" id="article_keyword" name="article_keyword" title="Keyword" data-style="btn-form-control" multiple data-selected-text-format="count &gt; 2">
                        <option value="vsixnine">69시간근무제</option>
                        <option value="vfee">임금</option>
                        <option value="vhire">해고</option>
                      </select>
                    </div>
                    <!-- 타이틀 검색 -->
                    <input type="text" placeholder="  Title" name="article_title" id="article_title" data-style="btn-form-control" class="col-md-6 col-lg-7 d-flex align-items-center form-group no-divider" style="border: none; outline: none;"></input>
                    <!-- article 버튼 -->
                    <div class="col-lg-2 d-grid form-group mb-0">
                      <input class="btn btn-primary h-100" type="submit" style="background-color: green; border: none; font-size: 18px;" id="subm" value="Search"></input>
                    </div>
                  </div>
                </form>
          </div>
          <div class="tab-pane fade" id="faq" role="tabpanel">
<!-- 검색창2 -->
                		<form id="index_search_article2" name="index_search_article2" method="get" action="${path}/workNetwork/searchFaqForm">
                              <div class="row">
                                <div class="col-md-3 col-lg-3 d-flex align-items-center form-group no-divider" style="border-right: 2px solid rgb(186, 186, 186);">
                                  <select class="selectpicker form-control" title="main" data-style="btn-form-control" id="main" name="main">
                                    <option value="">전체</option>
                                    <option value="해고">해고</option>
                                    <option value="임금">임금</option>
                                  </select>
                                </div>
                                <div class="col-md-3 col-lg-2 d-flex align-items-center form-group no-divider" style="border-right: 2px solid rgb(186, 186, 186);">
                                  <select class="selectpicker" id="middle" title="middle" data-style="btn-form-control" name="middle">
                                    <option value="">전체</option>
                                  </select>
                                </div>
                                <div class="col-md-6 col-lg-5 d-flex align-items-center form-group no-divider">
                                  <input type="text" placeholder="질문 검색" name="title" id="title" data-style="btn-form-control" class="col-md-6 col-lg-7 d-flex align-items-center form-group no-divider" style="border: none; outline: none;"></input>
                                </div>
                                <!-- Lawful FAQ 버튼 -->
                                <div class="col-lg-2 d-grid form-group mb-0">
                                  <button class="btn btn-primary h-100" type="submit" style="background-color: green; border: none; outline: none; font-size: 18px;">Search </button>
                                </div>
                              </div>
                            </form>
          </div>
        </div>
      </div>
    </div>
<% Integer member_no = (Integer) request.getSession().getAttribute("member_no"); %>
<!-- 중앙 네비바 -->
    <section class="pt-4 pb-6">
      <div class="container">
        <div class="row" style="margin-top: 70px;  margin-bottom: -100px;">
            <% if (member_no != null) { %>
          <div class="col-sm-6 col-lg-3 mb-3 mb-lg-0" style="text-align: center;">
            <div class="px-0 pe-lg-3">
              <a href="${path}/workNetwork/my_page"><div class="icon-rounded mb-3 bg-teal">
                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="white" class="bi bi-clock-fill" viewBox="0 0 16 16">
                  <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8 3.5a.5.5 0 0 0-1 0V9a.5.5 0 0 0 .252.434l3.5 2a.5.5 0 0 0 .496-.868L8 8.71V3.5z"/>
                </svg>
              </div></a>
              <h3 class="h6 text-uppercase" style="font-size: 22px;">나의 근무 시간</h3>
            </div>
          </div>
            <% } else { %>

            <div class="col-sm-6 col-lg-3 mb-3 mb-lg-0" style="text-align: center;">
                <div class="px-0 pe-lg-3">
                    <a href="${path}/workNetwork/login" onclick="showAlert()"><div class="icon-rounded mb-3 bg-teal">
                        <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="white" class="bi bi-clock-fill" viewBox="0 0 16 16">
                            <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8 3.5a.5.5 0 0 0-1 0V9a.5.5 0 0 0 .252.434l3.5 2a.5.5 0 0 0 .496-.868L8 8.71V3.5z"/>
                        </svg>
                    </div></a>
                    <h3 class="h6 text-uppercase" style="font-size: 22px;">나의 근무 시간</h3>
                </div>
            </div>
            <% } %>
            <script>
                function showAlert() {
                    alert("로그인이 필요합니다");
                }
            </script>
          <div class="col-sm-6 col-lg-3 mb-3 mb-lg-0" style="text-align: center;">
            <div class="px-0 pe-lg-3">
              <a href="${path}/workNetwork/community"><div class="icon-rounded mb-3 bg-cyan">
                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="white" class="bi bi-people-fill" viewBox="0 0 16 16">
                  <path d="M7 14s-1 0-1-1 1-4 5-4 5 3 5 4-1 1-1 1H7Zm4-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6Zm-5.784 6A2.238 2.238 0 0 1 5 13c0-1.355.68-2.75 1.936-3.72A6.325 6.325 0 0 0 5 9c-4 0-5 3-5 4s1 1 1 1h4.216ZM4.5 8a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5Z"/>
                </svg>
              </div></a>
              <h3 class="h6 text-uppercase" style="font-size: 22px;">커뮤니티</h3>
            </div>
          </div>
          <div class="col-sm-6 col-lg-3 mb-3 mb-lg-0" style="text-align: center;">
            <div class="px-0 pe-lg-3">
              <a href="${path}/workNetwork/searchArticle"><div class="icon-rounded mb-3 bg-teal">
                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="white" class="bi bi-newspaper" viewBox="0 0 16 16">
                  <path d="M0 2.5A1.5 1.5 0 0 1 1.5 1h11A1.5 1.5 0 0 1 14 2.5v10.528c0 .3-.05.654-.238.972h.738a.5.5 0 0 0 .5-.5v-9a.5.5 0 0 1 1 0v9a1.5 1.5 0 0 1-1.5 1.5H1.497A1.497 1.497 0 0 1 0 13.5v-11zM12 14c.37 0 .654-.211.853-.441.092-.106.147-.279.147-.531V2.5a.5.5 0 0 0-.5-.5h-11a.5.5 0 0 0-.5.5v11c0 .278.223.5.497.5H12z"/>
                  <path d="M2 3h10v2H2V3zm0 3h4v3H2V6zm0 4h4v1H2v-1zm0 2h4v1H2v-1zm5-6h2v1H7V6zm3 0h2v1h-2V6zM7 8h2v1H7V8zm3 0h2v1h-2V8zm-3 2h2v1H7v-1zm3 0h2v1h-2v-1zm-3 2h2v1H7v-1zm3 0h2v1h-2v-1z"/>
                </svg>
              </div></a>
              <h3 class="h6 text-uppercase" style="font-size: 22px;">뉴스</h3>
            </div>
          </div>
          <div class="col-sm-6 col-lg-3 mb-3 mb-lg-0" style="text-align: center;">
            <div class="px-0 pe-lg-3">
              <a href="${path}/workNetwork/searchFaq"><div class="icon-rounded mb-3 bg-cyan">
                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="white" class="bi bi-info-circle" viewBox="0 0 16 16">
                  <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                  <path d="m8.93 6.588-2.29.287-.082.38.45.083c.294.07.352.176.288.469l-.738 3.468c-.194.897.105 1.319.808 1.319.545 0 1.178-.252 1.465-.598l.088-.416c-.2.176-.492.246-.686.246-.275 0-.375-.193-.304-.533L8.93 6.588zM9 4.5a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
                </svg>
              </div></a>
              <h3 class="h6 text-uppercase" style="font-size: 22px;">노동법 FAQ</h3>
            </div>
          </div>
        </div>
      </div>
    </section>

<!-- 섹션 시작: 근무시간 -->
    <section class="py-6">
      <div class="container" style=" margin-bottom: -120px;">
        <div class="row mb-5">
          <div class="col-md-8">
            <p class="subtitle " style="color:green; font-size: 20px;">한 눈에 보기</p>
            <h2 class="mb-md-0" style="font-size: 35px;">나의 근무 시간</h2>
          </div>
        </div>
          <% if (member_no != null) { %>
        <div style="width: 100%; height: 350px; display: flex; justify-content: space-between; margin-top: -100px;">
          <div style="display: inline-block; width: 30%;">
            <!-- 나의 근무시간에서 어떤 정보를 확인할 수 있는지 설명할 것 -->

            <div style="width: 90%; height: 70%; margin-left: 10%; margin-top: 20%; text-align: right;">
              <h5 style="color: black; text-align: left; font-weight: 900;">요일별 근무 시간</h5>
              <p style="color: rgb(112, 112, 112); font-size: 14px; text-align: left;">우측의 <span style="font-weight: 900;">WEEK</span> 탭을 눌러 주간 평균 근로 시간과 일별 근무 시간 그래프를 확인하세요.</p>
              <h5 style="color: black; text-align: left; font-weight: 900;">월별 근무 시간</h5>
              <p style="color: rgb(112, 112, 112); font-size: 14px; text-align: left;">우측의 <span style="font-weight: 900;">MONTH</span> 탭을 눌러 월간 평균 근로 시간과 월별 근무 시간 그래프를 확인하세요.</p>
              <h5 style="color: black; text-align: left; font-weight: 900;">연간 근무 시간</h5>
              <p style="color: rgb(112, 112, 112); font-size: 14px; text-align: left;">우측의 <span style="font-weight: 900;">YEAR</span> 탭을 눌러 연간 평균 근로 시간과 연도별 근무 시간 그래프를 확인하세요.</p>
            </div>
          </div>
          <div style="background-color: white; display: inline-block; width: 30%; border-radius: 10px; box-shadow: 0 0 15px #bcbcbc; text-align: center; padding: 10px;">
            <!-- <div style="height: 20%; text-align: center; margin-bottom: 8%;"> -->
              <!-- 그래프의 제목, 값(hidden)이 들어갈 자리 -->
              <!-- <h3 name="g_title" id="g_title" style="background-color: yellow; padding: 5px; margin-top: 20px;">주간 근무 시간</h3>
              <div name="g_value" style="display: none;"></div>
            </div> -->
<!-- chart 1-1 -->
            <canvas id="myChart3" style="width: 100%; height: 100%; display: block; background-color: white;"></canvas>
            <canvas id="myChart2" style="width: 100%; height: 100%; display: block; background-color: white;"></canvas>
            <canvas id="myChart" style="width: 100%; height: 100%; display: block; background-color: white;"></canvas>
            <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
            <script>
              const ctx = document.getElementById('myChart');
                new Chart(ctx, {
                  type: 'line',
                  data: {
                    labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat','Sun'],
                    datasets: [{
                      label: '주간 근무 시간',
                      data: ${week},
                      borderWidth: 3
                    }]
                  },
                  options: {
                    scales: {
                      y: {
                        beginAtZero: false,
                        /* max : 15,
                        min : 5,
	                   	 ticks: {
	   						stepSize : 1
	   					 } */
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
                      data: ${month},
                      borderWidth: 3
                    }]
                  },
                  options: {
                    scales: {
                      y: {
                        beginAtZero: false,
                        /* max: 14,
                        min: 8,
	                   	 ticks: {
	   						stepSize : 1
	   					 } */
                      }
                    }
                  }
                });

                const ctx3 = document.getElementById('myChart3');
                new Chart(ctx3, {
                  type: 'line',
                  data: {
                    labels: ['2017', '2018', '2019', '2020', '2021', '2022','2023'],
                    datasets: [{
                      label: '연간 근무 시간',
                      data: ${year},
                      borderWidth: 3
                    }]
                  },
                  options: {
                    scales: {
                      y: {
                        beginAtZero: false,
                        /* max: 14,
                        min: 7,
	                   	 ticks: {
	   						stepSize : 1
	   					 } */
                      }
                    }
                  }
                });
            </script>
          </div>
          <div style="background-color: green; display: inline-block; width: 30%; padding: 25px; border-radius: 10px; box-shadow: 0 0 15px #bcbcbc;">
            <!-- 탭, 내용이 들어갈 자리 -->
            <div class="tab" style="height: 20%; margin-bottom: 8%; display: flex; justify-content: space-between;">
              <!-- 탭 버튼이 들어갈 자리 -->
              <button id="tb1" style="background-color: rgb(215, 231, 255); padding: 6px; display: inline-block; width: 20%; border-radius: 10px; border: none; outline: none; box-shadow: 0 0 3px rgb(111, 111, 111);">
                <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="#298AC6" class="bi bi-calendar-day-fill" viewBox="0 0 16 16">
                  <path d="M4 .5a.5.5 0 0 0-1 0V1H2a2 2 0 0 0-2 2v1h16V3a2 2 0 0 0-2-2h-1V.5a.5.5 0 0 0-1 0V1H4V.5zM16 14a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V5h16v9zm-4.785-6.145a.428.428 0 1 0 0-.855.426.426 0 0 0-.43.43c0 .238.192.425.43.425zm.336.563h-.672v4.105h.672V8.418zm-6.867 4.105v-2.3h2.261v-.61H4.684V7.801h2.464v-.61H4v5.332h.684zm3.296 0h.676V9.98c0-.554.227-1.007.953-1.007.125 0 .258.004.329.015v-.613a1.806 1.806 0 0 0-.254-.02c-.582 0-.891.32-1.012.567h-.02v-.504H7.98v4.105z"/>
                </svg>
                <p class="h6 text-uppercase" style="font-size: 12px; margin-top: 4.5px;">week</p>
              </button>
              <button id="tb2" style="background-color: rgb(224, 255, 234); padding: 6px; display: inline-block; width: 20%; border-radius: 10px; border: none; outline: none; box-shadow: 0 0 3px rgb(111, 111, 111);">
                <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="#21B44B" class="bi bi-calendar-month-fill" viewBox="0 0 16 16">
                  <path d="M4 .5a.5.5 0 0 0-1 0V1H2a2 2 0 0 0-2 2v1h16V3a2 2 0 0 0-2-2h-1V.5a.5.5 0 0 0-1 0V1H4V.5zm.104 7.305L4.9 10.18H3.284l.8-2.375h.02zm9.074 2.297c0-.832-.414-1.36-1.062-1.36-.692 0-1.098.492-1.098 1.36v.253c0 .852.406 1.364 1.098 1.364.671 0 1.062-.516 1.062-1.364v-.253z"/>
                  <path d="M16 14V5H0v9a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2zM2.56 12.332h-.71L3.748 7h.696l1.898 5.332h-.719l-.539-1.602H3.1l-.54 1.602zm7.29-4.105v4.105h-.668v-.539h-.027c-.145.324-.532.605-1.188.605-.847 0-1.453-.484-1.453-1.425V8.227h.676v2.554c0 .766.441 1.012.98 1.012.59 0 1.004-.371 1.004-1.023V8.227h.676zm1.273 4.41c.075.332.422.636.985.636.648 0 1.07-.378 1.07-1.023v-.605h-.02c-.163.355-.613.648-1.171.648-.957 0-1.64-.672-1.64-1.902v-.34c0-1.207.675-1.887 1.64-1.887.558 0 1.004.293 1.195.64h.02v-.577h.648v4.03c0 1.052-.816 1.579-1.746 1.579-1.043 0-1.574-.516-1.668-1.2h.687z"/>
                </svg>
                <p class="h6 text-uppercase" style="font-size: 12px; margin-top: 4.5px; color: black;">Month</p>
              </button>
              <button id="tb3" style="background-color: rgb(250, 255, 211); padding: 6px; display: inline-block; width: 20%; border-radius: 10px; border: none; outline: none; box-shadow: 0 0 3px rgb(111, 111, 111);">
                <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="#D9D601" class="bi bi-calendar2-week-fill" viewBox="0 0 16 16">
                  <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zm9.954 3H2.545c-.3 0-.545.224-.545.5v1c0 .276.244.5.545.5h10.91c.3 0 .545-.224.545-.5v-1c0-.276-.244-.5-.546-.5zM8.5 7a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1zM3 10.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5zm3.5-.5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1z"/>
                </svg>
                <h2 class="h2 text-uppercase" style="font-size: 12px; margin-top: 4.5px; color: black;">year</h2>
              </button>
            </div>
            <div class="contents" style="background-color: white; height: 72%; border-radius: 10px; box-shadow: 0 0 3px rgb(153, 153, 153); padding: 15px;">
              <!-- 버튼에 따른 내용이 들어갈 자리 -->
              <h5 style=" font-weight: 900; margin-top: -2px;"><span id="txt1">주간</span> 평균 근로 시간</h5>
              <p style="color: rgb(112, 112, 112); font-size: 14px; text-align: left; margin-top: -10px;">이번 <span id="txt2">주</span> 평균 근무 시간은 <span id="avg" style="font-weight: 900; color: black; font-size: 18px; margin-top: -10px;">10.2</span>시간 입니다.</p>
              <h5 style=" font-weight: 900;">이번 <span id="txt4">주</span> 연장 근로 시간</h5>
              <p style="color: rgb(112, 112, 112); font-size: 14px; text-align: left; margin-top: -10px;">이번 <span id="txt3">주</span> 평균 연장 근로 시간은 <span id="plus" style="font-weight: 900; color: black; font-size: 18px;">5.1</span>시간 입니다.</p>
              <h5 id="check" style=" font-weight: 900;" value="${resultOver}">오남용 확인</h5>
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
              <% } else { %>
              <h5 style="color: black; text-align: left; font-weight: 900; font-size: 22px; color: rgb(235, 74, 49);">나의 근무시간은 로그인 후 확인하실 수 있습니다.</h5>

              <% } %>
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
      </div>
    </section>
      
<!-- 섹션 시작: 통계자료 -->
    <section class="py-6">
      <div class="container" style=" margin-bottom: -120px;">
        <div class="row mb-5">
          <div class="col-md-8">
            <p class="subtitle " style="color:green; font-size: 20px;">성별 | 규모별 | 육아휴직</p>
            <h2 class="mb-md-0" style="font-size: 35px;">통계자료 한 눈에 보기</h2>
          </div>
        </div>
        <div style="width: 100%; height: 350px; margin-top: -18px;">
          <div style="width: 100%; height: 350px;display: flex; justify-content: space-between;">
            <div style="background-color: white; display: inline-block; width: 30%; border-radius: 10px; box-shadow: 0 0 15px #bcbcbc; text-align: center;">
<!-- chart 2-1 -->
              <canvas id="chart2_1" style="width: 100%; height: 100%;"></canvas>
              <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
              <script>
                const ctx2_1 = document.getElementById('chart2_1');
              
                new Chart(ctx2_1, {
                  type: 'line',
                  data: {
                    labels: ['2017', '2018', '2019', '2020', '2021'],
                    datasets: [{
                      label: '20대 이하',
                      data: ${ageTwo},
                      borderWidth: 3
                    },{
                      label: '30대',
                      data: ${ageThree},
                      borderWidth: 3
                    },{
                       label: '40대',
                       data: ${ageFour},
                       borderWidth: 3
                    },{
                        label: '50대',
                        data: ${ageFive},
                        borderWidth: 3
                     },{
                         label: '60대 이상',
                         data: ${ageSix},
                         borderWidth: 3
                      }]
                  },
                  options: {
                    plugins: {
                      title: {
                        display: true,
                        text: '나이대별 총 근로시간'
                      },
                    },
                    scales: {
                        y: {
                        	 beginAtZero: false,
                        	 ticks: {
          						stepSize : 1
          					 }
                        }
                    }
                  }
                });
              </script>
            </div>
            <div style="background-color: white; display: inline-block; width: 30%; border-radius: 10px; box-shadow: 0 0 15px #bcbcbc; text-align: center;">
<!-- chart 2-2 -->
              <canvas id="chart2_2" style="width: 100%; height: 100%;"></canvas>
              <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
              <script>
                const ctx2_2 = document.getElementById('chart2_2');
              
                new Chart(ctx2_2, {
                  type: 'line',
                  data: {
                    labels: ['2017', '2018', '2019', '2020', '2021'],
                    datasets: [{
                        label: '5인 미만',
                        data: ${small},
                        borderWidth: 3
                      },{
                      label: '5~29인',
                      data: ${twentynine},
                      borderWidth: 3
                    },{
                      label: '30~299인',
                      data: ${thirty},
                      borderWidth: 3
                    },{
                      label: '300인미만',
                      data: ${threehundred},
                      borderWidth: 3
                    },{
                        label: '300인이상',
                        data: [200, 180, 176, 187, 190],
                        borderWidth: 3
                      }
                    ]
                  },
                  options: {
                    plugins: {
                      title: {
                        display: true,
                        text: '규모별 총 근로시간'
                      },
                    },
                    scales: {
                        y: {
                        	 beginAtZero: false,
                          ticks: {
      						stepSize : 1
      					  }
                        }
                    }
                  }
                });
              </script>
            </div>
            <div style="background-color: white; display: inline-block; width: 30%; border-radius: 10px; box-shadow: 0 0 15px #bcbcbc; text-align: center;">
<!-- chart 2-3 -->
              <canvas id="chart2_3" style="width: 100%; height: 100%;"></canvas>
              <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
              <script>
                const ctx2_3 = document.getElementById('chart2_3');
              
                new Chart(ctx2_3, {
                  type: 'line',
                  data: {
                    labels: ['2016','2017', '2018', '2019', '2020', '2021'],
                    datasets: [{
                      label: '전체',
                      data: ${total},
                      borderWidth: 3
                    },{
                      label: '부',
                      data: ${m},
                      borderWidth: 3
                    },{
                      label: '모',
                      data: ${w},
                      borderWidth: 3
                    }]
                  },
                  options: {
                    plugins: {
                      title: {
                        display: true,
                        text: '산업대분류별 출생아 부모의 육아휴직 사용률',
                      },
                    },
                    scales: {
                        y: {
                        	 beginAtZero: true,
                        	 ticks: {
                        		min : 0,
          						stepSize : 10
          					  }
                        }
                    }
                  }
                });
              </script>
            </div>
          </div>
        </div>
        </div>
      </div>
    </section>

<!-- 섹션 시작: 커뮤니티 & 노동법 FAQ -->
    <section class="py-6">
      <div class="container" style="justify-content: space-between; display: flex; margin-bottom: -120px;">
        <div class="row mb-4" style="display: inline-block; width: 45%;">
          <div class="col-md-3" style="display: inline-block; margin-right: 57.6%;">
            <p class="subtitle " style="color:green; font-size: 20px;">HOT</p>
            <h2 class="mb-md-0" style="font-size: 35px;">커뮤니티</h2>
          </div>
          <div class="col-md-2" style="display: inline-block; text-align: right; margin-bottom: 32px;"><a class="text-muted text-sm" href="${path}/workNetwork/community">list<i class="fas fa-angle-double-right ms-2"></i></a></div>
          <div style="background-color: white; width: 100%; border-radius: 10px; height: 350px; box-shadow: 0 0 15px #bcbcbc;">
            <div style="width: 100%; overflow: auto;">
	            <table style="width: 100%; white-space: nowrap;">
	                <thead style="text-align: center;">
	                  <tr>
	                      <th>#</th>
	                      <th>직종</th>
	                      <th>제목</th>
	                      <th>작성자</th>
	                      <th>날짜</th>
	                  </tr>
	                </thead>
	                <tbody>
						 <c:if test="${not empty communityList}">
			          		<c:forEach var="comV" items="${communityList}" varStatus="status">
			          			<c:if test="${comV.num == 5}">
				          			<tr style="border: none;">
			          			</c:if>
			          			<c:if test="${comV.num != 5}">
				          			<tr>
			          			</c:if>
								      <td class="td1">${comV.num}</td>
								      <td class="td2">${comV.job}</td>
								      <td class="td3" style="text-align: left;">${comV.title}</td>
								      <td class="td4">${comV.name}</td>
								      <td class="td5">${comV.create_date}</td>
							    </tr>
			          		</c:forEach>
			          	</c:if>            
	                </tbody>
	            </table>
            </div>
          </div>
        </div>

        <div class="row mb-4" style="display: inline-block; width: 45%;">
          <div class="col-md-4" style="display: inline-block; margin-right: 49.26%;">
            <p class="subtitle " style="color:green; font-size: 20px;">HOT</p>
            <h2 class="mb-md-0" style="font-size: 35px; width: 130%;">노동법 FAQ</h2>
          </div>
          <div class="col-md-2" style="display: inline-block; text-align: right; margin-bottom: 32px;"><a class="text-muted text-sm" href="${path}/workNetwork/searchFaq">list<i class="fas fa-angle-double-right ms-2"></i></a></div>
          <div style="background-color: white; width: 100%; border-radius: 10px; height: 350px; box-shadow: 0 0 15px #bcbcbc;">
            <div style="width: 100%; overflow: auto;"><table style="width: 100%; white-space: nowrap;">
              <thead style="text-align: center;">
                <tr>
                    <th>#</th>
                    <th>대분류</th>
                    <th>중분류</th>
                    <th>주제</th>
                    <th>질문</th>
                </tr>
              </thead>
              <tbody>
              	<c:if test="${not empty faqList}">
			          		<c:forEach var="comV" items="${faqList}" varStatus="status">
			          			<c:if test="${comV.num == 5}">
				          			<tr style="border: none;">
			          			</c:if>
			          			<c:if test="${comV.num != 5}">
				          			<tr>
			          			</c:if>
								      <td class="td1">${comV.num}</td>
								      <td class="td2">${comV.main}</td>
								      <td class="td3">${comV.middle}</td>
								      <td class="td4">${comV.small}</td>
								      <td class="td5" style="text-align: left;">${comV.question}</td>
							    </tr>
			          		</c:forEach>
			          	</c:if>    
              </tbody>
          </table></div>
          </div>
        </div>
      </div>
    </section>

<!-- 섹션 시작: 기사 -->
    <section class="py-6">
      <div class="container" style="margin-bottom: -35px; margin-top: -8px;">
        <div class="row mb-5">
          <div class="col-md-8">
            <p class="subtitle " style="color:green; font-size: 20px;">HOT</p>
            <h2 class="mb-md-0" style="font-size: 35px;">기사 모아보기</h2>
          </div>
          <div class="col-md-4 d-md-flex align-items-center justify-content-end"><a class="text-muted text-sm" href="${path}/workNetwork/searchArticle">list<i class="fas fa-angle-double-right ms-2"></i></a></div>
        </div>
      </div>
<!-- 기사 목록 -->
      <div class="container">
        <!-- Slider main container-->
        <div class="swiper-container swiper-init pt-3" data-swiper="{&quot;slidesPerView&quot;:5,&quot;spaceBetween&quot;:20,&quot;loop&quot;:true,&quot;roundLengths&quot;:true,&quot;breakpoints&quot;:{&quot;1200&quot;:{&quot;slidesPerView&quot;:3},&quot;991&quot;:{&quot;slidesPerView&quot;:2},&quot;565&quot;:{&quot;slidesPerView&quot;:1}},&quot;pagination&quot;:{&quot;el&quot;:&quot;.swiper-pagination&quot;,&quot;clickable&quot;:true,&quot;dynamicBullets&quot;:true}}">
          <!-- Additional required wrapper-->
          <div class="swiper-wrapper pb-5">
          	<c:if test="${not empty newsList}">
          		<c:forEach var="newsV" items="${newsList}" varStatus="status">
		            <div class="swiper-slide h-auto px-2">
		              <div class="w-100 h-100 hover-animate" data-marker-id="59c0c8e33b1527bfe2abaf92">
		                <div class="card h-100 border-0 shadow">
		                  <a href="${newsV.url}"><div class="card-img-top overflow-hidden gradient-overlay"><img class="img-fluid img_ot" src="${path}/${newsV.img}" alt=""/>
		                  </div></a>
		                  <div class="card-body d-flex align-items-center">
		                    <div class="w-100">
		                      <h6 class="card-title"><a class="text-decoration-none text-dark" href="${newsV.url}">${newsV.title}</a></h6>
		                    </div>
		                  </div>
		                </div>
		              </div>
		            </div>
          		</c:forEach>
          	</c:if>
        </div>
      </div>
    </section>


<jsp:include page="/WEB-INF/views/common/footer_main.jsp" />