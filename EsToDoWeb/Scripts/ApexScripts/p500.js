jQuery.fn.tagName = function() {
    return this.prop("tagName");
};

function hideOrShow(sender) {
    rowToHide = $(sender).closest( "tr" ).next();
    if ($(rowToHide).is(":visible")) {
        rowToHide.hide();
    } else {
        rowToHide.show();
    }
}
   
    
function GetTable(){
    
    get = new htmldb_Get(null,&APP_ID.,'APPLICATION_PROCESS=ParamTable',500);
    get.addParam("x01",$v("P500_DOC_ID") );
    get.addParam("x02",$v("P500_SHEET") ); 
    get.addParam("x03",$v("P500_REL_ID") ); 
    gReturn = get.get();
    $("#ParameterRegion .uRegionContent ").html(gReturn);
    get = null; 
    $('.datetimePicker').datetimepicker({format:'Y.m.d H:i'});
    $('.datePicker').datetimepicker({format:'Y.m.d'});
}

function InsertLine() {
    get = new htmldb_Get(null,&APP_ID.,'APPLICATION_PROCESS=GetEmptyRow',500);
    get.addParam("x01",$v("P500_DOC_ID") );
    gReturn = get.get();
    $('#DmXlTable').append(gReturn);
    get = null; 
}

function SaveChanges() {
//    alert("save");
    $("#DmXlTable tr.editable").each(function() {
        $this = $(this);
        IdField = $this.children( ".dmXlId" ).children();

        //set session values
        var get = new htmldb_Get(null,&APP_ID.,'APPLICATION_PROCESS=dummy',1);
        get.add('P500_DOC_ID', $v("P500_DOC_ID"));
        get.add('P500_SHEET', $v("P500_SHEET"));
        get.add('P500_REL_ID', $v("P500_REL_ID"));
        gReturn = get.get();
        get = null;

        TypeIdField = $this.children( ".paramTypeId" ).children();
        UnitTypeField = $this.children( ".unitTypeId" ).children();
        OrderNoField = $this.children( ".orderNo" ).children();
        OrderSignField =  $this.children( ".orderSign" ).children();
        OrderRegField = $this.children( ".orderReg" ).children();
        PrintTypeField =  $this.children( ".printType" ).children();
        DescriptionField = $this.children( ".description" ).children();
        FromDateField = $this.children( ".fromDate" ).children();
        ToDateField = $this.children( ".toDate" ).children();

        get = new htmldb_Get(null,&APP_ID.,'APPLICATION_PROCESS=SaveChanges',500);
        get.addParam("x01",IdField.val()); 
        get.addParam("x02",TypeIdField.val()); // subj_type_id
        get.addParam("x03",UnitTypeField.val()); // subj_id
        get.addParam("x04",OrderNoField.val()); // 
        get.addParam("x05",OrderSignField.val()); // 
        get.addParam("x06",OrderRegField.val()); // 
        get.addParam("x07",PrintTypeField.val()); // 

        gReturn = get.get();
        get = null;

        alert(gReturn);
    });
}
