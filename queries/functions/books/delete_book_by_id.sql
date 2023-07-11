CREATE OR REPLACE FUNCTION delete_book_by_id(
  book_id INTEGER
)
RETURNS VOID
AS $$
BEGIN
  DELETE FROM books
  WHERE id = book_id;
END;
$$ LANGUAGE plpgsql;
