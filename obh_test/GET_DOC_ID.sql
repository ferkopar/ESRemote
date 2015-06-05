--------------------------------------------------------
--  DDL for Function GET_DOC_ID
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "GET_DOC_ID" (p_data_inco_id number)
  RETURN number
AS
  v_retval number;
BEGIN
  select distinct
    GET_SUPER_TYP_GROUP_ID(TR_XL.LIST_TYPE_ID )
    INTO v_retval
    from tr_xl
    where DATA_INCO_ID = p_data_inco_id ;
  RETURN v_retval;
END;

/
