CREATE OR REPLACE FUNCTION get_all_loans_from_all_users(
  r_user_id INTEGER,
  result_per_page INTEGER,
  page_number INTEGER,
  start_date DATE DEFAULT NULL,
  end_date DATE DEFAULT NULL,
  order_by VARCHAR DEFAULT 'ASC'
) 
RETURNS TABLE (
  loan_id INTEGER,
  user_name TEXT,
  book_name VARCHAR(50),
  borrow_date DATE,
  return_date DATE,
  due_date DATE
)
AS $$
DECLARE
  exception_message TEXT;
  is_librarian BOOLEAN;
BEGIN
  -- Check if the user with r_user_id has 'Librarian' role
  SELECT EXISTS (
    SELECT 1
    FROM users u
    JOIN roles r ON u.role = r.id
    WHERE u.id = r_user_id AND r.name = 'Librarian'
  ) INTO is_librarian;

  IF is_librarian IS FALSE THEN
    RAISE EXCEPTION 'User with ID % is not allowed to run this query.', r_user_id;
  END IF;

  IF start_date IS NOT NULL AND end_date IS NOT NULL AND start_date > end_date THEN
    RAISE EXCEPTION 'start_date must be before end_date.';
  END IF;

  RETURN QUERY
  (
    SELECT
      l.id AS loan_id,
      CONCAT(u.first_name, ' ', u.last_name) AS user_name,
      b.book_name,
      l.borrowed_date AS borrow_date,
      l.returned_date AS return_date,
      l.due_date
    FROM
      loans l
      JOIN users u ON l.user_id = u.id
      JOIN books b ON l.book_id = b.id
    WHERE
      (l.borrowed_date >= start_date OR start_date IS NULL)
      AND (l.borrowed_date <= end_date OR end_date IS NULL)
    ORDER BY
      CASE WHEN order_by = 'ASC' THEN l.borrowed_date END ASC,
      CASE WHEN order_by = 'DESC' THEN l.borrowed_date END DESC
    LIMIT result_per_page
    OFFSET (page_number - 1) * result_per_page
  );

END;
$$ LANGUAGE plpgsql;
