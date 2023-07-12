CREATE OR REPLACE FUNCTION delete_genre(
  p_genre_id integer
)
RETURNS VOID
AS $$
BEGIN
  DELETE FROM genres
  WHERE id = p_genre_id;
END;
$$ LANGUAGE plpgsql;
