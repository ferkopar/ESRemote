--------------------------------------------------------
--  DDL for Procedure BULK_LOAD_FROM_BLOB
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "BULK_LOAD_FROM_BLOB" AS 
CURSOR files is
select V_ADAT_BEERKEZES.BEERKEZES_ID as BEERKEZES_ID,
        MM_FILES.status_id as mm_status  
 from MM_FILES MM_FILES, V_ADAT_BEERKEZES V_ADAT_BEERKEZES
where mm_files.mm_id = V_ADAT_BEERKEZES.mm_id
and V_ADAT_BEERKEZES.STATUS_ID != 919
and MM_FILES.status_id= 912;

BEGIN
  for l_file in files
  loop
     load_tr_xl_from_blob(l_file.BEERKEZES_ID);
  end loop;
END;

/
