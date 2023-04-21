<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<head>
    <link rel="stylesheet" href="css/join.css">
    <script src="/js/trim.js"></script>
    <script language="javascript">
        const regExp = /[!?@#$%^&*():;+-=~{}<>\_\[\]\|\\\"\'\,\.\/\`\₩]/g; //전체에서 특수문자 찾기
        const blankExp = /\s/g; //전체에서 공백찾기

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
                 jf.submit();
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
    <script>
        function updateMember(){
            var pwdVal = document.getElementById('pwd').value;
            var pwdCheckVal = document.getElementById('pwdCheck').value;
            pwdVal = trim(pwdVal);
            if(pwdVal != pwdCheckVal){
                alert("비밀번호가 일치하지 않습니다");
                return false;
            }else if(check_name()){
                return true;
            }
        }
    </script>

    <style>
        a { text-decoration:none }
    </style>
</head>

<body>
<%@ include file="/WEB-INF/views/nav.jsp" %>
    <div class="body_container">
        <form name="jf" action="updatemember.do" method="post">
            <div class="center-member-join">회원정보 수정하기</div>
            <div class="container">
                <div class="email-container">
                    <div class="email-wrapper">
                        <div class="email-label-wrapper">
                            <h4>이메일</h4>
                        </div>
                    </div>
                    <div class="email-input-wrapper">
                        <input class="email" type="text", name="email" id="email" readonly value="${login.email}">
                    </div>
                    <div class="pwd-wrapper">
                        <div class="pwd-label-wrapper">
                            <h4>비밀번호</h4>
                        </div>
                    </div>
                    <div class="pwd-input-wrapper">
                        <input class="pwd" type="password", name="pwd" id="pwd" maxlength="12" required="required" placeholder="비번을 입력해주세요">
                    </div>
                    <input type="hidden" name="pwdCheck" id="pwdCheck" value="${login.pwd}">
                    <div class="nickname-wrapper">
                        <div class="nickname-label-wrapper">
                            <h4>닉네임</h4>
                        </div>
                    </div>
                    <div class="nickname-input-wrapper">
                        <input class="nickname" type="text", name="nickname" id="nickname" maxlength="25" required="required" value="${login.nickname}">
                    </div>
                    <div class="phone-wrapper">
                        <div class="phone-label-wrapper">
                          <h4>연락처</h4>
                        </div>
                        <div class="phone-input-wrapper">
                          <input class="phone" type="text", name="phone" id="phone" maxlength="11" value="${login.phone}">
                        </div>
                    </div>
                        <input class="join-button" type="button" value="수정하기" onclick="updateMember()">
                        </br>
                        <a href="withdraw" id="withdraw" class="withdraw-member">회원탈퇴</a>
                    <br/>
                </div>
            </div>
        </form>
    </div>
</body>
<%@ include file="/WEB-INF/views/footer.jsp" %>