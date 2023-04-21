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
    <c:choose>
        <c:when test="${not empty mainPost.mpId}">
    <form name="input" method="post" action="postupdate.do?mpId=${mainPost.mpId}&mpemail=${mainPost.mpemail}">
        </c:when>
        <c:when test="${not empty post.postId}">
    <form name="input" method="post" action="postupdate.do?postId=${post.postId}&pemail=${post.pemail}">
        </c:when>
    </c:choose>

        <c:choose>
            <c:when test="${post.status == '판매완료'}">
        <div class="postwrite-header" style="display:none">
            </c:when>
            <c:otherwise>
        <div class="postwrite-header">
            </c:otherwise>
        </c:choose>
            <h2 class="postwrite-title">글 수정</h2>
            <c:choose>
                <c:when test="${not empty mainPost.mpId}">
            <input type="button" class="postwrite-apply" value="수정" onclick="checkUpdateMP()">
                </c:when>
                <c:when test="${not empty post.postId}">
            <input type="button" class="postwrite-apply" value="수정" onclick="checkUpdateP()">
                </c:when>
            </c:choose>
        </div>

        <div class="postwrite-main">
            <div class="postwrite-checkInfo">
                <c:choose>
                    <c:when test="${not empty mainPost.mpId}">
                <div class="checkInfo" style="display:none">
                    </c:when>
                    <c:when test="${not empty post.postId}">
                <div class="checkInfo">
                    </c:when>
                </c:choose>
                    <select class="select-checkInfo" name="pinfoId" id="infoList">
                        <option class="option-info1" id="infoListDate" value="1">기타 매물</option>
                        <option class="option-info2" id="infoListDate" value="2">아파트(직접입력)</option>
                        <c:forEach items="${ilist}" var="i">
                            <option class="option-info${i.infoId}" id="pinfoId" value="${i.infoId}">
                            ${i.gu.guname}${i.dong}&nbsp;${i.apt}&nbsp;${i.dyear}년&nbsp;${i.dmonth}월
                            &nbsp;${i.earea}m2&nbsp;${i.price}만원</option>
                        </c:forEach>
                    </select>
                </div>
                <c:choose>
                    <c:when test="${not empty mainPost.mpId}">
                <div class="searchInfo" style="display:none">
                    </c:when>
                    <c:when test="${not empty post.postId}">
                <div class="searchInfo">
                    </c:when>
                </c:choose>
                    <input type="text" id="infoKeyword" size="30"/>
                    <button type="button" id="infoButton" onclick="checkWriteSearch()">검색</button>
                </div>
            </div>
            <c:choose>
                <c:when test="${not empty mainPost.mpId}">
            <div class="postupdate-status" style="display:none">
                </c:when>
                <c:when test="${not empty post.postId}">
            <div class="postupdate-status">
                </c:when>
            </c:choose>
                <select class="select-status" name="status" id="statusList">
                    <option>판매중</option>
                    <option>예약중</option>
                    <option>판매완료</option>
                </select>
            </div>
            <div class="postwrite-subject">
                <c:choose>
                    <c:when test="${not empty mainPost.mpId}">
                        <textarea placeholder="제목을 입력해 주세요." id="mpsub" name="mpsub" class="textarea_subject" maxlength="40" style="height: 40px;">${mainPost.mpsub}</textarea>
                    </c:when>
                    <c:when test="${not empty post.postId}">
                        <textarea placeholder="제목을 입력해 주세요." id="subject" name="subject" class="textarea_subject" maxlength="40" style="height: 40px;">${post.subject}</textarea>
                    </c:when>
                </c:choose>
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
                <c:choose>
                    <c:when test="${not empty mainPost.mpId}">
                <textarea class="summernote" id="mpcon" name="mpcon">${mainPost.mpcon}
                    </c:when>
                    <c:when test="${not empty post.postId}">
                <textarea class="summernote" id="content" name="content">${post.content}
                    </c:when>
                </c:choose>
                </textarea>
            </div>
        </div>
        </form>
    </div>
</body>
<c:if test="${not empty post.postId}">
    <script>
        var pinfoId = ${post.pinfoId};
        selectOption(pinfoId);
        selectStatus('${post.status}');
        function selectOption(pinfoId){
            $("#infoList").val(pinfoId);

            $.ajax({
                url: "../write.info",
                type: "POST",
                data: {select: $("#infoList").val()},
                success: function(info){
                    var infoAddrVal = info.gu.guname + " " + info.dong + " " + info.apt;
                    var infoPriceVal = info.price + " 만원";
                    var infoEareaVal = info.earea + " m2";
                    var infoDyearMonthVal = info.dyear + " 년 / " + info.dmonth + " 월";
                    var infoAddr = $('.info-addr');
                    var infoPrice = $('.info-price');
                    var infoEarea = $('.info-earea');
                    var infoDyearMonth = $('.info-year-month');
                    infoAddr.empty();
                    infoPrice.empty();
                    infoEarea.empty();
                    infoDyearMonth.empty();
                    var infoAddrP = $('<p>').text(infoAddrVal);
                    var infoPriceP = $('<p>').text(infoPriceVal);
                    var infoEareaP = $('<p>').text(infoEareaVal);
                    var infoDyearMonthP = $('<p>').text(infoDyearMonthVal);
                    infoAddr.append(infoAddrP);
                    infoPrice.append(infoPriceP);
                    infoEarea.append(infoEareaP);
                    infoDyearMonth.append(infoDyearMonthP)
                },
                error: function(error){
                    alert("error: " + error);
                }
            });

            if (pinfoId  > 2) {
                $('.setInfoTab').show();
            }else if (pinfoId == 1 || pinfoId == 2) {
                $('.setInfoTab').hide();
            }
        }
        function selectStatus(status){
            $("#statusList").val(status);
        }
    </script>
</c:if>
<script src="https://code.jquery.com/jquery-3.3.1.min.js" ></script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script src="js/summernote-lite.js"></script>
<script src="js/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="css/summernote-lite.css">

<script src="js/trim.js"></script>

<script src="js/postupdate_content.js"></script>

<script>
$('.summernote').summernote({
	  height: 450,
	  lang: "ko-KR"
	});
</script>

<%@ include file="/WEB-INF/views/footer.jsp" %>
</html>