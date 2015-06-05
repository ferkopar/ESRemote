--------------------------------------------------------
--  Constraints for Table ADMIN_DBA_LOG
--------------------------------------------------------

  ALTER TABLE "ADMIN_DBA_LOG" ADD CONSTRAINT "CKC_BASE_DAT_UPL_ADMIN_DB" CHECK (BASE_DAT_UPL IS NULL OR (BASE_DAT_UPL IN ('Y','N'))) ENABLE;
 
  ALTER TABLE "ADMIN_DBA_LOG" ADD CONSTRAINT "CKC_BASE_TRSL_UPL_ADMIN_DB" CHECK (BASE_TRSL_UPL IS NULL OR (BASE_TRSL_UPL IN ('Y','N'))) ENABLE;
 
  ALTER TABLE "ADMIN_DBA_LOG" ADD CONSTRAINT "PK_ADMIN_DBA_LOG" PRIMARY KEY ("DBA_LOG_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "ADMIN_DBA_LOG" MODIFY ("DBA_LOG_ID" NOT NULL ENABLE);
 
  ALTER TABLE "ADMIN_DBA_LOG" MODIFY ("TABLE_NAME" NOT NULL ENABLE);
 
  ALTER TABLE "ADMIN_DBA_LOG" MODIFY ("TIME_STAMP" NOT NULL ENABLE);