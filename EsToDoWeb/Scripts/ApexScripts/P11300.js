function openTree(p, id) {
   // alert(id);
   // var vItem = $(p).next("span");
   // var vLi = $(p).closest("li");
   // var outerSpan = $(p).parent();
   // var position = outerSpan.position();
   // var spanTxt = '<span style="display:block;position: relative;left:' + position.left + 'px; top:7px;"> Ez az új tartalom </span>';
   // var get = new htmldb_Get(null,&APP_ID.,'APPLICATION_PROCESS=getSubTree',11300);
   // get.addParam("x01",id); 
   // var gReturn = get.get();
   //// alert(gReturn);
   // get = null;
   // vItem.append(gReturn);
   // var table = $(p).next("span").children("table");
   // vLi.height(vLi.height() + table.height());
    // outerSpan.height(outerSpan.height() + table.height());
    window.location.replace("f?p=" + $v('pFlowId') + ":11200:" + $v('pInstance') + '::::P11200_ROOT:' + id);

}

function LoadTree(p) {
    var typeId = $(p).data('typid');
    //alert(typeId);   
     var get = new htmldb_Get(null,&APP_ID.,'APPLICATION_PROCESS=getSubTree',11300);
     get.addParam("x01",typeId); 
     get.GetAsync(function(pResponse){
         console.log(pResponse.readyState);
         if(pResponse.readyState==4 && pResponse.status==200){
             $("#SuperTypeTable > tbody").html(pResponse.responseText);
         };
     });
     //var gReturn = get.get();
     //alert(gReturn);
    $("#SuperTypeTable > tbody").empty();
    //$("#SuperTypeTable > tbody").html(gReturn);
}

function GoToEditor(p) {
    var typeId = $(p).data('typeid');
    
    var urn = 'f?p=&APP_ID.:11301:&SESSION.::NO::P11301_SUPER_TYP_ID:' + typeId;
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