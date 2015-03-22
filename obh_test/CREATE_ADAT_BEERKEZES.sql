--------------------------------------------------------
--  DDL for Procedure CREATE_ADAT_BEERKEZES
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "CREATE_ADAT_BEERKEZES" (
  p_subj_id NUMBER,
  p_inc_type_id NUMBER,
  p_list_type_id NUMBER,
  p_from_date DATE,
  p_to_date  DATE,
  p_data_owner_id NUMBER,
  p_adat_beerkezes_id OUT number
  )
AS
v_beerkezes_id NUMBER (12,0);
BEGIN
begin
   v_beerkezes_id := get_next_id();
   p_adat_beerkezes_id := v_beerkezes_id;
   insert into data_inco 
  (data_inco_id,subj_id,inc_type_id,mm_id,status_id,list_type_id,from_date,to_date,
   param_fdate,param_tdate,
   data_owner_id)
  values
 ( v_beerkezes_id,p_subj_id,
   p_inc_type_id,null,904,
   p_list_type_id,
   p_from_date,
   p_to_date ,
   p_from_date,
   p_to_date ,
   p_data_owner_id
);
--  create_report(v_beerkezes_id );
end;
END;

/
