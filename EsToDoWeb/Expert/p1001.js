function goExec(p) {
    window.location.replace("http://157.181.173.15:8080/apex/f?p=" + $v('pFlowId') + ":1001:" + $v('pInstance') + '::::P1001_ALERT_ID:' + $(p).data("alertid"));

}

function goBack() {
    window.location.replace("http://157.181.173.15:8080/apex/f?p=" + $v('pFlowId') + ":1000:" + $v('pInstance') );

}

function accept(p) {
    alert('accept');
    callAjax("ivalidateAlert", p);
    goBack();
}

function decline() {
    alert('decline');
}

function callAjax(process, p) {
    $.post('wwv_flow.show',
       {
           "p_request": "APPLICATION_PROCESS="+ process,
           "p_flow_id": $v('pFlowId'),
           "p_flow_step_id": $v('pFlowStepId'),
           "p_instance": $v('pInstance'),
           "x01": p
       },
        function (data) {
            //do something FUN with the return -> data
            //alert(data);
        }
        )
}