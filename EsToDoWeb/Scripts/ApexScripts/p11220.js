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

function SaveChanges() {
    if (!dirty) return;
    $this = $(this);
    var jsonTxt = "{\n";
    jsonTxt += formatJsonKeyValuePair("SUPER_TYP_ID", $("#SUPER_TYP_ID").children().val());
    jsonTxt += formatJsonKeyValuePairStr("SUPER_TYPE_NAME", $("#SUPER_TYPE_NAME").children().val());
    jsonTxt += formatJsonKeyValuePairStr("SUPER_TYPE_SHORT_NAME", $("#SUPER_TYPE_SHORT_NAME").children().val());
    jsonTxt += formatJsonKeyValuePair("GROUP_ID", $("#GROUP_ID").children().val());
    jsonTxt += formatJsonKeyValuePair("ROLL_TYPE", $("#ROLL_TYPE").children().val());

    if ($("#translateTable>tbody tr").length > 0) {
        jsonTxt += '"TREATM_PARAMS" : [';
        $("#translateTable>tbody tr").each(function () {
            $this = $(this);
            editField = $this.children(".text").children();

            var inputValue = editField.val();
            var inputTagName = editField.prop("tagName");
            var paramId = $this.children(".rowHead").children(".paramId").val();
            var inputParamType = $this.children(".rowHead").children(".paramType").val();
            jsonTxt += "{";
            //jsonTxt += formatJsonKeyValuePairStr("TEXT", isEmpty(inputValue) ? 0 : inputValue);
            jsonTxt += formatJsonKeyValuePairStr("TEXT", editField.val());
            jsonTxt = jsonTxt.substring(0, jsonTxt.length - 1);
            jsonTxt += "}\n,";

        });
        jsonTxt = jsonTxt.substring(0, jsonTxt.length - 1);
        jsonTxt += "],\n";
        jsonTxt = jsonTxt.substring(0, jsonTxt.length - 1);

        jsonTxt += "}\n";

        alert(jsonTxt);
    }
}



