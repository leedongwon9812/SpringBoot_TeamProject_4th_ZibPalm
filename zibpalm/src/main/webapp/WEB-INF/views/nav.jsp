<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    String email = (String)session.getAttribute("email");
    String nickname = (String)session.getAttribute("nickname");
%>

<head>
    <meta charset="utf-8">
    <title>집팜</title>
    <link rel="stylesheet" type="text/css" href="css/nav.css" />
    <link rel="stylesheet" type="text/css" href="css/footer.css" />
    <link rel="stylesheet" type="text/css" href="css/login.css" />
    <link rel="stylesheet" type="text/css" href="css/main.css" />
    <link rel="stylesheet" type="text/css" href="css/etc.css" />
    <link rel="stylesheet" type="text/css" href="css/subsidiary.css" />

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js" ></script>
    <script type="text/javascript" src="js/HideShow.js" ></script>
    <script type="text/javascript" src="js/hover.js" ></script>

</head>
<body style="margin: 0;">
    <nav class="nav-main">
        <header class="nav-header">
            <div class="nav-header-1">
                <a href="index" title="메인 화면"><img src="css/imgs/Logo.png" class="nav-image"></a>
                <a href="index" class="nav-logo">ZIBPALM</a>
            </div>
            <div class="nav-header-1">
            <ul class="nav-menu">
                <li class="nav-menu-item">
                    <a href="price.do" class="menu-heading">시세정보</a>
                </li>
                <li class="nav-menu-item" id="nav-post">
                    <a href="postlist?cp=1&ps=10&cat=all&bt=list" class="menu-heading">매물보기</a>
                    <div class="nav-post-box">
                        <div class="hidden-div"><a class="hidden-a" href="postlist?cp=1&ps=10&cat=all&bt=list">전체</a></div>
                        <div class="hidden-div"><a class="hidden-a" href="postlist?cp=1&ps=10&cat=apt&bt=list">아파트</a></div>
                        <div class="hidden-div"><a class="hidden-a" href="postlist?cp=1&ps=10&cat=else&bt=list">기타매물</a></div>
                    </div>
                </li>
                <li class="nav-menu-item">
                    <a href="introduce" class="menu-heading">회사소개</a>
                </li>
                <li class="nav-menu-item">
                    <c:choose>
                        <c:when test="${not empty email}">
                            <button class="logout-button" onclick="location.href='logout.do'">LOGOUT</button>
                        </c:when>
                        <c:otherwise>
                            <button class="login-button">LOGIN</button>
                        </c:otherwise>
                    </c:choose>
                    <form name="f" method="post" action="login.do">
                    <div class="modal_login">
                        <div class="modal_body">
                            <h2 style="font-size: 30px; color:white; margin-bottom:20%">로그인</h2>
                            <input class="login_text" name="email" type="text" placeholder="이메일">
                            <input class="pwd_text" name="pwd" type="password" placeholder="비밀번호">
                            <input class="login_button" type="submit" value="로그인">
                            <input class="cancle_button" type="button" value="취소"><br/>
                        </div>
                    </div>
                    </form>
                </li>
                <li class="nav-menu-item">
                    <c:choose>
                        <c:when test="${not empty email}">
                            <button onclick="location.href='updatemember'">PROFILE</button >
                        </c:when>
                        <c:otherwise>
                            <button onclick="location.href='join'">SIGN UP</button>
                        </c:otherwise>
                    </c:choose>
                </li>
            </ul>
            <div class="response-login"><button class="response-login-button"><img src="css/imgs/login.png" style="width:100%;height:100%;object-fit:cover;"/></button></div>
            </div>
        </header>
    </nav>
</body>

<script> //로그인
    const modal_login = document.querySelector('.modal_login');
    const login_button = document.querySelector('.login-button');
    const login_button2 = document.querySelector('.response-login-button');
    const cancle_button = document.querySelector('.cancle_button');
    function togglemodal() {
        modal_login.classList.toggle("show-login");
    }
    function windowOnClick(event) {
        if (event.target === modal_login) {
            togglemodal();
        }
    }
    <c:if test="${empty email}">
        login_button.addEventListener("click", togglemodal);
        login_button2.addEventListener("click", togglemodal);
    </c:if>
    cancle_button.addEventListener("click", togglemodal);
    window.addEventListener("click", windowOnClick);
</script>