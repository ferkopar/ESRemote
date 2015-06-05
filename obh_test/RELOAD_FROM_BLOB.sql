--------------------------------------------------------
--  DDL for Procedure RELOAD_FROM_BLOB
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "RELOAD_FROM_BLOB" AS 
CURSOR files is
select V_ADAT_BEERKEZES.BEERKEZES_ID as BEERKEZES_ID,
        MM_FILES.status_id as mm_status  
 from MM_FILES MM_FILES, V_ADAT_BEERKEZES V_ADAT_BEERKEZES
where  mm_files.mm_id IS NOT NULL
and mm_files.mm_id = V_ADAT_BEERKEZES.mm_id
and V_ADAT_BEERKEZES.STATUS_ID != 919;

BEGIN
  DELETE FROM TR_XL TX;
  DELETE FROM TR_XL_LOAD_ERR TXLE;
  DELETE FROM TRAFFIC_SUM TS;

  for l_file in files
  loop
     load_tr_xl_from_blob(l_file.BEERKEZES_ID);
  end loop;

  UPDATE TR_XL TX SET TX.STATUS_ID = 914;
  LOAD_TRAFFIC_SUM_FROM_TR_XL();
END;

/
