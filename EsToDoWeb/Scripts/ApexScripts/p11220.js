var htmldb_delete_message = '"DELETE_CONFIRM_MSG"';


$(document).ready(function () {
    $("input").each(function () {
        $(this).width($(this).closest('td').width());
        $(this).css("padding", "5px");
    });
});

function idChange(p) {
    // $s("P11220_GRUNDLEVEL_ID",$v("P11220_TYPE_ID"));
    dirty(p);
}

function Clear(){
    var roleLevel = $("#ROLL_TYPE").children().val();
    $(".responstable input").each(function () {
        $(this).val("");
    });
    $("#ROLL_TYPE").children().val(roleLevel);
}

function CreateChild(){
    var groupID   = $("#SUPER_TYP_ID").children().val();
    var groupName = $("#SUPER_TYPE_NAME").children().val();
    var groundLevelId = $("#GROUND_LEVEL_ID").children().val();
    var groundLevelName = $("#GROUND_LEVEL_NAME").children().val();
    Clear();
    $("#GROUP_ID").children().val(groupID);
    $("#SUPER_GROUP_NAME").children().val(groupName);
    $("#GROUND_LEVEL_ID").children().val(groundLevelId);
    $("#GROUND_LEVEL_NAME").children().val(groundLevelName);
}

function SaveChanges() {
    if (!dirty) return;
    $this = $(this);
    var jsonTxt = "{\n";
    jsonTxt += formatJsonKeyValuePair("SUPER_TYP_ID", $("#SUPER_TYP_ID").children().val());
    jsonTxt += formatJsonKeyValuePairStr("SUPER_TYPE_NAME", $("#SUPER_TYPE_NAME").children().val());
    jsonTxt += formatJsonKeyValuePairStr("SUPER_TYPE_SHORT_NAME", $("#SUPER_TYPE_SHORT_NAME").children().val());
    jsonTxt += formatJsonKeyValuePair("GROUP_ID", $("#GROUP_ID").children().val());
    jsonTxt += formatJsonKeyValuePairNoComma("ROLL_TYPE", $("#ROLL_TYPE").children().val());
    var translateDirty = false;
    if ($("#translateTable>tbody tr").length > 0) {
        $("#translateTable>tbody tr").each(function () {
            $this = $(this);
            editField = $this.children(".text").children();
            if (editField.hasClass("dirty")) {
                translateDirty = true;
            }
        });
    }
    if (translateDirty) {
        jsonTxt += ',"TRANSALTES" : [';
        $("#translateTable>tbody tr").each(function () {
            $this = $(this);
            editField = $this.children(".text").children();
            if (editField.hasClass("dirty")) {
                var inputValue = editField.val();
                var inputTagName = editField.prop("tagName");
                var paramId = $this.children(".rowHead").children(".paramId").val();
                var inputParamType = $this.children(".rowHead").children(".paramType").val();
                jsonTxt += "{";
                jsonTxt += formatJsonKeyValuePair("LANGUAGE_ID", $this.data("langid"));
                jsonTxt += formatJsonKeyValuePairNoCommaStr("TEXT", editField.val());
                jsonTxt += "}\n,";
                editField.removeClass("dirty");
            }
        });
        jsonTxt = jsonTxt.substring(0, jsonTxt.length - 1);
        jsonTxt += "]\n,";
    }
    jsonTxt = jsonTxt.substring(0, jsonTxt.length - 1);
    jsonTxt += "}\n";
    $s("P11220_DEBUG", jsonTxt);
    var get = new htmldb_Get(null,&APP_ID.,'APPLICATION_PROCESS=SaveChanges',11220);
    get.addParam("x01",jsonTxt); 
    var gReturn = get.get();
    alert(gReturn);
    get = null;
    //apex.submit();

    //alert(jsonTxt);
}



