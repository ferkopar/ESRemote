--------------------------------------------------------
--  DDL for Function GET_SUPER_TYP_GROUP_ID
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "GET_SUPER_TYP_GROUP_ID" (p_super_typ_id number)
  RETURN number
AS
 v_retval number;
BEGIN
 select GROUP_ID into v_retval from DM_SUPER_TYP where SUPER_TYP_ID = p_super_typ_id;
return v_retval;
END;

/
