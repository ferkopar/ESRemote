--------------------------------------------------------
--  Ref Constraints for Table PRT_WORK_TIME
--------------------------------------------------------

  ALTER TABLE "PRT_WORK_TIME" ADD CONSTRAINT "FK_DMUS_WKTI" FOREIGN KEY ("USER_ID")
	  REFERENCES "DM_USER" ("USER_ID") ENABLE;
