<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header_news.jsp">
	<jsp:param name="title" value="| FAQ" />
</jsp:include>

<!-- Hero Section-->
		
        <section class="hero py-5 py-lg-7" style="background-image: url(${path}/resources/img/01.jpeg); padding-buttom: 20%;">
          <div >
            <h1 class="hero-heading" style="color: white;">노동법 조회&nbsp;&nbsp;&nbsp;FAQ</h1>
		  </div>
          <div class="container">
            <!-- 검색창 -->
                  <!-- 검색창에 그림자 효과 추가 -->
                  <div class="search-bar search-bar-with-tabs p-3 p-lg-4" style="box-shadow: 0px 0px 10px 1px rgb(148, 148, 148);">
                    <div class="tab-content">
                      <div class="tab-pane fade show active" id="faq" role="tabpanel">
<!-- 검색창 -->
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
        </section>

      <section class="py-6" style="margin: -10px;">
      		
        <div class="container">
        <nav aria-label="Blog pagination" style="text-align: right;">
          <ul class="pagination justify-content-between mb-5" style="text-align: right;" >
            <li class="page-item"></li>
            <li class="page-item"><p class="mb-3 mb-md-0" style="font-size: 20px;"><strong>${count}</strong> results found</p></li>
            <li class="page-item"></li>
          </ul>
        </nav>
          <div class="row mb-5" id="faq_dataList">
            
            <c:if test="${not empty searchFaqs}">
          		<c:forEach var="faqV" items="${searchFaqs}" varStatus="status">
		            <!-- blog item-->
				    <div class="col-lg-4 col-sm-6 mb-4 hover-animate">
				      <div class="card shadow border-0 h-100"><a href="${path}/workNetwork/searchFaqInfo?question=${faqV.question}&answer=${faqV.answer}&main=${faqV.main}&middle=${faqV.middle}"><%-- <img class="img-fluid card-img-top" src="${path}/resources/img/context3.jpg" alt="..."/> --%></a>
				        <div class="card-body">
				          <a style="font-size: 18px; color:green;">${faqV.main}</a> <spanstyle="font-size: 18px;">&gt;</span> 
				          <a style="font-size: 18px; color:green;">${faqV.middle} </a>
				          <h5 class="my-2"><a class="text-dark" href="${path}/workNetwork/searchFaqInfo?question=${faqV.question}&answer=${faqV.answer}&main=${faqV.main}&middle=${faqV.middle}">${faqV.question}          </a></h5>
				        </div>
				      </div>
				    </div>
          		</c:forEach>
          	</c:if>
		    
          </div>
          <!-- Pagination -->
          <nav aria-label="Page navigation example">
             <ul class="pagination pagination-template d-flex justify-content-center">
               <c:if test="${empty res}">
               		<li class="page-item"><a class="page-link" onclick="movePage('${path}/workNetwork/searchFaq?${res}&page=${pageInfo.prevPage}');" aria-label="Prev" style="color: green;"> <i class="fa fa-angle-left"></i></a></li>
					<c:forEach begin="${pageInfo.startPage}" end="${pageInfo.endPage}" step="1" varStatus="status">
						<c:if test="${status.current == pageInfo.currentPage}">
							<li class="page-item active" aria-current="page"><span class="page-link" style="background-color:green; border: 1px solid green;">${status.current}<span style="display: none;">(current)</span></span></li>
						</c:if>
						<c:if test="${status.current != pageInfo.currentPage}">
							<li class="page-item"><a class="page-link" onclick="movePage('${path}/workNetwork/searchFaq?${res}&page=${status.current}');" style="color: green;">${status.current}</a></li>
						</c:if>
					</c:forEach>
				   <li class="page-item"><a class="page-link" onclick="movePage('${path}/workNetwork/searchFaq?${res}&page=${pageInfo.nextPage}');" aria-label="Next" style="color: green;"> <i class="fa fa-angle-right"></i></a></li>
               </c:if>
               <c:if test="${not empty res}">
				   <li class="page-item"><a class="page-link" onclick="movePage('${path}/workNetwork/searchFaqForm?${res}&page=${pageInfo.prevPage}');" aria-label="Prev" style="color: green;"> <i class="fa fa-angle-left"></i></a></li>
					<c:forEach begin="${pageInfo.startPage}" end="${pageInfo.endPage}" step="1" varStatus="status">
						<c:if test="${status.current == pageInfo.currentPage}">
							<li class="page-item active" aria-current="page"><span class="page-link" style="background-color:green; border: 1px solid green;">${status.current}<span style="display: none;">(current)</span></span></li>
						</c:if>
						<c:if test="${status.current != pageInfo.currentPage}">
							<li class="page-item"><a class="page-link" onclick="movePage('${path}/workNetwork/searchFaqForm?${res}&page=${status.current}');"  style="color: green;">${status.current}</a></li>
						</c:if>
					</c:forEach>
				   <li class="page-item"><a class="page-link" onclick="movePage('${path}/workNetwork/searchFaqForm?${res}&page=${pageInfo.nextPage}');" aria-label="Next" style="color: green;"> <i class="fa fa-angle-right"></i></a></li>
               </c:if>
             </ul>
           </nav>
        </div>
      </section>
      <script type="text/javascript">
	    function movePage(pageUrl){
			location.href = encodeURI(pageUrl);	
		};
	</script>

<jsp:include page="/WEB-INF/views/common/footer_news.jsp" />