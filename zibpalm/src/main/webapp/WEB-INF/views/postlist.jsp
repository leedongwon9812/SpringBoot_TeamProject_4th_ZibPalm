<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head>
    <link href="css/postlist.css" rel="stylesheet" type="text/css">
    <script src="https://code.jquery.com/jquery-3.3.1.min.js" ></script>
    <script src="js/trim.js"></script>
    <title>ZibPalm Post List</title>
</head>
<%@ include file="/WEB-INF/views/nav.jsp" %>
<body onload="setList('${paginator.boardType}')" style="margin:0; font-size:13px;">
    <div class="list-body">

        <! 검색해서 들어올 때 제목 정해주기 >
        <div class="list-info">
            <c:choose>
                <c:when test="${paginator.category == 'apt'}">
                    <h3 class="list-title">아파트 매물 리스트</h>
                </c:when>
                <c:when test="${paginator.category == 'else'}">
                    <h3 class="list-title">기타 매물 리스트</h>
                </c:when>
                <c:otherwise>
                    <h3 class="list-title">전체 매물 리스트</h>
                </c:otherwise>
            </c:choose>
        </div>

        <! 공지사항 위 선택인자들 >
        <div class="list-sort">
            <div class="list-sort-content">
                <div class="check_box">
                    <input type="checkbox" id="notice_hidden" onclick="mainShow('${paginator.boardType}')">
                    <label for="notice_hidden">공지 숨기기</label>
                </div>
                <div class="sort_form">
                    <a href="postlist?cp=1&ps=12&cat=${paginator.category}&bt=album" class="sort_album"></a>
                    <a href="postlist?cp=1&ps=10&cat=${paginator.category}&bt=list" class="sort_list is_selected"></a>
                </div>
            </div>
        </div>

        <! 공지사항 게시판 >
        <div class="list-maintable">
            <table cellpadding='7' cellspacing='2'>
            <thead class="list-maintable-title">
            	<tr id="normalTableTitle">
                    <th class="mainpost-14">번호</th>
                    <th class="mainpost-44">글제목</th>
                    <th class="mainpost-14">글쓴이</th>
                    <th class="mainpost-14">작성일</th>
                    <th class="mainpost-14">조회수</th>
                </tr>
            </thead>
            <c:if test="${empty mlist}">
                <tr class="list-maintable-content">
                    <td align='center' colspan="5">공지사항 없음</td>
                </tr>
            </c:if>
            <c:forEach items="${mlist}" var="m">
                <tr class="list-maintable-content">
                    <td class="mainpost-14">
                        <div class="list-maintable-strong">
                            <strong>공지</strong>
                        </div>
                    </td>
                    <td>
                        <a class="list-maintable-a" href="postcontent?cp=${paginator.currentPage}&ps=${paginator.pageSize}&cat=${paginator.category}&bt=${paginator.boardType}&mpId=${m.mpId}">
                        ${m.mpsub}
                    </td>
                    <td class="mainpost-14">${m.login.nickname}</td>
                    <fmt:formatDate var="today" value="${m.mpcdate}" pattern="yyyy-MM-dd" />
                    <c:choose>
                        <c:when test="${paginator.nowTime == today}">
                            <td class="mainpost-14"><fmt:formatDate value="${m.mpcdate}" pattern="HH:mm" /></td>
                        </c:when>
                        <c:otherwise>
                            <td class="mainpost-14"><fmt:formatDate value="${m.mpcdate}" pattern="yyyy-MM-dd" /></td>
                        </c:otherwise>
                    </c:choose>
                    <td class="mainpost-14">${m.mpview}</td>
                </tr>
            </c:forEach>
            </table>
        </div>



        <! 매물 게시판 리스트형 >
        <div class="list-table">
            <table cellpadding='7' cellspacing='2'>
            <c:if test="${empty plist}">
                <tr class="list-table-content">
                    <td align='center' colspan="5">검색된 리스트가 없습니다.</td>
                </tr>
            </c:if>
            <c:forEach items="${plist}" var="p">
                <tr class="list-table-content">
                    <td class="mainpost-14">${p.postId}</td>
                    <td class="mainpost-44">
                        <a class="list-table-a" href="postcontent?cp=${paginator.currentPage}&ps=${paginator.pageSize}&cat=${paginator.category}&bt=${paginator.boardType}&postId=${p.postId}">
                        <span class="post-status">[${p.status}]</span>&nbsp;
                        <span class="post-subject">${p.subject}</span></a>
                    </td>
                    <td class="mainpost-14">
                        ${p.login.nickname}
                    </td>
                    <fmt:formatDate var="today" value="${p.pcdate}" pattern="yyyy-MM-dd" />
                    <c:choose>
                        <c:when test="${paginator.nowTime == today}">
                            <td class="mainpost-14"><fmt:formatDate value="${p.pcdate}" pattern="HH:mm" /></td>
                        </c:when>
                        <c:otherwise>
                            <td class="mainpost-14"><fmt:formatDate value="${p.pcdate}" pattern="yyyy-MM-dd" /></td>
                        </c:otherwise>
                    </c:choose>
                    <td class="mainpost-14">${p.pview}</td>
                </tr>
            </c:forEach>
            </table>
        </div>

        <! 매물 게시판 앨범형 >
        <%@ page import="java.util.regex.Pattern" %>
        <%@ page import="java.util.regex.Matcher" %>
        <div class="album-table" style="display:none">
            <ul class="album-table-list">
                <c:if test="${empty plist}">
                    <div class="album-table-content" width="100%" style="text-align:center">
                        <p>검색된 리스트가 없습니다.</p>
                    </div>
                </c:if>
                <c:forEach items="${plist}" var="p">
                    <li class="album-table-content">
                        <a href="postcontent?cp=${paginator.currentPage}&ps=${paginator.pageSize}&cat=${paginator.category}&bt=${paginator.boardType}&postId=${p.postId}" class="album-table-img">
                        <c:set var="pContent" value="${p.content}"/>
                        <%
                            String content=(String)pageContext.getAttribute("pContent");
                            String firstImgSrc = "";
                            Pattern pattern = Pattern.compile("<img[^>]*src=[\"']([^>\"']+)[\"'][^>]*>");

                            Matcher matcher = pattern.matcher(content);
                            if (matcher.find()) {
                                firstImgSrc = matcher.group(1);
                            }

                            // 이미지가 있는 경우 앨범에 추가
                            if (!firstImgSrc.equals("")) {
                                out.print("<img width='200' height='200' style='vertical-align:top; border:none' src='" + firstImgSrc + "'>");
                            }else{
                                out.print("<img width='200' height='200' style='vertical-align:top; border:none' src='css/imgs/NoImage.png'>");
                            }
                        %>
                        </a>
                        <dl>
                            <dt>
                                <a href="postcontent?cp=${paginator.currentPage}&ps=${paginator.pageSize}&cat=${paginator.category}&bt=${paginator.boardType}&postId=${p.postId}" class="album-table-sub" title="${p.subject}">
                                ${p.subject}</a>
                            </dt>
                            <dd>${p.login.nickname}</dd>
                            <fmt:formatDate var="today" value="${p.pcdate}" pattern="yyyy-MM-dd" />
                            <c:choose>
                                <c:when test="${paginator.nowTime == today}">
                                    <dd><fmt:formatDate value="${p.pcdate}" pattern="HH:mm" />&nbsp;&nbsp;조회수 ${p.pview}</dd>
                                </c:when>
                                <c:otherwise>
                                    <dd><fmt:formatDate value="${p.pcdate}" pattern="yyyy-MM-dd" />&nbsp;&nbsp;조회수 ${p.pview}</dd>
                                </c:otherwise>
                            </c:choose>
                        </dl>
                    </li>
                </c:forEach>
            </ul>
        </div>

        <! 페이징 처리 부분 >
        <div class="list-leg">
            <div class="list-leg-body">
                <div class="list-leg-tpc">
                    전체 페이지: ${paginator.totalPageCount}
                </div>
                <div class="list-leg-a1">
                    <c:if test="${paginator.currentPage!=1}">
                    <c:choose>
                        <c:when test="${not empty paginator.searchWord}">
                            <a href="postlist?cp=1&ps=${paginator.pageSize}&cat=${paginator.category}&bt=${paginator.boardType}&sbv=${paginator.searchOption}&stv=${paginator.searchWord}">처음</a>
                            <a href="postlist?cp=${paginator.foreachStart}&ps=${paginator.pageSize}&cat=${paginator.category}&bt=${paginator.boardType}&sbv=${paginator.searchOption}&stv=${paginator.searchWord}">이전</a>
                        </c:when>
                        <c:when test="${not empty paginator.myEmail}">
                            <a href="postlist?cp=1&ps=${paginator.pageSize}&cat=${paginator.category}&bt=${paginator.boardType}&getEmail=${paginator.myEmail}">처음</a>
                            <a href="postlist?cp=${paginator.foreachStart}&ps=${paginator.pageSize}&cat=${paginator.category}&bt=${paginator.boardType}&getEmail=${paginator.myEmail}">이전</a>
                        </c:when>
                        <c:otherwise>
                            <a href="postlist?cp=1&ps=${paginator.pageSize}&cat=${paginator.category}&bt=${paginator.boardType}">처음</a>
                            <a href="postlist?cp=${paginator.foreachStart}&ps=${paginator.pageSize}&cat=${paginator.category}&bt=${paginator.boardType}">이전</a>
                        </c:otherwise>
                    </c:choose>
                    </c:if>
                </div>
                <div class="list-leg-cp">
                    <c:forEach begin="${paginator.foreachStart}" end="${paginator.foreachEnd}" var="i">
                        <c:choose>
                            <c:when test="${not empty paginator.searchWord}">
                                <a class="list-leg-a2" href="postlist?cp=${i}&ps=${paginator.pageSize}&cat=${paginator.category}&bt=${paginator.boardType}&sbv=${paginator.searchOption}&stv=${paginator.searchWord}">
                            </c:when>
                            <c:when test="${not empty paginator.myEmail}">
                                <a class="list-leg-a2" href="postlist?cp=${i}&ps=${paginator.pageSize}&cat=${paginator.category}&bt=${paginator.boardType}&getEmail=${paginator.myEmail}">
                            </c:when>
                            <c:otherwise>
                                <a class="list-leg-a2" href="postlist?cp=${i}&ps=${paginator.pageSize}&cat=${paginator.category}&bt=${paginator.boardType}">
                            </c:otherwise>
                        </c:choose>
                        <c:choose>
                            <c:when test="${i==paginator.currentPage}">
                                <strong>${i}</strong>
                            </c:when>
                            <c:otherwise>
                                ${i}
                            </c:otherwise>
                        </c:choose>
                        </a>&nbsp;
                    </c:forEach>
                </div>
                <div class="list-leg-a1">
                    <c:if test="${paginator.currentPage!=paginator.totalPageCount}">
                    <c:choose>
                        <c:when test="${not empty paginator.searchWord}">
                            <a href="postlist?cp=${paginator.foreachEnd}&ps=${paginator.pageSize}&cat=${paginator.category}&bt=${paginator.boardType}&sbv=${paginator.searchOption}&stv=${paginator.searchWord}">다음</a>
                            <a href="postlist?cp=${paginator.totalPageCount}&ps=${paginator.pageSize}&cat=${paginator.category}&bt=${paginator.boardType}&sbv=${paginator.searchOption}&stv=${paginator.searchWord}">끝</a>
                        </c:when>
                        <c:when test="${not empty paginator.myEmail}">
                            <a href="postlist?cp=${paginator.foreachEnd}&ps=${paginator.pageSize}&cat=${paginator.category}&bt=${paginator.boardType}&getEmail=${paginator.myEmail}">다음</a>
                            <a href="postlist?cp=${paginator.totalPageCount}&ps=${paginator.pageSize}&cat=${paginator.category}&bt=${paginator.boardType}&getEmail=${paginator.myEmail}">끝</a>
                        </c:when>
                        <c:otherwise>
                            <a href="postlist?cp=${paginator.foreachEnd}&ps=${paginator.pageSize}&cat=${paginator.category}&bt=${paginator.boardType}">다음</a>
                            <a href="postlist?cp=${paginator.totalPageCount}&ps=${paginator.pageSize}&cat=${paginator.category}&bt=${paginator.boardType}">끝</a>
                        </c:otherwise>
                    </c:choose>
                    </c:if>
                </div>

                <div class="list-leg-total">
                    전체 게시물: ${paginator.totalCount}
                </div>

                <! 리스트용 페이지사이즈 처리 부분 >
                <div class="list-leg-ps">
                    페이지 싸이즈 :
                        <c:choose>
                            <c:when test="${not empty paginator.searchWord}">
                                <select id="psId" name="ps" onchange="f1(this)">
                            </c:when>
                            <c:when test="${not empty paginator.myEmail}">
                                <select id="psId" name="ps" onchange="f2(this)">
                            </c:when>
                            <c:otherwise>
                                <select id="psId" name="ps" onchange="f3(this)">
                            </c:otherwise>
                        </c:choose>
                        <c:choose>
                            <c:when test="${paginator.pageSize <= 3}">
                               <option value="3" selected>3</option>
                               <option value="5">5</option>
                               <option value="10">10</option>
                            </c:when>
                            <c:when test="${paginator.pageSize == 5}">
                               <option value="3">3</option>
                               <option value="5" selected>5</option>
                               <option value="10">10</option>
                            </c:when>
                            <c:when test="${paginator.pageSize == 10}">
                               <option value="3">3</option>
                               <option value="5">5</option>
                               <option value="10" selected>10</option>
                            </c:when>
                        </c:choose>
                    </select>
                </div>

                <! 앨범용 페이지사이즈 처리 부분 >
                <div class="album-leg-ps" style="display:none">
                    페이지 싸이즈 :
                        <c:choose>
                            <c:when test="${not empty paginator.searchWord}">
                                <select id="psId" name="ps" onchange="f1(this)">
                            </c:when>
                            <c:when test="${not empty paginator.myEmail}">
                                <select id="psId" name="ps" onchange="f2(this)">
                            </c:when>
                            <c:otherwise>
                                <select id="psId" name="ps" onchange="f3(this)">
                            </c:otherwise>
                        </c:choose>
                        <c:choose>
                            <c:when test="${paginator.pageSize <= 4}">
                               <option value="4" selected>4</option>
                               <option value="8">8</option>
                               <option value="12">12</option>
                            </c:when>
                            <c:when test="${paginator.pageSize == 8}">
                               <option value="4">4</option>
                               <option value="8" selected>8</option>
                               <option value="12">12</option>
                            </c:when>
                            <c:when test="${paginator.pageSize == 12}">
                               <option value="4">4</option>
                               <option value="8">8</option>
                               <option value="12" selected>12</option>
                            </c:when>
                        </c:choose>
                    </select>
                </div>
            </div>

            <div class="list-leg-search">
                <div class="list-leg-Mypost">
                    <c:choose>
                        <c:when test="${not empty paginator.myEmail}">
                            <button type="button" onclick="location.href='postlist?cp=${paginator.currentPage}&ps=${paginator.pageSize}&cat=${paginator.category}&bt=${paginator.boardType}'">전체보기</button>
                        </c:when>
                        <c:otherwise>
                            <button type="button" onclick="location.href='postlist?cp=1&ps=10&cat=${paginator.category}&bt=all&getEmail=${email}'">내글보기</button>
                        </c:otherwise>
                    </c:choose>
                </div>
                <select name="searchBox" id="searchBox">
                    <option value="1">제목</option>
                    <option value="2">글쓴이</option>
                    <option value="3">내용</option>
                </select>
                <input type="text" id="keyword" onkeyup="enterKey()" size="40"/>
                <button type="button" onclick="checkSearch()">검색</button>
                <div class="list-leg-write">
                    <button type="button" onclick="location.href='postwrite?cp=${paginator.currentPage}&ps=${paginator.pageSize}&cat=${paginator.category}&bt=${paginator.boardType}'">글쓰기</button>
                </div>
            </div>


            <script src="js/postlist_content.js"></script>
            <script language="javascript">
                function f1(select){
                    var ps = select.value;
                    location.href="postlist?cp=1&ps="+ps+"&cat=${paginator.category}&bt=${paginator.boardType}&sbv=${paginator.searchOption}&stv=${paginator.searchWord}";
                }

                function f2(select){
                    var ps = select.value;
                    location.href="postlist?cp=1&ps="+ps+"&cat=${paginator.category}&bt=${paginator.boardType}&getEmail=${email}";
                }

                function f3(select){
                    var ps = select.value;
                    location.href="postlist?cp=1&ps="+ps+"&cat=${paginator.category}&bt=${paginator.boardType}";
                }

                function enterKey(){
                    if (window.event.keyCode == 13) {
                        checkSearch();
                    }
                }

                function checkSearch(){
                    var searchBoxVal = $("#searchBox").val();
                    var searchTextVal = $("#keyword").val();
                    searchTextVal = trim(searchTextVal);
                    if(searchTextVal.length == 0){
                        location.href="postlist?cp=1&ps=${paginator.pageSize}&cat=${paginator.category}&bt=${paginator.boardType}";
                    }else{
                        if(searchBoxVal == 1){
                            sbv = "p.subject";
                        }else if(searchBoxVal == 2){
                            sbv = "l.nickname";
                        }else if(searchBoxVal == 3){
                            sbv = "p.content";
                        }else{
                            return false;
                        }
                        location.href="postlist?cp=1&ps=${paginator.pageSize}&cat=${paginator.category}&bt=${paginator.boardType}&sbv=" + sbv + "&stv="+searchTextVal;
                    }
                }
            </script>
        </div>
    </div>
</body>
<%@ include file="/WEB-INF/views/footer.jsp" %>
</html>