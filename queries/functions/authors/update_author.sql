CREATE OR REPLACE FUNCTION update_author(
  p_author_id integer,
  p_new_author_name character varying(30)
)
RETURNS VOID
AS $$
BEGIN
  UPDATE authors
  SET author_name = p_new_author_name
  WHERE id = p_author_id;
END;
$$ LANGUAGE plpgsql;
