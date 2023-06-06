<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
	   
    <!-- Footer-->
    <footer class="position-relative z-index-10 d-print-none">
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
              <!-- 링크 걸어야 함 -->
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
    <script>
      var snapSlider = document.getElementById('slider-snap');
      
      noUiSlider.create(snapSlider, {
          start: [ 40, 110 ],
          snap: false,
          connect: true,
          step: 1,
          range: {
              'min': 40,
              'max': 110
          }
      });
      var snapValues = [
          document.getElementById('slider-snap-value-from'),
          document.getElementById('slider-snap-value-to')
      ];
      var inputValues = [
          document.getElementById('slider-snap-input-from'),
          document.getElementById('slider-snap-input-to')
      ];
      snapSlider.noUiSlider.on('update', function( values, handle ) {
          snapValues[handle].innerHTML = values[handle];
          inputValues[handle].value = values[handle];
      })
    </script>
    <script>
      $(document).ready(function() {
        $('#main').on('change', function() {
          var dataToString = ""
          var selectedValue = $(this).val();
          if (selectedValue === '임금') {
            // Option 1을 선택한 경우
            var datas = ["노동 일반", "평균임금", "임금채권","통상임금","최저임금","임금일반","비전형근로관계","법정수당","퇴직금","휴업수당","실업급여"];
            for(var i = 0; i < datas.length; i++){
              dataToString += `<option value='`+datas[i]+`'>`+datas[i]+`</option>\n`
            }
            for(var i = 0; i < datas.length; i++){
              $('#middle').html(dataToString);
            }
            
          } else if (selectedValue === '해고') {
            // Option 2를 선택한 경우
            var datas = ["해고일반","징계","정리해고","해고의 제한", "해고예고","해고의 구제", "당연퇴직","통상해고","해고사유 서면통지","직위해제","직권면직","기타"];
            for(var i = 0; i < datas.length; i++){
              dataToString += `<option value='`+datas[i]+`'>`+datas[i]+`</option>\n`
            }
            for(var i = 0; i < datas.length; i++){
              $('#middle').html(dataToString);
            }
          } else {
            $('#middle').html(`
            <option value="">전체</option>`);
          }
          $('#middle').selectpicker('refresh');
        });
      });
    </script>

    
    <script>
      function createCodeSnippet() {
        // Create the necessary elements
        var divCol = document.createElement("div");
        divCol.className = "col-lg-4 col-sm-6 mb-4 hover-animate";
      
        var divCard = document.createElement("div");
        divCard.className = "card shadow border-0 h-100";
      
        var link = document.createElement("a");
        link.href = "${path}/workNetwork/faq_post";
      
        var image = document.createElement("img");
        image.className = "img-fluid card-img-top";
        image.src = "${path}/resources/img/contextNone.jpg";
        image.alt = "...";
      
        var divCardBody = document.createElement("div");
        divCardBody.className = "card-body";
      
        var dismissLink = document.createElement("a");
        dismissLink.className = "text-uppercase text-muted text-sm letter-spacing-2";
        dismissLink.innerText = "해고";
      
        var dismissalLink = document.createElement("a");
        dismissalLink.className = "text-uppercase text-muted text-sm letter-spacing-2";
        dismissalLink.innerText = "해고일반";
      
        var heading = document.createElement("h5");
        heading.className = "my-2";
      
        var questionLink = document.createElement("a");
        questionLink.className = "text-dark";
        questionLink.href = "${path}/workNetwork/faq_post";
        questionLink.innerText = "질문 : ";
      
        // Append the elements to their respective parents
        heading.appendChild(questionLink);
        divCardBody.appendChild(dismissLink);
        divCardBody.appendChild(document.createElement("br"));
        divCardBody.appendChild(dismissalLink);
        divCardBody.appendChild(heading);
        link.appendChild(image);
        divCard.appendChild(link);
        divCard.appendChild(divCardBody);
        divCol.appendChild(divCard);
      
        // Return the generated code snippet
        return divCol;
      }
    </script>
  </body>
</html>