var htmldb_delete_message="\"DELETE_CONFIRM_MSG\"";
var newRowIserted = false;

jQuery.fn.tagName = function () {
    return this.prop("tagName");
}; 

function toggleGroup(p) {
    var $param = $(p);
    var group_id = $param.data("id");
    $("#ParameterTable tr[data-group='" + group_id + "']").each(function() {
        $(this).toggle();
    });
    $(".subtable").each(function() {
        $(this).width($(this).closest("td").width());
    });
    setInputElementsWidth();
}

function alertIfDeveloper( p )
{
    //    alert($v("APP_USER")); 
    if( $v("APP_USER") === "FPARDI"){
        alert ( p );
    }
}

function SendJson (jsonTxt) {
    alert("Json sent");
    var get = new htmldb_Get(null,&APP_ID.,"APPLICATION_PROCESS=SaveChanges",3001);
    get.addParam("x01",jsonTxt); 
    var gReturn = get.get();
    //if(gReturn.match("^sqlerrm:")){
    alert(gReturn);
    //}
}

function getComboValue(p) {
    var retval = 0;
    var $input = $(p);
    alert($input.val() );
    var $datalist = $("#" + $input.attr("list")).children();
    
    $datalist.each(function() {
        if ($input.val() == $(this).val()) {
            retval =  $(this).data("combodata");
        }      
    });
    return retval;
}

function SaveChanges(){ 
    var cnt = 0;
    var jsonTxt = "{\n";
    jsonTxt += formatJsonKeyValuePair("SUBJ_ID",$("#SubjId").val());  
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
            var attr = $(this).attr('list');

            // For some browsers, `attr` is undefined; for others,
            // `attr` is false.  Check for both.
            if (typeof attr !== typeof undefined && attr !== false) {
                var comboValue = getComboValue($(this));
                alert(comboValue);
                if (comboValue == 0) {
                    jsonTxt += formatJsonKeyValuePairNoCommaStr("PARAM_VALUE", $this.val());
                } else {
                    jsonTxt += formatJsonKeyValuePairNoCommaStr("PARAM_VALUE", comboValue);
                }
            } else {
                jsonTxt += formatJsonKeyValuePairNoCommaStr("PARAM_VALUE", $this.val());
            }
            jsonTxt += "},";

            if (jsonTxt.length > 3000){
                jsonTxt = dropLastComma(jsonTxt);    
                jsonTxt += "]";
                jsonTxt += "}";
                SendJson(jsonTxt);
                jsonTxt = "{\n";
                jsonTxt += formatJsonKeyValuePair("SUBJ_ID",$("#SubjId").val());  
                jsonTxt += "PARAMS:[";
            }
        };
    });
    jsonTxt = dropLastComma(jsonTxt);    
    jsonTxt += "]";
    jsonTxt += "}";
    $s("P3001_TESZT", jsonTxt);
    SendJson(jsonTxt);
    $s("P3001_TESZT", gReturn);
    $(".dirty").removeClass( "dirty" );
}

function GetTable(){
    // alertIfDeveloper('GetTable()');
    get = new htmldb_Get(null,&APP_ID.,"APPLICATION_PROCESS=ParamTable",3001);
    get.addParam("x01",$v("P3001_SUBJ_ID") );
    // alertIfDeveloper($v("P3001_SUBJ_TYPE_ID"));
    get.addParam("x02",$v("P3001_SUBJ_TYPE_ID") );
    gReturn = get.get();
    // alertIfDeveloper(gReturn);
    $("#ParameterRegion .uRegionContent ").html(gReturn);
    get = null; 
}

