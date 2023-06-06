<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header_mix.jsp" />

<div class="progress rounded-0 sticky-top" style="height: 8px; top: 72px;">
      <div class="progress-bar" role="progressbar" style="width: 40%; background-color:green;" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"></div>
    </div>
    <section class="py-5">
      <div class="container">
        <p class="subtitle text-primary"><br><br></p>
        <h1 class="h2 mb-5" style="color:green; text-align: right;">Upload your story</span>      </h1>
        
        
<!-- 값 입력 -->        
        <form method="post" action="${path}/workNetwork/writesuccess">
          <div class="row form-block">
            <div class="col-lg-4">
              <h4>글 작성</h4>
              <p class="text-muted text-sm"> 작성하고 싶은 내용을 자유롭게 기록해보세요.</p>
            </div>
            <div class="col-lg-7 ms-auto">
              <div class="mb-5">
                <label class="form-label" for="form_description">제목</label>
                <textarea class="form-control" name="title" id="form_description" rows="1" aria-describedby="descriptionHelp"></textarea><small class="form-text text-muted mt-2" id="descriptionHelp">업로드할 글의 제목을 작성하세요.    </small>
              </div>
              <div class="mb-5">
                <label class="form-label" for="form_neighbourhood">세부 내용</label>
               <textarea class="form-control" name="content" id="form_neighbourhood" rows="10" aria-describedby="hoodHelp"></textarea><small class="form-text text-muted mt-2" id="hoodHelp">글의 내용을 작성하세요.    </small>
              </div>
            </div>
          </div>
          <div class="container">
	        <div class="row form-block flex-column flex-sm-row">
	          <div class="col text-center text-sm-start">
	          	<a class="btn btn-primary px-3" href="${path}/workNetwork/community" style="background-color:green; border: 1px solid green;"> <i class="fa-chevron-left fa me-2"></i>Back</a></div>
	          
	          <div class="col text-center text-sm-end">
	            <button class="btn btn-primary px-3" type="submit" style="background-color:green; border: 1px solid green;"> Finish<i class="fa-chevron-right fa ms-2"></i></button></div>
	        </div>
	      </div>
        </form>
        
      </div>
</main>

<jsp:include page="/WEB-INF/views/common/footer_mix.jsp" />