var htmldb_delete_message='"DELETE_CONFIRM_MSG"';

function callMyPopup (pTreatmId) { 
    url = 'f?p=&APP_ID.:300:&APP_SESSION.::::P300_TREATM_ID:' + pTreatmId;
    w = open(url,"winLov","Scrollbars=1,resizable=1,width=800,height=600");
    if (w.opener == null)
        w.opener = self;
    w.focus();
}

function alertIfDeveloper( p )
{
    //    alert($v("APP_USER")); 
    if( $v("APP_USER") === "FPARDI"){
        alert ( p );
    }
}

function ChangeTreatmName(sender){
    var textToDisplay= "";
    textToDisplay += $("#P400_SUBJ2_ID").children(':selected').text() + " ";
    textToDisplay += $("#P400_TREATM_TYPE_ID").children(':selected').text() + " ";
    textToDisplay += $v(P400_TIME_START);
    $s("P400_TREATM_NAME",textToDisplay);  
}

function GoToDoc() {
    SaveChanges();    

    if ( isEmpty( $("#P400_DOC_ID").val() )) {
        // alert("empy");
        apex.submit({
            request: "CREATE_DOCUMENT",
            set:{"P400_ACTION":"DOC",
                "P400_P_TREARM_ID":$v("P400_TREATM_ID")}
        });
    }
    else {
 //         alert("full");
        apex.submit({
            request: "DOCUMENT",
            set:{"P400_ACTION":"DOC",
                "P400_TREATM_ID":$v("P400_DOC_ID"),
                "P400_P_TREARM_ID":$v("P400_TREATM_ID")
            }
        });
    }

}

function SubjList(sender,sel){
    dirty(sender);
    subjType=$(sender).val();
    aSelect = $("#"+sel);
    var get = new htmldb_Get(null,&APP_ID.,'APPLICATION_PROCESS=GetSubjOptions',400);
    get.addParam("x01", subjType);
    gReturn = get.get();
    aSelect.html(gReturn);
}

function GoToNextStep(){
    SaveChanges();
    apex.submit({
        request: "NEXT"            
    });
}

