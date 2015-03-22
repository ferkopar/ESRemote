--------------------------------------------------------
--  DDL for Function GET_APEX_LINK
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "GET_APEX_LINK" (
  p_alert_id NUMBER)
  RETURN VARCHAR2
AS
v_apex_page VARCHAR2 (255);
v_apex_param_name_list VARCHAR2 (2000);
v_apex_param_value_list VARCHAR2 (2000);
BEGIN
  SELECT ap.apex_page INTO v_apex_page FROM alert_param ap WHERE alert_id = p_alert_id AND param_type_id = 30201;
  v_apex_param_name_list := 'P1900_ALERT_ID,';
  v_apex_param_value_list := p_alert_id||',';
 FOR param IN (SELECT * FROM alert_param WHERE alert_id = p_alert_id AND param_type_id = 30202)
  LOOP
    v_apex_param_name_list := v_apex_param_name_list || param.APEX_VARIABLE ||',';
    v_apex_param_value_list := v_apex_param_value_list || param.value ||',';
  END LOOP;
   v_apex_param_name_list := substr(v_apex_param_name_list,1,length(v_apex_param_name_list)-1);
   v_apex_param_value_list := substr(v_apex_param_value_list,1,length(v_apex_param_value_list)-1);
  RETURN '<a href = "f?p='||V('APP_ID')||':'||v_apex_page||':'||V('APP_SESSION')||'::NO::'||v_apex_param_name_list||':'||v_apex_param_value_list||'"><img  style="width:16px;height:16px;"  src="'|| V('WORKSPACE_IMAGES') ||'056.ico"</a>';
END;

/
