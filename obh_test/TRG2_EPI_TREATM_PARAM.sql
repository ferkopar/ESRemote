--------------------------------------------------------
--  DDL for Trigger TRG2_EPI_TREATM_PARAM
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "TRG2_EPI_TREATM_PARAM" 
BEFORE INSERT ON AMNIS.EPI_TREATM_PARAM FOR EACH ROW
BEGIN
IF INSERTING THEN
 IF 
 :NEW.EPI_TREATM_PARAM_ID IS NULL THEN
  SELECT SEQ_BASE.NEXTVAL 
 INTO :NEW.EPI_TREATM_PARAM_ID FROM DUAL;
 END IF;
 :NEW.CRD:=SYSTIMESTAMP;            --LÉTREHOZÁS IDŐPONTJA
 :NEW.CRU:=BASE_PKG.V_USER;       --APEX USER AKI LÉTREHOZZA A REKORDOT
ELSIF UPDATING THEN 
  :NEW.MDD:=SYSTIMESTAMP;           --MÓDOSÍTÁS IDŐPONTJA
  :NEW.MDU:=BASE_PKG.V_USER;      --APEX USER AKI MÓDOSÍT
END IF;
END;
/
ALTER TRIGGER "TRG2_EPI_TREATM_PARAM" ENABLE;
