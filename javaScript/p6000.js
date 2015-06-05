if (!Array.prototype.forEach)
{
  Array.prototype.forEach = function(fun /*, thisp*/)
  {
    var len = this.length;
    if (typeof fun != "function")
      throw new TypeError();

    var thisp = arguments[1];
    for (var i = 0; i < len; i++)
    {
      if (i in this)
        fun.call(thisp, this[i], i, this);
    }
  };
} 

$(function() {
    $('table.zebra').attr('width', 500);
  });

$(document).ready(function(){
        var _height = 0;
	$('.editable .field').focus(function() {
		$(this).addClass('focused');
	}).blur(function(){
		$(this).removeClass('focused');
	});
        $('#EloiranyzatTable tr').each(function (i, row) {
             var $row = $(row);
             _height += $row.height();
            
        });
         _height += 53;
//             alert(_height);
        $('#tableContainer').height(_height); 
});

function insert_tr_xl(pThis,pXOszl,pParamTyp,pTreatmId){ 
       //  alert(pThis.parentElement.parentElement.firstChild.innerText);
	 var get = new htmldb_Get(null,&APP_ID.,'APPLICATION_PROCESS=insert_tr_xl_row',6000);
	 get.addParam('x01',$v(pThis)); // az input értéke
         get.addParam('x02',pXOszl);    // a dm_xl oszlopra vonatkozó rekordja
         get.addParam('x03',pParamTyp); // a sor paramétertípusa
         get.addParam('x04',pTreatmId); // a treatm_id,ami összefogja a dokumentumot
         get.addParam('x05',pThis.parentElement.parentElement.firstChild.innerText); // az order_no 
	 gReturn = get.get();
  //       alert(gReturn);
	 get = null; 
 } 

function insert_line(pThis){
       // alert("insert_line");
         var get = new htmldb_Get(null,&APP_ID.,'APPLICATION_PROCESS=insert_tr_xl',6000);
         get.addParam('x01',100132); 
         gReturn = get.get();
         $('#EloiranyzatTable tr:last').before(gReturn);
         $('#tableContainer').height($('#tableContainer').height() + 32); 
         //$('#EloiranyzatTable > tbody:last').append('<tr><td>column 1 value</td><td>column 2 value</td></tr>');
         //alert(gReturn); 
}

function set_tr_xl(pThis,pXlId){ 
         // alert(pThis);
	 var get = new htmldb_Get(null,&APP_ID.,'APPLICATION_PROCESS=set_tr_xl',6000);
	 get.addParam('x01',$v(pThis));
         get.addParam('x02',pXlId);
         //gReturn = get.get('XML');
         gReturn = get.get();
         var obj = jQuery.parseJSON(gReturn);
         //alert(gReturn);
         //alert(obj.Cell[0].key);
         obj.Cell.forEach(function(element, index, array) {
             // var cellToModify = $('#' + obj.Cell[index].key);
             var cellToModify = $('#' + element.key);
             cellToModify.replaceWith('<div id="'+element.key+'">'+ element.value+'</div>' );
         });
	get = null;
 } 

function showKeyCode(e) {
	// alert( "keyCode for the key pressed: " + e.keyCode + "\n" );
}
var htmldb_delete_message='"DELETE_CONFIRM_MSG"';