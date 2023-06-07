<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header_mix.jsp" />

<section class="d-flex align-items-center dark-overlay bg-cover" style="background-image: url(${path}/resources/img/08.jpeg);">
      <div class="container py-6 py-lg-7 text-white overlay-content">
        <div class="row">
          <div class="col-xl-8">
            <h1 class="display-3 fw-bold text-shadow">workNetwork</h1>
            <p class="text-lg text-shadow" style="margin-bottom: 50px; color:white;">모두의 이야기를 <span style="color: rgb(74, 226, 135);">커뮤니티</span><span style="color:white;">에서 들려주세요.</span></p>
          </div>
        </div>
      </div>
    </section>

      <section>
        <div class="container">
          <div class="row">
            <div class="col-xl-8 col-lg-10 mx-auto" style="margin-top: 30px; font-size: 20px;">           
              <p class="py-3 mb-5 text-muted text-center fw-light" style="font-size: 18px;">글쓴이 <a class="fw-bold" style="color:green;"> ${name} </a><span class="mx-1"> | </span> ${create_date} <span class="mx-1">| </span> 조회수 : ${views} <span class="mx-1"> | </span><a class="text-muted" href="#"> 댓글 : ${replyCount}                </a></p>
              <p class="lead mb-5" style="font-size: 20px;"> <strong>${title}</strong></p>
            </div>
          </div>
          <div class="row">
            <div class="col-xl-8 col-lg-10 mx-auto">                               
              <div class="text-content">
                <p style="font-size: 19px; margin-bottom: 50px;">${content}</p>
              </div>
			
			<hr>
			
              <!-- comments-->
              <div class="mt-5">
                <h6 class="text-uppercase text-muted mb-4">${replyCount}개의 댓글 <button class="btn btn-outline-primary" type="button" data-bs-toggle="collapse" data-bs-target="#leaveComment" aria-expanded="false" aria-controls="leaveComment" style="color:green; border:1px solid green; margin-left: 89%;" id="reply_tab">댓글 달기</button></h6>
                <script type="text/javascript">
	                var element = document.getElementById("reply_tab");
	
	                element.addEventListener("mouseover", function() {
	                  this.style.border = "1px solid green";
	                  this.style.backgroundColor = "rgb(215, 247, 227)";
	                });
	                element.addEventListener("mouseout", function() {
	                  this.style.border = "1px solid green";
	                  this.style.backgroundColor = "white";
	                });

                    element.addEventListener("click", function() {
                        // 로그인 여부 확인
                        <% Integer member_no = (Integer) request.getSession().getAttribute("member_no"); %>
                        var member_no = <%=member_no%>
                        if (member_no == null) {
                            alert("로그인이 필요합니다.");
                            window.location.href = "${path}/workNetwork/login"; // 로그인 페이지로 이동
                        }
                    });
                </script>
                
              <!-- comment form-->
              <div class="mb-5">
                <div class="collapse" id="leaveComment"> 
                  <div class="mt-4">
                    <h5 class="mb-4" style="color: green;">댓글 달기</h5>
            <!-- 댓글 달기 -->
                    <form class="form" id="comment-form">
                      <div class="row">
                        <div class="mb-4">
                          <label class="form-label" for="reply_content">댓글 <span class="required">*</span></label>
                          <textarea class="form-control" id="reply_content" rows="4" name="reply_content"></textarea>
                        </div>   
                      </div>
                    	<a class="btn btn-primary" style="background-color:green; border: 1px solid green; margin-left: 89%;" id="reply_go" onclick="movePage('${path}/workNetwork/replyForm?department=${department}&title=${title}&content=${content}&name=${name}&create_date=${create_date}&views=${views}&board_no=${board_no}');"> 댓글 추가 </a>
                    	<script type="text/javascript">
	                    	function movePage(pageUrl){
	                    		var reply_content = document.getElementById('reply_content').value;
	                    		var updatedUrl = pageUrl + '&reply_content=' + reply_content;
	                			location.href = encodeURI(updatedUrl);	
	                		};
                    	</script>
                    </form>
                  </div>
                </div>
              </div>
              <!-- /comment form-->
                
                
                <c:if test="${not empty reply}">
	          		<c:forEach var="v" items="${reply}" varStatus="status">
		                <!-- comment-->
		                <div class="d-flex mb-4">
		                  <div>
		                    <h5>${v.name}</h5>
		                    <p class="text-uppercase text-sm text-muted"><i class="far fa-clock"></i> ${v.create_date} </p>
		                    <p class="text-muted">${v.content}</p>
		                  </div>
		                </div>
		                <!-- /comment-->
	          		</c:forEach>
          		</c:if>
                
            </div>
          </div>
        </div>
      </section>
</main>

<jsp:include page="/WEB-INF/views/common/footer_mix.jsp" />