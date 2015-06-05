--------------------------------------------------------
--  DDL for Function GET_SUBJ_ID
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "GET_SUBJ_ID" 
(
  P_USER_NAME IN VARCHAR2  
) RETURN NUMBER AS 
v_user_id number (12,0);
BEGIN
  select subj_id  into v_user_id from dm_user where user_name = P_USER_NAME;
  RETURN v_user_id;
END GET_SUBJ_ID;

/
