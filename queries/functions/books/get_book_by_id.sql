--Get book by ID
CREATE OR REPLACE FUNCTION get_book_by_id(input_id INT)
RETURNS TABLE (
  id INT,
  book_name VARCHAR(50),
  isbn VARCHAR(13),
  author VARCHAR[],
  genre VARCHAR[],
  publishing_year INT,
  avg_rating NUMERIC(2,1),
  _description VARCHAR(1000),
  image_url VARCHAR,
  reviews VARCHAR[],
  borrowing_period INT,
  quantity INT
)
AS $$
BEGIN
RETURN QUERY
  SELECT b.id, b.book_name, b.isbn, 
       (SELECT ARRAY_AGG(a.author_name) 
        FROM authors a 
        JOIN book_author ba ON ba.author_id = a.id 
        WHERE ba.book_id = b.id) AS author,
       (SELECT ARRAY_AGG(g.genre_name) 
        FROM genres g 
        JOIN book_genre bg ON bg.genre_id = g.id 
        WHERE bg.book_id = b.id) AS genre,
       b.publishing_year,
       COALESCE(ROUND(AVG(r.rating), 2), 0) AS avg_rating,
       b._description, b.image_url, ARRAY_AGG(r.comment) AS reviews, b.borrowing_period, b.quantity
  FROM books b
  LEFT JOIN reviews r ON b.id = r.book_id
  WHERE b.id = input_id
  GROUP BY b.id;
END;
$$
LANGUAGE plpgsql;

--USAGE EXAMPLE:
SELECT * FROM get_book_by_id(1);