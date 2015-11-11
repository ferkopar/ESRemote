var htmldb_delete_message="\"DELETE_CONFIRM_MSG\"";

function callHelpPopup () {
    var url;
    url = "f?p=&APP_ID.:3101:&APP_SESSION." ;
    w = open(url,"winLov","width=925,height=800,scrollbars=yes");
}



$(document).ready(
   
    function () {
     
        $("#imgBack").each(function(){
            $(this).remove();
        });
        if(getCookie("Alerted") === ""){
            alert("Ez egy tesztrendszer, melynek célja a tervezett működés szimulációja, ezért a dizájn egyszerű és a rendszer kapacitása is alacsony (előfordulhat a szerverre várakozás).");
            setCookie("Alerted","alerted",1);
        }
        var get = new htmldb_Get(null,&APP_ID.,"APPLICATION_PROCESS=GetLanguageId",0);
        var gReturn = get.get();
 //       alert(gReturn);
        if(gReturn == 3){
            $("#HeadTableCaptionText").text( $("#HeadTableCaptionText").text().replace("szerkesztése","editing"));
            $("#HeadText").text("IKT Expert System (Pilot)");
        }
    });

function  DeleteParamRow(p){

    if(newRowIserted) return;
    var $row =  $(p).closest("tr");
    var $groupId = $row.data("paramgroup");
    //alert ($groupId);
    if(confirm("Biztosan törli?\n OK or Cancel.")){
    var get = new htmldb_Get(null,&APP_ID.,"APPLICATION_PROCESS=DeleteRow",3001);
    get.addParam("x01",$groupId); 
    var gReturn = get.get();
    if(gReturn.match("^sqlerrm:")){
        alert(gReturn);
    }
    else{
        alert(gReturn);
        $row.remove();
    }
}}

function toggleGroup(p){
    var $param = $(p); 
    var group_id = $param.data("id");
    $("#ParameterTable tr[data-group='"+group_id+"']").each(function(){
        $( this ).toggle();
    });
    $(".subtable").each(function () {
        $(this).width($(this).closest("td").width());
    });
    setInputElementsWidth();
}

function SaveChanges(){ 
    var cnt = 0;
    var jsonTxt = "{\n";
    jsonTxt += formatJsonKeyValuePair("SUBJ_ID",$("#SubjId").val());  
    jsonTxt += "PARAMS:[";
    $(".Resizable").each(function() {
        $this = $(this);
        if ($this.hasClass("dirty")) {
            cnt ++;
            jsonTxt += "{\n";
            if (! isEmptyVar($this.data("subjparamid"))) {
                jsonTxt += formatJsonKeyValuePair("PARAM_ID",$this.data("subjparamid"));

            }            
            jsonTxt += formatJsonKeyValuePair("DM_SUBJECT_ID",$this.data("dmsubject"));  
            if ($this.closest("tr").data("paramgroup") !== undefined) {
                jsonTxt += formatJsonKeyValuePair("GROUP_ID",$this.closest("tr").data("paramgroup"));      
            }            
            jsonTxt += formatJsonKeyValuePairNoCommaStr("PARAM_VALUE",$this.val());  
            jsonTxt += "},"

            if (jsonTxt.length > 3000){
                jsonTxt = dropLastComma(jsonTxt);    
                jsonTxt += "]";
                jsonTxt += "}";
                //alert(jsonTxt.length);
                var get = new htmldb_Get(null,&APP_ID.,"APPLICATION_PROCESS=SaveChanges",3001);
                get.addParam("x01",jsonTxt); 
                var gReturn = get.get();
                if(gReturn.match("^sqlerrm:")){
                    alert(gReturn);
                }
                jsonTxt = "{\n";
                jsonTxt += formatJsonKeyValuePair("SUBJ_ID",$("#SubjId").val());  
                jsonTxt += "PARAMS:[";
            }
        };
    });
    jsonTxt = dropLastComma(jsonTxt);    
    jsonTxt += "]";
    jsonTxt += "}";
    //$s("P3001_TESZT", jsonTxt);
    //alert(jsonTxt.length);
    var get = new htmldb_Get(null,&APP_ID.,"APPLICATION_PROCESS=SaveChanges",3001);
    get.addParam("x01",jsonTxt); 
    var gReturn = get.get();
    if(gReturn.match("^sqlerrm:")){
        alert(gReturn);
    }
    //$s("P3001_TESZT", gReturn);
    $(".dirty").removeClass( "dirty" );
}

var newRowIserted = false;
function AddParamRow(p){
    var newRowIserted = true;
    $p = $(p);
    $td = $p.closest("td");
    $paramgroup = $p.closest("tr").data("paramgroup");  
    $dm_param = $p.closest("table").closest("tr").data("group");  
    $dm_table = $p.closest("table");
    var get = new htmldb_Get(null,&APP_ID.,"APPLICATION_PROCESS=LoadRow",3001);
    get.addParam("x01",$dm_param); 
    get.addParam("x02",$paramgroup); 
    var gReturn = get.get(); 
    $dm_table.append(gReturn);
    $p.remove();
    var img = $("<img>"); //Equivalent: $(document.createElement('img'))
    img.attr("src", "#WORKSPACE_IMAGES#Minus Red Button.png");
    img.attr("title", "Sor törlése");
    img.click(function(){
        $(this).closest("tr").remove();
    });
    $td.append(img);
    setInputElementsWidth();
}

var oSelect;
function AddSuperTyp(p) {
    var $p = $(p);
    $("#popupItemValue").val($p.data("dmsupertypid"));
    oSelect = $(p).siblings(":first");
    $("#popupHeadRow").text(oSelect.data("headtext") + " felvitele");
    $("#popUpSuperTypDiv").show();    
    $("#popUpSuperTypDiv").center();
}

function addListElement(){
    var get = new htmldb_Get(null,&APP_ID.,"APPLICATION_PROCESS=INSERT_NEW_LIST_ELEMENT",3001);
    //alert($("#popupItemValue").val()+' '+$("#pSuperTypeName").val());
    get.addParam("x01",$("#popupItemValue").val()); 
    get.addParam("x02",$("#pSuperTypeName").val()); 
    var gReturn = get.get();
    if(gReturn.match("^ERROR:")){
        alert(gReturn);
    }
    else{
        var usedNames = {};
        oSelect.append(gReturn);
        dirty(oSelect);
        ClosePopup();
        $("#popupItemValue").val(""); 
        $("#pSuperTypeName").val("");
        $("oSelect > option").each(function () {
            alert (this.text)
            if(usedNames[this.text]) {
                $(this).remove();
            } else {
                usedNames[this.text] = this.value;
            }
        });
    }
    
}

function ClosePopup(){
    $("#popUpSuperTypDiv").hide();
}

function goBack(){
    window.location.replace("http://157.181.173.15:8080/apex/f?p="+$v("pFlowId") +":3000:"+$v("pInstance"));
}

function valid(){
    retVal = true;
    $("#ParameterTable>tbody tr").each(function() {
        $this = $(this);
        var inputValue = $this.children( ".value" ).children().val();
        var mandantory = $this.children( ".rowHead" ).children(".mandantory").val();
        if( mandantory != 0 && isEmptyVar(inputValue )){
            retVal = false;             
        }
    });
    return retVal;
}