--------------------------------------------------------
--  Ref Constraints for Table MM_FILES
--------------------------------------------------------

  ALTER TABLE "MM_FILES" ADD CONSTRAINT "FK_EPIS_MMFS" FOREIGN KEY ("EPI_ID")
	  REFERENCES "EPI" ("EPI_ID") ENABLE;
 
  ALTER TABLE "MM_FILES" ADD CONSTRAINT "FK_MM_SUPER_TYP" FOREIGN KEY ("STATUS_ID")
	  REFERENCES "DM_SUPER_TYP" ("SUPER_TYP_ID") ENABLE;
