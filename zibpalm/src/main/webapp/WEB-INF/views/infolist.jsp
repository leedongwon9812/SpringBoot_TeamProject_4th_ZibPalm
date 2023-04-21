<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <title>Title</title>

        <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />

        <style>
            a { text-decoration:none }

            .ui-autocomplete{
                max-height: 280px;
                overflow-y: auto; /* prevent horizontal scrollbar */
                overflow-x: hidden;
            }

            * html .ui-autocomplete{
                height: 280px;
            }
        </style>

    </head>
<body onload="$('#keyword').focus()">
<%@ include file="/WEB-INF/views/nav.jsp" %>
</br></br></br></br></br></br></br>
<div>
    <center>
    <hr width='600' size='2' color='gray' noshade>
    <h3>안녕하세요 집팜(ZibPalm) 시세정보입니다</h3>
    <p>${msg}</p>
    목록에서 찾기 :
    <select id="sizeId" name="size" onchange="guname(this)">
        <option>지역구를 선택하세요</option>
        <c:forEach var="guList" items="${guLists}">
            <c:if test="${guList.guId == guid}">
                <option value="${guList.guId}" selected>${guList.guname}</option>
            </c:if>
            <c:if test="${guList.guId != guid}">
                <option value="${guList.guId}">${guList.guname}</option>
            </c:if>
        </c:forEach>
    </select>
    <c:choose>
        <c:when test="${guid != null}">
            <select id="sizeId2" name="size2" onchange="dong(this)">
               <option>동이름을 선택하세요</option>
               <c:forEach var="infoList" items="${infoLists}">
                   <c:if test="${infoList.dong == dong}">
                       <option value="${guid}+${infoList.dong}" selected>${infoList.dong}</option>
                   </c:if>
                   <c:if test="${infoList.dong != dong}">
                       <option value="${guid}+${infoList.dong}">${infoList.dong}</option>
                   </c:if>
               </c:forEach>
            </select>
        </c:when>
    </c:choose>
    <c:choose>
        <c:when test="${dong != null}">
            <select id="sizeId3" name="size3" onchange="apt(this)">
               <option>아파트를 선택하세요</option>
               <c:forEach var="aptList" items="${aptLists}">
                   <c:if test="${aptList.apt == apt}">
                       <option value="${guid}+${dong}+${aptList.apt}" selected>${aptList.apt}</option>
                   </c:if>
                   <c:if test="${aptList.apt != apt}">
                       <option value="${guid}+${dong}+${aptList.apt}">${aptList.apt}</option>
                   </c:if>
               </c:forEach>
            </select>
        </c:when>
    </c:choose>
    <c:choose>
        <c:when test="${apt != null}">
            <select id="sizeId4" name="size4" onchange="earea(this)">
               <option>전용면적을 선택하세요</option>
               <c:forEach var="eareaList" items="${eareaLists}">
                   <c:if test="${eareaList.earea == earea}">
                       <option value="${guid}+${dong}+${apt}+${eareaList.earea}" selected>${eareaList.earea}</option>
                   </c:if>
                   <c:if test="${eareaList.earea != earea}">
                       <option value="${guid}+${dong}+${apt}+${eareaList.earea}">${eareaList.earea}</option>
                   </c:if>
               </c:forEach>
            </select>
        </c:when>
    </c:choose>



    <div>
    <c:choose>
        <c:when test="${guid != null && dong == null}">
            <TABLE border='2' width='800' align='center' noshade>
                <TR size='2' align='center' noshade bgcolor='AliceBlue'>
                    <th color='gray'>지역구명</th>
                    <th color='gray'>동이름</th>
                    <th color='gray'>아파트명</th>
                    <th color='gray'>전용면적</th>
                    <th color='gray'>년(year)</th>
                    <th color='gray'>월(month)</th>
                    <th color='gray'>매매금액(단위:만)</th>
                </TR>
                <c:if test="${empty guidSelectLists}">
                    <tr align="center" noshade>
                       <td colspan="7">데이터가 하나도 없음</td>
                    </tr>
                </c:if>
                <c:forEach items="${guidSelectLists}" var="guidSelectList">
                    <TR align='center' noshade>
                        <TD>${guidSelectList.gu.guname}</TD>
                        <TD>${guidSelectList.dong}</TD>
                        <TD>${guidSelectList.apt}</TD>
                        <TD>${guidSelectList.earea}</TD>
                        <TD>${guidSelectList.dyear}</TD>
                        <TD>${guidSelectList.dmonth}</TD>
                        <TD>${guidSelectList.price}</TD>
                    </TR>
                </c:forEach>
            </TABLE>
        </c:when>
        <c:when test="${dong != null && apt == null}">
            <TABLE border='2' width='800' align='center' noshade>
                <TR size='2' align='center' noshade bgcolor='AliceBlue'>
                    <th color='gray'>지역구명</th>
                    <th color='gray'>동이름</th>
                    <th color='gray'>아파트명</th>
                    <th color='gray'>전용면적(m2)</th>
                    <th color='gray'>년(year)</th>
                    <th color='gray'>월(month)</th>
                    <th color='gray'>매매금액(단위:만원)</th>
                </TR>
                <c:if test="${empty dongSelectLists}">
                    <tr align="center" noshade>
                       <td colspan="7">데이터가 하나도 없음</td>
                    </tr>
                </c:if>
                <c:forEach items="${dongSelectLists}" var="dongSelectList">
                    <TR align='center' noshade>
                        <TD>${dongSelectList.gu.guname}</TD>
                        <TD>${dongSelectList.dong}</TD>
                        <TD>${dongSelectList.apt}</TD>
                        <TD>${dongSelectList.earea}</TD>
                        <TD>${dongSelectList.dyear}</TD>
                        <TD>${dongSelectList.dmonth}</TD>
                        <TD>${dongSelectList.price}</TD>
                    </TR>
                </c:forEach>
            </TABLE>
        </c:when>
        <c:when test="${apt != null && earea == null}">
            <TABLE border='2' width='800' align='center' noshade>
                <TR size='2' align='center' noshade bgcolor='AliceBlue'>
                    <th color='gray'>지역구명</th>
                    <th color='gray'>동이름</th>
                    <th color='gray'>아파트명</th>
                    <th color='gray'>전용면적(m2)</th>
                    <th color='gray'>년(year)</th>
                    <th color='gray'>월(month)</th>
                    <th color='gray'>매매금액(단위:만원)</th>
                </TR>
                <c:if test="${empty aptSelectLists}">
                    <tr align="center" noshade>
                       <td colspan="7">데이터가 하나도 없음</td>
                    </tr>
                </c:if>
                <c:forEach items="${aptSelectLists}" var="aptSelectList">
                    <TR align='center' noshade>
                        <TD>${aptSelectList.gu.guname}</TD>
                        <TD>${aptSelectList.dong}</TD>
                        <TD>${aptSelectList.apt}</TD>
                        <TD>${aptSelectList.earea}</TD>
                        <TD>${aptSelectList.dyear}</TD>
                        <TD>${aptSelectList.dmonth}</TD>
                        <TD>${aptSelectList.price}</TD>
                    </TR>
                </c:forEach>
            </TABLE>
        </c:when>
        <c:when test="${earea != null}">
            <TABLE border='2' width='800' align='center' noshade>
                <TR size='2' align='center' noshade bgcolor='AliceBlue'>
                    <th color='gray'>지역구명</th>
                    <th color='gray'>동이름</th>
                    <th color='gray'>아파트명</th>
                    <th color='gray'>전용면적(m2)</th>
                    <th color='gray'>년(year)</th>
                    <th color='gray'>월(month)</th>
                    <th color='gray'>매매금액(단위:만원)</th>
                </TR>
                <c:if test="${empty priceLists}">
                    <tr align="center" noshade>
                       <td colspan="7">데이터가 하나도 없음</td>
                    </tr>
                </c:if>
                <c:forEach items="${priceLists}" var="priceList">
                    <TR align='center' noshade>
                        <TD>${priceList.gu.guname}</TD>
                        <TD>${priceList.dong}</TD>
                        <TD>${priceList.apt}</TD>
                        <TD>${priceList.earea}</TD>
                        <TD>${priceList.dyear}</TD>
                        <TD>${priceList.dmonth}</TD>
                        <TD>${priceList.price}</TD>
                    </TR>
                </c:forEach>
            </TABLE>
        </c:when>
        <c:when test="${searchText != null}">
            <TABLE border='2' width='800' align='center' noshade>
                <TR size='2' align='center' noshade bgcolor='AliceBlue'>
                    <th color='gray'>지역구명</th>
                    <th color='gray'>동이름</th>
                    <th color='gray'>아파트명</th>
                    <th color='gray'>전용면적(m2)</th>
                    <th color='gray'>년(year)</th>
                    <th color='gray'>월(month)</th>
                    <th color='gray'>매매금액(단위:만원)</th>
                </TR>
                <c:if test="${empty searchLists}">
                    <tr align="center" noshade>
                       <td colspan="7">데이터가 하나도 없음</td>
                    </tr>
                </c:if>
                <c:forEach items="${searchLists}" var="searchList">
                    <TR align='center' noshade>
                        <TD>${searchList.gu.guname}</TD>
                        <TD>${searchList.dong}</TD>
                        <TD>${searchList.apt}</TD>
                        <TD>${searchList.earea}</TD>
                        <TD>${searchList.dyear}</TD>
                        <TD>${searchList.dmonth}</TD>
                        <TD>${searchList.price}</TD>
                    </TR>
                </c:forEach>
            </TABLE>
        </c:when>
    </c:choose>
    </div>

    <div>
    <c:choose>
        <c:when test="${guid != null && dong == null}">
            <hr width='800' size='2' color='gray' noshade>

                ( 총 페이지수 : ${paginator.totalPageCount} )
                &nbsp;&nbsp;&nbsp;

                <a href="price2.do?guid=${guid}&cp=1&ps=${paginator.pageSize}">처음</a>
                <c:choose>
                    <c:when test="${paginator.currentPage > 1}">
                        <a href="price2.do?guid=${guid}&cp=${paginator.currentPage-1}&ps=${paginator.pageSize}">이전</a>
                    </c:when>
                    <c:otherwise>
                        <a href="price2.do?guid=${guid}&cp=1&ps=${paginator.pageSize}">이전</a>
                    </c:otherwise>
                </c:choose>
                <c:forEach begin="${paginator.foreachStart}" end="${paginator.foreachEnd}" var="i">
                    <c:choose>
                        <c:when test="${i == paginator.currentPage}">
                            <strong>${i}</strong>
                        </c:when>
                        <c:otherwise>
                            <a href="price2.do?guid=${guid}&cp=${i}&ps=${paginator.pageSize}">${i}</a>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                <c:choose>
                    <c:when test="${paginator.currentPage != paginator.totalPageCount}">
                        <a href="price2.do?guid=${guid}&cp=${paginator.currentPage+1}&ps=${paginator.pageSize}">다음</a>
                    </c:when>
                    <c:otherwise>
                        <a href="price2.do?guid=${guid}&cp=${paginator.totalPageCount}&ps=${paginator.pageSize}">다음</a>
                    </c:otherwise>
                </c:choose>
                <a href="price2.do?guid=${guid}&cp=${paginator.totalPageCount}&ps=${paginator.pageSize}">끝</a>

                &nbsp;&nbsp;&nbsp;
                ( 총 매매건수 : ${paginator.totalCount} )

                &nbsp;&nbsp;&nbsp;
                <select onchange="gunamePs(this)">
                    <c:choose>
                        <c:when test="${paginator.pageSize == 10}">
                            <option value="${guid}+${paginator.currentPage}+10" selected>10</option>
                            <option value="${guid}+${paginator.currentPage}+15">15</option>
                            <option value="${guid}+${paginator.currentPage}+20">20</option>
                        </c:when>
                        <c:when test="${paginator.pageSize == 15}">
                            <option value="${guid}+${paginator.currentPage}+10">10</option>
                            <option value="${guid}+${paginator.currentPage}+15" selected>15</option>
                            <option value="${guid}+${paginator.currentPage}+20">20</option>
                        </c:when>
                        <c:when test="${paginator.pageSize == 20}">
                            <option value="${guid}+${paginator.currentPage}+10">10</option>
                            <option value="${guid}+${paginator.currentPage}+15">15</option>
                            <option value="${guid}+${paginator.currentPage}+20" selected>20</option>
                        </c:when>
                    </c:choose>
                </select>

        </c:when>
        <c:when test="${dong != null && apt == null}">
            <hr width='800' size='2' color='gray' noshade>

                ( 총 페이지수 : ${paginator.totalPageCount} )
                &nbsp;&nbsp;&nbsp;

                <a href="price3.do?guid=${guid}&dong=${dong}&cp=1&ps=${paginator.pageSize}">처음</a>
                <c:choose>
                    <c:when test="${paginator.currentPage > 1}">
                        <a href="price3.do?guid=${guid}&dong=${dong}&cp=${paginator.currentPage-1}&ps=${paginator.pageSize}">이전</a>
                    </c:when>
                    <c:otherwise>
                        <a href="price3.do?guid=${guid}&dong=${dong}&cp=1&ps=${paginator.pageSize}">이전</a>
                    </c:otherwise>
                </c:choose>
                <c:forEach begin="${paginator.foreachStart}" end="${paginator.foreachEnd}" var="i">
                    <c:choose>
                        <c:when test="${i == paginator.currentPage}">
                            <strong>${i}</strong>
                        </c:when>
                        <c:otherwise>
                            <a href="price3.do?guid=${guid}&dong=${dong}&cp=${i}&ps=${paginator.pageSize}">${i}</a>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                <c:choose>
                    <c:when test="${paginator.currentPage != paginator.totalPageCount}">
                        <a href="price3.do?guid=${guid}&dong=${dong}&cp=${paginator.currentPage+1}&ps=${paginator.pageSize}">다음</a>
                    </c:when>
                    <c:otherwise>
                        <a href="price3.do?guid=${guid}&dong=${dong}&cp=${paginator.totalPageCount}&ps=${paginator.pageSize}">다음</a>
                    </c:otherwise>
                </c:choose>
                <a href="price3.do?guid=${guid}&dong=${dong}&cp=${paginator.totalPageCount}&ps=${paginator.pageSize}">끝</a>
                &nbsp;&nbsp;&nbsp;

                ( 총 매매건수 : ${paginator.totalCount} )

                &nbsp;&nbsp;&nbsp;
                <select onchange="dongPs(this)">
                    <c:choose>
                        <c:when test="${paginator.pageSize == 10}">
                            <option value="${guid}+${dong}+${paginator.currentPage}+10" selected>10</option>
                            <option value="${guid}+${dong}+${paginator.currentPage}+15">15</option>
                            <option value="${guid}+${dong}+${paginator.currentPage}+20">20</option>
                        </c:when>
                        <c:when test="${paginator.pageSize == 15}">
                            <option value="${guid}+${dong}+${paginator.currentPage}+10">10</option>
                            <option value="${guid}+${dong}+${paginator.currentPage}+15" selected>15</option>
                            <option value="${guid}+${dong}+${paginator.currentPage}+20">20</option>
                        </c:when>
                        <c:when test="${paginator.pageSize == 20}">
                            <option value="${guid}+${dong}+${paginator.currentPage}+10">10</option>
                            <option value="${guid}+${dong}+${paginator.currentPage}+15">15</option>
                            <option value="${guid}+${dong}+${paginator.currentPage}+20" selected>20</option>
                        </c:when>
                    </c:choose>
                </select>

        </c:when>
        <c:when test="${apt != null && earea == null}">
            <hr width='800' size='2' color='gray' noshade>

                ( 총 페이지수 : ${paginator.totalPageCount} )

                &nbsp;&nbsp;&nbsp;
                <a href="price4.do?guid=${guid}&dong=${dong}&apt=${apt}&cp=1&ps=${paginator.pageSize}">처음</a>
                <c:choose>
                    <c:when test="${paginator.currentPage > 1}">
                        <a href="price4.do?guid=${guid}&dong=${dong}&apt=${apt}&cp=${paginator.currentPage-1}&ps=${paginator.pageSize}">이전</a>
                    </c:when>
                    <c:otherwise>
                        <a href="price4.do?guid=${guid}&dong=${dong}&apt=${apt}&cp=1&ps=${paginator.pageSize}">이전</a>
                    </c:otherwise>
                </c:choose>
                <c:forEach begin="${paginator.foreachStart}" end="${paginator.foreachEnd}" var="i">
                    <c:choose>
                        <c:when test="${i == paginator.currentPage}">
                            <strong>${i}</strong>
                        </c:when>
                        <c:otherwise>
                            <a href="price4.do?guid=${guid}&dong=${dong}&apt=${apt}&cp=${i}&ps=${paginator.pageSize}">${i}</a>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                <c:choose>
                    <c:when test="${paginator.currentPage != paginator.totalPageCount}">
                        <a href="price4.do?guid=${guid}&dong=${dong}&apt=${apt}&cp=${paginator.currentPage+1}&ps=${paginator.pageSize}">다음</a>
                    </c:when>
                    <c:otherwise>
                        <a href="price4.do?guid=${guid}&dong=${dong}&apt=${apt}&cp=${paginator.totalPageCount}&ps=${paginator.pageSize}">다음</a>
                    </c:otherwise>
                </c:choose>
                <a href="price4.do?guid=${guid}&dong=${dong}&apt=${apt}&cp=${paginator.totalPageCount}&ps=${paginator.pageSize}">끝</a>

                &nbsp;&nbsp;&nbsp;
                ( 총 매매건수 : ${paginator.totalCount} )

                &nbsp;&nbsp;&nbsp;
                <select onchange="aptPs(this)">
                    <c:choose>
                        <c:when test="${paginator.pageSize == 10}">
                            <option value="${guid}+${dong}+${apt}+10" selected>10</option>
                            <option value="${guid}+${dong}+${apt}+15">15</option>
                            <option value="${guid}+${dong}+${apt}+20">20</option>
                        </c:when>
                        <c:when test="${paginator.pageSize == 15}">
                            <option value="${guid}+${dong}+${apt}+10">10</option>
                            <option value="${guid}+${dong}+${apt}+15" selected>15</option>
                            <option value="${guid}+${dong}+${apt}+20">20</option>
                        </c:when>
                        <c:when test="${paginator.pageSize == 20}">
                            <option value="${guid}+${dong}+${apt}+10">10</option>
                            <option value="${guid}+${dong}+${apt}+15">15</option>
                            <option value="${guid}+${dong}+${apt}+20" selected>20</option>
                        </c:when>
                    </c:choose>
                </select>

        </c:when>
        <c:when test="${earea != null}">
            <hr width='800' size='2' color='gray' noshade>

                ( 총 페이지수 : ${paginator.totalPageCount} )

                &nbsp;&nbsp;&nbsp;
                <a href="price5.do?guid=${guid}&dong=${dong}&apt=${apt}&earea=${earea}&cp=1&ps=${paginator.pageSize}">처음</a>
                <c:choose>
                    <c:when test="${paginator.currentPage > 1}">
                        <a href="price5.do?guid=${guid}&dong=${dong}&apt=${apt}&earea=${earea}&cp=${paginator.currentPage-1}&ps=${paginator.pageSize}">이전</a>
                    </c:when>
                    <c:otherwise>
                        <a href="price5.do?guid=${guid}&dong=${dong}&apt=${apt}&earea=${earea}&cp=1&ps=${paginator.pageSize}">이전</a>
                    </c:otherwise>
                </c:choose>
                <c:forEach begin="${paginator.foreachStart}" end="${paginator.foreachEnd}" var="i">
                    <c:choose>
                        <c:when test="${i == paginator.currentPage}">
                            <strong>${i}</strong>
                        </c:when>
                        <c:otherwise>
                            <a href="price5.do?guid=${guid}&dong=${dong}&apt=${apt}&earea=${earea}&cp=${i}&ps=${paginator.pageSize}">${i}</a>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                <c:choose>
                    <c:when test="${paginator.currentPage != paginator.totalPageCount}">
                        <a href="price5.do?guid=${guid}&dong=${dong}&apt=${apt}&earea=${earea}&cp=${paginator.currentPage+1}&ps=${paginator.pageSize}">다음</a>
                    </c:when>
                    <c:otherwise>
                        <a href="price5.do?guid=${guid}&dong=${dong}&apt=${apt}&earea=${earea}&cp=${paginator.totalPageCount}&ps=${paginator.pageSize}">다음</a>
                    </c:otherwise>
                </c:choose>
                <a href="price5.do?guid=${guid}&dong=${dong}&apt=${apt}&earea=${earea}&cp=${paginator.totalPageCount}&ps=${paginator.pageSize}">끝</a>

                &nbsp;&nbsp;&nbsp;
                ( 총 매매건수 : ${paginator.totalCount} )

                &nbsp;&nbsp;&nbsp;
                <select onchange="eareaPs(this)">
                    <c:choose>
                        <c:when test="${paginator.pageSize == 10}">
                            <option value="${guid}+${dong}+${apt}+${earea}+10" selected>10</option>
                            <option value="${guid}+${dong}+${apt}+${earea}+15">15</option>
                            <option value="${guid}+${dong}+${apt}+${earea}+20">20</option>
                        </c:when>
                        <c:when test="${paginator.pageSize == 15}">
                            <option value="${guid}+${dong}+${apt}+${earea}+10">10</option>
                            <option value="${guid}+${dong}+${apt}+${earea}+15" selected>15</option>
                            <option value="${guid}+${dong}+${apt}+${earea}+20">20</option>
                        </c:when>
                        <c:when test="${paginator.pageSize == 20}">
                            <option value="${guid}+${dong}+${apt}+${earea}+10">10</option>
                            <option value="${guid}+${dong}+${apt}+${earea}+15">15</option>
                            <option value="${guid}+${dong}+${apt}+${earea}+20" selected>20</option>
                        </c:when>
                    </c:choose>
                </select>

        </c:when>
        <c:when test="${searchText != null}">
            <hr width='800' size='2' color='gray' noshade>

                ( 총 페이지수 : ${paginator.totalPageCount} )

                &nbsp;&nbsp;&nbsp;
                <a href="price6.do?searchBox=${searchBox}&searchText=${searchText}&cp=1&ps=${paginator.pageSize}">처음</a>
                <c:choose>
                    <c:when test="${paginator.currentPage > 1}">
                        <a href="price6.do?searchBox=${searchBox}&searchText=${searchText}&cp=${paginator.currentPage-1}&ps=${paginator.pageSize}">이전</a>
                    </c:when>
                    <c:otherwise>
                        <a href="price6.do?searchBox=${searchBox}&searchText=${searchText}&cp=1&ps=${paginator.pageSize}">이전</a>
                    </c:otherwise>
                </c:choose>
                <c:forEach begin="${paginator.foreachStart}" end="${paginator.foreachEnd}" var="i">
                    <c:choose>
                        <c:when test="${i == paginator.currentPage}">
                            <strong>${i}</strong>
                        </c:when>
                        <c:otherwise>
                            <a href="price6.do?searchBox=${searchBox}&searchText=${searchText}&cp=${i}&ps=${paginator.pageSize}">${i}</a>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                <c:choose>
                    <c:when test="${paginator.currentPage != paginator.totalPageCount}">
                        <a href="price6.do?searchBox=${searchBox}&searchText=${searchText}&cp=${paginator.currentPage+1}&ps=${paginator.pageSize}">다음</a>
                    </c:when>
                    <c:otherwise>
                        <a href="price6.do?searchBox=${searchBox}&searchText=${searchText}&cp=${paginator.totalPageCount}&ps=${paginator.pageSize}">다음</a>
                    </c:otherwise>
                </c:choose>
                <a href="price6.do?searchBox=${searchBox}&searchText=${searchText}&cp=${paginator.totalPageCount}&ps=${paginator.pageSize}">끝</a>

                &nbsp;&nbsp;&nbsp;
                ( 총 매매건수 : ${paginator.totalCount} )

                &nbsp;&nbsp;&nbsp;
                <select onchange="searchPs(this)">
                    <c:choose>
                        <c:when test="${paginator.pageSize == 10}">
                            <option value="${searchBox}+${searchText}+10" selected>10</option>
                            <option value="${searchBox}+${searchText}+15">15</option>
                            <option value="${searchBox}+${searchText}+20">20</option>
                        </c:when>
                        <c:when test="${paginator.pageSize == 15}">
                            <option value="${searchBox}+${searchText}+10">10</option>
                            <option value="${searchBox}+${searchText}+15" selected>15</option>
                            <option value="${searchBox}+${searchText}+20">20</option>
                        </c:when>
                        <c:when test="${paginator.pageSize == 20}">
                            <option value="${searchBox}+${searchText}+10">10</option>
                            <option value="${searchBox}+${searchText}+15">15</option>
                            <option value="${searchBox}+${searchText}+20" selected>20</option>
                        </c:when>
                    </c:choose>
                </select>

        </c:when>
    </c:choose>
    </div>
    </br>
    <div>
    검색어로 찾기 :
        <select name="searchBox" id="searchBox">
            <c:choose>
                <c:when test="${searchBox == null || searchBox == 'GUNAME'}">
                    <option value="GUNAME" selected>지역구명</option>
                    <option value="DONG">동이름</option>
                    <option value="APT">아파트명</option>
                </c:when>
                <c:when test="${searchBox == 'DONG'}">
                    <option value="GUNAME">지역구명</option>
                    <option value="DONG" selected>동이름</option>
                    <option value="APT">아파트명</option>
                </c:when>
                <c:when test="${searchBox == 'APT'}">
                    <option value="GUNAME">지역구명</option>
                    <option value="DONG">동이름</option>
                    <option value="APT" selected>아파트명</option>
                </c:when>
            </c:choose>
        </select>
        <input type="text" id="keyword" name="guName" onkeyup="enterKey()" size="40"/>
        <button type="button" onclick="checkSearch()">검색</button>
    </div>
    </center>
