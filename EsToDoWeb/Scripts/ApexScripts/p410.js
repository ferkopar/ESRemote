function isEmpty(str) {
    return (!str || 0 === str.length);
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

    $("#ParameterTable input").each(function () {
        $(this).width($(this).closest('td').width());
    });

    $("#ParameterTable select").each(function () {
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

function SaveChanges(){ 

    //if(! valid()){
    //    alert('Kötelező mező nincs kitöltve' + ErrorString); 
    //    return;
    //}
    
    alert('SaveChanges'); 
    //if (!dirty) return;
    $this = $(this);
    var treatmId = isEmpty($v("P410_TREATM_ID")) ? '0' : $v("P410_TREATM_ID");
    var jsonTxt = "{\n";
    jsonTxt += formatJsonKeyValuePair("TREATM_ID",treatmId);
    if (isEmpty($v("P410_TREATM_ID"))) {
        jsonTxt += formatJsonKeyValuePair("TREATM_GROUP_ID",$v("P410_TREATM_GROUP_ID"));        
    }
    jsonTxt += formatJsonKeyValuePairStr("TREATM_NAME",$("#TREATM_NAME").children().val());
    jsonTxt += formatJsonKeyValuePair("TREATM_CATEGORY_ID",$("#TREATM_CATEGORY_ID").children().val());
    jsonTxt += formatJsonKeyValuePair("TREATM_TYPE_ID",$("#TREATM_TYPE_ID").children().val());
    jsonTxt += formatJsonKeyValuePairStr("FROM_DATE",$("#FROM_DATE").children().val());
    jsonTxt += formatJsonKeyValuePairStr("TO_DATE",$("#TO_DATE").children().val());
    jsonTxt += formatJsonKeyValuePair("TYPE1_ID",$("#TYPE1_ID").children().val());
    jsonTxt += formatJsonKeyValuePair("TYPE2_ID",$("#TYPE2_ID").children().val());

    if ($("#ParameterTable>tbody tr").length > 0) {
        jsonTxt += '"TREATM_PARAMS" : [';
        $("#ParameterTable>tbody tr").each(function() {
            $this = $(this);
            editField = $this.children( ".value" ).children();
            dimField  = $this.children( ".dimension" ).children();
            subjField = $this.children( ".alany" ).children();  
            concreteSubjField = $this.children( ".konkretAlany" ).children(); 
            //if( editField.hasClass( "dirty" ) || subjField.hasClass("dirty") ||concreteSubjField.hasClass("dirty")){
            
            var inputValue = editField.val();
            var inputTagName = editField.prop("tagName");
            var paramId = $this.children( ".rowHead" ).children(".paramId").val();
            var inputParamType = $this.children( ".rowHead" ).children(".paramType").val();   
            jsonTxt +=  "{";
            jsonTxt +=  formatJsonKeyValuePair("TREATM_PARAM_ID",isEmpty(paramId)?0:paramId);
            jsonTxt +=  formatJsonKeyValuePair("SUBJ_TYPE_ID",isEmpty(subjField.val())?0:subjField.val());
            jsonTxt +=  formatJsonKeyValuePair("SUBJ_ID",isEmpty(concreteSubjField.val())?0:concreteSubjField);
            jsonTxt +=  formatJsonKeyValuePairStr("VALUE",isEmpty(inputValue)?0:inputValue);
            jsonTxt +=  formatJsonKeyValuePair("PARAM_TYPE",isEmpty(inputParamType)?0:inputParamType);
            jsonTxt +=  formatJsonKeyValuePairNoComma ("DIM_TYPE",isEmpty(dimField.val())?0:dimField.val());
            jsonTxt += "}\n,";

            //}
        });
        jsonTxt= jsonTxt.substring(0, jsonTxt.length - 1);
        jsonTxt += "],\n";
    }


    if ($("#ChildTable>tbody tr").length > 2) {
        jsonTxt += '"CHILDS" : [';
        $("#ChildTable>tbody tr").each(function() {
            $this = $(this);
            var childId = $this.children( ".CHILD" ).children(".CHILD_ID").val();
            jsonTxt +=  "{";
            jsonTxt += formatJsonKeyValuePairNoComma("CHILD_ID", childId);
            jsonTxt += "},";
        });

        jsonTxt= jsonTxt.substring(0, jsonTxt.length - 1);
        jsonTxt += "],\n";
    }
    jsonTxt= jsonTxt.substring(0, jsonTxt.length - 2);
    jsonTxt += "}\n";
    $s("P410_TESZT", jsonTxt);
    var get = new htmldb_Get(null,&APP_ID.,'APPLICATION_PROCESS=SaveChanges',410);
    get.addParam("x01",jsonTxt); 
    var gReturn = get.get();
    alert(gReturn);
    get = null;

} 


function ChangeTreatmName(sender){
    var textToDisplay= "";
    textToDisplay += $("#P400_SUBJ2_ID").children(':selected').text() + " ";
    textToDisplay += $("#P400_TREATM_TYPE_ID").children(':selected').text() + " ";
    textToDisplay += $v(P400_TIME_START);
    $s("P400_TREATM_NAME",textToDisplay);  
}