--------------------------------------------------------
--  DDL for Function LOOKUP_SUBJ_NAME
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "LOOKUP_SUBJ_NAME" 
(
  P_SUBJ_ID number
) return varchar2 as 

 v_ret varchar2 (2000);
begin
  begin
    select subj_name into v_ret from  subject WHERE subj_id = P_SUBJ_ID;
  EXCEPTION 
  when OTHERS then
    return null;
 end;
 return V_RET;
END LOOKUP_SUBJ_NAME;

/
