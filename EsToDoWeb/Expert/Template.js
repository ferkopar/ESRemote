var formIsDirty = false;

function setCookie(cname, cvalue, exdays) {
    var d = new Date();
    d.setTime(d.getTime() + (exdays*24*60*60*1000));
    var expires = "expires="+d.toUTCString();
    document.cookie = cname + "=" + cvalue + "; " + expires;
}

function getCookie(cname) {
    var name = cname + "=";
    var ca = document.cookie.split(';');
    for(var i=0; i<ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0)==' ') c = c.substring(1);
        if (c.indexOf(name) == 0) return c.substring(name.length,c.length);
    }
    return "";
}

function  GetUserName(){ 
        
    var get = new htmldb_Get(null,&APP_ID.,'APPLICATION_PROCESS=AjaxSetUserName',0);
    get.addParam('x01','&APP_USER.');
    var gReturn = get.get();
    get = null;
    var $userBlockSpan = $(".userBlock span").text(gReturn);
}

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


function rotate($el, degrees) {
    $el.css({
        '-webkit-transform' : 'rotate('+degrees+'deg)',
        '-moz-transform' : 'rotate('+degrees+'deg)',  
        '-ms-transform' : 'rotate('+degrees+'deg)',  
        '-o-transform' : 'rotate('+degrees+'deg)',  
        'transform' : 'rotate('+degrees+'deg)',  
        'zoom' : 1

    });
}

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