<div>
    <script language="javascript">
        function guname(select){
            var guid = select.value;
            if(guid != "지역구를 선택하세요"){
                location.href="price2.do?guid=" + guid + "&cp=1&ps=15";
            }
        }
        function gunamePs(select){
            var guidCpPs = select.value;
            guidCpPs = guidCpPs.split("+");
            guid = guidCpPs[0];
            cp = guidCpPs[1];
            ps = guidCpPs[2];
            location.href="price2.do?guid=" + guid + "&cp=1&ps=" + ps;
        }
        function dong(select){
            var guidDong = select.value;
            if(guidDong != "동이름을 선택하세요"){
                guidDong = guidDong.split("+");
                guid = guidDong[0];
                dong = guidDong[1];
                location.href="price3.do?guid=" + guid + "&dong=" + dong + "&cp=1&ps=15";
            }
        }
        function dongPs(select){
            var guidDongCpPs = select.value;
            guidDongCpPs = guidDongCpPs.split("+");
            guid = guidDongCpPs[0];
            dong = guidDongCpPs[1];
            cp = guidDongCpPs[2];
            ps = guidDongCpPs[3];
            location.href="price3.do?guid=" + guid + "&dong=" + dong + "&cp=1&ps=" + ps;
        }
        function apt(select){
            var guidDongApt = select.value;
            if(guidDongApt != "아파트를 선택하세요"){
                guidDongApt = guidDongApt.split("+")
                guid = guidDongApt[0]
                dong = guidDongApt[1]
                apt = guidDongApt[2]
                location.href="price4.do?guid=" + guid + "&dong=" + dong + "&apt=" + apt + "&cp=1&ps=15";
            }
        }
        function aptPs(select){
            var guidDongAptPs = select.value;
            guidDongAptPs = guidDongAptPs.split("+");
            guid = guidDongAptPs[0];
            dong = guidDongAptPs[1];
            apt = guidDongAptPs[2];
            ps = guidDongAptPs[3];
            location.href="price4.do?guid=" + guid + "&dong=" + dong + "&apt=" + apt + "&cp=1&ps=" + ps;
        }
        function earea(select){
            var guidDongAptEarea = select.value;
            if(guidDongAptEarea != "전용면적을 선택하세요"){
                guidDongAptEarea = guidDongAptEarea.split("+")
                guid = guidDongAptEarea[0]
                dong = guidDongAptEarea[1]
                apt = guidDongAptEarea[2]
                earea = guidDongAptEarea[3]
                location.href="price5.do?guid=" + guid + "&dong=" + dong + "&apt=" + apt + "&earea=" + earea + "&cp=1&ps=15";
            }
        }
        function eareaPs(select){
            var guidDongAptEareaPs = select.value;
            guidDongAptEareaPs = guidDongAptEareaPs.split("+");
            guid = guidDongAptEareaPs[0];
            dong = guidDongAptEareaPs[1];
            apt = guidDongAptEareaPs[2];
            earea = guidDongAptEareaPs[3];
            ps = guidDongAptEareaPs[4];
            location.href="price5.do?guid=" + guid + "&dong=" + dong + "&apt=" + apt + "&earea=" + earea + "&cp=1&ps=" + ps;
        }
        function enterKey(){
            if (window.event.keyCode == 13) {
                checkSearch();
            }
        }
        function checkSearch(){
            var searchBoxVal = $("#searchBox").val();
            var searchTextVal = $("#keyword").val();
            if(searchTextVal.length == 0){
                alert("검색어를 입력해 주세요");
            }else{
                location.href="price6.do?searchBox=" + searchBoxVal + "&searchText=" + searchTextVal + "&cp=1&ps=15";
            }
        }
        function searchPs(select){
            var searchPs = select.value;
            searchPs = searchPs.split("+");
            searchBox = searchPs[0];
            searchText = searchPs[1];
            ps = searchPs[2];
            location.href="price6.do?searchBox=" + searchBox + "&searchText=" + searchText + "&cp=1&ps=" + ps;
        }

        $(function(){
            $.ui.autocomplete.prototype._renderItem = function (ul, item) {
                item.label = item.label.replace(new RegExp("(?![^&;]+;)(?!<[^<>]*)(" + $.ui.autocomplete.escapeRegex(this.term) + ")(?![^<>]*>)(?![^&;]+;)", "gi"), "<strong>$1</strong>");
                return $("<li></li>")
                        .data("item.autocomplete", item)
                        .append("<a>" + item.label + "</a>")
                        .appendTo(ul);
            };
            $("#keyword").autocomplete({
                source : function( request, response ) {
                    $.ajax({
                        type: 'post',
                        url: "price.do",
                        dataType: "json",
                        data: { keyword : $("#keyword").val(), searchBox : $("#searchBox").val() },
                        success: function(data) {
                            response(
                                $.map(data, function(item) {
                                    return {
                                        label: item,
                                        value: item
                                    }
                                })
                            );
                        }
                    });
                },
                minLength: 1,
            });
        })
    </script>
</body>
<script src="http://code.jquery.com/jquery-1.9.1.js" type="text/javascript"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js" type="text/javascript"></script>
<%@ include file="/WEB-INF/views/footer.jsp" %>
</html>