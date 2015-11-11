var htmldb_delete_message = '"DELETE_CONFIRM_MSG"';
$(document).ready(
    function () {
        $("#ParameterTable img").remove();
        $("#popUpSuperTypDiv").remove();
    });

function toggleGroup(p) {
    var $param = $(p);
    var group_id = $param.data("id");
    $("#ParameterTable tr[data-group='" + group_id + "']").each(function () {
        $(this).toggle();
    });
    $(".subtable").each(function () {
        $(this).width($(this).closest('td').width());
    });
    setInputElementsWidth();
}

function goBack() {
    window.location.replace("http://157.181.173.15:8080/apex/f?p=" + $v('pFlowId') + ":3002:" + $v('pInstance'));
}

function SaveChanges(){ 
    var cnt = 0;
    var get = new htmldb_Get(null,&APP_ID.,'APPLICATION_PROCESS=NameAccept',3004);
    get.addParam("x01",$v("P3004_QUERY_NAME")); 
    var gReturn = get.get();
    //alert(gReturn);
    // gReturn = "null";
    if(gReturn.indexOf("null") > -1){
        alert('A lekérdezés neve nem lehet üres');
        return;
    }
    if(gReturn.indexOf("exists") > -1)
    {

        alert('Már létezik '+$v("P3004_QUERY_NAME")+' nevű lekérdezés. ');
        return;
    }


    var jsonTxt = "{\n";
    jsonTxt += formatJsonKeyValuePairStr("QUERY_NAME", $v("P3004_QUERY_NAME"));
    jsonTxt += "PARAMS:[";
    $(".Resizable").each(function() {
        $this = $(this);
        if ($this.hasClass("dirty")) {
            cnt ++;
            jsonTxt += "{\n";
            if (! isEmptyVar($this.data("subjparamid"))) {
                jsonTxt += formatJsonKeyValuePair("PARAM_ID",$this.data("subjparamid"));

            }            
            jsonTxt += formatJsonKeyValuePair("DM_SUBJECT_ID",$this.data("dmsubject"));  
            if ($this.closest("tr").data("paramgroup") !== undefined) {
                jsonTxt += formatJsonKeyValuePair("GROUP_ID",$this.closest("tr").data("paramgroup"));      
            }            
            jsonTxt += formatJsonKeyValuePairNoCommaStr("PARAM_VALUE",$this.val());  
            jsonTxt += "},"
        };
    });
    jsonTxt = dropLastComma(jsonTxt);    
    jsonTxt += "]";
    jsonTxt += "}";
    $s("P3004_TESZT", jsonTxt);
    var get = new htmldb_Get(null,&APP_ID.,'APPLICATION_PROCESS=SaveChanges',3004);
    get.addParam("x01",jsonTxt); 
    var gReturn = get.get();
    $s("P3004_TESZT", gReturn);
    $(".dirty").removeClass( "dirty" );
    // alert(gReturn);
    if(gReturn.indexOf("inserted") > -1){
        goBack();
    }
    else{
        alert(' lekérdezést nem sikerült elmenteni.\n'+ gReturn);
    }
}
