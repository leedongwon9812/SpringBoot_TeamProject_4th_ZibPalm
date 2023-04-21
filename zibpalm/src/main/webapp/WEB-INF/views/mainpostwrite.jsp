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
    <form name="input" method="post" action="postwrite.do">
        <div class="postwrite-header">
            <h2 class="postwrite-title">글쓰기</h2>
            <input type="button" class="postwrite-apply" value="등록" onclick="checkWrite()">
        </div>

        <div class="postwrite-main">
            <div class="postwrite-subject">
                <textarea placeholder="제목을 입력해 주세요." id="subject" name="mpsub" class="textarea_subject" maxlength="40" style="height: 40px;"></textarea>
            </div>
            <div class="postwrite-content">
                <textarea class="summernote" id="content" name="mpcon"></textarea>
            </div>
        </div>
        </form>
    </div>
</body>
<script src="https://code.jquery.com/jquery-3.3.1.min.js" ></script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script src="js/summernote-lite.js"></script>
<script src="js/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="css/summernote-lite.css">

<script src="js/trim.js"></script>

<script src="js/postwrite_content.js"></script>

<script>
$('.summernote').summernote({
	  height: 450,
	  lang: "ko-KR"
	});
</script>

<%@ include file="/WEB-INF/views/footer.jsp" %>
</html>