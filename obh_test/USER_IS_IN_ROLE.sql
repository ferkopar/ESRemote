--------------------------------------------------------
--  DDL for Function USER_IS_IN_ROLE
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "USER_IS_IN_ROLE" 
(
  P_USER_NAME IN VARCHAR2 ,
  P_ROLE_ID IN NUMBER
) RETURN NUMBER AS 
v_user_type_id number (12,0);
v_user_id NUMBER (12,0);
v_user_in_role NUMBER (10) := 0;
BEGIN
  select subj_id  into v_user_id from dm_user where user_name = P_USER_NAME;
  SELECT count(1) INTO v_user_in_role FROM dm_role_user WHERE user_id = v_user_id AND role_id = p_role_id;
  RETURN v_user_in_role;
END USER_IS_IN_ROLE ;

/
