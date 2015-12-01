function GoToEditor(p) {
    var urn = 'f?p=&APP_ID.:3110:&SESSION.::NO::P3110_SUBJ_TYPE_ID:' + $(p).data("subjtypeid");
    //f?p=App:Page:Session:Request:Debug:ClearCache:itemNames:itemValues:PrinterFriendly
   window.location = urn;
}
