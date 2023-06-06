<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!-- 푸터 수정 후 -->
    <!-- Footer-->
    <footer class="position-relative z-index-10 d-print-none" style="margin-top: 40px;">
		<!-- Main block - menus, subscribe form-->
		<div class="py-6 bg-gray-200 text-muted"> 
			<div class="container">
				<div class="row" style="height:100px; padding: 0px; margin-top: -40px;">
					<div class="col-lg-4 mb-5 mb-lg-0">
						<div class="fw-bold text-uppercase text-dark mb-3">workNetwork</div>
						<p><img src="${path}/resources/img/mail.png" style="width: 20px; height: 20px;"> &nbsp;workNetwork@bd.team3.com</img></p>
						<p style="margin-top: -10px;"><img src="${path}/resources/img/phone.png" style="width: 20px; height: 20px;"> &nbsp;(02) 1251-0683</img></p>
					</div>
					<div class="col-lg-2 col-md-6 mb-5 mb-lg-0">
						<h6 class="text-uppercase text-dark mb-3">Quick Links</h6>
						<ul class="list-unstyled">
							<% Integer member_no = (Integer) request.getSession().getAttribute("member_no"); %>

							<% if (member_no != null) { %>
							<li><a class="text-muted" href="${path}/workNetwork/my_page">나의 근무 시간</a></li>
							<% } else { %>
							<li><a class="text-muted" href="${path}/workNetwork/login", onclick="showAlert()">나의 근무 시간</a></li>
							<script>
								function showAlert() {
									alert("로그인이 필요합니다");
								}
							</script>
							<% } %>
		                <li><a class="text-muted" href="${path}/workNetwork/community">커뮤니티</a></li>
		                <li><a class="text-muted" href="${path}/workNetwork/searchArticle">뉴스</a></li>
		                <li><a class="text-muted" href="${path}/workNetwork/searchFaq">노동법 FAQ</a></li>
						</ul>
					</div>
					<div class="col-lg-2 col-md-6 mb-5 mb-lg-0">
						<h6 class="text-uppercase text-dark mb-3">Team Member</h6>
						<ul class="list-unstyled">
						<li><a class="text-muted">김영주                                   </a></li>
						<li><a class="text-muted">김하영                                   </a></li>
						<li><a class="text-muted">백진욱                                   </a></li>
						<li><a class="text-muted">이광호                                   </a></li>
						</ul>
					</div>
					<div class="col-lg-4">
						<h6 class="text-uppercase text-dark mb-3">workNetwork를 구독하세요</h6>
						<p class="mb-3"> 새롭게 업데이트 되는 소식을 놓치지 마세요</p>
						<form action="#" id="newsletter-form">
							<div class="input-group mb-3">
								<input class="form-control bg-transparent border-dark border-end-0" type="email" placeholder="Your Email Address" aria-label="Your Email Address">
								<button class="btn btn-outline-dark border-start-0" type="submit"> <i class="fa fa-paper-plane text-lg"></i></button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- Copyright section of the footer-->
		<div class="py-4 fw-light bg-gray-800 text-gray-300">
			<div class="container">
				<div class="row align-items-end"  style="text-align: right;">
					<p class="text-sm mb-md-0">&copy; 2023, WNW company.  All rights reserved.</p>
				</div>
			</div>
		</div>
	</footer>
	<!-- JavaScript files-->
    <script>
      // ------------------------------------------------------- //
      //   Inject SVG Sprite - 
      //   see more here 
      //   https://css-tricks.com/ajaxing-svg-sprite/
      // ------------------------------------------------------ //
      function injectSvgSprite(path) {
      
          var ajax = new XMLHttpRequest();
          ajax.open("GET", path, true);
          ajax.send();
          ajax.onload = function(e) {
          var div = document.createElement("div");
          div.className = 'd-none';
          div.innerHTML = ajax.responseText;
          document.body.insertBefore(div, document.body.childNodes[0]);
          }
      }    
      // to avoid CORS issues when viewing using file:// protocol, using the demo URL for the SVG sprite
      // use your own URL in production, please :)
      // https://demo.bootstrapious.com/directory/1-0/icons/orion-svg-sprite.svg
      //- injectSvgSprite('${path}icons/orion-svg-sprite.svg'); 
      injectSvgSprite('https://demo.bootstrapious.com/directory/1-4/icons/orion-svg-sprite.svg'); 
      
    </script>

<!-- =======================
Footer END -->

<!-- Back to top -->
<div class="back-top"><i class="bi bi-arrow-up-short"></i></div>

<!-- =======================
JS libraries, plugins and custom scripts -->

<!-- Bootstrap JS -->
<script src="${path}/resources/blogzine/template/assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

<!-- Vendors -->
<script src="${path}/resources/blogzine/template/assets/vendor/apexcharts/js/apexcharts.js"></script>
<script src="${path}/resources/blogzine/template/assets/vendor/overlay-scrollbar/js/OverlayScrollbars.min.js"></script>

<!-- Template Functions -->
<script src="${path}/resources/blogzine/template/assets/js/functions.js"></script>

<!-- stop watch -->
<script src="${path}/resources/js/stop_watch.js" type="text/javascript"></script>
