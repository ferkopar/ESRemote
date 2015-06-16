

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

function SaveChanges(){ 
    //  alert($v("P400_TREATM_ID"));
    //if(! valid()){
    //    alert('Kötelező mező nincs kitöltve' + ErrorString); 
    //    return;
    //}
    
    alert('SaveChanges'); 
    //if (!dirty) return;
    $this = $(this);
    jsonTxt = "{\n";
    jsonTxt += formatJsonKeyValuePair("TREATM_ID",$v("P410_TREATM_ID"));
    jsonTxt += formatJsonKeyValuePairStr("TREATM_NAME",$("#TREATM_NAME").children().val());
    jsonTxt += formatJsonKeyValuePair("TREATM_CATEGORY_ID",$("#TREATM_CATEGORY_ID").children().val());
    jsonTxt += formatJsonKeyValuePair("TREATM_TYPE_ID",$("#TREATM_TYPE_ID").children().val());
    jsonTxt += formatJsonKeyValuePairStr("FROM_DATE",$("#FROM_DATE").children().val());
    jsonTxt += formatJsonKeyValuePairStr("TO_DATE",$("#TO_DATE").children().val());
    jsonTxt += formatJsonKeyValuePair("TREATM_TYPE_ID",$("#TREATM_TYPE_ID").children().val());
    jsonTxt += formatJsonKeyValuePair("TYPE1_ID",$("#TYPE1_ID").children().val());
    jsonTxt += formatJsonKeyValuePairNoComma("TYPE2_ID",$("#TYPE2_ID").children().val());


    //jsonTxt += formatJsonKeyValuePairNoComma("SUBJ_GROUP_ID",$this.children(".SUBJ_GROUP_ID").children().val());
    jsonTxt += "}\n";
    $s("P410_TESZT", jsonTxt);
    //get = null; 
    //$("#ParameterTable>tbody tr").each(function() {
    //    $this = $(this);
    //    editField = $this.children( ".value" ).children();
    //    dimField  = $this.children( ".dimension" ).children();
    //    subjField = $this.children( ".alany" ).children();  
    //    concreteSubjField = $this.children( ".konkretAlany" ).children(); 
    //    if( editField.hasClass( "dirty" ) || subjField.hasClass("dirty") ||concreteSubjField.hasClass("dirty")){
    //        var inputValue = editField.val();
    //        var inputTagName = editField.prop("tagName");
    //        var paramId = $this.children( ".rowHead" ).children(".paramId").val();
    //        var inputParamType = $this.children( ".rowHead" ).children(".paramType").val();   
    //        //alert("asasasas");
    //        get = new htmldb_Get(null,&APP_ID.,'APPLICATION_PROCESS=InsertOrUpdateTreatmParam',400);
    //        get.addParam("x01",isEmpty(paramId)?0:paramId); 
    //        get.addParam("x02",subjField.val()); // subj_type_id
    //        get.addParam("x03",concreteSubjField.val()); // subj_id
    //        get.addParam("x04",$this.children( ".value" ).children().prop("tagName")); // 
    //        get.addParam("x05",inputValue); // 
    //        get.addParam("x06",$v("P400_TREATM_ID")); // 
    //        get.addParam("x07",inputParamType); // 
    //        get.addParam("x08",dimField.val()); // 
    //        gReturn = get.get();
    //        //alert(gReturn);
    //        // $s("P400_DESCRIPTION",$v("P400_DESCRIPTION")+"_"+gReturn);
    //    }
    //});

} 
