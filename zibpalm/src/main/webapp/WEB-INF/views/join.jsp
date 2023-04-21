<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

${msg}
<head>
    <link rel="stylesheet" href="css/join.css">
    <link rel="stylesheet" href="css/nav.css">
    <link rel="stylesheet" href="css/modal.css">
    <script src="/js/trim.js"></script>
    <script language="javascript">
        const regExp = /[!?@#$%^&*():;+-=~{}<>\_\[\]\|\\\"\'\,\.\/\`\₩]/g; //전체에서 특수문자 찾기
        const blankExp = /\s/g; //전체에서 공백찾기
        // 이메일 체크(트랜젝션 스타트)

        function check_email(){
            var emailFoc = document.getElementById('email');
            var emailVal = emailFoc.value;
            emailVal = trim(emailVal); //공백제거

            if(emailVal.length == 0){ //emailval의 길이가 0이라면
                alert("Email을 입력해 주세요");
                emailFoc.focus(); //focus() : 해당 요소에 포커스를 부여하여 텍스트창의 경우 커서를 위치시켜 바로 입력할 수 있게 함
                return false;
            }else if(!checkEmail(emailVal)){ //emailval값이 checkEmail이 아니라면
                alert('Email 형식을 맞춰주세요 ex)"--@--.--"');
                emailFoc.focus();
                return false;
            }else if(blankExp.test(emailVal)){
                alert("Email은 공백을 포함할 수 없습니다");
                emailFoc.focus();
                return false;

            }else if(check_pwd()){
                jf.submit();
            }else{
                return false;
            }
        }

        // 비밀번호 체크(retrurn boolean)
        function check_pwd(){
            var pwdFoc = document.getElementById('pwd');
            var pwdVal = pwdFoc.value;
            var repwd = document.getElementById('repwd');
            var repwdVal = repwd.value;

            if(pwdVal.length == 0){
                alert("Password를 입력해 주세요");
                pwdFoc.focus();
                return false;
            }else if(!checkPwd(pwdVal)){
                alert("Password는 영문,숫자,특수문자를 혼합하여 6~12자로 입력해 주세요");
                pwdVal = "";
                pwdFoc.focus();
                return false;
            }else if(blankExp.test(pwdVal)){
                alert("Password는 공백이 포함될 수 없습니다");
                pwdVal = "";
                pwdFoc.focus();
                return false;
            }else if(pwdVal != repwdVal){
                alert("비밀번호를 동일하게 다시 입력해 주세요");
                pwdVal = "";
                repwdVal = "";
                return false;
            }else if(check_name()){
                return true;
            }else{
                return false;
            }
        }

        // 닉네임 체크(retrurn boolean)
        function check_name(){
            var nicknameFoc = document.getElementById('nickname');
            var nicknameVal = nicknameFoc.value;
            if(nicknameVal.length==0){
                alert("닉네임을 입력해 주세요");
                nicknameFoc.focus();
                return false;
            }else if(nicknameVal.length<2){
                alert("닉네임이 너무 짧습니다.");
                nicknameVal = "";
                nicknameFoc.focus();
                return false;
            }else if(check_byte(nicknameVal)>30){
                alert("닉네임이 너무 깁니다");
                nicknameVal = "";
                nicknameFoc.focus();
                return false;
            }else if(check_phone()){
                return true;
            }else{
                return false;
            }
        }

        // 휴대전화 체크(retrurn boolean)
        function check_phone(){
            var phoneFoc = document.getElementById('phone');
            var phoneVal = phoneFoc.value;
            if(phoneVal.length == 0){
                alert("휴대전화를 입력해 주세요");
                phoneFoc.focus();
                return false;
            }else if(phoneVal.length != 11){
                alert("휴대전화는 11자리만 입력해 주세요");
                phoneVal = "";
                phoneFoc.focus();
                return false;
            }else if(isNaN(phoneVal)){
                alert('휴대전화는 숫자로만 입력해 주세요("-"미포함)');
                phoneVal = "";
                phoneFoc.focus();
                return false;
            }else{
                return true;
            }
        }

        // 이메일 형식 체크 기능
        function checkEmail(str){
            var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
            if(!reg_email.test(str)) {
                return false;
            }else{
                return true;
            }
        }

        // 비밀번호 형식 체크 기능
        function checkPwd(str){
            var regExp = /^.*(?=^.{6,12}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
            if(!regExp.test(str)) {
                return false;
            }else{
                return true;
            }
        }

        // 바이트 체크 기능(모델 Max-length 제한치 적용)
        function check_byte(str){
            stringByteLength = (function(s,b,i,c){
                for(b=i=0;c=s.charCodeAt(i++);b+=c>>11?3:c>>7?2:1);
                return b
            })(str)
            return stringByteLength
        }
    </script>


</head>

<body>

    <%@ include file="/WEB-INF/views/nav.jsp"%>
    <div class="body_container">
        <form name="jf" action="join.do" method="post">
            <div class="center-member-join">회원가입</div>
                <div class="container">
                    <div class="email-container">
                        <div class="email-wrapper">
                            <div class="email-label-wrapper">
                                <h4>이메일</h4>
                            </div>
                            <div class="email-input-wrapper">
                                <input class="email" type="text", name="email" id="email" required="required" placeholder="이메일을 입력해주세요">
                            </div>
                        <div class="pwd-wrapper">
                            <div class="pwd-label-wrapper">
                                <h4>패스워드</h4>
                            </div>
                            <div class="pwd-input-wrapper">
                                <input class="pwd" type="password", name="pwd" id="pwd" maxlength="12" required="required" placeholder="비번을 입력해주세요">
                            </div>
                        <div class="pwd-wrapper">
                            <div class="pwd-label-wrapper">
                                <h4>패스워드 확인</h4>
                            </div>
                            <div class="pwd-input-wrapper">
                                <input class="pwd" type="password", name="repwd" id="repwd" maxlength="12" required="required" placeholder="비번을 다시 입력해주세요">
                            </div>
                        <div class="nickname-wrapper">
                            <div class="nickname-label-wrapper">
                                <h4>닉네임</h4>
                            </div>
                            <div class="nickname-input-wrapper">
                                <input class="nickname" type="text", name="nickname" id="nickname" maxlength="25" required="required" placeholder="닉네임을 입력해주세요">
                            </div>
                        <div class="phone-wrapper">
                            <div class="phone-label-wrapper">
                                <h4>연락처</h4>
                            </div>
                            <div class="phone-input-wrapper">
                                <input class="phone" type="text", name="phone" id="phone" maxlength="11" placeholder="연락처">
                            </div>
                        <div class="admin-wrapper">
                            <div class="admin-label-wrapper">
                                <h4>관리자 코드</h4>
                            </div>
                            <div class="admin-input-wrapper">
                                <input class="admin" type="text", name="isadmin" id="isadmin" maxlength="5" placeholder="관리자일 경우 입력해주세요">
                            </div>


                        <input class="join-button" type="button" value="회원가입" onclick="check_email()">

                        <br/>
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>