<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="css/etc.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <title>Tropical Night Introduce</title>
</head>
<!-- Contents -->
<%@ include file="/WEB-INF/views/nav.jsp" %>
<body style="margin:0">
    <div class="introduce-wrap">
        <div class="introduce-image">
            <div>    
                <strong class="introduce-text1">ZIBPALM<br></strong>
                <br>
                <strong class="introduce-text2">
                    중개 수수료의 부담감을 느끼는 사람들은 위해<br>
                    판매자와 구매자간 직접거래를 도와주는 중개커뮤니티입니다.<br>
                    실제 부동산 데이터를 제공하여 효율적인 거래를 만들어 내고자 합니다<br>
                    더욱 행복하고 건강한 삶을 누리는 데 도움이 될 기술을 발전시켜 나갈 것입니다.
                    <br><br><br><br><br>
                    지혜롭게 판매하고 효율적인 거래를 만드는 회사, ZIBPALM<br>
                </strong>
            </div>
        </div>
        <div class="introduce-history">
            <br><br><br>
            <h1>TN COMPANY 연혁</h1><br>
            <div>
                <h2>2022.12 파일 애플 런칭</h2>
                <ol class="introduce-history">
                    <li><img src="css/img/fileapple.png"></li><hr>
                </ol>
                <h2>2023.01 파파야 마켓 런칭</h2>
                <ol class="introduce-history">    
                    <li><img src="css/img/papaya.png"></li><hr>
                </ol>
                <h2>2023.02 리치 루트 런칭</h2>
                <ol class="introduce-history">    
                    <li><img src="css/img/litchi_root.png"></li><hr>
                </ol>
                <h2>2023.03~ 집팜 런칭</h2>
                <ol class="introduce-history">    
                    <li><img src="css/img/Logo.png" style="height:160px;"></li><hr>
                </ol>
            </div>
        </div>
    </div>
</body>
<%@ include file="/WEB-INF/views/footer.jsp" %>
</html>