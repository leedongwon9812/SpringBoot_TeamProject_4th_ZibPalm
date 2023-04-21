<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<head>
    <link rel="stylesheet" href="css/join.css">
    <script src="/js/trim.js"></script>
    <script>
        function withdraw(){
            var pwdVal = document.getElementById('pwd').value;
            var pwdCheckVal = document.getElementById('pwdCheck').value;
            pwdVal = trim(pwdVal);
            if(pwdVal != pwdCheckVal){
                alert("비밀번호가 일치하지 않습니다");
                return false;
            }else{
                jf.submit();
            }
        }
    </script>
</head>

<body>
<%@ include file="/WEB-INF/views/nav.jsp" %>
    <div class="body_container">
        <form name="jf" action="withdraw.do" method="post">
            <div class="center-member-join">회원탈퇴</div>
                <div class="container">
                    <div class="pwd-container">
                        <div class="pwd-wrapper">
                            <div class="pwd-label-wrapper">
                                <h4>비밀번호</h4>
                            </div>
                            <div class="pwd-input-wrapper">
                                <input class="pwd" type="password", name="pwd" id="pwd" required="required" placeholder="패스워드를 입력해주세요">
                            </div>
                            <input type="hidden" name="pwdCheck" id="pwdCheck" value="${login.pwd}">
                            <input type="hidden" name="email" id="email" value="${login.email}">
                        </div>
                        <input class="join-button" type="button" value="탈퇴" onclick="withdraw()">
                        <input class="cancel-button" type="button" value="취소" onclick="history.back()">
                    </div>
                    <br/>
                </div>
            </div>
        </form>
    </div>
</body>
<%@ include file="/WEB-INF/views/footer.jsp" %>