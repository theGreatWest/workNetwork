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
    <link rel="stylesheet" href="${path}/resources/bootstrap-5/html/vendor/magnific-popup/magnific-popup.css">
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
      <style>
      	a:hover{
			text-decoration: none;
			color: green;
		}
        .img_ot{
          width: 550px;
          height: 150px;
        }
        body{
          -webkit-user-select: none;
          -moz-user-select: none;
          -ms-use-select: none;
          user-select: none;
        }
        td, th{
          font-size: 18px;
          height: 50px;
        }
        thead{
          border-bottom: 2px solid rgb(201, 201, 201);
        }
        th{
          color: rgb(83, 83, 83);
          font-size: 20px;
          font-weight: 900;
        }
        tbody{
          text-align: center;
          font-size: 20px;
          color: rgb(97, 97, 97);
        }
        td{
          padding-top: 15px;
          padding-bottom: 15px;
          font-size: 18px;
          padding-left: 40px;
        }
        tr{
          border-bottom: 2px solid rgb(201, 201, 201);
        }
        tbody a{
          color: rgb(97, 97, 97);
        }
        tbody a:hover{
          text-decoration: none;
          color: green;
        }
      </style>
  </head>
  
    <body style="padding-top: 72px;">
    <header class="header">
      <!-- Navbar-->
      <nav class="navbar navbar-expand-lg fixed-top shadow navbar-light bg-white">
        <div class="container-fluid">
<!-- logo == workNetwork -->
          <div class="d-flex align-items-center"><a class="navbar-brand py-1" href="${path}/"><img src="${path}/resources/img/logo.png" style="margin-top: -15px; margin-bottom: -5px;" alt="workNetwork logo"></a>
          </div>
          <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation"><i class="fa fa-bars"></i></button>
          <!-- Navbar Collapse -->
          <div class="collapse navbar-collapse" id="navbarCollapse">
            <form class="form-inline mt-4 mb-2 d-sm-none" action="#" id="searchcollapsed">
              <div class="input-label-absolute input-label-absolute-left w-100">
                <label class="label-absolute" for="searchcollapsed_search"><i class="fa fa-search"></i><span class="sr-only">What are you looking for?</span></label>
                <input class="form-control form-control-sm border-0 shadow-0 bg-gray-200" id="searchcollapsed_search" placeholder="Search" aria-label="Search" type="search">
              </div>
            </form>
            <ul class="navbar-nav ms-auto">
              <% Integer member_no = (Integer) request.getSession().getAttribute("member_no"); %>
              <% String name = (String) request.getSession().getAttribute("name"); %>
              <% if (member_no != null) { %>
              <li class="nav-item"><a class="nav-link" href="${path}/workNetwork/my_page" style="font-size: 18px;">
                나의 근무 시간</a>
              </li>
              <% } else { %>
              <li class="nav-item">
                <a class="nav-link" href="${path}/workNetwork/login" onclick="showAlert()" style="font-size: 18px;">
                  나의 근무 시간
                </a>
              </li>
              <script>
                function showAlert() {
                  alert("로그인이 필요합니다");
                }
              </script>
              <% } %>
              <li class="nav-item"><a class="nav-link" href="${path}/workNetwork/community" style="font-size: 18px;">
                커뮤니티</a>
              </li>
              <li class="nav-item"><a class="nav-link" href="${path}/workNetwork/searchArticle" style="font-size: 18px;">
                뉴스</a>
              </li>
              <li class="nav-item"><a class="nav-link" href="${path}/workNetwork/searchFaq" style="font-size: 18px;">
                노동법 FAQ</a>
              </li>
              <!-- add a listening 항목 삭제 -->
              <% if (member_no != null) { %>
              <%-- 로그인 된 상태의 메뉴 --%>
              <li class="nav-item">
                <form action="/next_page" method="POST">
                  <input type="hidden" name="member_no" value="${member_no}" />
                  <!-- 다른 필드들과 버튼 등 폼 요소들 추가 -->
                  <a class="nav-link" href="${path}/workNetwork/my_page/" style="font-size: 18px;"><%= name %>님</a>
                </form>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="${path}/workNetwork/login/logout" style="font-size: 18px;">로그아웃</a>
              </li>
              <% } else { %>
              <%-- 로그인 되지 않은 상태의 메뉴 --%>
              <li class="nav-item">
                <a class="nav-link" href="${path}/workNetwork/login" style="font-size: 18px;">로그인</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="${path}/workNetwork/signup" style="font-size: 18px;">회원가입</a>
              </li>
              <% } %>

            </ul>
          </div>
        </div>
      </nav>
<!-- 메인 이미지 -->
    </header>
      