<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header_news.jsp">
	<jsp:param name="title" value="| 뉴스 검색" />
</jsp:include>

<!-- 메인 이미지 -->
    <section class="d-flex align-items-center dark-overlay bg-cover" style="background-image: url(${path}/resources/img/article1.jpg);">
      <div class="container py-6 py-lg-7 text-white overlay-content">
        <div class="row">
          <div class="col-xl-8">
            <h1 class="display-3 fw-bold text-shadow">workNetwork</h1>
            <p class="text-lg text-shadow" style="margin-bottom: 50px;">관심 기사 한 눈에 보기: <span style="color: rgb(74, 226, 135);">검색 사이트</span>, <span style="color: rgb(74, 226, 135);">관심 키워드</span>,<span style="color: rgb(74, 226, 135);"> 기간</span>을 선택해 궁금한 기사를 검색하세요.</p>
            <!-- <p class="text-shadow" style="color: rgb(75, 136, 91); margin-top: 0px;">근무 시간을 인증하여 눈치 보지 말고 정당하게 휴가를 받으세요</p> -->
          </div>
        </div>
      </div>
    </section>
    
    <div class="container-fluid py-5 px-lg-5">
      <div class="row">
        <div class="col-lg-3 pt-3">
          <form class="pe-xl-3" action="${path}/workNetwork/newsForm" autocomplete="off" method="get">
            <div class="mb-4">
              <label class="card-title" for="form_dates" style="font-size: 20px;">기간</label>
              <div>
                <input class="form-control" type="date" name="date1" id="form_dates" style="width: 45.9%; display: inline-block;">
                &nbsp;~&nbsp;
                <input class="form-control" type="date" name="date2" id="form_dates" style="width: 45.9%; display: inline-block;">
              </div>
            </div>
            <div class="mb-4">
              <label class="card-title" for="form_type" style="font-size: 20px;">관심 키워드</label>
              <select class="selectpicker form-control" name="article_keyword" id="form_type" multiple data-style="btn-selectpicker" title="" multiple data-selected-text-format="count &gt; 2">
                <option value="vsixnine">69시간 근무제    </option>
                <option value="vfee">임금    </option>
                <option value="vhire">해고    </option>
              </select>
            </div>
            
            <div class="mb-4">
              <label class="card-title" for="self" style="font-size: 20px;">직접 입력</label>
              <div class="input-label-absolute input-label-absolute-right">
                <div class="label-absolute"><i class="fa fa-search"></i></div>
                <input class="form-control pe-4" type="search" name="article_title" placeholder="Keywords" id="self">
              </div>
            </div>

            <div class="mb-4" style="text-align: center;">
              <button class="btn btn-primary" type="submit" style="background-color: green; outline: none; border: none; margin-top: 20px; font-size: 16px;"> <i class="fas fa-filter me-1"></i>Filter                </button>
            </div>
          </form>
          
<!-- 항목 보이기 -->
        </div>
        <div class="col-lg-9">
          <div class="d-flex justify-content-between align-items-center flex-column flex-md-row mb-4">
            <div class="me-3">
              <p class="mb-3 mb-md-0"><strong>${count}</strong> results found</p>
            </div>
            <div>
              <label class="form-label me-2" for="form_sort">Sort by</label>
              <select class="selectpicker" name="sort" id="form_sort" data-style="btn-selectpicker" title="">
                <option value="sortBy_0">최신순   </option>
              </select>
            </div>
          </div>
<!-- 기사 목록 -->
          <div class="row">
          	<c:if test="${not empty searchNews}">
          		<c:forEach var="newsV" items="${searchNews}" varStatus="status">
		            <!-- place item-->
		            <div class="col-sm-6 col-xl-4 mb-5 hover-animate" data-marker-id="59c0c8e33b1527bfe2abaf92">
		              <div class="card h-100 border-0 shadow">
		                <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid img_ot" src="${path}/${newsV.img}" alt=""/><a class="tile-link" href="${newsV.url}"></a></div>
		                <div class="card-body d-flex align-items-center">
		                  <div class="w-100">
		                    <h6 class="card-title"><a class="text-decoration-none text-dark" href="${newsV.url}">${newsV.title}</a></h6>
		                    <div class="d-flex card-subtitle mb-3">
		                      <p class="flex-grow-1 mb-0 text-muted text-end">${newsV.date}</p>
		                    </div>
		                  </div>
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
               		<li class="page-item"><a class="page-link" onclick="movePage('${path}/workNetwork/newsForm?${res}&page=${pageInfo.prevPage}');" aria-label="Prev" style="color: green;"> <i class="fa fa-angle-left"></i></a></li>
					<c:forEach begin="${pageInfo.startPage}" end="${pageInfo.endPage}" step="1" varStatus="status">
						<c:if test="${status.current == pageInfo.currentPage}">
							<li class="page-item active" aria-current="page"><span class="page-link" style="background-color:green; border: 1px solid green;">${status.current}<span style="display: none;">(current)</span></span></li>
						</c:if>
						<c:if test="${status.current != pageInfo.currentPage}">
							<li class="page-item"><a class="page-link" onclick="movePage('${path}/workNetwork/newsForm?${res}&page=${status.current}');" style="color: green;">${status.current}</a></li>
						</c:if>
					</c:forEach>
				   <li class="page-item"><a class="page-link" onclick="movePage('${path}/workNetwork/newsForm?${res}&page=${pageInfo.nextPage}');" aria-label="Next" style="color: green;"> <i class="fa fa-angle-right"></i></a></li>
               </c:if>
               <c:if test="${not empty res}">
				   <li class="page-item"><a class="page-link" onclick="movePage('${path}/workNetwork/newsForm?${res}&page=${pageInfo.prevPage}');" aria-label="Prev" style="color: green;"> <i class="fa fa-angle-left"></i></a></li>
					<c:forEach begin="${pageInfo.startPage}" end="${pageInfo.endPage}" step="1" varStatus="status">
						<c:if test="${status.current == pageInfo.currentPage}">
							<li class="page-item active" aria-current="page"><span class="page-link" style="background-color:green; border: 1px solid green;">${status.current}<span style="display: none;">(current)</span></span></li>
						</c:if>
						<c:if test="${status.current != pageInfo.currentPage}">
							<li class="page-item"><a class="page-link" onclick="movePage('${path}/workNetwork/newsForm?${res}&page=${status.current}');" style="color: green;">${status.current}</a></li>
						</c:if>
					</c:forEach>
				   <li class="page-item"><a class="page-link" onclick="movePage('${path}/workNetwork/newsForm?${res}&page=${pageInfo.nextPage}');" aria-label="Next" style="color: green;"> <i class="fa fa-angle-right"></i></a></li>
               </c:if>
             </ul>
           </nav>
        </div>
      </div>
    </div>
    
    <script type="text/javascript">
	    function movePage(pageUrl){
			location.href = encodeURI(pageUrl);	
		};
	</script>

<jsp:include page="/WEB-INF/views/common/footer_news.jsp" />