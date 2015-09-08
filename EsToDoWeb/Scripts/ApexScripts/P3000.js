
$(document).ready(function () {
    setInputElementsWidth();
});


function setInputElementsWidth() {
    $("#mainTable input").each(function () {
        $(this).width($(this).closest('th').width());
        $(this).css("padding", "5px");
    });
    $("#mainTable select").each(function () {
        if ($(this).siblings().size() > 0) {
            $(this).width($(this).closest('th').width() - 32);
        } else {
            $(this).width($(this).closest('th').width());
        }
        $(this).css("padding", "5px");
    });
}

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

function changeOrder(o) {
    var workspaceImages = "#WORKSPACE_IMAGES#";
    var data = $(o).data("ord");
    if (data == "none") {
        o.src = workspaceImages + "sort-alphabet-icon.png";
        $(o).data("ord", "asc");
    }
    else if (data == "asc") {
        o.src = workspaceImages + "sort-alphabet-descending-icon.png";
        $(o).data("ord","desc");
    }
    else {
        o.src = workspaceImages + "sort-icon.png";
        $(o).data("ord", "none");
    }

    deleteDataRows();
    reloadMainTable(o);
}

function changeSearch(o) {
//    alert("change_search");
}

function deleteDataRows() {
    var dataRows = $("#mainTable .dataRow");
    dataRows.each(function () {
        $(this).remove();
    });
}

function reloadMainTable(p) {

    var jsonTxt = "{\n";
    jsonTxt += formatJsonKeyValuePairNoComma("SUBJ_TYPE",$v("P3000_SUBJ_TYPE"));  
  
    var sortTxt = "";
    var s = $(".sortImg");
    s.each(
        function(){
            var $this = $(this);
            if($this.data("ord")!="none"){
                if($this.data("ord")!="asc"){
                    sortTxt += $this.data("col")+" desc,";
                }
                else{
                    sortTxt += $this.data("col")+",";
                }
               
            }
        }
    );
    if(!isEmpty(sortTxt)){
        sortTxt= sortTxt.substring(0, sortTxt.length - 1);
    }
    sortTxt= sortTxt.substring(0, sortTxt.length - 1);
    jsonTxt += ",\n";
    jsonTxt +=formatJsonKeyValuePairNoCommaStr("ORDER", sortTxt) ;
    jsonTxt += "}\n";
    var dataTable = $("#mainTable");
    var get = new htmldb_Get(null,&APP_ID.,'APPLICATION_PROCESS=reload',3000);
    get.addParam("x01", jsonTxt);
    //get.addParam("x02", selected);
    $s("P3000_TESZT",jsonTxt); 
    var retVal = get.get(); 
    $s("P3000_TESZT",jsonTxt+"\n"+retVal);  
    dataTable.append(retVal);
}