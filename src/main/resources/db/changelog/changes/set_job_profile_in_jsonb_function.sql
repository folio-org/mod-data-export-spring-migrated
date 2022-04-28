CREATE OR REPLACE FUNCTION set_job_profile_in_jsonb() RETURNS trigger AS $set_job_profile_in_jsonb$
BEGIN
      NEW.jobProfileId = (NEW.jsonb->>'jobProfileId');
RETURN NEW;
END;
$set_job_profile_in_jsonb$ LANGUAGE 'plpgsql';