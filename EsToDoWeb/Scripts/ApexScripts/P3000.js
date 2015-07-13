

function goToEdit(p) {

    var urn;
    if(p==0)
        urn = 'f?p=&APP_ID.:3001:&SESSION.::NO:3001';
    else
        urn = 'f?p=&APP_ID.:3001:&SESSION.::NO::P3001_SUBJ_ID:' + p;

    //f?p=App:Page:Session:Request:Debug:ClearCache:itemNames:itemValues:PrinterFriendly
    alert(urn);
    window.location = urn;
}