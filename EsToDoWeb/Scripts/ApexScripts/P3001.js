var htmldb_delete_message='"DELETE_CONFIRM_MSG"';

 
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

function setInputElementsWidth() {
    $("#SubjHeadTable input").each(function () {
        $(this).width($(this).closest('td').width());
        $(this).css("padding", "5px");
    });

  /* TO DO*/




    
    $("#SubjHeadTable select").each(function () {
        if ($(this).siblings().size() > 0) {
            $(this).width($(this).closest('td').width() - 32);
        } else {
            $(this).width($(this).closest('td').width());
        }
        $(this).css("padding", "5px");

    });

    $("#ParameterTable input").each(function () {
        $(this).width($(this).closest('td').width());
    });

    $("#ParameterTable select").each(function () {
        $(this).width($(this).closest('td').width());
    });

}

function alertIfDeveloper( p )
{
    //    alert($v("APP_USER")); 
    if( $v("APP_USER") === "FPARDI"){
        alert ( p );
    }
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
            jsonTxt += formatJsonKeyValuePairNoCommaStr("PARAM_VALUE",$this.val());  
            jsonTxt += "},"

            if (jsonTxt.length > 3000){
                jsonTxt = dropLastComma(jsonTxt);    
                jsonTxt += "]";
                jsonTxt += "}";
                //alert(jsonTxt.length);
                ////var get = new htmldb_Get(null,&APP_ID.,"APPLICATION_PROCESS=SaveChanges",3001);
                ////get.addParam("x01",jsonTxt); 
                ////var gReturn = get.get();
                ////if(gReturn.match("^sqlerrm:")){
                ////    alert(gReturn);
                ////}
                jsonTxt = "{\n";
                jsonTxt += formatJsonKeyValuePair("SUBJ_ID",$("#SubjId").val());  
                jsonTxt += "PARAMS:[";
            }
        };
    });
    jsonTxt = dropLastComma(jsonTxt);    
    jsonTxt += "]";
    jsonTxt += "}";
    //$s("P3001_TESZT", jsonTxt);
    //alert(jsonTxt.length);
    ////var get = new htmldb_Get(null,&APP_ID.,"APPLICATION_PROCESS=SaveChanges",3001);
    ////get.addParam("x01",jsonTxt); 
    ////var gReturn = get.get();
    ////if(gReturn.match("^sqlerrm:")){
    ////    alert(gReturn);
    ////}
    $s("P3001_TESZT", gReturn);
    $(".dirty").removeClass( "dirty" );
}

var newRowIserted = false;

function SaveChangesInvalid(){ 
    // alert('saveChang');
    if(! valid()){
        alert('Kötelető mező nincs kitöltve'); 
        return;
    }
    /* var get = new htmldb_Get(null,&APP_ID.,'APPLICATION_PROCESS=Execute',3001);
	 get.addParam("x01","insert into WK_PF_AUDIT_TABLE values('pitty','putty')");
        // get.addParam("x01","Bassza meg egy taliga majom.");
         gReturn = get.get();
         //alert( gReturn );
	 get = null; */
    $("#ParameterTable>tbody tr").each(function() {
        $this = $(this);
        editField = $this.children( ".value" ).children();
        dimField  = $this.children( ".dimension" ).children();
        if( editField.hasClass( "dirty" )){
            //alert($this.children( ".value" ).children().val());
            var inputValue = editField.val();
            var inputTagName = editField.prop("tagName");
            var subjParamId = $this.children( ".rowHead" ).children(".paramId").val();
            var inputParamType = $this.children( ".rowHead" ).children(".paramType").val();      
            //alert(subjParamId);
            var sqlScript = "";
            if ( isEmpty(subjParamId) ){
                
                if($this.children( ".value" ).children().prop("tagName")==="INPUT"){
                    sqlScript = "insert INTO subj_param (SUBJ_ID,SUBJ_TYPE_ID,PARAM_TYPE_ID,VALUE) ";
                    sqlScript +=  "values ("+$v("P3001_SUBJ_ID")   +"," +  $v("P3001_SUBJ_TYPE_ID")   +","+inputParamType + ",'"+inputValue +"') RETURNING SUBJ_PARAM_ID INTO :1";
                }
                else{
                    sqlScript = "insert INTO subj_param (SUBJ_ID,SUBJ_TYPE_ID,PARAM_TYPE_ID,VALUE_TYPE_ID) ";
                    sqlScript +=  "values ("+$v("P3001_SUBJ_ID")   +"," +  $v("P3001_SUBJ_TYPE_ID")   +","+inputParamType + ",'"+inputValue +"') RETURNING SUBJ_PARAM_ID INTO :1";
                }
                //            //alert( sqlScript );
                
            }
            else{
                if($this.children( ".value" ).children().prop("tagName")==="INPUT"){
                    sqlScript = "update subj_param set VALUE = '"+inputValue +"' where subj_param_id ="+subjParamId+"RETURNING SUBJ_PARAM_ID INTO :1";
                }
                else{
                    sqlScript = "update subj_param set VALUE_TYPE_ID = "+inputValue +" where subj_param_id ="+subjParamId+"RETURNING SUBJ_PARAM_ID INTO :1";
                }
            }
            //alert( sqlScript );
            get = new htmldb_Get(null,&APP_ID.,'APPLICATION_PROCESS=Execute',3001);
            get.addParam("x01",sqlScript );
            gReturn = get.get();
            // alert( gReturn );
            get = null; 
            if (dimField) {
                if(dimField.prop("tagName")==="INPUT"){
                    sqlScript = "update subj_param set UNIT ='"+dimField.val()+"' where subj_param_id ="+gReturn +"RETURNING SUBJ_PARAM_ID INTO :1";
                }
                else{
                    sqlScript = "update subj_param set UNIT_TYPE_ID ="+dimField.val()+" where subj_param_id ="+gReturn +"RETURNING SUBJ_PARAM_ID INTO :1";
                }
                //alert(sqlScript);
                get = new htmldb_Get(null,&APP_ID.,'APPLICATION_PROCESS=Execute',3001);
                get.addParam("x01",sqlScript );
                gReturn = get.get();
                //alert(gReturn);
                get = null; 
            }
            goBack();
        }
    });
} 

function GetTable(){
    // alertIfDeveloper('GetTable()');
    get = new htmldb_Get(null,&APP_ID.,'APPLICATION_PROCESS=ParamTable',3001);
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
        alert('Kötelető mező nincs kitöltve'); 
        return;
    }
    //alert('AddSubject'); 
    var get = new htmldb_Get(null,&APP_ID.,'APPLICATION_PROCESS=Execute',3001);
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
            get = new htmldb_Get(null,&APP_ID.,'APPLICATION_PROCESS=Execute',3001);
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
    window.location.replace("http://157.181.173.15:8080/apex/f?p="+$v('pFlowId') +":3000:"+$v('pInstance'));
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
    alert($(p).val());
}

