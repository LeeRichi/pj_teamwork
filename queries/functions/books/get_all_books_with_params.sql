--Get all books using parameters for search keyword, column name for sorting, sorting order, number of rows returned and offset of rows
CREATE OR REPLACE FUNCTION get_all_books_with_params(
  keyword TEXT,
  sort_column TEXT,
  sort_order TEXT,
  limit_rows INT,
  offset_rows INT
)
RETURNS TABLE (
  id INT,
  book_name VARCHAR(50),
  isbn VARCHAR(13),
  publishing_year INT,
  _description VARCHAR(1000),
  image_url VARCHAR,
  borrowing_period INT,
  quantity INT
)
AS $$
BEGIN
  RETURN QUERY
  SELECT
    b.*
    FROM books b
    WHERE b.book_name ILIKE '%' || keyword || '%'
    ORDER BY sort_column || ' ' || sort_order
    LIMIT limit_rows OFFSET offset_rows;
END;
$$
LANGUAGE plpgsql;

--USAGE EXAMPLE:
SELECT * FROM get_all_books_with_params('book', 'book_name', 'ASC', 10, 0);