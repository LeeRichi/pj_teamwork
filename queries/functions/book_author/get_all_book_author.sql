CREATE OR REPLACE FUNCTION get_all_book_author()
  RETURNS json AS
$$
DECLARE
  result json;
BEGIN
  SELECT json_agg(row_to_json(t))
    INTO result
    FROM (
      SELECT book_id, author_id
        FROM book_author
    ) t;
  
  RETURN result;
END;
$$
LANGUAGE plpgsql;
