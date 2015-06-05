--------------------------------------------------------
--  DDL for Trigger TRG_TREATM_PARAM
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "TRG_TREATM_PARAM" 
BEFORE INSERT OR UPDATE ON TREATM_PARAM FOR EACH ROW
BEGIN
IF INSERTING THEN
IF 
 :NEW.TREATM_PARAM_ID IS NULL THEN
SELECT SEQ_BASE.NEXTVAL
  INTO :NEW.TREATM_PARAM_ID
  FROM DUAL;
END IF;
:NEW.CRD:=SYSTIMESTAMP;
		   --LÉTREHOZÁS IDŐPONTJA
:NEW.CRU:=NVL(V('APP_USER'),USER);
       --APEX USER AKI LÉTREHOZZA A REKORDOT
ELSIF UPDATING THEN 
  :NEW.MDD:=SYSTIMESTAMP;
	     --MÓDOSÍTÁS IDŐPONTJA
  :NEW.MDU:=NVL(V('APP_USER'),USER);
       --APEX USER AKI MÓDOSÍT
END IF;
END;
/
ALTER TRIGGER "TRG_TREATM_PARAM" ENABLE;