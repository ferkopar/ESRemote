--------------------------------------------------------
--  DDL for Function LOOKUP_SUPER_TYPE_GROUP_ID
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "LOOKUP_SUPER_TYPE_GROUP_ID" 
(
  P_SUPER_TYPE_ID NUMBER
) return DM_SUPER_TYP.GROUP_ID%TYPE as 

 v_ret DM_SUPER_TYP.GROUP_ID%TYPE;
begin
  begin
    select GROUP_ID into v_ret from  dm_super_typ WHERE SUPER_TYP_ID = P_SUPER_TYPE_ID;
  EXCEPTION 
  when OTHERS then
    return null;
 end;
 return V_RET;
END LOOKUP_SUPER_TYPE_GROUP_ID;

/
