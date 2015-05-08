var formIsDirty = false;

function  GetTranslated(tx){ 
        
        var get = new htmldb_Get(null,&APP_ID.,'APPLICATION_PROCESS=GetTranslated',1);
        get.addParam('x01',&LANGUAGE.);
        get.addParam('x02',tx);
	gReturn = get.get();
	get = null;
        return gReturn;
 }

function LanguageChanged(){
  
  alert($("#LANGUAGE_SELECT").val());
  var get = new htmldb_Get(null,&APP_ID.,'APPLICATION_PROCESS=setLanguageSession',7);
        get.addParam('x01',$("#LANGUAGE_SELECT").val());
 	gReturn = get.get();
 	get = null;
  apex.submit('LANGUAGE');
}

function dirty(param){
    $this = $(param);
    $this.addClass( "dirty" );
    formIsDirty = true;
}