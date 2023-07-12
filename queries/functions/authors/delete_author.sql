CREATE OR REPLACE FUNCTION delete_author(
  p_author_id integer
)
RETURNS VOID
AS $$
BEGIN
  DELETE FROM authors
  WHERE id = p_author_id;
END;
$$ LANGUAGE plpgsql;
