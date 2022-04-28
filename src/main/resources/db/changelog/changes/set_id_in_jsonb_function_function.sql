CREATE OR REPLACE FUNCTION set_id_in_jsonb() RETURNS trigger AS $set_id_in_jsonb$
BEGIN
  NEW.jsonb = jsonb_set(NEW.jsonb, '{id}', to_jsonb(NEW.id));
RETURN NEW;
END;
$set_id_in_jsonb$ LANGUAGE 'plpgsql';