function SaveChanges(){ 
    //  alert($v("P400_TREATM_ID"));
    //if(! valid()){
    //    alert('Kötelező mező nincs kitöltve' + ErrorString); 
    //    return;
    //}
    
    //alert('SaveChanges'); 
    if (!dirty) return;
    var d = false;
    var get = new htmldb_Get(null,&APP_ID.,'APPLICATION_PROCESS=Execute',400);
    var sqlScript = "update treatm set ";
    if($("#P400_TREATM_NAME").hasClass( "dirty" )){
        sqlScript += "TREATM_NAME=" + stringOrNull($v("P400_TREATM_NAME"));
        d=true;
    }
    if($("#P400_TIME_START").hasClass( "dirty" )){
        sqlScript += ",TIME_START=" + dateOrNull($v("P400_TIME_START"));
        d=true;
    }
    if($("#P400_TIME_END").hasClass( "dirty" )){
        sqlScript += ",TIME_END=" + dateOrNull($v("P400_TIME_END"));
        d=true;
    }
    if($("#P400_TYPE1_ID").hasClass( "dirty" )){
        sqlScript += ",TYPE1_ID=" + numberOrNull($v("P400_TYPE1_ID"));
        d=true;
    }
    if($("#P400_TYPE2_ID").hasClass( "dirty" )){
        sqlScript += ",TYPE2_ID=" + numberOrNull($v("P400_TYPE2_ID"));
        d=true;
    }
    if($("#P400_SUBJ1_ID").hasClass( "dirty" )){
        sqlScript += ",SUBJ1_ID=" + numberOrNull($v("P400_SUBJ1_ID"));
        d=true;
    }
    if($("#P400_SUBJ2_ID").hasClass( "dirty" )){
        sqlScript += ",SUBJ2_ID=" + numberOrNull($v("P400_SUBJ2_ID"));
        d=true;
    }
    if (d) {
        sqlScript += " where treatm_id = " + $v("P400_TREATM_ID") + " RETURNING TREATM_ID INTO :1";
        $s("P400_DESCRIPTION", sqlScript);
        get.addParam("x01", sqlScript);
        gReturn = get.get();
        // alert( gReturn );
    }
    get = null; 
    $("#ParameterTable>tbody tr").each(function() {
        $this = $(this);
        editField = $this.children( ".value" ).children();
        dimField  = $this.children( ".dimension" ).children();
        subjField = $this.children( ".alany" ).children();  
        concreteSubjField = $this.children( ".konkretAlany" ).children(); 
        if( editField.hasClass( "dirty" ) || subjField.hasClass("dirty") ||concreteSubjField.hasClass("dirty")){
            var inputValue = editField.val();
            var inputTagName = editField.prop("tagName");
            var paramId = $this.children( ".rowHead" ).children(".paramId").val();
            var inputParamType = $this.children( ".rowHead" ).children(".paramType").val();   
            //alert("asasasas");
            get = new htmldb_Get(null,&APP_ID.,'APPLICATION_PROCESS=InsertOrUpdateTreatmParam',400);
            get.addParam("x01",isEmpty(paramId)?0:paramId); 
            get.addParam("x02",subjField.val()); // subj_type_id
            get.addParam("x03",concreteSubjField.val()); // subj_id
            get.addParam("x04",$this.children( ".value" ).children().prop("tagName")); // 
            get.addParam("x05",inputValue); // 
            get.addParam("x06",$v("P400_TREATM_ID")); // 
            get.addParam("x07",inputParamType); // 
            get.addParam("x08",dimField.val()); // 
            gReturn = get.get();
            //alert(gReturn);
            // $s("P400_DESCRIPTION",$v("P400_DESCRIPTION")+"_"+gReturn);
        }
    });

} 

function GetTable(){
    
    get = new htmldb_Get(null,&APP_ID.,'APPLICATION_PROCESS=ParamTable',400);
    get.addParam("x01",$v("P400_TREATM_ID") );
    get.addParam("x02",$v("P400_TREATM_TYPE_ID") );
    get.addParam("x03",$v("P400_TREATM_GROUP_ID") );
    get.addParam("x04",$v("P400_TREATM_CATEGORY_ID") );
    gReturn = get.get();
    $("#ParameterRegion .uRegionContent ").html(gReturn);
    get = null; 
}

function numberOrNull( p ){
    if (isEmpty(p)){
        return "null";
    }
    else{
        return p;
    }
}

function stringOrNull(p){
    if (isEmpty(p)){
        return "null";
    }
    else{
        return "'" + p + "'";
    }
}

function dateOrNull(p){
    if (isEmpty(p)){
        return "null";
    }
    else{
        return "to_date('"+p+"','YYYY.MM.DD')";
    }
}

