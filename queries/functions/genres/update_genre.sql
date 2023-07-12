CREATE OR REPLACE FUNCTION update_genre(
  p_genre_id integer,
  p_new_genre_name character varying(30)
)
RETURNS VOID
AS $$
BEGIN
  UPDATE genres
  SET genre_name = p_new_genre_name
  WHERE id = p_genre_id;
END;
$$ LANGUAGE plpgsql;
