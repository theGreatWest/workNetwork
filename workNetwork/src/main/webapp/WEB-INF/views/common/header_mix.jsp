<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="ko">
  <head> 
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- title == workNetwork -->
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
    <link rel="stylesheet" href="${path}/resources/bootstrap-5/html/magnific-popup/magnific-popup.css">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="${path}/resources/bootstrap-5/html/css/style.default.css" id="theme-stylesheet">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="${path}/resources/bootstrap-5/html/custom.css">
    <!-- Favicon-->
    <link rel="shortcut icon" href="${path}/resources/img/logo_new.png">
    <!-- Tweaks for older IEs--><!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
  
<!-- blogzine -->
      <!-- Favicon -->
      <!-- <link rel="shortcut icon" href="../../template/assets/images/favicon.ico"> -->
      <!-- Google Font -->
      <!-- <link rel="preconnect" href="https://fonts.gstatic.com"> -->
      <!-- <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@400;700&family=Rubik:wght@400;500;700&display=swap" rel="stylesheet"> -->
      <!-- Plugins CSS -->
      <link rel="stylesheet" type="text/css" href="${path}/resources/blogzine/template/assets/vendor/font-awesome/cssall.min.css">
      <link rel="stylesheet" type="text/css" href="${path}/resources/blogzine/template/assets/vendor/bootstrap-icons/bootstrap-icons.css">
      <link rel="stylesheet" type="text/css" href="${path}/resources/blogzine/template/assets/vendor/tiny-slider/tiny-slider.css">
      <!-- Theme CSS -->
      <!-- <link id="style-switch" rel="stylesheet" type="text/css" href="../../template/assets/css/style.css"> -->
  <!-- / blogzine end -->
      <style>
     	a:hover{
			text-decoration: none;
		}
		body{
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-use-select: none;
            user-select: none;
        }
	</style>
  </head>
<!-- ======================= Header START ======================= -->
<!-- 네비게이션은 따로 수치 맞춰 줌 -->
<header class="header" style="height: 70px; margin: 0px; padding: 0px; margin-bottom: 7px;">
	<!-- Navbar-->
	<nav class="navbar navbar-expand-lg fixed-top shadow navbar-light bg-white"  style="height: 74px; margin: 0px; padding: 0px;">
	  <div class="container-fluid">
<!-- logo == workNetwork  -->
<!-- 이 부분도 margin 수정해줌 -->
		<div class="d-flex align-items-center" style="margin-top: -2px;"><a class="navbar-brand py-1" href="${path}/"><img src="${path}/resources/img/logo.png" style="margin-top: -8px; margin-bottom: -5px;" alt="workNetwork logo"></a>
		</div>
		<!-- Navbar Collapse -->
		<div class="collapse navbar-collapse" id="navbarCollapse" style="margin-top: 3px; font-size: 18px; letter-spacing: 0.165px;">
		  <ul class="navbar-nav ms-auto">
			<li class="nav-item"><a class="nav-link" href="${path}/workNetwork/my_page" style="font-weight: 752; font-size: 17.8px;">
			  나의 근무 시간</a>
			</li>
			<li class="nav-item"><a class="nav-link" href="${path}/workNetwork/community" style="font-weight: 752; font-size: 17.8px;">
			  커뮤니티</a>
			</li>
			<li class="nav-item"><a class="nav-link" href="${path}/workNetwork/searchArticle" style="font-weight: 752; font-size: 17.8px;">
			  뉴스</a>
			</li>
			<li class="nav-item"><a class="nav-link" href="${path}/workNetwork/searchFaq" style="font-weight: 752; font-size: 17.8px;">
			  노동법 FAQ</a>
			</li>
			<!-- add a listening 항목 삭제 -->
			<li class="nav-item"><a class="nav-link" href="${path}/workNetwork/login" style="font-weight: 752; font-size: 17.8px;">로그인</a></li>
			<li class="nav-item"><a class="nav-link" href="${path}/workNetwork/signup" style="font-weight: 752; font-size: 17.8px;">회원가입</a></li>
		  </ul>
		</div>
	  </div>
	</nav>
	<!-- /Navbar -->
  </header>
<!-- ======================= Header END -->

<!-- **************** MAIN CONTENT START **************** -->
<main>