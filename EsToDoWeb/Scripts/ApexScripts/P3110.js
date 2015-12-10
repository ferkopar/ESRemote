function toggleGroup(p) {

    var $param = $(p);
    var group_id = $param.data("id");
    alert(group_id);
    $param.next().toggle(1000);
    //$(".datatable tr[data-group='" + group_id + "']").each(function () {
    //    alert('benne');
    //    $(this).toggle();
    //});
    $(".subtable").each(function () {
        $(this).width($(this).closest("td").width());
    });
    setInputElementsWidth();
}

function EditDmSubj(p) {
    e = window.event;
    e.stopPropagation();
    var urn = 'f?p=&APP_ID.:3111:&SESSION.:EDIT:NO::P3111_DM_SUBJECT_ID:' + $(p).closest("tr").data("id");
    //f?p=App:Page:Session:Request:Debug:ClearCache:itemNames:itemValues:PrinterFriendly
    window.location = urn;
}

function AddDmSubj(p) {

    e = window.event;
    e.stopPropagation();
    if (p == undefined) {
        var urn = 'f?p=&APP_ID.:3111:&SESSION.:ADD:NO::P3111_SUBJ_TYPE_ID:' + $v("P3110_SUBJ_TYPE_ID");
    } else {
        var urn = 'f?p=&APP_ID.:3111:&SESSION.:ADD:NO::P3111_SUBJ_TYPE_ID,P3111_GROUP_ID:' + $v("P3110_SUBJ_TYPE_ID"+',0');
    }
    alert(urn);
    //f?p=App:Page:Session:Request:Debug:ClearCache:itemNames:itemValues:PrinterFriendly
    window.location = urn;
}