function callHelpPopup () {
    var url;
    url = 'f?p=&APP_ID.:3101:&APP_SESSION.' ;
    w = open(url,"winLov","Scrollbars=yes,resizable=1,width=925,height=400");
}

// A $( document ).ready() block.
$(document).ready(
    function () {
        console.log("ready!");
        $("#mainselect").width($("#mainselect").closest("td").width() - 10);
        $("#mainselect").change( MainSelectChanged );
        $("#imgBack").remove();
        //if($("#mainselect").val() != 0) MainSelectChanged();
        if($v("P3002_QUERY_ID") != '') {
            $("#mainselect").val($v("P3002_QUERY_ID"));
            MainSelectChanged();
        }
        //var addSpanChildWidth = 0;
        //$("#spanAddChild").children().each(function(){
        //    addSpanChildWidth += $(this).width();
        //});
        ////addSpanChildWidth += 10;
        //$("#spanAddChild").width(addSpanChildWidth);
    });
    

function MainSelectChanged() {
    var get = new htmldb_Get(null,&APP_ID.,'APPLICATION_PROCESS=GetQueryResult',3002);
    get.addParam("x01",$("#mainselect").val());  
    var gReturn = get.get();
    $("#queryresult").find("tr:gt(0)").remove();
    $("#queryresult").append(gReturn);
    $("#queryresult").show();

}

function goToDetails(subjid){

    window.location.replace("http://157.181.173.15:8080/apex/f?p="+$v('pFlowId') +":3003:"+$v('pInstance')+'::::P3003_SUBJ_ID,P3003_QUERY_ID:'+subjid+','+$("#mainselect").val());
   
}

function goToDefineQuery(){

    window.location.replace("http://157.181.173.15:8080/apex/f?p="+$v('pFlowId') +":3004:"+$v('pInstance'));
   
}