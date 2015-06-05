--------------------------------------------------------
--  DDL for Function LOOKUP_MENU_LABEL
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "LOOKUP_MENU_LABEL" 
(
  P_MENU_ID NUMBER
 ,P_TRANSLATE NUMBER DEFAULT 0
 ,P_LANGUAGE_ID NUMBER DEFAULT 0
) return varchar2 as 

 v_ret varchar2(2000);
 v_forgein varchar2(2000);
begin
  BEGIN
    select LABEL into v_ret from  wk_pf_menu WHERE menu_id = p_menu_id;
    IF p_translate != 0 THEN
       v_forgein := DM_TRANSLATE_F('MENU',null,p_menu_id,p_language_id);
      IF v_forgein != 'nn' THEN
        v_ret := v_forgein;
      END IF;
    END IF;
  EXCEPTION 
  when OTHERS THEN -- Ha nem talált rekordot super_type tekordot
    null;
 end;
 return V_RET;
END LOOKUP_MENU_LABEL;

/
