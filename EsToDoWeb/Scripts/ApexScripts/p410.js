jQuery.fn.center = function () {
    this.css("position","absolute");
    this.css("top", ( jQuery(window).height() - this.height() ) / 2+jQuery(window).scrollTop() + "px");
    this.css("left", ( jQuery(window).width() - this.width() ) / 2+jQuery(window).scrollLeft() + "px");
    return this;
}

$(document).ready(function () {
    setInputElementsWidth(); 

    $("#spanAddChild").click(function(e) {
        $("#popUpDiv").show();    
        $("#popUpDiv").center();

    });

    $("#spanClosePopup").click(function(e) {
        $("#popUpDiv").hide();
    });
    
    $(".popTd").click(function(e) {
        var target = $( e.target );
        newRow = '<tr><th class="thDelete"><img src="wwv_flow_file_mgr.get_file?p_security_group_id=1000000&amp;p_fname=Minus Red Button.png"></th>';
        newRow += '<td>' +  target.html() + '</td></tr>'
        $("#ChildTable").append(newRow);
        $("#popUpDiv").hide();
    });

    $(".thDelete").click(function(e) {
        var target = $( e.target );
        target.closest('tr').hide();
    });
    
});



function setInputElementsWidth() {
    $("#TreatmTable input").each(function () {
       $(this).width( $(this).closest('td').width());
    });

    $("#TreatmTable select").each(function () {
        $(this).width($(this).closest('td').width());
    });
}

function selectListChanged(sender) {
     dirty(sender);
     columnName = $(sender).closest('td').attr('id');
     if (columnName == "TREATM_CATEGORY_ID") {
//       alert(columnName);
         gReturn = getSelectListIems($(sender).attr('data-group'), $(sender).val());
//--         alert(gReturn);
         $("#TREATM_TYPE_ID").html(gReturn);
         setInputElementsWidth();
     }
}

function getSelectListIems(group,selected){
//--   alert(group + ' '+ selected);
    var get = new htmldb_Get(null,&APP_ID.,'APPLICATION_PROCESS=GetSelectList',410);
    get.addParam("x01", group);
    get.addParam("x02", selected);
    return (get.get());   
}
