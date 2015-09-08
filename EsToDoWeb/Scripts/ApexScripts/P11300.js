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

