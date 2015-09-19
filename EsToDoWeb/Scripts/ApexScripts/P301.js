var minDate = new Date(2099, 11, 31);
var maxDate = new Date(2000, 1, 1);
function goToEdit(p) {

    var urn;
    if (p == 0)
        urn = 'f?p=&APP_ID.:410:&SESSION.::NO:410';
    else
        urn = 'f?p=&APP_ID.:410:&SESSION.::NO::P410_TREATM_ID:' + p;

    //f?p=App:Page:Session:Request:Debug:ClearCache:itemNames:itemValues:PrinterFriendly
    //alert(urn);
    window.location = urn;
}

function changeOrder(o) {
    var workspaceImages = "#WORKSPACE_IMAGES#";
    var data = $(o).data("ord");
    if (data == "none") {
        o.src = workspaceImages + "sort-alphabet-icon.png";
        $(o).data("ord", "asc");
    }
    else if (data == "asc") {
        o.src = workspaceImages + "sort-alphabet-descending-icon.png";
        $(o).data("ord", "desc");
    }
    else {
        o.src = workspaceImages + "sort-icon.png";
        $(o).data("ord", "none");
    }

   // deleteDataRows();
   // reloadMainTable(o);
}

function deleteDataRows() {
    var dataRows = $("#TreatmTable .dataRow");
    dataRows.each(function () {
        $(this).remove();
    });
}
