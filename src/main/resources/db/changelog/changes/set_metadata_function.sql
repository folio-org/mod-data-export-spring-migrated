CREATE OR REPLACE FUNCTION set_metadata() RETURNS trigger AS $set_metadata$
DECLARE
input text;
  createdDate timestamp;
BEGIN
input = NEW.jsonb->'metadata'->>'createdDate';
  IF input IS NULL THEN
    RETURN NEW;
END IF;
  -- time stamp without time zone?
  IF (input::timestamp::timestamptz = input::timestamptz) THEN
    -- createdDate already has no time zone, normalize using ::timestamp
    createdDate = input::timestamp;
ELSE
    -- createdDate has a time zone string
    -- normalize using ::timestamptz, convert to '+00' time zone and remove time zone string
    createdDate = input::timestamptz AT TIME ZONE '+00';
END IF;
  NEW.jsonb = jsonb_set(NEW.jsonb, '{metadata,createdDate}', to_jsonb(createdDate));
  NEW.creation_date = createdDate;
  NEW.created_by = NEW.jsonb->'metadata'->>'createdByUserId';
RETURN NEW;
END;
$set_metadata$ LANGUAGE 'plpgsql';