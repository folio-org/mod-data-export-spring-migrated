CREATE OR REPLACE FUNCTION set_mapping_profile_in_jsonb() RETURNS trigger AS $set_mapping_profile$
BEGIN
      NEW.mappingProfileId = (NEW.jsonb->>'mappingProfileId');
RETURN NEW;
END;
$set_mapping_profile$ LANGUAGE 'plpgsql';