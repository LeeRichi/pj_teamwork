CREATE OR REPLACE FUNCTION delete_role(
  p_role_id integer
)
RETURNS VOID
AS $$
BEGIN
  DELETE FROM roles
  WHERE id = p_role_id;
END;
$$ LANGUAGE plpgsql;
