function postDelete(postId, pemail, cat){
    var resultDel = confirm("정말 삭제하시겠습니까?");
    if(resultDel){
        location.href="postdel.do?postId=" + postId + "&pemail=" + pemail + "&cat=" + cat;
    }
    return false;
}

function mainpostDelete(mpId, mpemail, cat){
    var resultDel = confirm("정말 삭제하시겠습니까?");
    if(resultDel){
        location.href="postdel.do?mpId=" + mpId + "&mpemail=" + mpemail + "&cat=" + cat;
    }
    return false;
}

function postUpdate(postId, pemail, cat){
    var resultUp = confirm("해당 글을 수정하시겠습니까?");
    if(resultUp){
        location.href="postupdate?postId=" + postId + "&pemail=" + pemail;
    }
    return false;
}

function mainpostUpdate(mpId, mpemail, cat){
    var resultUp = confirm("해당 글을 수정하시겠습니까?");
    if(resultUp){
        location.href="postupdate?mpId=" + mpId + "&mpemail=" + mpemail;
    }
    return false;
}

function checkFcomment(){
    if($("#fccomment").val() == ""){
        alert("댓글 내용을 입력해 주세요. ");
        return false;
    }else{
        document.commentf.submit();
    }
}

function countTextF(textarea){
    textarea.style.height = "auto";
    textarea.style.height = textarea.scrollHeight + "px";
    if($("#fccomment").val().length == 0){
        $(".comment_inbox_number").hide();
    }else{
        $(".comment_inbox_number").show();
    }
    const comment = $("#fccomment").val();
    const textCount = $(".inbox_count");
    const count = comment.length;
    textCount.text(count);
    if(count>100){
        alert("글자 수는 100자를 넘길 수 없습니다.")
    }
}

function countTextS(textareaRe, reFcId){
    textareaRe.style.height = "auto";
    textareaRe.style.height = textareaRe.scrollHeight + "px";
    var getIdRecomment = "#sc"+reFcId;
    if($(getIdRecomment).val().length == 0){
        $(".comment_inbox_number-re").hide();
    }else{
        $(".comment_inbox_number-re").show();
    }
    const commentRe = $(getIdRecomment).val();
    const textCountRe = $(".inbox_count-re");
    const countRe = commentRe.length;
    textCountRe.text(countRe);
    if(textCountRe>100){
        alert("글자 수는 100자를 넘길 수 없습니다.")
    }
}

function showReplyForm(fcId){
    if($(".comment-text").val().length != 0){
        var commentRemain = confirm("작성중인 댓글이 있습니다. 취소하시겠습니까?");
        if(!commentRemain){
            return false;
        }
    }
    $(".comment-text").val("");
    $(".commentItem-re").hide();
    $(".comment_inbox_number-re").hide();
    var getId = "#fc"+fcId;
    var commentText = "#sc"+fcId;
    $(getId).show();
    $(commentText).focus();
}

function delReplyForm(fcId, fcemail){
    var resultDel = confirm("정말 삭제하시겠습니까?");
    if(resultDel){
        location.href="commentdel.do?fcId=" + fcId + "&fcemail=" + fcemail;
    }
    return false;
}

function checkScomment(fcId){
    var commentTextId = "#sc"+fcId;
    var commentForm = "#comments"+fcId;
    if($(commentTextId).val() == ""){
        alert("댓글 내용을 입력해 주세요. ");
        return false;
    }else{
        $(commentForm).submit();
    }
}

function delReReplyForm(scId, scemail){
    var resultDel = confirm("정말 삭제하시겠습니까?");
    if(resultDel){
        location.href="commentdel.do?scId=" + scId + "&scemail=" + scemail;
    }
    return false;
}

function cancleScomment(){
    if($(".comment-text").val().length != 0){
        var commentRemain = confirm("작성중인 댓글이 있습니다. 취소하시겠습니까?");
        if(!commentRemain){
            return false;
        }
    }
    $(".comment-text").val("");
    $(".commentItem-re").hide();
    $(".comment_inbox_number-re").hide();
}