function AddSubject(){ 
    if(! valid()){
        alert("Kötelető mező nincs kitöltve"); 
        return;
    }
    //alert('AddSubject'); 
    var get = new htmldb_Get(null,&APP_ID.,"APPLICATION_PROCESS=Execute",3001);
    var sqlScript = "insert INTO subject (SUBJ_ID,ROLL_TYPE,DESCRIPTION,SUBJ_CATEGORY_ID) "
    sqlScript +=  "values (null," + $v("P3001_ROLL_TYPE") +",'"+$v("P3001_DESCRIPTION")+"',"+$v("P3001_SUBJ_MAIN_TYPE") + ") RETURNING SUBJ_ID INTO :1";
    //alert(sqlScript );
    get.addParam("x01",sqlScript );
    gReturnSubjJd = get.get();
    //alert( gReturn );
    get = null; 
    $("#ParameterTable>tbody tr").each(function() {
        $this = $(this);
        editField = $this.children( ".value" ).children();
        dimField  = $this.children( ".dimension" ).children();
           
        if (editField.hasClass( "dirty" )) {
            var inputValue = $this.children( ".value" ).children().val();
            var inputParamType = $this.children( ".rowHead" ).children(".paramType").val();            
            //            //alert($this.children( ".value" ).children().prop("tagName")); 
            get = new htmldb_Get(null,&APP_ID.,"APPLICATION_PROCESS=Execute",3001);
            if($this.children( ".value" ).children().prop("tagName")==="INPUT"){
                sqlScript = "insert INTO subj_param (SUBJ_ID,SUBJ_TYPE_ID,PARAM_TYPE_ID,VALUE) ";
                sqlScript +=  "values ("+gReturnSubjJd  +"," +  $v("P3001_SUBJ_TYPE_ID")   +","+inputParamType + ",'"+inputValue +"') RETURNING SUBJ_PARAM_ID INTO :1";
            }
            else{
                sqlScript = "insert INTO subj_param (SUBJ_ID,SUBJ_TYPE_ID,PARAM_TYPE_ID,VALUE_TYPE_ID) ";
                sqlScript +=  "values ("+gReturnSubjJd  +"," +  $v("P3001_SUBJ_TYPE_ID")   +","+inputParamType + ",'"+inputValue +"') RETURNING SUBJ_PARAM_ID INTO :1";
            }
            //alert( sqlScript );
            get.addParam("x01",sqlScript );
            gReturn = get.get();
            get = null; 
            
            //if (dimField === undefined ) {
            //}
            //else {
            //    if(dimField.prop("tagName")==="INPUT"){
            //        sqlScript = "update subj_param set UNIT ='"+dimField.val()+"' where subj_param_id ="+gReturn +"RETURNING SUBJ_PARAM_ID INTO :1";
            //    }
            //    else{
            //        sqlScript = "update subj_param set UNIT_TYPE_ID ="+dimField.val()+" where subj_param_id ="+gReturn +"RETURNING SUBJ_PARAM_ID INTO :1";
            //    }
            //    alert(sqlScript);
            //    get = new htmldb_Get(null,&APP_ID.,'APPLICATION_PROCESS=Execute',3001);
            //    get.addParam("x01",sqlScript );
            //    gReturn = get.get();
            //    alert(gReturn);
            //    get = null; 
            //}
            
            goBack();
        }
    });
} 

function goBack(){
    window.location.replace("http://157.181.173.15:8080/apex/f?p="+$v("pFlowId") +":3000:"+$v("pInstance"));
}

function valid(){
    retVal = true;
    $("#ParameterTable>tbody tr").each(function() {
        $this = $(this);
        var inputValue = $this.children( ".value" ).children().val();
        var mandantory = $this.children( ".rowHead" ).children(".mandantory").val();
        if( mandantory != 0 && isEmptyVar(inputValue )){
            retVal = false;             
        }
    });
    return retVal;
}

function cityChanged (p) {


    dirty(p);
    var $streetTd = $(p).closest("tr").next().find("td:first");
    var get = new htmldb_Get(null,&APP_ID.,"APPLICATION_PROCESS=AjaxGetStreetNames",3001);
    get.addParam("x01",$(p).val()); 
    get.addParam("x02",$(p).data("dmsubject")); 
    get.GetAsync(function(pResponse){
        if(pResponse.readyState === 4 && pResponse.status === 200){
            $streetTd.html(pResponse.responseText);
            setInputElementsWidth();

        };
    });
}

function streetChanged(p) {
    dirty(p);
    var $input = $(p);
    var $datalist = $("#" + $input.attr("list")).children();
    var $typeSelect = $(p).closest("tr").next().find("td:first").find("select");
    //   $s("P3001_TESZT",$typeSelect.prop("tagName"));   

    $datalist.each(function() {      
        if ($input.val() == $(this).val()) {
            //$s("P3001_TESZT",$v("P3001_TESZT")+$input.val()+" "+$(this).val()+ " " +$(this).data("combodata")+"\n");   
            var get = new htmldb_Get(null,&APP_ID.,"APPLICATION_PROCESS=AjaxGetStreetTypeId",3001);
            get.addParam("x01",$(this).data("combodata")); 
            get.GetAsync(function(pResponse){
                if(pResponse.readyState === 4 && pResponse.status === 200 && pResponse.responseText !="no_data_found"){
                    $s("P3001_TESZT",$v("P3001_TESZT")+"\n*"+pResponse.responseText+"*");
                    $typeSelect.val(pResponse.responseText.replace(/(\r\n|\n|\r)/gm,""));
                };
            });
        }
    });
}

function zipChanged(p) {
    dirty(p);
}

function addressHeadClick(p) {
    
    $(p).closest("tr").siblings().each(function() {
        // alert(  $(this).data("row-name") );
        $(this).toggle();
    });
    setInputElementsWidth();
}