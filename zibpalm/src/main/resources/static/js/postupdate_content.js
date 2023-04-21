$(document).ready(function(){
    checkAutocomplete();
    $('#infoKeyword').keypress(function(event){
        var keycode = (event.keyCode ? event.keyCode : event.which);
        if(keycode == '13'){
            checkWriteSearch();
        }
    });
    $('#infoList').change(function() {
        setWriteInfo();
        var selectedValue = $(this).val();
        if (selectedValue  > 2) {
            $('.setInfoTab').show();
        }else if (selectedValue == 1 || selectedValue == 2) {
            $('.setInfoTab').hide();
        }
    });
});

function checkAutocomplete(){
    $('#infoKeyword').autocomplete({
        source : function( request, response ) {
            $.ajax({
                type: "POST",
                url: "auto.write",
                dataType: "json",
                data: { text : $("#infoKeyword").val()},
                success: function(data) {
                    response(
                        $.map(data, function(item) {
                            return {
                                id: item.infoId,
                                gu: item.gu.guname,
                                dong: item.dong,
                                year: item.dyear,
                                month: item.dmonth,
                                apt: item.apt,
                                earea: item.earea,
                                price: item.price
                            }
                        })
                    );
                }
            });
        },
        select : function(event, ui) {
            var itemVal = ui.item.gu + ui.item.dong + " " + ui.item.apt + " " + ui.item.year + "년 " + ui.item.month +
                        "월 " + ui.item.earea + "m2" + ui.item.price + "만원";
            $("#infoList").val(ui.item.id);
            setWriteInfo();
            if (ui.item.id > 2) {
                $('.setInfoTab').show();
            }else if (ui.item.id == 1 || ui.item.id == 2) {
                $('.setInfoTab').hide();
            }
            return false;
        },
    }).autocomplete('instance')._renderItem = function(ul, item) {
        return $('<li>')
        .append('<div style="font-size:12px;font-weight:bold">' + item.gu + item.dong + '&nbsp;' + item.apt + '&nbsp;'
                + item.year + "년" + '&nbsp;' + item.month + "월 " + item.earea + "m2 " + item.price + "만원" + '</div>')
        .appendTo(ul);
    };
}

function checkWriteSearch(){
    $.ajax({
        url: "../write.search",
        type: "POST",
        data: {text: $("#infoKeyword").val()},
        success: function(data){
            var select = $('#infoList');
            select.empty();
            var option1 = $('<option>').val("1").text("기타 매물");
            var option2 = $('<option>').val("2").text("아파트(직접입력)");
            select.append(option1);
            select.append(option2);
            for(var newI of data){
                var newVal = newI.gu.guname + " " + newI.dong + " " + newI.apt + " " + newI.dyear + "년 " + newI.dmonth
                                + "월 " + newI.earea + "m2 " + newI.price + "만원";
                var option = $('<option>').val(newI.infoId).text(newVal);
                select.append(option);
            }
        },
        error: function(error){
            alert("error: " + error);
        }
    });
}

function setWriteInfo(){
    $.ajax({
        url: "../write.info",
        type: "POST",
        data: {select: $("#infoList").val()},
        success: function(info){
            var infoAddrVal = info.gu.guname + " " + info.dong + " " + info.apt;
            var infoPriceVal = info.price + " 만원";
            var infoEareaVal = info.earea + " m2";
            var infoDyearMonthVal = info.dyear + " 년 / " + info.dmonth + " 월";
            var infoAddr = $('.info-addr');
            var infoPrice = $('.info-price');
            var infoEarea = $('.info-earea');
            var infoDyearMonth = $('.info-year-month');
            infoAddr.empty();
            infoPrice.empty();
            infoEarea.empty();
            infoDyearMonth.empty();
            var infoAddrP = $('<p>').text(infoAddrVal);
            var infoPriceP = $('<p>').text(infoPriceVal);
            var infoEareaP = $('<p>').text(infoEareaVal);
            var infoDyearMonthP = $('<p>').text(infoDyearMonthVal);
            infoAddr.append(infoAddrP);
            infoPrice.append(infoPriceP);
            infoEarea.append(infoEareaP);
            infoDyearMonth.append(infoDyearMonthP)
        },
        error: function(error){
            alert("error: " + error);
        }
    });
}

function checkUpdateP(){
    if($("#subject").val() == "" || trim($("#subject").val()) == ""){
        alert("제목을 입력해 주세요. ");
        return false;
    }else if($("#content").val() == ""){
        alert("내용을 입력해 주세요. ");
    }else{
        document.input.submit();
    }
}

function checkUpdateMP(){
    if($("#mpsub").val() == "" || trim($("#mpsub").val()) == ""){
        alert("제목을 입력해 주세요. ");
        return false;
    }else if($("#mpcon").val() == ""){
        alert("내용을 입력해 주세요. ");
    }else{
        document.input.submit();
    }
}