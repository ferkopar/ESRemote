--------------------------------------------------------
--  DDL for Trigger TRG_ALERT_PARAM
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "TRG_ALERT_PARAM" 
BEFORE INSERT OR UPDATE ON AMNIS.ALERT_PARAM FOR EACH ROW
BEGIN
IF INSERTING THEN
IF 
 :NEW.ALERT_PARAM_ID IS NULL THEN
  SELECT SEQ_BASE.NEXTVAL 
 INTO :NEW.ALERT_PARAM_ID FROM DUAL;
END IF;
:NEW.CRD:=SYSTIMESTAMP;		   --LÉTREHOZÁS IDŐPONTJA
:NEW.CRU:=NVL(V('APP_USER'),USER);        --APEX USER AKI LÉTREHOZZA A REKORDOT
ELSIF UPDATING
THEN
  :NEW.MDD:=SYSTIMESTAMP;	     --MÓDOSÍTÁS IDŐPONTJA
  :NEW.MDU:=NVL(V('APP_USER'),USER);       --APEX USER AKI MÓDOSÍT
END IF;
END;
/
ALTER TRIGGER "TRG_ALERT_PARAM" ENABLE;