--Delete book
CREATE OR REPLACE FUNCTION delete_book(user_id INT, p_book_id INT)
RETURNS BOOLEAN
AS $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM users u JOIN roles r 
    ON u.id = r.id 
    WHERE u.id = user_id 
    AND r.name = 'Admin'
    ) THEN RAISE EXCEPTION 'User is not authorized';
  END IF;

  IF NOT EXISTS (SELECT 1 FROM books WHERE id = p_book_id) THEN
    RAISE EXCEPTION 'Book with ID % does not exist.', p_book_id;
  END IF;

  DELETE FROM books
  WHERE id = p_book_id;
  
  RETURN TRUE;
END;
$$
LANGUAGE plpgsql;
