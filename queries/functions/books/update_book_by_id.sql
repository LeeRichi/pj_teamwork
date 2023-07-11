CREATE OR REPLACE FUNCTION update_book_by_id(
  book_id INTEGER,
  new_title TEXT
)
RETURNS VOID
AS $$
BEGIN
  UPDATE books
  SET title = new_title
  WHERE id = book_id;
END;
$$ LANGUAGE plpgsql;
