function mainShow(bt){
    if ($("#notice_hidden").is(':checked')) {
        $(".list-maintable-content").hide();
        if(bt == "album"){
            $("#normalTableTitle").hide();
        }
    } else {
        $(".list-maintable-content").show();
        if(bt == "album"){
            $("#normalTableTitle").show();
        }
    }
}


function setList(viewType){
    if (viewType === "album" && $(".sort_list").hasClass("is_selected")) {
        $(".sort_list").removeClass("is_selected");
        $(".sort_album").addClass("is_selected");
        $(".album-table").show();
        $(".album-leg-ps").show();
        $(".list-table").hide();
        $(".list-leg-ps").hide();

    } else {
        $(".sort_album").removeClass("is_selected");
        $(".sort_list").addClass("is_selected");
        $(".list-table").show();
        $(".list-leg-ps").show();
        $(".album-table").hide();
        $(".album-leg-ps").hide();
    }
}