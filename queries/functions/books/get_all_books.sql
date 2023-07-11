CREATE OR REPLACE FUNCTION get_all_books(
  sort_column TEXT DEFAULT 'id',
  sort_order TEXT DEFAULT 'ASC',
  filter_column TEXT DEFAULT NULL,
  filter_value TEXT DEFAULT NULL,
  page_number INTEGER DEFAULT 1,
  page_limit INTEGER DEFAULT 10
)
RETURNS TABLE (
  id INTEGER,
  book_name CHARACTER VARYING(50),
  isbn CHARACTER VARYING(13),
  publishing_year INTEGER,
  _description CHARACTER VARYING(1000),
  image_url CHARACTER VARYING,
  borrowing_period INTEGER,
  quantity INTEGER
)
AS $$
BEGIN
  RETURN QUERY
  SELECT books.id, books.book_name, books.isbn, books.publishing_year, books._description, books.image_url, books.borrowing_period, books.quantity
  FROM books
  WHERE
    CASE WHEN filter_column IS NOT NULL THEN
      filter_column ILIKE '%' || filter_value || '%'
    ELSE TRUE END
  ORDER BY sort_column || ' ' || sort_order
  LIMIT page_limit OFFSET (page_number - 1) * page_limit;
END;
$$ LANGUAGE plpgsql;
