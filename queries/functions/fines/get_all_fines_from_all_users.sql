CREATE OR REPLACE FUNCTION get_all_fines_from_all_users(
  r_user_id INT,
  result_per_page INT,
  page_number INT,
  start_date DATE DEFAULT NULL,
  end_date DATE DEFAULT NULL,
  order_by VARCHAR DEFAULT 'ASC'
) 
RETURNS TABLE (
  fine_id INTEGER,
  user_name TEXT,
  email VARCHAR,
  created_date DATE,
  due_date DATE,
  payment_date DATE,
  book_name VARCHAR,
  balance NUMERIC(5,2)[]
)
AS $$
DECLARE
  exception_message TEXT;
  is_librarian BOOLEAN;
BEGIN
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
  SELECT
    f.id,
    CONCAT(u.first_name, ' ', u.last_name) AS user_name,
    u.email,
    f.created_date,
    f.due_date,
    f.payment_date,
    b.book_name,
    f.balance
  FROM
    fine f
    JOIN loans l ON f.loan_id = l.id
    JOIN books b ON l.book_id = b.id
    JOIN users u ON u.id = l.user_id
  WHERE
    (start_date IS NULL OR f.created_date >= start_date)
    AND (end_date IS NULL OR f.created_date <= end_date)
  ORDER BY
      CASE WHEN order_by = 'ASC' THEN f.created_date END ASC,
      CASE WHEN order_by = 'DESC' THEN f.created_date END DESC
  LIMIT result_per_page
  OFFSET (page_number - 1) * result_per_page;

END;
$$ LANGUAGE plpgsql;
