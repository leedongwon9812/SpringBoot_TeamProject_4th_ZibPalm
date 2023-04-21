<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
    <%@ include file="/WEB-INF/views/nav.jsp" %>
        <!-- 네비 ------------------------------------------------->
        <div class="collapse-container">
          <div class="collapse-box1" style="border-top:1px solid #e6e6e6;">
            <div class="em-container">
              <em style="padding-top: 15px;">01</em>
              <p style="padding-left: 50px;margin-top:0;font-size: 40px;font-weight:bolder">지역별</p>
            </div>
            <div class="collapse-hover-p1">
              <h3>지역별 아파트 매물 보기</h3>
            </div>
          </div>
          <div class="collapse-box2">
            <div class="em-container">
              <em style="padding-top: 10px;">02</em>
              <p style="padding-left: 50px;margin-top:0;font-size: 40px;font-weight:bolder">게시글 검색</p>
            </div>
            <div class="collapse-hover-p2">
              <h3>키워드로 게시글 검색하기</h3>
            </div>
          </div>
          <div class="collapse-main1"  id="collapse-main1">
            <h1>지역을 골라주세요</h1>
            <p style="padding-left: 18%;color:gray;">(원하는 지역을 클릭해주세요 클릭시 해당지역의 매물들만 보여집니다)</p>
            <div id="mapIcon" class="wholeMap">
              <div>
                  <ul>
                      <li style="display: block;">
                          <img src="css/img/서울시1.png" alt="서울시전체" title="서울시전체" usemap="#Map" class="Seoul-img">
                      </li>
                   </ul>
                  <map name="Map" id="Map">
                      <area href="price2.do?guname=강남구&cp=1&ps=15" shape="poly" coords="322,280,339,267,353,271,368,281,376,287,384,302,391,320,412,327,434,339,446,354,453,368,441,376,419,376,410,352,387,357,371,356,353,348,351,331,339,325,332,300,326,294" alt="강남구">
                      <area href="price2.do?guname=강동구&cp=1&ps=15" shape="poly" coords="445,241,447,215,486,203,507,189,517,214,527,235,516,245,489,259,476,284,453,273,455,255" alt="강동구">
                      <area href="price2.do?guname=강북구&cp=1&ps=15" shape="poly" coords="280,37,299,27,307,41,313,47,313,54,311,67,308,75,314,85,322,90,357,123,345,133,335,141,323,134,312,128,303,115,293,103,273,99,269,79,277,66,287,51" alt="강북구">
                      <area href="price2.do?guname=강서구&cp=1&ps=15" shape="poly" coords="49,154,84,184,108,200,149,238,117,237,105,267,83,255,66,252,39,252,17,248,6,227,22,204,35,189,38,164" alt="강서구">
                      <area href="price2.do?guname=관악구&cp=1&ps=15" shape="poly" coords="178,343,203,330,216,335,233,331,248,334,247,351,265,360,283,376,249,402,237,411,215,405,200,390,193,379,189,356,173,338" alt="관악구">
                      <area href="price2.do?guname=광진구&cp=1&ps=15" shape="poly" coords="398,213,412,211,422,215,428,223,431,241,427,254,420,269,403,277,384,277,376,267,382,254,391,239,394,227" alt="광진구">
                      <area href="price2.do?guname=구로구&cp=1&ps=15" shape="poly" coords="70,303,84,316,94,316,106,304,116,308,128,309,143,298,157,310,170,342,158,343,124,328,113,333,110,338,99,343,88,350,68,349,71,329,64,314" alt="구로구">
                      <area href="price2.do?guname=금천구&cp=1&ps=15" shape="poly" coords="140,340,156,350,175,354,176,364,183,374,186,385,193,391,194,398,182,410,167,407,157,386,152,378,151,362,142,351" alt="금천구">
                      <area href="price2.do?guname=노원구&cp=1&ps=15" shape="poly" coords="364,24,390,14,397,24,412,24,410,32,407,44,410,54,409,63,400,69,404,78,414,90,428,94,432,107,422,115,420,124,410,126,404,124,392,130,379,133,364,127,360,116,356,106,361,100,375,92,375,72,368,60,361,46,368,33" alt="노원구">
                      <area href="price2.do?guname=도봉구&cp=1&ps=15" shape="poly" coords="305,18,313,3,327,6,333,18,346,19,359,25,354,40,359,54,366,66,367,79,366,92,357,92,349,101,334,90,318,78,320,64,326,47,316,40" alt="도봉구">
                      <area href="price2.do?guname=동대문구&cp=1&ps=15" shape="poly" coords="386,155,380,164,384,174,385,184,395,194,391,204,389,218,371,213,360,202,347,194,335,196,341,182,351,171,366,163" alt="동대문구">
                      <area href="price2.do?guname=동작구&cp=1&ps=15" shape="poly" coords="206,295,224,292,240,296,260,303,269,310,274,321,273,338,268,350,256,345,252,326,241,324,228,323,218,323,199,328,174,334" alt="동작구">
                      <area href="price2.do?guname=마포구&cp=1&ps=15" shape="poly" coords="160,178,169,200,184,208,195,214,199,230,212,235,236,233,245,234,238,250,227,258,216,254,193,250,171,234,155,222,138,212,129,200,139,193,144,179" alt="마포구">
                      <area href="price2.do?guname=서대문구&cp=1&ps=15" shape="poly" coords="225,156,239,165,241,176,241,189,243,204,245,210,245,220,228,228,208,225,203,214,194,208,181,196,187,187,209,182,217,170" alt="서대문구">
                      <area href="price2.do?guname=서초구&cp=1&ps=15" shape="poly" coords="284,312,304,302,318,306,329,322,336,342,346,348,356,358,370,374,389,366,403,367,412,374,408,389,397,400,379,411,369,422,351,414,344,400,340,375,330,372,322,378,309,378,303,370,295,362,284,360,279,352,280,338,284,328" alt="서초구">
                      <area href="price2.do?guname=성동구&cp=1&ps=15" shape="poly" coords="330,209,346,202,355,209,360,222,386,226,383,239,373,249,371,260,358,259,344,252,330,256,315,258,310,247,322,232,335,219" alt="성동구">
                      <area href="price2.do?guname=성북구&cp=1&ps=15" shape="poly" coords="265,111,271,107,285,112,291,119,306,132,314,142,333,150,353,138,366,142,381,145,369,154,352,160,337,168,331,178,322,190,305,179,297,170,280,166,284,150,281,132,274,118" alt="성북구">
                      <area href="price2.do?guname=송파구&cp=1&ps=15" shape="poly" coords="388,294,413,292,430,281,439,266,449,274,464,294,470,306,492,317,490,329,484,340,469,352,450,350,438,331,419,318,400,310,391,308,388,297" alt="송파구">
                      <area href="price2.do?guname=양천구&cp=1&ps=15" shape="poly" coords="82,260,90,278,110,272,121,259,122,246,144,248,153,262,147,271,136,286,130,296,110,299,96,296,85,305,70,285,74,271" alt="양천구">
                      <area href="price2.do?guname=영등포구&cp=1&ps=15" shape="poly" coords="161,253,205,266,220,283,205,290,193,302,184,315,164,322,163,304,153,291,148,281,158,268" alt="영등포구">
                      <area href="price2.do?guname=용산구&cp=1&ps=15" shape="poly" coords="251,242,265,236,284,245,303,250,312,260,311,270,297,282,290,294,277,292,259,284,250,281,239,275,231,266,245,261,251,248" alt="용산구">
                      <area href="price2.do?guname=은평구&cp=1&ps=15" shape="poly" coords="220,76,236,80,242,91,250,97,256,105,240,115,230,126,228,139,224,150,212,162,200,174,187,180,170,187,167,177,172,168,166,142,173,134,184,93" alt="은평구">
                      <area href="price2.do?guname=종로구&cp=1&ps=15" shape="poly" coords="259,112,275,149,268,162,273,172,287,178,297,185,309,194,319,200,295,202,281,207,263,200,255,202,247,190,247,172,243,157,232,148,236,131,245,120" alt="종로구">
                      <area href="price2.do?guname=중구&cp=1&ps=15" shape="poly" coords="253,223,261,212,284,215,299,214,319,214,322,224,310,234,297,242,278,236,265,226" alt="중구">
                      <area href="price2.do?guname=중랑구&cp=1&ps=15" shape="poly" coords="393,142,407,132,419,138,432,132,439,136,442,144,440,158,442,166,435,174,431,185,429,192,420,200,409,204,402,202,404,191,399,176,391,171,389,165,398,156" alt="중랑구">
                  </map>
              </div>
          </div>
          </div>
          <button class="collapse-off" ><img src="css/img/on-off.png" style="width:100%;height:auto;"></button>
          <div class="collapse-main2">
            <h1>검색어를 입력해 주세요.</h1>
            <div class="search-container">
              <div class="search-select">
                <button id="search-select1" class="search-button" value="apt" onclick="getValue(this)">아파트</button>
                <button id="search-select2" class="search-button" value="else" onclick="getValue(this)">기타매물</button>
              </div>
              <div>
                <div class="search-input">
                  <svg width="24" height="24" viewBox="0 0 24 24" style="padding-top: 4px;padding-left:10px;">
                  <g fill="none" fill-rule="evenodd">
                  <path d="M0 0H24V24H0z">
                  </path>
                  <g stroke="#222" stroke-width="2" transform="translate(2 2)">
                  <circle cx="8" cy="8" r="8"></circle>
                  <path stroke-linecap="round" d="M15 14L19.95 18.95"></path>
                  </g>
                  </g>
                  </svg>
                  <input onkeyup="enterSKey()" placeholder="게시물 제목에서 검색됩니다." id="keyword" style="width:90%;height:34px;border-style:none;padding-left:20px;background-color:transparent;padding-top:4px;outline:none;font-size:15px;">
                  </label>
                </div>
              </div>
              </div>
          </div>
          <button class="collapse-off" ><img src="css/img/on-off.png" style="width:100%;height:auto;"></button>
          <button class="collapse-off" ><img src="css/img/on-off.png" style="width:100%;height:auto;"></button>
          <button class="collapse-on1" ><img src="css/img/on-off.png" style="width:100%;height:auto;"></button>
          <button class="collapse-on2" ><img src="css/img/on-off.png" style="width:100%;height:auto;"></button>
        </div>
        <!-- 사진슬라이드 ------------------------------------------------->
        <div id="slideShow">
          <ul class="slides">
            <li><a href="https://docs.google.com/forms/d/e/1FAIpQLSebRYIJtDZlcyPPNW3v2AoBAUMKTvQ3YtV512qhNvFCUNs_kA/viewform" target="blank"><img src="css/img/한샘미강이벤트.png" alt=""></a></li>
            <li><a href="https://docs.google.com/forms/d/e/1FAIpQLSd8ozeJ6NRPfu2hJ1u4iWvPyIQ3TLSQJr6eg9G7ug7-VQZICw/viewform" target="blank"><img src="css/img/현대리바트이벤트.png" alt=""></a></li>
            <li><a href="https://m.cafe.naver.com/ca-fe/web/cafes/10322296/menus/2239" target="blank"><img src="css/img/댓글쌓기이벤트.png"></a></li>
            <li><a href="https://ohou.se/competitions/550" target="blank"><img src="css/img/엘지오브제.png"></a></li>
          </ul>
          <p class="controller">
            <!-- &lang: 왼쪽 방향 화살표 &rang: 오른쪽 방향 화살표 --> 
            <span class="prev">&lang;</span> 
            <span class="next">&rang;</span>
          </p>
        </div>
        <!-- 사진슬라이드 ------------------------------------------------->
        <!-- 회사 문구 ------------------------------------------------->
        <div class="main-tit">
            <h3 class="title">SELL SMARTER
                <br>
                DEAL EFFICIENTLY
            </h3>
        </div>
        <div class="main-intcom">
            <div class="intcom-div2"><img src="css/img/intcom_2.png" ></div>
            <div class="intcom-div1"><img src="css/img/intcom_1.png" ></div>
            <div class="intcom-div3"><img src="css/img/intcom_3.png" ></div>
            <div class="intcom-div4">
                <h4 class="intcom-div4-tit">지혜롭게 판매하고, 효율적으로 구매하다</h4>
                <p class="intcom-div4-con">
                    원활한 소통과 실시간 데이터의 시너지 효과는
                    <br>
                    집팜만의 효율적인 거래를 이끌어내며,
                    <br>
                    최적의 효율성을 통해 더 나은 결과를 만듭니다.
                </p>
            </div>
        </div>
        <!-- 회사 문구 ------------------------------------------------->
        <!-- 회사 모토 박스 ------------------------------------------------->
        <center>
            <div class="main-crud-box">
                <div class="main-crud">
                    <img src="css/img/crud_img1.jpg">
                    <div class="crud-hover"></div>
                    <div class="crud-hover-font">커뮤니티<br>
                      <p>-다양한 정보<br>-수많은 소통</p>
                    </div>
                </div>
                <div class="main-crud">
                    <img src="css/img/crud_img2.jpg">
                    <div class="crud-hover"></div>
                    <div class="crud-hover-font">실제 데이터<br>
                      <p>-다양한 정보<br>-수많은 소통</p>
                    </div>
                </div>
                <div class="main-crud">
                    <img src="css/img/crud_img3.jpg">
                    <div class="crud-hover"></div>
                    <div class="crud-hover-font">개인정보<br>
                      <p>-다양한 정보<br>-수많은 소통</p>
                    </div>
                </div>
            </div>
        </center>
        <script src="js/trim.js"></script>
        <script>
            var result = "";
            function getValue(event){
                if(event.value == "apt"){
                    $('#search-select1').addClass("focus");
                    $('#search-select2').removeClass("focus");
                    result = "apt";
                }else if(event.value == "else"){
                    $('#search-select2').addClass("focus");
                    $('#search-select1').removeClass("focus");
                    result = "else";
                }
            }

            function enterSKey(){
                if (window.event.keyCode == 13) {
                    checkSearch();
                }
            }

            function checkSearch(){
                var searchTextVal = $("#keyword").val();
                if(result.length == 0){
                    alert("검색 항목을 선택해 주세요");
                    return false;
                }else if(searchTextVal.length == 0){
                    alert("검색어를 입력해주세요");
                    return false;
                }else{
                    searchTextVal = trim(searchTextVal);
                    location.href="postlist?cp=1&ps=10&cat="+result+"&bt=list&sbv=subject&stv="+searchTextVal;
                }
            }
        </script>
        <!-- 회사 모토 박스 ------------------------------------------------->

        <script src="js/slideShow.js"></script>
        
        
    </body>
    <!-- 푸터 ------------------------------------------------->
    <%@ include file="/WEB-INF/views/footer.jsp" %>
</html>