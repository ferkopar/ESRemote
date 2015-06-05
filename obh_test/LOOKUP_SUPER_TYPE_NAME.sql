--------------------------------------------------------
--  DDL for Function LOOKUP_SUPER_TYPE_NAME
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "LOOKUP_SUPER_TYPE_NAME" 
(
  P_SUPER_TYPE_ID NUMBER
 ,P_TRANSLATE NUMBER DEFAULT 0
 ,P_LANGUAGE_ID NUMBER DEFAULT 0
) return varchar2 as 

 v_ret varchar2(2000);
begin
  BEGIN
    select SUPER_TYPE_NAME into v_ret from  dm_super_typ WHERE SUPER_TYP_ID = P_SUPER_TYPE_ID;
    IF p_translate != 0 THEN
       v_ret := DM_TRANSLATE_F('DM_SUPER_TYP','SUPER_TYPE_NAME',P_SUPER_TYPE_ID,p_language_id);
    END IF;
  EXCEPTION 
  when OTHERS THEN -- Ha nem talált rekordot super_type tekordot
    return null;
 end;
 return V_RET;
END LOOKUP_SUPER_TYPE_NAME;

/
