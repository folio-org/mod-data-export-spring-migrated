CREATE OR REPLACE FUNCTION update_metadata_created_date() RETURNS trigger AS $update_metadata_created_date$
BEGIN
  if NEW.creation_date IS NULL then
    RETURN NEW;
end if;

  NEW.jsonb = jsonb_set(NEW.jsonb, '{metadata,createdDate}', to_jsonb(NEW.creation_date));
  if NEW.created_by IS NULL then
    NEW.jsonb = NEW.jsonb #- '{metadata,createdByUserId}';
else
    NEW.jsonb = jsonb_set(NEW.jsonb, '{metadata,createdByUserId}', to_jsonb(NEW.created_by));
end if;
RETURN NEW;
END;
$update_metadata_created_date$ LANGUAGE 'plpgsql';