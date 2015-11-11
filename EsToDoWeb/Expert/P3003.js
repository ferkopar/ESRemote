var htmldb_delete_message='"DELETE_CONFIRM_MSG"';
function callHelpPopup() {
    var url;
    url = 'f?p=&APP_ID.:3101:&APP_SESSION.';
    w = open(url, "winLov", "Scrollbars=yes,resizable=1,width=925,height=400");
}
$(document).ready(
    function () {
        $("#ParameterTable input").attr("disabled", true);
        $("#ParameterTable select").attr("disabled", true);
        $("#ParameterTable select").css("background-color", "rgb(235, 235, 228)");
        $(".EmptyRow").remove();
        $("#ParameterTable img").remove();
        toggleGroup($('[data-id=1000033]'));
        $(this).css("padding", "5px");
        $("#imgOk").remove();
        $str = $("#HeadTableCaptionText").text();
        $("#HeadTableCaptionText").text($str.replace(" szerkesztése", " lekérdezése"));
        $("#SubjFootTable").remove();
        //$("#HeadTableCaptionText").text("teszt");
        //var addSpanChildWidth = 0;
        //$("#spanAddChild").children().each(function () {
        //    addSpanChildWidth += $(this).width();
        //});
        ////addSpanChildWidth += 10;
        //$("#spanAddChild").width(addSpanChildWidth);
    });

function toggleGroup(p){
    var $param = $(p); 
    var group_id = $param.data("id");
    $("#ParameterTable tr[data-group='"+group_id+"']").each(function(){
        $( this ).toggle();
    });
    $(".subtable").each(function () {
        $(this).width($(this).closest('td').width());
    });
    setInputElementsWidth();
}

function goBack(){
    window.location.replace("http://157.181.173.15:8080/apex/f?p=" + $v('pFlowId') + ":3002:" + $v('pInstance') + '::::P3002_QUERY_ID:' + $v("P3003_QUERY_ID"));

}


