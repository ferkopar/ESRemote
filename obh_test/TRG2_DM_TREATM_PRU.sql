--------------------------------------------------------
--  DDL for Trigger TRG2_DM_TREATM_PRU
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "TRG2_DM_TREATM_PRU" 
BEFORE INSERT OR UPDATE ON AMNIS.TREATM_PRU FOR EACH ROW
BEGIN
IF INSERTING THEN
IF 
 :NEW.TREATM_PRU_ID IS NULL THEN
  SELECT SEQ_BASE.NEXTVAL 
 INTO :NEW.TREATM_PRU_ID FROM DUAL;
END IF;
:NEW.CRD:=SYSTIMESTAMP;		   --LÉTREHOZÁS IDŐPONTJA
:NEW.CRU:=BASE_PKG.V_USER;       --APEX USER AKI LÉTREHOZZA A REKORDOT
ELSIF UPDATING THEN 
  :NEW.MDD:=SYSTIMESTAMP;	     --MÓDOSÍTÁS IDŐPONTJA
  :NEW.MDU:=BASE_PKG.V_USER;       --APEX USER AKI MÓDOSÍT
END IF;
END;
/
ALTER TRIGGER "TRG2_DM_TREATM_PRU" ENABLE;
