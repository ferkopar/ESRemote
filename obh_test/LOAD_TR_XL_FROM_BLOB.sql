--------------------------------------------------------
--  DDL for Procedure LOAD_TR_XL_FROM_BLOB
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "LOAD_TR_XL_FROM_BLOB" 
(
  P_ADAT_BEERK_ID IN NUMBER  
) AS 

cursor sheets( p_from_date v_dm_excell_columns.to_date%TYPE
              ,p_to_date v_dm_excell_columns.to_date%TYPE
              ,p_beerk_id NUMBER) is
select distinct sheet_name,list_type_id,param_fdate,param_tdate 
from dm_xl
where 
     param_fdate <= TO_DATE('2013.01.01','YYYY.MM.DD')
and   param_tdate >= TO_DATE('2099.12.31','YYYY.MM.DD')
  AND LIST_TYPE_ID IN 
  (SELECT DST.SUPER_TYP_ID FROM DM_SUPER_TYP DST WHERE DST.GROUP_ID = 
   (SELECT Data_inco.list_type_id FROM data_inco WHERE data_inco_id = p_beerk_id ));

cursor lines(p_list_type_id v_dm_excell_columns.list_type_id%TYPE
             ,p_beerkezes_id data_inco.data_inco_id%TYPE) IS

 SELECT * FROM TABLE(FN_GET_DM_XL_ROWS(p_beerkezes_id,p_list_type_id))
  ORDER BY order_no;


cursor xls_columns (p_LIST_TYPE_ID v_dm_excell_columns.list_type_id%TYPE
                   ,p_beerkezes_id data_inco.data_inco_id%TYPE) IS

SELECT * FROM TABLE(FN_GET_DM_XL_COLS(p_beerkezes_id,p_list_type_id))
ORDER BY order_no;


v_adat_beerk_row v_adat_beerkezes%ROWTYPE;
v_xlsx blob;
v_start_row number(12,0);
v_row_no number(12,0);
v_row_correction  number(12,0) := 0;
v_PARAM_VALUE number(12,0);
v_param_string varchar2(4000);
v_first_column number(12,0);
v_param_value_err varchar2(4000);
v_param_type_id number(12,0);
BEGIN
  execute immediate 'ALTER SESSION SET NLS_NUMERIC_CHARACTERS=''.,'' ';
  select * into v_adat_beerk_row from v_adat_beerkezes where BEERKEZES_ID = P_ADAT_BEERK_ID;
  begin
     select mm_blob into v_xlsx from mm_files where mm_files.mm_id = v_adat_beerk_row.mm_id;
     exception
       when others then
       insert into tr_xl_load_err (data_inco_id,description)
            values(v_adat_beerk_row.beerkezes_id, 'Az xls file hibás');
       return;
  end;   
  update mm_files set status_id = 913 where mm_id = v_adat_beerk_row.mm_id;
  for sheet in sheets(v_adat_beerk_row.from_date,v_adat_beerk_row.to_date,v_adat_beerk_row.beerkezes_id)
  LOOP /*
        IF v_adat_beerk_row.LIST_TYPE_ID = 61 THEN
           v_start_row := 9;
        elsif v_adat_beerk_row.intervall_type_id = 20104 and sheet.list_type_id in (53,54,55) then
           v_start_row := 9;
        elsif v_adat_beerk_row.intervall_type_id = 20104 and sheet.list_type_id = 52 then
           v_start_row := 10;
        elsif v_adat_beerk_row.intervall_type_id = 20105 and sheet.list_type_id in (53,54,55) then
           v_start_row := 9;
        elsif v_adat_beerk_row.intervall_type_id = 20105 and sheet.list_type_id = 52 then
           v_start_row := 10;
        elsif v_adat_beerk_row.intervall_type_id = 20106 and sheet.list_type_id in (53,52) then
           v_start_row := 11;
        elsif v_adat_beerk_row.intervall_type_id = 20106 and sheet.list_type_id in (54,55) then
           v_start_row := 10;
        else
         --  raise_application_error(-20101, 'START LINE NOT FOUND : v_adat_beerk_row.intervall_type_id:'||v_adat_beerk_row.intervall_type_id|| ' sheet.list_type_id:'||sheet.list_type_id);
          insert into tr_xl_load_err (BEERKEZES_ID,description)
            values( v_adat_beerk_row.beerkezes_id,'START LINE NOT FOUND : sheet.sheet_name:'||sheet.sheet_name|| ' sheet.list_type_id:'||sheet.list_type_id );
        end if;
        v_row_no := v_start_row;
--        insert into tr_xl_load_err (BEERKEZES_ID,LIST_TYPE_ID,description)
--            values( v_adat_beerk_row.beerkezes_id,sheet.list_type_id,'START LINE FOR : sheet.sheet_name:'||sheet.sheet_name||' is '|| v_start_row||' from_date:'||v_adat_beerk_row.from_date||' to_date:'||v_adat_beerk_row.to_date);
*/
    for line in lines(sheet.list_type_id
                      ,v_adat_beerk_row.BEERKEZES_ID
                      ) LOOP
        
        BEGIN
             v_first_column := ooxml_util_pkg.get_xlsx_cell_value(v_xlsx, sheet.sheet_name, 'A'||to_char(line.order_sign));
        EXCEPTION
         when others then
             v_first_column := null;
        end;
        
        v_param_type_id  := line.param_type_id;
        for xls_column in xls_columns(sheet.list_type_id
                                     ,v_adat_beerk_row.beerkezes_id
                                     )
        loop
          begin       
           v_param_string := ooxml_util_pkg.get_xlsx_cell_value (v_xlsx, sheet.sheet_name, xls_column.ORDER_SIGN||line.order_sign);
           if xls_column.PARAM_UNIT_ID = 20005 then
              v_PARAM_VALUE :=  to_number(v_param_string) * 100; 
           else
              v_PARAM_VALUE := to_number( v_param_string ); 
           end if;
          EXCEPTION  
            WHEN VALUE_ERROR THEN  
            v_PARAM_VALUE_err :=  xls_column.ORDER_SIGN||line.ORDER_NO;
            v_PARAM_VALUE := 0;
            insert into tr_xl_load_err (data_inco_id,description,PARAM_VALUE_ERR)
            values(v_adat_beerk_row.beerkezes_id, 'v_row_no:'||v_row_no|| ' sheet.sheet_name:'||sheet.sheet_name,v_param_string);
          END;
          insert into tr_xl (tr_xl_id,subj_id,list_type_id,param_date,data_inco_id,PARAM_TYPE_ID,
          PARAM_VALUE,COLUMN_NO,STATUS_ID,PARAM_UNIT,order_no,description) 
          values(get_next_id(),v_adat_beerk_row.subj_id,sheet.list_type_id,xls_column.PARAM_DATE_TYPE_ID
          ,v_adat_beerk_row.beerkezes_id,v_param_type_id,v_PARAM_VALUE,xls_column.ORDER_NO
          ,912,xls_column.PARAM_UNIT,v_row_no,v_param_string);
          
        end loop;
        v_row_no := v_row_no + 1;
    end loop; 
 
  end loop;
END LOAD_TR_XL_FROM_BLOB;

/
