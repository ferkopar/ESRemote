--------------------------------------------------------
--  DDL for Function LOOKUP_SUPER_TYPE_DESCRIPTION
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "LOOKUP_SUPER_TYPE_DESCRIPTION" 
(
  P_SUPER_TYPE_ID NUMBER
) return varchar2 as 

 v_ret varchar2(2000);
begin
  begin
    select DESCRIPTION into v_ret from  dm_super_typ WHERE SUPER_TYP_ID = P_SUPER_TYPE_ID;
  EXCEPTION 
  when OTHERS then
    return null;
 end;
 return V_RET;
END LOOKUP_SUPER_TYPE_DESCRIPTION;

/
