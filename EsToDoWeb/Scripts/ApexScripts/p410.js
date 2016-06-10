var oSelector;
var oSelectorText;

function isEmpty(str) {
    return (!str || 0 === str.length);
}

$(document).ready(function () {
    setInputElementsWidth(); 

    $("#spanAddChild").click(function(e) {
        //$("#popUpDiv").show();    
        //$("#popUpDiv").center();
        window.location.replace("http://157.181.173.15:8080/apex/f?p="+$v('pFlowId') +":410:"+$v('pInstance')+':::410:P410_CALLER_PAGE,P410_CALLER_TREATM:410,'+$v('P410_TREATM_ID'));
        //window.location.replace("http://157.181.173.15:8080/apex/f?p="+$v('pFlowId') +":3004:"+$v('pInstance'));
    });



    $("#spanClosePopup").click(function(e) {
        appendSelector();
        $("#popUpDiv").hide();
    });
    
    $("#spanSuperTypClosePopup").click(function(e) {
        appendSelector();
        $("#popUpSuperTypDiv").hide();
    });

    $("#spanSubjectClosePopup").click(function(e) {
        appendSelector();
        $("#popUpSubjectDiv").hide();
    });

    $(".popTd").click(function(e) {
        var target = $( e.target );
        newRow = '<tr><th class="thDelete"><img src="wwv_flow_file_mgr.get_file?p_security_group_id=1000000&amp;p_fname=Minus Red Button.png"></th>';
        newRow += '<td>' + target.html() + '</td></tr>';
        $("#ChildTable").append(newRow);
        $("#popUpDiv").hide();
    });

    $(".thDelete").click(function(e) {
        var target = $( e.target );
        target.closest('tr').hide();
    });
    

});

function goBack(subjid){

    window.location.replace("http://157.181.173.15:8080/apex/f?p="+$v('pFlowId') +":410:"+$v('pInstance')+'::::P410_CALLER_PAGE,P410_CALLER_TREATM:410,'+$("#mainselect").val());
   
}

function appendSelector() {
    oSelector.append($("<option></option>")
         .attr("value",-1)
         .text( oSelectorText.val() )); 
}

function setInputElementsWidth() {
    $("#TreatmTable input").each(function () {
        $(this).width( $(this).closest('td').width());
        $(this).css( "padding","5px" );
    });

    $("#TreatmTable select").each(function () {
        if ($(this).siblings().size() > 0) {
            $(this).width($(this).closest('td').width() - 32);
        } else {
            $(this).width($(this).closest('td').width());
        }
        $(this).css( "padding","5px" );

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
    if (columnName == "TREATM_TYPE_ID") {
        //       alert(columnName);
        // gReturn = getSelectListIems($(sender).attr('data-group'), $(sender).val());
        //--         alert(gReturn);
        //$("#TREATM_TYPE_ID").html(gReturn);
        //setInputElementsWidth();
        gReturn = getParamTable( $(sender).val())
        alert(gReturn);
        $("#tableContainer").html(gReturn);
    }
}

function getParamTable(typeId){
    //--   alert(group + ' '+ selected);
    var get = new htmldb_Get(null,&APP_ID.,'APPLICATION_PROCESS=GetParamTable',410);
    get.addParam("x01", typeId);
    return (get.get());   
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
    
    //alert('SaveChanges'); 
    //if (!dirty) return;
    $this = $(this);
    var treatmId = isEmpty($v("P410_TREATM_ID")) ? '0' : $v("P410_TREATM_ID");
    var jsonTxt = "{";
    jsonTxt += formatJsonKeyValuePair("TREATM_ID",treatmId);
    if (isEmpty($v("P410_TREATM_GROUP_ID"))) {
        if (isEmpty($v("P410_TREATM_ID"))) {
            jsonTxt += formatJsonKeyValuePair("TREATM_GROUP_ID","1604"); 
        }
        else
        {
            jsonTxt += formatJsonKeyValuePair("TREATM_GROUP_ID",$v("P410_TREATM_GROUP_ID")); 
        }
    }
    if (!isEmpty($v("P410_CALLER_TREATM"))){
        jsonTxt += formatJsonKeyValuePair("CALLER_TREATM_ID",$v("P410_CALLER_TREATM")); 
    }
    jsonTxt += formatJsonKeyValuePairStr("TREATM_NAME",$("#TREATM_NAME").children().val());
    jsonTxt += formatJsonKeyValuePair("TREATM_TYPE_ID",$("#TREATM_TYPE_ID").children().val());
    jsonTxt += formatJsonKeyValuePairStr("FROM_DATE",$("#FROM_DATE").children().val());
    jsonTxt += formatJsonKeyValuePairStr("TO_DATE",$("#TO_DATE").children().val());
    if ($("#TYPE1_ID").children().val() !== undefined) {
        jsonTxt += formatJsonKeyValuePair("TYPE1_ID", $("#TYPE1_ID").children().val());
    }
    if ($("#TYPE2_ID").children().val() !== undefined) {
        jsonTxt += formatJsonKeyValuePair("TYPE2_ID", $("#TYPE2_ID").children().val());
    }
    if ($("#SUBJ1_ID").children().val() !== undefined) {
        jsonTxt += formatJsonKeyValuePair("SUBJ1_ID", $("#SUBJ1_ID").children().val());
    }
    if ($("#SUBJ2_ID").children().val() !== undefined) {
        jsonTxt += formatJsonKeyValuePair("SUBJ2_ID", $("#SUBJ2_ID").children().val());
    }
    jsonTxt += formatJsonKeyValuePairStr("DESCRIPTION",$("#DESCRIPTION").children().val());

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
    $s("P410_TREATM_ID",gReturn);
    $("#treatmIDCell").html = gReturn;
    alert("treatm_id:"+gReturn);
    get = null;

} 

function CloseTreatm() {
    var get = new htmldb_Get(null,&APP_ID.,'APPLICATION_PROCESS=Close',410); 
    var gReturn = get.get();
   
    $s("P410_TESZT", gReturn);
    get = null;
    
}

function ChangeTreatmName(sender){
    var textToDisplay= "";
    textToDisplay += $("#P400_SUBJ2_ID").children(':selected').text() + " ";
    textToDisplay += $("#P400_TREATM_TYPE_ID").children(':selected').text() + " ";
    textToDisplay += $v(P400_TIME_START);
    $s("P400_TREATM_NAME",textToDisplay);  
}

function AddSuperTyp(p) {
    alert($(p).siblings(":first").tagName());
    var oSelect = $(p).siblings(":first");
    $("#popUpSuperTypDiv").show();    
    $("#popUpSuperTypDiv").center();

    oSelector = oSelect;
    oSelectorText = $('#pSuperTypeName');

}

function AddSubject(p) {
    alert($(p).siblings(":first").tagName());
    var oSelect = $(p).siblings(":first");
    $("#popUpSubjectDiv").show();    
    $("#popUpSubjectDiv").center();

    oSelector = oSelect;
    oSelectorText = $('#pSubjName');


}