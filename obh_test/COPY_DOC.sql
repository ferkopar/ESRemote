--------------------------------------------------------
--  DDL for Function COPY_DOC
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "COPY_DOC" 
  (
    p_data_inco_id    number,
    p_target_doc_type out number 
  )
  return number
AS
  cursor tr_xl_rows is 
    select *
      from TR_XL 
      where DATA_INCO_ID = p_data_inco_id
        and STATUS_ID != 919;
  v_dm_xl_row DM_XL%ROWTYPE;      -- source
  v_dm_xl_row_id NUMBER (12,0);   -- target
  v_new_data_inco_id NUMBER (12,0);
BEGIN
  SELECT GROUP_ID into p_target_doc_type from DM_SUPER_TYP where SUPER_TYP_ID =
  (select distinct list_type_id1 from V_DM_XL_REL where LIST_TYPE_ID2 = 100122 AND REL_TYPE_ID = 45);
  select seq_base.nextval into v_new_data_inco_id from dual;
  for tr_xl_row in tr_xl_rows
    loop 
      v_dm_xl_row_id := GET_DM_XL_ID_TO(tr_xl_row.col_dm_xl_id);
      
      if v_dm_xl_row_id is not null then
        
        select * INTO v_dm_xl_row FROM DM_XL WHERE DM_XL_ID = v_dm_xl_row_id;
        
        INSERT_TR_XL_REC(
             p_PARAM_VALUE_CHR      => tr_xl_row.PARAM_VALUE_CHR,
             p_PARAM_UNIT           => tr_xl_row.PARAM_UNIT ,
             p_ROW_DM_XL_ID         => tr_xl_row.ROW_DM_XL_ID,
             p_PARAM_TYPE_ID        => tr_xl_row.PARAM_TYPE_ID,
             p_COL_DM_XL_ID         => v_dm_xl_row.dm_xl_id,
             p_DATA_INCO_ID         => v_new_data_inco_id ,
             p_ORDER_NO             => tr_xl_row.ORDER_NO ,
             p_PARAM_VALUE          => tr_xl_row.PARAM_VALUE ,
             p_COLUMN_DATA_TYPE_ID  => v_dm_xl_row.PARAM_TYPE_ID,
             p_COLUMN_NO            => v_dm_xl_row.ORDER_NO,
             p_LIST_TYPE_ID         => v_dm_xl_row.LIST_TYPE_ID,
             p_STATUS_ID            => 912);
      END IF;
    end loop; 
  return v_new_data_inco_id;
END;

/
