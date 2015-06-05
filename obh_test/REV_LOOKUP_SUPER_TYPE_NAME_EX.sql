--------------------------------------------------------
--  DDL for Function REV_LOOKUP_SUPER_TYPE_NAME_EX
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "REV_LOOKUP_SUPER_TYPE_NAME_EX" 
(
  P_SUPER_TYPE_NAME varchar2
) return number as 

 v_ret number (12,0);
begin
  begin
    select SUPER_TYP_ID into V_RET from DM_SUPER_TYP 
    where 
    REPLACE(UPPER(TRIM(SUPER_TYPE_NAME)),' ','') = REPLACE(UPPER(TRIM(P_SUPER_TYPE_NAME)),' ','');
  EXCEPTION 
  when OTHERS then
    return 2106;
 end;
 return V_RET;
END REV_LOOKUP_SUPER_TYPE_NAME_EX;

/
