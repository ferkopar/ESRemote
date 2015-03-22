--------------------------------------------------------
--  DDL for Trigger TRG2_MM_FILES
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "TRG2_MM_FILES" 
BEFORE INSERT OR UPDATE ON AMNIS.MM_FILES FOR EACH ROW
BEGIN
IF INSERTING THEN
    IF 
       :NEW.MM_ID IS NULL THEN
       SELECT SEQ_BASE.NEXTVAL 
      INTO :NEW.MM_ID FROM DUAL;
    END IF;
      :new.CRD:=systimestamp;      --LÉTREHOZÁS IDŐPONTJA
      :NEW.CRU:=(NVL(V('APP_USER'),USER)); --APEX USER AKI LÉTREHOZZA A REKORDOT
    ELSIF UPDATING THEN
      :new.MDD:=systimestamp;      --MÓDOSÍTÁS IDŐPONTJA
      :NEW.MDU:=(NVL(V('APP_USER'),USER)); --APEX USER AKI MÓDOSÍT
    END IF;
END;
/
ALTER TRIGGER "TRG2_MM_FILES" ENABLE;
