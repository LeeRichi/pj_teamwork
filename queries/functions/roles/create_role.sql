CREATE OR REPLACE FUNCTION create_role(
  p_role_name character varying(30)
)
RETURNS VOID
AS $$
DECLARE
  role_id INTEGER;
BEGIN
  INSERT INTO roles (name)
  VALUES (p_role_name)
    RETURNING id INTO role_id;

END;
$$ LANGUAGE plpgsql;
