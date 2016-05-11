var formIsDirty = false;

function setInputElementsWidth() {


    $(".Resizable").each(function () {
        if ($(this).siblings().size() > 0) {
            $(this).width($(this).closest('td').width() - 50);
        } else {
            $(this).width($(this).closest('td').width() - 5);
        }
        $(this).css("padding", "5px");

    });
}



function  GetTranslated(tx){ 
        
    var get = new htmldb_Get(null,&APP_ID.,'APPLICATION_PROCESS=GetTranslated',1);
    get.addParam('x01',&LANGUAGE.);
    get.addParam('x02',tx);
    var gReturn = get.get();
    get = null;
    return gReturn;
}

// Array of images:
var imageArray = ["f?p=&APP_ID.:7:&APP_SESSION.:APPLICATION_PROCESS=zaszlo:::LANGUAGE:1",
                  "f?p=&APP_ID.:7:&APP_SESSION.:APPLICATION_PROCESS=zaszlo:::LANGUAGE:2",
                  "f?p=&APP_ID.:7:&APP_SESSION.:APPLICATION_PROCESS=zaszlo:::LANGUAGE:3",
                  "f?p=&APP_ID.:7:&APP_SESSION.:APPLICATION_PROCESS=zaszlo:::LANGUAGE:4",
                  "f?p=&APP_ID.:7:&APP_SESSION.:APPLICATION_PROCESS=zaszlo:::LANGUAGE:4"
                   ];

// Add hidden element
// var hidden = $('body').append('<div id="img-cache" style="display:none/>').children('#img-cache');
var hidden = $('body').append('<div id="img-cache" style="display:none/>').children('#img-cache');

// Add images to hidden element.
$.each(imageArray, function (i, val) {
    $('<img/>').attr('src', val).appendTo(hidden);
});

function FlagClick(){
    var get = new htmldb_Get(null,&APP_ID.,'APPLICATION_PROCESS=SetLanguageId',0);
    if('&LANGUAGE.' == 1){
        get.addParam("x01",3); 
    }
    else {
        get.addParam("x01",1); 
    }
    var gReturn = get.get();
    if(gReturn.match("^sqlerrm:")){
        alert(gReturn);
    }
    else{
        apex.submit();
    }
}

function LanguageChanged(){
  
    alert($("#LANGUAGE_SELECT").val());
    var get = new htmldb_Get(null,&APP_ID.,'APPLICATION_PROCESS=setLanguageSession',7);
    get.addParam('x01',$("#LANGUAGE_SELECT").val());
    var gReturn = get.get();
    get = null;
    apex.submit('LANGUAGE');
}

function dirty(param){
    $this = $(param);
    $this.addClass( "dirty" );
    formIsDirty = true;
}

jQuery.fn.tagName = function () {
    return this.prop("tagName");
};

jQuery.fn.checked = function () {
    return this.prop("checked");
};

String.prototype.format = function () {
    var s = this,
        i = arguments.length;

    while (i--) {
        s = s.replace(new RegExp('\\{' + i + '\\}', 'gm'), arguments[i]);
    }
    return s;
};



jQuery.fn.center = function () {
    this.css("position", "absolute");
    this.css("top", (jQuery(window).height() - this.height()) / 2 + jQuery(window).scrollTop() + "px");
    this.css("left", (jQuery(window).width() - this.width()) / 2 + jQuery(window).scrollLeft() + "px");
    return this;
}

function AlertIfDeveloper(p){
    if( '&APP_USER.' == 'FPARDI'){
        alert (p);
    }
}

function formatJsonKeyValuePairStr(key, value) {

    return "\"{0}\":\"{1}\",\n".format(key, value);
}

function formatJsonKeyValuePairNoCommaStr(key, value) {

    return "\"{0}\":\"{1}\"\n".format(key, value);
}

function formatJsonKeyValuePair(key, value) {

    return "\"{0}\":{1},\n".format(key, value);
}

function formatJsonKeyValuePairNoComma(key, value) {

    return "\"{0}\":{1}\n".format(key, value);
}

function isEmptyVar(str) {
    return (!str || 0 === str.length);
}

function dropLastComma(str){
    return str.substring(0,str.lastIndexOf(','));
}