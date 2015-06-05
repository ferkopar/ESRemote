--------------------------------------------------------
--  DDL for Procedure CPY_DM_XL_DOC
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "CPY_DM_XL_DOC" (p_doc_id dm_super_typ.super_typ_id%TYPE,
                                                 p_param_fdate dm_xl.param_fdate%TYPE,
                                                 p_param_tdate dm_xl.param_tdate%TYPE)
AS
  cursor listak is 
         select SUPER_TYP_id,SUPER_TYPE_NAME 
          from dm_super_typ 
          where GROUP_ID  = p_doc_id
          and EXISTS (select 1 from dm_xl where LIST_TYPE_ID =dm_super_typ.SUPER_TYP_ID
                                            and PARAM_FDATE = p_param_fdate
                                            and PARAM_TDATE = p_param_tdate);
BEGIN
  for l in listak
   loop
     dbms_output.put_line('CPY_DM_XL_DOC:'||l.SUPER_TYP_id||' '||l.SUPER_TYPE_NAME||' feldolgozása.');
     CPY_DM_XL_LIST (p_list_id => l.SUPER_TYP_id
                   , p_param_fdate => p_param_fdate
                    , p_param_tdate => p_param_tdate);
   end loop;
END;

/
