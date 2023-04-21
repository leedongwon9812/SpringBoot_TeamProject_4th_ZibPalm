<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="css/subsidiary.css">
    <title>Tropical Night Subsidiary</title>
</head>
<!-- Contents -->
<%@ include file="/WEB-INF/views/nav.jsp" %>
<body style="margin:0">
    <div class="subcom-main">
        <strong>Tropical Night</strong>
        <div class="companyGroup">
            <h3 class="categoryTitle">계열사 소개</h3>
            <ul class="companyList">
                <li class="subcom-list-item">
                    <a href="#" target="blank">
                        <p>Bang SOFT</p>
                        <div style="width:100%">
                            <img src="css/img/Bang SOFT.png">
                        </div>
                    </a>
                </li>
                <li class="subcom-list-item">
                    <a href="#" target="blank">
                        <p>IDLE</p>
                        <div style="width:100%">
                            <img src="css/img/IDLE.png">
                        </div>
                    </a>
                </li>
                <li class="subcom-list-item">
                    <a href="#" target="blank">
                        <p>Tuna Salad</p>
                        <div style="width:100%">
                            <img src="css/img/Tuna Salad.png">
                        </div>
                    </a>
                </li>
                <li class="subcom-list-item">
                    <a href="#" target="blank">
                        <p>Fantastic 4</p>
                        <div style="width:100%">
                            <img src="css/img/Fantastic 4.png">
                        </div>
                    </a>
                </li>
                <li class="subcom-list-item">
                    <a href="http://192.168.0.124:8080" target="blank">
                        <p>Bom</p>
                        <div style="width:100%">
                            <img src="css/img/BOM.png" style="width:100%;height:50%;padding-top:10%;">
                        </div>
                    </a>
                </li>
                <li class="subcom-list-item">
                    <a href="http://192.168.0.147:8080" target="blank">
                        <p>Coder</p>
                        <div style="width:100%">
                            <img src="css/img/CODER.png" style="width:100%;height:50%;padding-top:10%;">
                        </div>
                    </a>
                </li>
                <li class="subcom-list-item">
                    <a href="http://192.168.0.67:8080/main" target="blank">
                        <p>SIN</p>
                        <div style="width:100%">
                            <img src="css/img/SIN.png" style="width:100%;height:110%;">
                        </div>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</body>
<%@ include file="/WEB-INF/views/footer.jsp" %>
</html>
