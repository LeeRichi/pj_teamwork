CREATE OR REPLACE FUNCTION update_role(
  p_role_id integer,
  p_new_role_name character varying(30)
)
RETURNS VOID
AS $$
BEGIN
  UPDATE roles
  SET name = p_new_role_name
  WHERE id = p_role_id;
END;
$$ LANGUAGE plpgsql;
