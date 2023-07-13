--Create new book
CREATE OR REPLACE FUNCTION create_book(
  user_id INT,
  book_name VARCHAR(50),
  isbn VARCHAR(13),
  author_ids INT[],
  genre_ids INT[],
  publishing_year INT,
  _description VARCHAR(1000),
  image_url VARCHAR,
  borrowing_period INT,
  quantity INT
)
RETURNS INT
AS $$
DECLARE 
  new_book_id INT;
  author_id INT;
  genre_id INT;
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM users u JOIN roles r 
    ON u.id = r.id 
    WHERE u.id = user_id 
    AND r.name = 'Admin'
    ) THEN RAISE EXCEPTION 'User is not authorized';
  END IF;

  IF NOT EXISTS (
    SELECT 1 FROM authors WHERE id = ANY(author_ids)
  ) THEN RAISE EXCEPTION 'One or more of the author IDs do not exist in the database';
  END IF;

  IF NOT EXISTS (
    SELECT 1 FROM genres WHERE id = ANY(genre_ids)
  ) THEN RAISE EXCEPTION 'One or more of the genre IDs do not exist in the database';
  END IF;

  INSERT INTO books (book_name, isbn, publishing_year, _description, image_url, borrowing_period, quantity)
  VALUES (book_name, isbn, publishing_year, _description, image_url, borrowing_period, quantity)
  RETURNING id INTO new_book_id;

  FOREACH author_id IN ARRAY author_ids LOOP
    INSERT INTO book_author (book_id, author_id)
    VALUES (new_book_id, author_id);
  END LOOP;

  FOREACH genre_id IN ARRAY genre_ids LOOP
    INSERT INTO book_genre (book_id, genre_id)
    VALUES (new_book_id, genre_id);
  END LOOP;

  RETURN new_book_id;
END;
$$
LANGUAGE plpgsql;

--USAGE EXAMPLE:
SELECT create_book(
  2,
  'Shouldnt bbe possible',
  '9780123456789',
  ARRAY[1, 3], -- Author IDs
  ARRAY[2, 4], -- Genre IDs
  2023,
  'Description of Book 6',
  'https://example.com/book6.jpg',
  14,
  5
);