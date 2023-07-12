CREATE OR REPLACE FUNCTION create_genre(
  p_genre_name character varying(30)
)
RETURNS VOID
AS $$
DECLARE
  genre_id INTEGER;
BEGIN
  INSERT INTO genres (genre_name)
  VALUES (p_genre_name)
    RETURNING id INTO genre_id;
END;
$$ LANGUAGE plpgsql;
