--------------------------------------------------------
--  Constraints for Table LOG_TABLE
--------------------------------------------------------

  ALTER TABLE "LOG_TABLE" MODIFY ("LOG_ID" NOT NULL ENABLE);
 
  ALTER TABLE "LOG_TABLE" MODIFY ("OPERATION_TYPE" NOT NULL ENABLE);
 
  ALTER TABLE "LOG_TABLE" MODIFY ("OPERATION_TIME" NOT NULL ENABLE);
 
  ALTER TABLE "LOG_TABLE" MODIFY ("TABLE_NAME" NOT NULL ENABLE);
 
  ALTER TABLE "LOG_TABLE" MODIFY ("RECORD_ID" NOT NULL ENABLE);
 
  ALTER TABLE "LOG_TABLE" MODIFY ("USER_NAME" NOT NULL ENABLE);
