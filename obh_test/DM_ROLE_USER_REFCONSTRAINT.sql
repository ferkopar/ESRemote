--------------------------------------------------------
--  Ref Constraints for Table DM_ROLE_USER
--------------------------------------------------------

  ALTER TABLE "DM_ROLE_USER" ADD CONSTRAINT "FK_DMRU_DMRO" FOREIGN KEY ("ROLE_ID")
	  REFERENCES "DM_ROLE" ("ROLE_ID") ENABLE;
 
  ALTER TABLE "DM_ROLE_USER" ADD CONSTRAINT "FK_DMUS_DMRU" FOREIGN KEY ("USER_ID")
	  REFERENCES "DM_USER" ("USER_ID") ENABLE;
