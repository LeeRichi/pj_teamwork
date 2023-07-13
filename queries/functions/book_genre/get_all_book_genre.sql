CREATE OR REPLACE FUNCTION get_all_book_genre()
  RETURNS json AS
$$
DECLARE
  result json;
BEGIN
  SELECT json_agg(row_to_json(t))
    INTO result
    FROM (
      SELECT book_id, gerne_id
        FROM book_gerne
    ) t;
  
  RETURN result;
END;
$$
LANGUAGE plpgsql;
