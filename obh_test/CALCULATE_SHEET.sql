--------------------------------------------------------
--  DDL for Procedure CALCULATE_SHEET
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "CALCULATE_SHEET" 
  (
      p_beerk_id data_inco.data_inco_id%TYPE,
      p_list_id NUMBER 
  )
AS
  cursor lines(p_list_type_id v_dm_excell_columns.list_type_id%TYPE
             ,p_beerkezes_id data_inco.data_inco_id%TYPE) IS

 SELECT * FROM TABLE(FN_GET_DM_XL_ROWS(p_beerkezes_id,p_list_type_id))
  ORDER BY order_no;


cursor xls_columns (p_LIST_TYPE_ID v_dm_excell_columns.list_type_id%TYPE
                   ,p_beerkezes_id data_inco.data_inco_id%TYPE) IS

SELECT * FROM TABLE(FN_GET_DM_XL_COLS(p_beerkezes_id,p_list_type_id))
ORDER BY order_no;

  v_number NUMBER;
  v_tr_xl_row tr_xl%ROWTYPE;
BEGIN
   for line in lines(p_list_id
                      ,p_beerk_id
                      ) 
    LOOP
        
        for xls_column in xls_columns(p_list_id
                      ,p_beerk_id
                                     )
        LOOP
          SELECT * INTO v_tr_xl_row FROM tr_xl 
            WHERE data_inco_id = p_beerk_id
            AND list_type_id = p_list_id
            AND param_type_id = line.param_type_id
            AND column_no = xls_column.order_no
            AND status_id != 919;
          IF line.inc_type_id = 20206 THEN
            v_number := calculate_row_value( p_beerk_id,xls_column.order_no,line.param_type_id, p_list_id );
            UPDATE tr_xl tx SET param_value = v_number WHERE tr_xl_id = v_tr_xl_row.tr_xl_id;
          ELSIF xls_column.inc_type_id = 20206 THEN
            v_number := calculate_col_value( p_beerk_id,xls_column.order_no,line.param_type_id, p_list_id );
            UPDATE tr_xl tx SET param_value = v_number WHERE tr_xl_id = v_tr_xl_row.tr_xl_id;
          END IF;
        END LOOP;
   END LOOP;
END;

/