function AddSubject(){ 
    if(! valid()){
        alert('Kötelező mező nincs kitöltve' + ErrorString); 
        return;
    }
    //alert('AddTreatm'); 
    var get = new htmldb_Get(null,&APP_ID.,'APPLICATION_PROCESS=Execute',400);
    sqlScript  = "insert into treatm (TREATM_NAME,TREATM_GROUP_ID,TREATM_CATEGORY_ID,TREATM_TYPE_ID,SUBJ1_ID,TYPE1_ID,SUBJ2_ID, TYPE2_ID,DESCRIPTION,FROM_DATE,TO_DATE) ";
    sqlScript += "values (" + stringOrNull($v("P400_TREATM_NAME"));
    sqlScript += ","+ numberOrNull($v("P400_TREATM_GROUP_ID")); 
    sqlScript += ","+ numberOrNull($v("P400_TREATM_CATEGORY_ID")); 
    sqlScript += ","+ numberOrNull($v("P400_TREATM_TYPE_ID")); 
    sqlScript += ","+ numberOrNull($v("P400_SUBJ1_ID")); 
    sqlScript += ","+ numberOrNull($v("P400_TYPE1_ID")); 
    sqlScript += ","+ numberOrNull($v("P400_SUBJ2_ID")); 
    sqlScript += ","+ numberOrNull($v("P400_TYPE2_ID")); 
    sqlScript += ","+ stringOrNull($v("P400_DESCRIPTION")); 
    sqlScript += "," + dateOrNull($v("P400_FROM_DATE")); 
    sqlScript += "," + dateOrNull($v("P400_TO_DATE")); 
    sqlScript += ") RETURNING TREATM_ID INTO :1";
    get.addParam("x01",sqlScript );   
    gReturn = get.get();
    //alert(gReturn);
    get = null; 
   
    $("#ParameterTable>tbody tr").each(function() {
        $this = $(this);
        editField = $this.children( ".value" ).children();
        dimField  = $this.children( ".dimension" ).children();
        subjFiels = $this.children( ".alany" ).children();
        inputParamType = $this.children( ".rowHead" ).children(".paramType"); 
        if (editField.hasClass( "dirty" ) || dimField.hasClass( "dirty" ) || subjFiels.hasClass( "dirty" ) ){
            sqlScript = "insert into treatm_param(TREATM_ID,SUBJ_ID,SUBJ_TYPE_ID,PARAM_TYPE_ID,VALUE,UNIT_TYPE_ID,VALUE_TYPE_ID,UNIT)";
            sqlScript += "values ("+gReturn;            //TREATM_ID
            sqlScript += ",null";                           //SUBJ_ID
            sqlScript += ","+ numberOrNull(subjFiels.val());      //SUBJ_TYPE_ID
            sqlScript += ","+ numberOrNull(inputParamType.val()); //PARAM_TYPE_ID
            sqlScript += ","+ stringOrNull(editField.val());      //VALUE
            sqlScript += ","+ numberOrNull(dimField.val());       //UNIT_TYPE_ID
            if(editField.prop("tagName")==="INPUT"){
                sqlScript += ",null";                             //VALUE_TYPE_ID
            }
            else{
                sqlScript += ","+ numberOrNull(editField.val());  //VALUE_TYPE_ID
            }               
            sqlScript += ","+ stringOrNull(dimField.val());       //UNIT
            sqlScript += ") RETURNING TREATM_PARAM_ID INTO :1";
//            alert( sqlScript );
            get = new htmldb_Get(null,&APP_ID.,'APPLICATION_PROCESS=Execute',3001);
            get.addParam("x01",sqlScript );
            gReturn = get.get();
//            alert(gReturn);
            get = null; 
        }
    });      
    
} 

function goBack(){
    window.location.replace("http://157.181.173.15:8080/apex/f?p="+$v('pFlowId') +":3000:"+$v('pInstance'));
}

var ErrorString;

function valid(){
    retVal = true;
    ErrorString = '';
    //    alert("validation");
    $("#TreatmHead input.mandatory, #TreatmHead select.mandatory").each(function() {
        $this = $(this)
        $(this).val();
        if (isEmpty($this.val())){
            retVal = false;
            ErrorString +="\n"+ $this.attr('id') + " kötelező";
        }
    });

    if (isEmpty( $v('P400_TREATM_NAME'))){
        ErrorString += '\nTreatm name kötelező';
        retVal = false;
    }

    
    //$("#ParameterTable>tbody tr").each(function() {
    //    $this = $(this);
    //    var inputValue = $this.children( ".value" ).children().val();
    //    var mandantory = $this.children( ".rowHead" ).children(".mandantory").val();
    //    if( mandantory != 0 && isEmpty(inputValue )){
    //        retVal = false;             
    //    }
    //});
    return retVal;
}

function isEmpty(str) {
    return (!str || 0 === str.length);
}


