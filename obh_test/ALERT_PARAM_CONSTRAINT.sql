--------------------------------------------------------
--  Constraints for Table ALERT_PARAM
--------------------------------------------------------

  ALTER TABLE "ALERT_PARAM" ADD CONSTRAINT "PK_ALERT_PARAM" PRIMARY KEY ("ALERT_PARAM_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS NOCOMPRESS LOGGING
  STORAGE( INITIAL 65536 NEXT 1048576 MAXEXTENTS 2147483645)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "ALERT_PARAM" MODIFY ("ALERT_PARAM_ID" NOT NULL ENABLE);
 
  ALTER TABLE "ALERT_PARAM" MODIFY ("ALERT_ID" NOT NULL ENABLE);
 
  ALTER TABLE "ALERT_PARAM" MODIFY ("PARAM_TYPE_ID" NOT NULL ENABLE);
 
  ALTER TABLE "ALERT_PARAM" MODIFY ("STATUS_ID" NOT NULL ENABLE);
