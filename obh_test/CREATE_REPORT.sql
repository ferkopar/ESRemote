--------------------------------------------------------
--  DDL for Procedure CREATE_REPORT
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "CREATE_REPORT" 
 (
    p_beerkezes_id NUMBER
 )
AS
  cursor sheets( 
              p_list_group_id number) IS

SELECT * from
(SELECT 
  DISTINCT 
  dx.list_type_id,
  (SELECT dst.group_id FROM dm_super_typ dst WHERE dst.super_typ_id = dx.list_type_id) list_group_id
  FROM dm_xl dx) xx
  WHERE xx.list_group_id = p_list_group_id;

  cursor lines(p_list_type_id v_dm_excell_columns.list_type_id%TYPE
             ,p_beerkezes_id data_inco.data_inco_id%TYPE) IS

 SELECT * FROM TABLE(FN_GET_DM_XL_ROWS(p_beerkezes_id,p_list_type_id))
  ORDER BY order_no;


cursor xls_columns (p_LIST_TYPE_ID v_dm_excell_columns.list_type_id%TYPE
                   ,p_beerkezes_id data_inco.data_inco_id%TYPE) IS

SELECT * FROM TABLE(FN_GET_DM_XL_COLS(p_beerkezes_id,p_list_type_id))
ORDER BY order_no;


  v_adat_beerk_row v_adat_beerkezes%ROWTYPE;
  v_number NUMBER (15,2);
  v_param_adate_type_id NUMBER (12,0);
  v_previous_beerk_id NUMBER (12,0);
  v_param_d1value NUMBER (12,0);

BEGIN
  select * into v_adat_beerk_row from v_adat_beerkezes where BEERKEZES_ID = p_beerkezes_id;
  for sheet in sheets(v_adat_beerk_row.list_type_id) LOOP
     for line in lines(sheet.list_type_id,v_adat_beerk_row.BEERKEZES_ID) LOOP
         for xls_column in xls_columns(sheet.list_type_id, v_adat_beerk_row.beerkezes_id) LOOP
             SELECT param_adate_type_id INto v_param_adate_type_id FROM dm_xl WHERE dm_xl_id = xls_column.dm_xl_id;
             SELECT param_d1value INto v_param_d1value  FROM dm_xl WHERE dm_xl_id = xls_column.dm_xl_id;
             IF xls_column.INC_TYPE_ID = 20203 THEN  
                v_number := NULL;
             ELSIF xls_column.INC_TYPE_ID = 20204 
              THEN BEGIN
                SELECT data_inco_id INTO v_previous_beerk_id FROM data_inco ab 
                WHERE subj_id = v_adat_beerk_row.subj_id 
                  AND ab.param_fdate = v_adat_beerk_row.from_date
                  AND ab.param_tdate = last_day( ADD_MONTHS(v_adat_beerk_row.to_date,v_param_d1value ));
              SELECT param_value INTO v_number FROM tr_xl tx 
                 WHERE data_inco_id = v_previous_beerk_id
                 AND param_type_id = line.param_type_id
                 AND column_no = 6
                 AND list_type_id = sheet.list_type_id;
              EXCEPTION  
              WHEN OTHERS THEN 
                v_number := -2;
              END;

              ELSIF xls_column.INC_TYPE_ID = 20205 
              THEN BEGIN
                SELECT data_inco_id INTO v_previous_beerk_id FROM data_inco ab 
                WHERE subj_id = v_adat_beerk_row.subj_id 
                  AND ab.param_fdate = v_adat_beerk_row.from_date
                  AND ab.param_tdate = last_day( ADD_MONTHS(v_adat_beerk_row.to_date,-1 ));
              SELECT param_value INTO v_number FROM tr_xl tx 
                 WHERE data_inco_id = v_previous_beerk_id
                 AND param_type_id = line.param_type_id
                 AND column_no = xls_column.order_no
                 AND list_type_id = sheet.list_type_id;
              EXCEPTION  
              WHEN OTHERS THEN 
                v_number := -2;
              END;
    

              ELSIF xls_column.INC_TYPE_ID = 20206 
              THEN BEGIN
                SELECT data_inco_id INTO v_previous_beerk_id FROM data_inco ab 
                WHERE subj_id = v_adat_beerk_row.subj_id 
                  AND ab.param_fdate = v_adat_beerk_row.from_date
                  AND ab.param_tdate = last_day( ADD_MONTHS(v_adat_beerk_row.to_date,-1 ));
              SELECT param_value INTO v_number FROM tr_xl tx 
                 WHERE data_inco_id = v_previous_beerk_id
                 AND param_type_id = line.param_type_id
                 AND column_no = xls_column.order_no
                 AND list_type_id = sheet.list_type_id;
              EXCEPTION  
              WHEN OTHERS THEN 
                v_number := -2;
              END;

              ELSE v_number := -1;
             END IF;
             INSERT INTO tr_xl (LIST_TYPE_ID,param_date,param_type_id,param_value,param_unit,subj_id,column_no,
              data_inco_id,status_id)
              VALUES(sheet.list_type_id,xls_column.param_date_type_id,line.param_type_id,v_number,xls_column.param_unit,
              v_adat_beerk_row.subj_id,xls_column.order_no,v_adat_beerk_row.beerkezes_id,913);
          END LOOP;
        
      END LOOP;
  END LOOP;
END;

/
