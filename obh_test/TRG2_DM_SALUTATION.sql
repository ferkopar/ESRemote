--------------------------------------------------------
--  DDL for Trigger TRG2_DM_SALUTATION
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "TRG2_DM_SALUTATION" 
BEFORE INSERT OR UPDATE ON AMNIS.DM_SALUTATION FOR EACH ROW
BEGIN
IF INSERTING THEN
IF 
 :NEW.SALUTATION_ID IS NULL THEN
  SELECT SEQ_BASE.NEXTVAL 
 INTO :NEW.SALUTATION_ID FROM DUAL;
END IF;
:NEW.CRD:=SYSTIMESTAMP;		   --LÉTREHOZÁS IDŐPONTJA
:NEW.CRU:=BASE_PKG.V_USER;       --APEX USER AKI LÉTREHOZZA A REKORDOT
ELSIF UPDATING THEN 
  :NEW.MDD:=SYSTIMESTAMP;	     --MÓDOSÍTÁS IDŐPONTJA
  :NEW.MDU:=BASE_PKG.V_USER;       --APEX USER AKI MÓDOSÍT
END IF;
END;
/
ALTER TRIGGER "TRG2_DM_SALUTATION" ENABLE;
