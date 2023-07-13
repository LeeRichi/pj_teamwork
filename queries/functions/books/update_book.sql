--Update book
CREATE OR REPLACE FUNCTION update_book(
  p_user_id INT,
  p_book_id INT,
  p_book_name VARCHAR(50) = NULL,
  p_isbn VARCHAR(13) = NULL,
  p_author_ids INT[] = NULL,
  p_genre_ids INT[] = NULL,
  p_publishing_year INT = NULL,
  p_description VARCHAR(1000) = NULL,
  p_image_url VARCHAR = NULL,
  p_borrowing_period INT = NULL,
  p_quantity INT = NULL
)
RETURNS BOOLEAN
AS $$
DECLARE
  existing_author_ids INT[];
  existing_genre_ids INT[];
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM users u JOIN roles r 
    ON u.id = r.id 
    WHERE u.id = p_user_id 
    AND r.name = 'Admin'
    ) THEN RAISE EXCEPTION 'User is not authorized';
  END IF;

  IF NOT EXISTS (SELECT 1 FROM books WHERE id = p_book_id) THEN
    RAISE EXCEPTION 'Book with ID % does not exist.', p_book_id;
  END IF;

  SELECT ARRAY_AGG(author_id) INTO existing_author_ids
  FROM book_author ba
  WHERE ba.book_id = p_book_id;

  SELECT ARRAY_AGG(genre_id) INTO existing_genre_ids
  FROM book_genre bg
  WHERE bg.book_id = p_book_id;

  UPDATE books
  SET 
    book_name = COALESCE(p_book_name, books.book_name),
    isbn = COALESCE(p_isbn, books.isbn),
    publishing_year = COALESCE(p_publishing_year, books.publishing_year),
    _description = COALESCE(p_description, books._description),
    image_url = COALESCE(p_image_url, books.image_url),
    borrowing_period = COALESCE(p_borrowing_period, books.borrowing_period),
    quantity = COALESCE(p_quantity, books.quantity)
  WHERE
    id = p_book_id;

  IF p_author_ids IS NOT NULL AND
    EXISTS (SELECT 1 FROM UNNEST(p_author_ids) AS author_id
    WHERE author_id NOT IN (SELECT id FROM authors)) THEN
    RAISE EXCEPTION 'One or more author IDs do not exist.';
  END IF;

  IF p_genre_ids IS NOT NULL AND
    EXISTS (SELECT 1 FROM UNNEST(p_genre_ids) AS genre_id
    WHERE genre_id NOT IN (SELECT id FROM genres)) THEN
    RAISE EXCEPTION 'One or more genre IDs do not exist.';
  END IF;

  IF p_author_ids IS NOT NULL THEN
    DELETE FROM book_author
    WHERE book_id = p_book_id;

    INSERT INTO book_author (book_id, author_id)
    SELECT p_book_id, author_id
    FROM UNNEST(p_author_ids) AS author_id;
  END IF;

  IF p_genre_ids IS NOT NULL THEN
    DELETE FROM book_genre
    WHERE book_id = p_book_id;

    INSERT INTO book_genre (book_id, genre_id)
    SELECT p_book_id, genre_id
    FROM UNNEST(p_genre_ids) AS genre_id;
  END IF;

  RETURN TRUE;
END;
$$
LANGUAGE plpgsql;

--USAGE EXAMPLE:
SELECT update_book(1, 'New Book Name', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);