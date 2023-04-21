<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<head>
    <link href="css/postwrite.css" rel="stylesheet" type="text/css">

    <title>ZibPalm Post Write</title>
</head>
<%@ include file="/WEB-INF/views/nav.jsp" %>
<body style="margin:0">

    <div class="postwrite-body">
    <form name="input" method="post" action="postwrite.do?cp=1&ps=${paginator.pageSize}&cat=${paginator.category}&bt=${paginator.boardType}">
        <div class="postwrite-header">
            <h2 class="postwrite-title">글쓰기</h2>
            <input type="button" class="postwrite-apply" value="등록" onclick="checkWrite()">
        </div>

        <div class="postwrite-main">
            <div class="postwrite-checkInfo">
                <div class="checkInfo">
                    <select class="select-checkInfo" name="pinfoId" id="infoList">
                    <option id="infoListDate" value="1">기타 매물</option>
                    <option id="infoListDate" value="2">아파트(직접입력)</option>
                    <c:forEach items="${ilist}" var="i">
                        <option id="pinfoId" value="${i.infoId}">
                        ${i.gu.guname}${i.dong}&nbsp;${i.apt}&nbsp;${i.dyear}년&nbsp;${i.dmonth}월
                        &nbsp;${i.earea}m2&nbsp;${i.price}만원</option>
                    </c:forEach>
                    </select>
                </div>
                <div class="searchInfo">
                    <input type="text" placeholder="구/동/아파트 이름 중 하나로만 검색 가능합니다." id="infoKeyword" size="30"/>
                    <button type="button" id="infoButton" onclick="checkWriteSearch()">검색</button>
                </div>
            </div>
            <div class="postwrite-subject">
                <textarea placeholder="제목을 입력해 주세요." id="subject" name="subject" class="textarea_subject" maxlength="40" style="height: 40px;"></textarea>
            </div>
            <div class="setInfoTab" style="display:none">
                <table>
                    <tr><td colspan="2"><strong>아파트 매물 정보</strong></td></tr>
                    <tr>
                        <td class="info-td"><strong>주소</strong></td>
                        <td class="info-addr"></td>
                    </tr>
                    <tr>
                        <td class="info-td"><strong>가격</strong></td>
                        <td class="info-price"></td>
                    </tr>
                    <tr>
                        <td class="info-td"><strong>전용면적</strong></td>
                        <td class="info-earea"><p></p></td>
                    </tr>
                    <tr>
                        <td><strong>거래 년/월</strong></td>
                        <td class="info-year-month"><p></p></td>
                    </tr>
                </table>
            </div>
            <div class="postwrite-content">
                <textarea class="summernote" id="content" name="content">
                <p><b>※ 거래 정보</b></p><p>- 계약 형태:</p><p>- 가격 정보:</p><p>- 공용 관리비:</p><p>- 공용 관리비 항목:</p>
                <p>- 개별 사용료 항목:</p><p>- 입주 가능일:</p><p><br></p><p><b>※ 방 정보</b></p><p>- 건물 유형:</p>
                <p>- 건물 이름:</p><p>- 해당 층:</p><p>- 전체 층:</p><p>- 방 개수:</p><p>- 욕실 개수:</p><p>- 공급 면적:</p>
                <p>- 전용 면적:</p><p>- 방 거실 형태:</p><p>- 현관 유형:</p><p>- 주실 방향:</p><p>- 총 세대수:</p>
                <p>- 총 주차대수:</p><p>- 주차 가능대수:</p><p>- 행정기관 승인일자:</p><p><br></p><p><b>※ 시설 정보</b></p>
                <p>- 난방 방식:</p><p>- 냉방 시설:</p><p>- 생활 시설:</p><p>- 보안 시설:</p><p>- 기타 시설:</p><p><br></p>
                <p><b>※ 상세 설명</b></p><p><b><br></b></p><p><b><br></b></p><p><b><br></b></p><p><b>※ 매물 사진</b>
                </p><p><b><br></b></p><p><b><br></b></p><p><b><br></b></p><p><b><br></b></p></textarea>
            </div>
        </div>
        </form>
    </div>
</body>
<script src="https://code.jquery.com/jquery-3.3.1.min.js" ></script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script src="js/summernote-lite.js"></script>
<script src="js/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="css/summernote-lite.css">

<script src="js/trim.js"></script>

<script src="js/postwrite_content.js"></script>

<script>
$('.summernote').summernote({
	  height: 450,
	  lang: "ko-KR"
	});
</script>

<%@ include file="/WEB-INF/views/footer.jsp" %>
</html>