function GoToEditor(p) {
    var urn = "f?p=&APP_ID.:3110:&SESSION.::NO::P3110_SUBJ_TYPE_ID:" + $(p).data("subjtypeid");
    //f?p=App:Page:Session:Request:Debug:ClearCache:itemNames:itemValues:PrinterFriendly
   window.location = urn;
}

function addDescendant(p) {
    var e = window.event;
    e.stopPropagation();
    alert("addDescendant");
    var urn = "f?p=&APP_ID.:11301:&SESSION.:ADD:NO::P11301_SUPER_TYP_ID:" + $(p).data("id");
    //f?p=App:Page:Session:Request:Debug:ClearCache:itemNames:itemValues:PrinterFriendly
    window.location = urn;
}