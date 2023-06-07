<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header_news.jsp">
	<jsp:param name="title" value="| FAQ Post" />
</jsp:include>

<section class="dark-overlay mb-5"><img class="bg-image" src="${path}/resources/img/photo/photo-1467987506553-8f3916508521.jpg" alt="">
        <div class="container py-7">
          <div class="overlay-content text-center text-white">
            <h1 class="display-3 text-serif fw-bold text-shadow mb-0">FAQ</h1>
          </div>
        </div>
      </section>
      <section>
        <div class="container">
          <div class="row">
            <div class="col-xl-8 col-lg-10 mx-auto">           
              <p class="py-3 mb-5 text-muted text-center fw-light" style="font-size: 22px;"><span class="fw-bold" style="color: green;">${main}</span><span class="mx-1"> &nbsp;&gt;&nbsp; <span class="fw-bold" style="color: green;">${middle}</span></p>
              <p class="lead mb-5" style="font-size: 22px;">질문 : <strong>${question}</strong></p>
            </div>
          </div>
          <div class="row">
            <div class="col-xl-8 col-lg-10 mx-auto">                               
              <div class="text-content">
                <p style="font-size: 20px; margin-bottom: 100px;">${answer}</p>
              </div>
              </div>
            </div>
          </div>
        </div>
      </section>

<jsp:include page="/WEB-INF/views/common/footer_news.jsp" />