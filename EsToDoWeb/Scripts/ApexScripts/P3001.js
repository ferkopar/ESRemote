﻿var htmldb_delete_message='"DELETE_CONFIRM_MSG"';

function alertIfDeveloper( p )
{
    //    alert($v("APP_USER")); 
    if( $v("APP_USER") === "FPARDI"){
        alert ( p );
    }
}

function SaveChanges(){ 
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
        if( mandantory != 0 && isEmpty(inputValue )){
            retVal = false;             
        }
    });
    return retVal;
}

function isEmpty(str) {
    return (!str || 0 === str.length);
}