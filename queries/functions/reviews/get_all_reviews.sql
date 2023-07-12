CREATE OR REPLACE FUNCTION get_all_reviews_for_book(
  book_id INTEGER,
  sort_column TEXT DEFAULT 'id',
  sort_order TEXT DEFAULT 'ASC',
  page_number INTEGER DEFAULT 1,
  page_limit INTEGER DEFAULT 10
)
RETURNS TABLE (
  id INTEGER,
  comment CHARACTER VARYING,
  rating SMALLINT,
  book_id INTEGER,
  user_id INTEGER
)
AS $$
BEGIN
  RETURN QUERY
  SELECT reviews.id, reviews.comment, reviews.rating, reviews.book_id, reviews.user_id
  FROM reviews
  WHERE reviews.book_id = book_id
  ORDER BY sort_column || ' ' || sort_order
  LIMIT page_limit OFFSET (page_number - 1) * page_limit;
END;
$$ LANGUAGE plpgsql;
