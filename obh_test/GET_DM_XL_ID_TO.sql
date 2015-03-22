--------------------------------------------------------
--  DDL for Function GET_DM_XL_ID_TO
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "GET_DM_XL_ID_TO" (
   p_dm_xl_from number
  )
  RETURN number
AS
  v_retval number(12,0);
BEGIN
  select DM_XL_REL.DM_XL_ID1 into v_retval FROM DM_XL_REL WHERE DM_XL_ID2 = p_dm_xl_from and REL_TYPE_ID=45;
  RETURN v_retval; 
EXCEPTION
  when no_data_found then
    RETURN null;
  WHEN TOO_MANY_ROWS THEN
    RAISE_APPLICATION_ERROR (-20002,'AMNIS.COPY_DOC TOO_MANY_ROWS:'||p_dm_xl_from);
  WHEN OTHERS THEN
    RETURN null;
END;

/
