declare 
l_emp_id varchar(255);
l_tr_xl_id varchar(255);
return_str varchar(255);
BEGIN
/*
    
    htp.init;
    --owa_util.mime_header('application/json', false);
    owa_util.mime_header('text/html', false);
    htp.p('Cache-Control: no-cache');
    htp.p('Pragma: no-cache');
    owa_util.http_header_close;
   -- insert into fpardi.debug (text) values (l_emp_id||'-'||l_tr_xl_id  );
    SET_TR_XL_PARAM_VALUE(l_tr_xl_id,l_emp_id);
    return_str := '{"model":["qqqqqqqqq","ppppppppp"] }';
   htp.prn(return_str);  
*/
    l_emp_id   := wwv_flow.g_x01;
    l_tr_xl_id := wwv_flow.g_x02;
    htp.init;
    --owa_util.mime_header('application/json', false);
    owa_util.mime_header('text/html', false);
    htp.p('Cache-Control: no-cache');
    htp.p('Pragma: no-cache');
    owa_util.http_header_close;
    SET_TR_XL_PARAM_VALUE(l_tr_xl_id,l_emp_id);
/*
    htp.p('{"Cell": [{');
    htp.p('        "key": "cell_id_1308570863",');
    htp.p('        "value": "222"');
    htp.p('        },');
    htp.p('        {');
    htp.p('        "key": "cell_id_1308570872",');
    htp.p('        "value": "333"');
    htp.p('        }');
    htp.p('    ]}');
*/  
END;