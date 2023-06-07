<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>workNetwork</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
    <!-- Price Slider Stylesheets -->
    <link rel="stylesheet" href="${path}/resources/bootstrap-5/html/vendor/nouislider/nouislider.css">
    <!-- Google fonts - Playfair Display-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700">
    <!-- Google fonts - Poppins-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,400i,700">
    <!-- swiper-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.1/css/swiper.min.css">
    <!-- Magnigic Popup-->
    <link rel="stylesheet" href="${path}/resources/bootstrap-5/html/vendor/magnific-popup/magnific-popup.css">
    <!-- Leaflet Maps-->
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.5.1/dist/leaflet.css" integrity="sha512-xwE/Az9zrjBIphAcBb3F6JVqxf46+CDLwfLMHloNu6KEQCAWi6HcDUbeOfBIptF7tcCzusKFjFw2yuvEpDL9wQ==" crossorigin="">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="${path}/resources/bootstrap-5/html/css/style.default.css" id="theme-stylesheet">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="${path}/resources/bootstrap-5/html/css/custom.css">
    <!-- Favicon-->
    <link rel="shortcut icon" href="${path}/resources/img/logo_new.png">
    <!-- Tweaks for older IEs--><!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    <!-- jquery -->
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <style>
      body{
          -webkit-user-select: none;
          -moz-user-select: none;
          -ms-use-select: none;
          user-select: none;
        }
    </style>
  </head>
  <body>
    <div class="container-fluid px-3">
      <div class="row min-vh-100">
        <div class="col-md-8 col-lg-6 col-xl-5 d-flex align-items-center">
          <div class="w-100 py-5 px-md-5 px-xxl-6 position-relative">
            <div class="mb-5" style="text-align: center;">
              <img src="${path}/resources/img/logo.png"/>
            </div>
            <form class="form-validate" method="post" action="${path}/workNetwork/signup/insert" >
              <!-- 아이디 -->
              <div class="mb-4">
                <label class="form-label" for="id" style="font-size: 20px; font-weight: 600;"> 아이디</label>
                <input class="form-control" name="id" id="id" type="text" placeholder="ID" autocomplete="off" required data-msg="Please enter your id" required>
              </div>
              <div class="mb-4">
                <label class="form-label" for="loginPassword" style="font-size: 20px; font-weight: 600;"> 비밀번호</label>
                <input class="form-control" name="loginPassword" id="loginPassword" placeholder="Password" type="password" required data-msg="Please enter your password" required>
              </div>
              <div class="mb-4">
                <label class="form-label" for="loginPassword2" style="font-size: 20px; font-weight: 600;"> 비밀번호 재확인</label>
                <input class="form-control" name="loginPassword2" id="loginPassword2" placeholder="Password" type="password" required data-msg="Please enter your password" required>
              </div>
              <!-- 이름 -->
              <div class="mb-4">
                <label class="form-label" for="name" style="font-size: 20px; font-weight: 600;"> 이름</label>
                <input class="form-control" name="name" id="name" type="text" placeholder="Full Name" autocomplete="off" required data-msg="Please enter your name" required>
              </div>
              <!-- 성별 -->
              <div class="mb-4">
                <label class="form-label" for="gender" style="font-size: 20px; font-weight: 600;">성별</label>
                <div style="border: 1px solid #d2d2d2; border-radius: .45em;">
                  <select class="selectpicker form-control" id="gender" name="gender" title="성별 선택" data-style="btn-form-control">
                    <option value="남">남</option>
                    <option value="여">여</option>
                  </select>
                </div>
              </div>
              <!-- 전화번호 -->
              <div class="mb-4">
                <label class="form-label" for="phone" style="font-size: 20px; font-weight: 600;"> 전화번호</label>
                <input class="form-control" name="phone" id="phone" type="text" placeholder="0**-****-****" autocomplete="off" required data-msg="Please enter your phone number" required>
              </div>
              <!-- 이메일 -->
              <div class="mb-4">
                <label class="form-label" for="email" style="font-size: 20px; font-weight: 600;"> 이메일</label>
                <input class="form-control" name="email" id="email" type="email" placeholder="name@address.com" autocomplete="off" required data-msg="Please enter your email" required>
              </div>
              <!-- 회사명 -->
              <div class="mb-4">
                <label class="form-label" for="company_name" style="font-size: 20px; font-weight: 600;"> 회사</label>
                <input class="form-control" name="company_name" id="company_name" type="text" placeholder="회사명" autocomplete="off" required data-msg="Please enter your company" required>
              </div>
              <!-- 직종 -->
              <div class="mb-4">
                <label class="form-label" for="job" style="font-size: 20px; font-weight: 600;"> 직종</label>
                <div style="border: 1px solid #d2d2d2; border-radius: .45em;">
                  <select class="selectpicker form-control" id="job" name="job" title="직종 선택" data-style="btn-form-control">
                    <option value="제조업">제조업</option>
                    <option value="건설업">건설업</option>
                    <option value="도매 및 소매업">도매 및 소매업</option>
                    <option value="운수 및 창고업">운수 및 창고업</option>
                    <option value="숙박 및 음식업">숙박 및 음식업</option>
                    <option value="정보통신업">정보통신업</option>
                    <option value="금융 및 보험업">금융 및 보험업</option>
                    <option value="전문, 과학 및 기술 서비스업">전문, 과학 및 기술 서비스업</option>
                    <option value="사업시설 관리, 사업 지원 및 임대 서비스업">사업시설 관리, 사업 지원 및 임대 서비스업</option>
                    <option value="공공 행정, 국방 및 사회보장 행정">공공 행정, 국방 및 사회보장 행정</option>
                    <option value="교육 서비스업">교육 서비스업</option>
                    <option value="보건업 및 사회복지 서비스업">보건업 및 사회복지 서비스업</option>
                    <option value="기타" selected>기타</option>
                  </select>
                </div>
              </div>
              <!-- 생년 -->
              <div class="mb-4">
                <label class="form-label" for="age" style="font-size: 20px; font-weight: 600;"> 나이</label>
                <input class="form-control" type="number" name="age" id="age" placeholder="만 나이" required/>
              </div>

              <div class="d-grid" style="margin-top: 50px;">
                <button class="btn btn-lg btn-primary" style="background-color: green; border: none; border: none; height: 65px; font-size: 21px; margin-bottom: 15px;"> 회원가입</button>
              </div>
              <hr class="my-4">
              <p class="text-sm text-muted">By signing up you agree to Directory's <a href="#" style="color: green;">Terms and Conditions</a> and <a href="#" style="color: green;">Privacy Policy</a>.</p>
            </form><a class="close-absolute me-md-5 me-xl-6 pt-5" href="${path}/"> 
              <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="green" class="bi bi-cursor-fill" viewBox="0 0 16 16">
                <path d="M14.082 2.182a.5.5 0 0 1 .103.557L8.528 15.467a.5.5 0 0 1-.917-.007L5.57 10.694.803 8.652a.5.5 0 0 1-.006-.916l12.728-5.657a.5.5 0 0 1 .556.103z"/>
              </svg></a>
          </div>
        </div>
        <div class="col-md-4 col-lg-6 col-xl-7 d-none d-md-block">
          <!-- Image-->
          <div class="bg-cover h-100 me-n3" style="background-image: url(${path}/resources/img/login_signup4.jpg);"></div>
        </div>
      </div>
    </div>
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
    <!-- jQuery-->
    <script src="${path}/resources/bootstrap-5/html/vendor/jquery/jquery.min.js"></script>
    <!-- Bootstrap JS bundle - Bootstrap + PopperJS-->
    <script src="${path}/resources/bootstrap-5/html/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Magnific Popup - Lightbox for the gallery-->
    <script src="${path}/resources/bootstrap-5/html/vendor/magnific-popup/jquery.magnific-popup.min.js"></script>
    <!-- Smooth scroll-->
    <script src="${path}/resources/bootstrap-5/html/vendor/smooth-scroll/smooth-scroll.polyfills.min.js"></script>
    <!-- Bootstrap Select-->
    <script src="${path}/resources/bootstrap-5/html/vendor/bootstrap-select/js/bootstrap-select.min.js"></script>
    <!-- Object Fit Images - Fallback for browsers that don't support object-fit-->
    <script src="${path}/resources/bootstrap-5/html/vendor/object-fit-images/ofi.min.js"></script>
    <!-- Swiper Carousel                       -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.1/js/swiper.min.js"></script>
    <script>var basePath = ''</script>
    <!-- Main Theme JS file    -->
    <script src="${path}/resources/bootstrap-5/html/js/theme.js"></script>
  </body>
</html>