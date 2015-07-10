function goToEdit(p) {
    var urn = 'f?p=&APP_ID.:3001:&SESSION.::NO::P3001_SUBJ_ID:' + p;
    //f?p=App:Page:Session:Request:Debug:ClearCache:itemNames:itemValues:PrinterFriendly
    alert(urn);
    window.location = urn;
}