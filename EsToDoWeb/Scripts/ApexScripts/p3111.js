function GetValue(p) {
    var $p = $(p);

    if ($p.attr('type') === "checkbox")
    {
        if ($p.is(':checked')) {
            return 1;
        } else {
            return 0;
        }
    }
    else
    {
        return $p.val();
    }
}

function SaveChanges() {

    var jsonTxt = "{\n";   
    $("[data-colname]").each(function () {
        var $this = $(this);
        jsonTxt += formatJsonKeyValuePairStr($this.data("colname"), GetValue($(this).children("td").children().first()));
    });
    jsonTxt = dropLastComma(jsonTxt);
    jsonTxt += "}";

    //alert(jsonTxt);

    var get = new htmldb_Get(null,&APP_ID.,'APPLICATION_PROCESS=saveChanges',3111);
    get.addParam("x01",jsonTxt); 
    get.GetAsync(function(pResponse){
        if(pResponse.readyState === 4 && pResponse.status === 200){
            alert(pResponse.responseText);        
        };
    });
}
