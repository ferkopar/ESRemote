


$(document).ready(function () {
    $("#DmTreatmTable input").each(function () {
        $(this).width( $(this).closest('td').width());
    });

    $("#DmTreatmTable select").each(function () {
        $(this).width($(this).closest('td').width());
    });

});




function saveChanges() {
    $("#DmTreatmTable tr.editable").each(function() {
        $this = $(this);
        jsonTxt = "{\n";
        jsonTxt += formatJsonKeyValuePair("DM_XL_ID",$this.attr('id'));
        jsonTxt += formatJsonKeyValuePair("TREATM_ID",$v("P3202_TREATM_ID"));
        jsonTxt += formatJsonKeyValuePair("TREATM_PARAM_TYPE_ID",  $this.children(".TREATM_PARAM_TYPE_ID").children().val());
        jsonTxt += formatJsonKeyValuePair("PARAM_VISIBLE", $this.children(".PARAM_VISIBLE").children().checked() ? "1":"0");
        jsonTxt += formatJsonKeyValuePairStr("ORDER_NO",$this.children(".ORDER_NO").children().val());
        jsonTxt += formatJsonKeyValuePair("MANDATORY", $this.children(".MANDATORY").children().checked() ? "1":"0");
        jsonTxt += formatJsonKeyValuePair("MULTIPLY", $this.children(".MULTIPLY").children().checked() ? "1":"0");
        jsonTxt += formatJsonKeyValuePair("VALUE_ALLOWED", $this.children(".VALUE_ALLOWED").children().checked() ? "1":"0");
        jsonTxt += formatJsonKeyValuePairStr("VALUE_TYPE",$this.children(".VALUE_TYPE").children().val());
        jsonTxt += formatJsonKeyValuePair("VALUE_GROUP_ID",$this.children(".VALUE_GROUP_ID").children().val());
        jsonTxt += formatJsonKeyValuePairStr("VALUE_GROUP_TABLE",$this.children(".VALUE_GROUP_TABLE").children().val());
        jsonTxt += formatJsonKeyValuePair("DIMENSION_ALLOWED", $this.children(".DIMENSION_ALLOWED").children().checked() ? "1":"0");
        jsonTxt += formatJsonKeyValuePair("DIMENSION_GROUP_ID",$this.children(".DIMENSION_GROUP_ID").children().val());
        jsonTxt += formatJsonKeyValuePairNoComma("SUBJ_GROUP_ID",$this.children(".SUBJ_GROUP_ID").children().val());
        jsonTxt += "}\n";
        $s("P3202_TESZT", jsonTxt);
        //alert(jsonTxt);
        get = new htmldb_Get(null,&APP_ID.,'APPLICATION_PROCESS=SaveChanges',3202);
        get.addParam("x01",jsonTxt); 
        gReturn = get.get();
        get = null;

        //           alert(gReturn);


    });
   
}

function InsertLine() {
    get = new htmldb_Get(null,&APP_ID.,'APPLICATION_PROCESS=GetEmptyRow',3202);
    gReturn = get.get();
    $('#DmTreatmTable').append(gReturn);
    get = null; 
}





