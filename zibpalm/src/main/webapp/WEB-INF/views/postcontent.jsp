<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head>
    <link href="css/postcontent.css" rel="stylesheet" type="text/css">
    <title>ZibPalm Post Content</title>
</head>
<%@ include file="/WEB-INF/views/nav.jsp" %>
<body style="margin:0; font-size:13px;">

    <div class="postcontent-topbutton">
        <c:if test="${not empty email}">
            <c:choose>
                <c:when test="${email == post.login.email}">
                    <c:choose>
                        <c:when test="${post.status == '판매완료'}">
                    <div class="left-topbutton" style="display:none">
                        </c:when>
                        <c:otherwise>
                    <div class="left-topbutton">
                        </c:otherwise>
                    </c:choose>
                        <button class="post-update" onclick="postUpdate(${post.postId}, '${post.pemail}', '${paginator.category}')">수정</button>
                        <button class="post-delete" onclick="postDelete(${post.postId}, '${post.pemail}', '${paginator.category}')">삭제</button>
                    </div>
                </c:when>
                <c:when test="${email == mainPost.login.email}">
                    <div class="left-topbutton">
                        <button class="post-update" onclick="mainpostUpdate(${mainPost.mpId}, '${mainPost.mpemail}', '${paginator.category}')">수정</button>
                        <button class="post-delete" onclick="mainpostDelete(${mainPost.mpId}, '${mainPost.mpemail}', '${paginator.category}')">삭제</button>
                    </div>
                </c:when>
            </c:choose>
        </c:if>
        <div class="right-topbutton">
            <button class="postcontent-index" onclick="location.href='postlist?cp=${paginator.currentPage}&ps=${paginator.pageSize}&cat=${paginator.category}&bt=${paginator.boardType}'">
            목록</button>
        </div>
    </div>
	<div class="postcontent-body">

	    <! 내용 머리 부분 >
	    <div class="postcontent-header">

	        <! 카테고리 결정 및 누르면 리스트로 이동 >
            <div class="postcontent-header-main">
                <a href="postlist?cp=${paginator.currentPage}&ps=${paginator.pageSize}&cat=${paginator.category}&bt=${paginator.boardType}">
                    <c:choose>
                        <c:when test="${paginator.category == 'apt'}">
                            <h4 class="list-title">아파트 매물 리스트</h>
                        </c:when>
                        <c:when test="${paginator.category == 'else'}">
                            <h4 class="list-title">기타 매물 리스트</h>
                        </c:when>
                        <c:otherwise>
                            <h4 class="list-title">전체 매물 리스트</h>
                        </c:otherwise>
                    </c:choose>
                </a>
                <div class="postcontent-header-title">
                    <c:choose>
                        <c:when test="${not empty mainPost.mpId}">
                            <div class="postcontent-title-strong">
                                <strong>공지</strong>
                            </div>
                            <h3 class="postcontent-title">${mainPost.mpsub}<h3>
                        </c:when>
                        <c:otherwise>
                            <h3 class="postcontent-title">${post.subject}<h3>
                        </c:otherwise>
                    </c:choose>
                </div>

                <! 작성자 및 작성/수정일자, 조회수 >
                <div class="postcontent-header-writer">
                    <div class="header-writer-profile">
                        <div class="writer-profile">
                            <img src="css/imgs/Logo.png" width="36" height="36">
                            <c:choose>
                                <c:when test="${not empty mainPost.mpId}">
                                    <strong>관리자</strong>
                                    <p>${mainPost.login.nickname}</p>
                                </c:when>
                                <c:otherwise>
                                    <strong>회원</strong>
                                    <p>${post.login.nickname}</p>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                    <div class="header-article-profile">
                        <c:choose>
                            <c:when test="${not empty mainPost.mpId}">
                                <div class="article-profile-date">
                                    <span>작성일자: ${mainPost.mpcdate}</span>
                                    <span>수정일자: ${mainPost.mpudate}</span>
                                </div>
                                <span class="article-profile-count">조회수: ${mainPost.mpview}</span>
                            </c:when>
                            <c:otherwise>
                                <div class="article-profile-date">
                                    <span>작성일자: ${post.pcdate}</span>
                                    <span>수정일자: ${post.pudate}</span>
                                </div>
                                <span class="article-profile-count">조회수: ${post.pview}</span>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
                <div class="postcontent-header-status">
                    <h3 class="postcontent-status">${post.status}<h3>
                </div>
            </div>
	    </div>

	    <! 내용 몸통 부분 >
	    <div class="postcontent-main">
	        <c:choose>
                <c:when test="${not empty mainPost.mpId}">
                    ${mainPost.mpcon}
                </c:when>
                <c:otherwise>
                    <! 아파트 정보는 매물정보 있으므로 가져오는 부분 >
                    <c:if test="${not empty info.infoId and info.infoId > 2}">
                        <div class="postcontent-main-info">
                            <table>
                                <tr><td colspan="2"><strong>아파트 매물 정보</strong></td></tr>
                                <tr>
                                    <td class="info-td"><strong>주소</strong></td>
                                    <td class="info-content">
                                        <p>${info.gu.guname}</p>
                                        <p>${info.dong}</p>
                                        <p>${info.apt}</p>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="info-td"><strong>가격</strong></td>
                                    <td><p>${info.price}&nbsp;만원</p></td>
                                </tr>
                                <tr>
                                    <td class="info-td"><strong>전용면적</strong></td>
                                    <td><p>${info.earea}&nbsp;m2</p></td>
                                </tr>
                                <tr>
                                    <td><strong>거래 년/월</strong></td>
                                    <td><p>${info.dyear}년 &nbsp;${info.dmonth}월</p></td>
                                </tr>
                            </table>
                        </div>
                    </c:if>
                    ${post.content}
                </c:otherwise>
            </c:choose>
        </div>


        <! 댓글 부분 >
        <c:choose>
            <c:when test="${not empty mainPost.mpId}">
        <div class="postcontent-comment" style="display:none">
            </c:when>
            <c:otherwise>
        <div class="postcontent-comment">
            </c:otherwise>
        </c:choose>
            <div class="postcontent-comment-option">
                <h3 class="comment_title">댓글</h3>
            </div>
            <ul class="comment-list" id="comment-list">
                <c:if test="${empty fcList}">
                    <div width="100%" style="text-align:center">
                        <p>현재 해당 글에는 댓글이 없습니다.</p>
                    </div>
                </c:if>
                <c:forEach items="${fcList}" var="f">
                <li class="commentItem">
                    <div class="comment_area">
                        <img src="css/imgs/Logo.png" width="36" height="36">
                        <div class="comment_box">
                            <div class="comment_nick_info">
                                ${f.login.nickname}
                            </div>
                            <div class="comment_text_box">
                                <p class="comment_text_view">
                                    <span class="text_comment">
                                        ${f.fccomment}
                                    </span>
                                </p>
                            </div>
                            <div class="comment_info_box">
                                <span class="comment_info_date">
                                    <fmt:formatDate value="${f.fccdate}" pattern="yyyy-MM-dd a hh:mm:ss" />
                                </span>
                                <a role="button" class="comment_info_button" onclick="showReplyForm(${f.fcId})">
                                    답글쓰기
                                </a>
                                <c:if test="${not empty email}">
                                    <c:if test="${email == f.fcemail}">
                                        <a role="button" class="comment_delete_button" onclick="delReplyForm(${f.fcId}, '${f.fcemail}')">
                                            삭제
                                        </a>
                                    </c:if>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </li>
                <c:set var="fcIdLong" value="${f.fcId}"/>
                <c:forEach items="${scMap}" var="scMap">
                <c:if test="${scMap.key == fcIdLong}">
                    <c:forEach items="${scMap.value}" var="s">
                        <li class="commentItem-reply">
                            <div class="comment_area">
                                <img src="css/imgs/Logo.png" width="36" height="36">
                                <div class="comment_box">
                                    <div class="comment_nick_info">
                                        ${s.login.nickname}
                                    </div>
                                    <div class="comment_text_box">
                                        <p class="comment_text_view">
                                            <span class="text_comment">
                                                ${s.sccomment}
                                            </span>
                                        </p>
                                    </div>
                                    <div class="comment_info_box">
                                        <span class="comment_info_date">
                                            <fmt:formatDate value="${s.sccdate}" pattern="yyyy-MM-dd a hh:mm:ss" />
                                        </span>
                                        <c:if test="${not empty email}">
                                            <c:if test="${email == s.scemail}">
                                                <a role="button" class="comment_delete_button" onclick="delReReplyForm(${s.scId}, '${s.scemail}')">
                                                    삭제
                                                </a>
                                            </c:if>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </c:forEach>
                </c:if>
                </c:forEach>
                <li id="fc${f.fcId}" class="commentItem-re" style="display:none">
                    <div class="commentWriter">
                        <form id="comments${f.fcId}" method="post" action="postcomment.do?cp=${paginator.currentPage}&ps=${paginator.pageSize}&cat=${paginator.category}&bt=${paginator.boardType}&scfcId=${f.fcId}&fcp=${fcPaginator.fcurrentPage}&fps=${fcPaginator.fpageSize}">
                            <div class="comment-inbox">
                                <strong class="comment-blind">댓글을 입력하세요</strong>
                                <c:choose>
                                    <c:when test="${not empty nickname}">
                                        <em class="comment-nickname" name="nickname"> ${nickname} </em>
                                    </c:when>
                                    <c:otherwise>
                                        <em class="comment-nickname" name="nickname"> Guest </em>
                                    </c:otherwise>
                                </c:choose>
                                <textarea placeholder="댓글을 남겨보세요" rows="1" name="sccomment" id="sc${f.fcId}" class="comment-text" maxlength="100" onkeyup="countTextS(this, ${f.fcId})"></textarea>
                                <div class="comment_inbox_number-re" style="display:none">
                                    <strong class="inbox_count-re"></strong>
                                    <span class="inbox_total">/ 100</span>
                                </div>
                            </div>
                            <div class="comment_attach">
                                <div class="register_box">
                                    <input type="button" class="comment-cancle" value="취소" onclick="cancleScomment(${f.fcId})"/>
                                    <input type="button" class="comment-register" value="등록" onclick="checkScomment(${f.fcId})"/>
                                </div>
                            </div>
                        </form>
                    </div>
                </li>
                </c:forEach>
            </ul>
        </div>


        <! 댓글 입력하는 부분 >
        <c:choose>
            <c:when test="${not empty mainPost.mpId}">
        <div class="commentWriter" style="display:none">
            </c:when>
            <c:otherwise>
        <div class="commentWriter">
            </c:otherwise>
        </c:choose>
        <form name="commentf" method="post" action="postcomment.do?cp=${paginator.currentPage}&ps=${paginator.pageSize}&cat=${paginator.category}&bt=${paginator.boardType}&fcpostId=${post.postId}&fcp=1&fps=100">
            <div class="comment-inbox">
                <strong class="comment-blind">댓글을 입력하세요</strong>
                <c:choose>
                    <c:when test="${not empty nickname}">
                        <em class="comment-nickname" name="nickname"> ${nickname} </em>
                    </c:when>
                    <c:otherwise>
                        <em class="comment-nickname" name="nickname"> Guest </em>
                    </c:otherwise>
                </c:choose>
                <textarea placeholder="댓글을 남겨보세요" rows="1" name="fccomment" id="fccomment" class="comment-text" maxlength="100" onkeyup="countTextF(this)"></textarea>
                <div class="comment_inbox_number" style="display:none">
                    <strong class="inbox_count"></strong>
                    <span class="inbox_total">/ 100</span>
                </div>
            </div>
            <div class="comment_attach">
                <div class="register_box">
                    <input type="button" class="comment-register" value="등록" onclick="checkFcomment()"/>
                </div>
            </div>
        </form>
        </div>
    </div>
</body>
<script src="https://code.jquery.com/jquery-3.3.1.min.js" ></script>
<script src="js/postcontent_content.js"></script>

<%@ include file="/WEB-INF/views/footer.jsp" %>
