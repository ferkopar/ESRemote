--------------------------------------------------------
--  Ref Constraints for Table DATA_INCO
--------------------------------------------------------

  ALTER TABLE "DATA_INCO" ADD CONSTRAINT "FK_ADBE_DSPT1" FOREIGN KEY ("STATUS_ID")
	  REFERENCES "DM_SUPER_TYP" ("SUPER_TYP_ID") DISABLE;
 
  ALTER TABLE "DATA_INCO" ADD CONSTRAINT "FK_ADBE_MMFS" FOREIGN KEY ("MM_ID")
	  REFERENCES "MM_FILES" ("MM_ID") DISABLE;
