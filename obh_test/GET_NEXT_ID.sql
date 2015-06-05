--------------------------------------------------------
--  DDL for Function GET_NEXT_ID
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "GET_NEXT_ID" return number is 
v_ret number(12,0);
begin
  select seq_base.nextval into v_ret from dual;
  RETURN v_ret;
END GET_NEXT_ID;

/
