--------------------------------------------------------
--  DDL for Index NDX_ETRP_2
--------------------------------------------------------

  CREATE INDEX "NDX_ETRP_2" ON "EPI_TREATM_PARAM" ("EPI_TREAMT_ID", "PARAM_TYPE_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
