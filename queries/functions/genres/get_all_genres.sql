CREATE OR REPLACE FUNCTION get_all_genres()
RETURNS TABLE (
  id INTEGER,
  genre_name CHARACTER VARYING(30)
)
AS $$
BEGIN
  RETURN QUERY
  SELECT genres.id, genres.genre_name
  FROM genres;
END;
$$ LANGUAGE plpgsql;
