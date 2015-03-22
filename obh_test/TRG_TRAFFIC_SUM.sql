--------------------------------------------------------
--  DDL for Trigger TRG_TRAFFIC_SUM
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "TRG_TRAFFIC_SUM" 
BEFORE INSERT OR UPDATE ON AMNIS.TRAFFIC_SUM FOR EACH ROW
BEGIN
  IF INSERTING
  THEN
    IF :new.TRAFFIC_SUM_ID IS NULL OR :new.TRAFFIC_SUM_ID = 0
    THEN
      SELECT SEQ_BASE.NEXTVAL
        INTO :NEW.TRAFFIC_SUM_ID
        FROM DUAL;
    END IF;
    :new.CRD := SYSTIMESTAMP;      --LÉTREHOZÁS IDŐPONTJA
    :NEW.CRU := NVL(V('APP_USER'), USER); --APEX USER AKI LÉTREHOZZA A REKORDOT
  ELSIF UPDATING
  THEN
    :new.MDD := SYSTIMESTAMP;      --MÓDOSÍTÁS IDŐPONTJA
    :NEW.MDU := NVL(V('APP_USER'), USER); --APEX USER AKI MÓDOSÍT
  END IF;
END TRG_TRAFFIC_SUM;
/
ALTER TRIGGER "TRG_TRAFFIC_SUM" ENABLE;
