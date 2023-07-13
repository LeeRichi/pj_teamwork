CREATE OR REPLACE FUNCTION get_all_loans_from_a_user(r_user_id INTEGER, q_user_id INTEGER)
  RETURNS TABLE (
    loan_id INTEGER,
	  book_name VARCHAR(50),
    borrow_date DATE,
    return_date DATE,
    due_date DATE
  )
AS $$
DECLARE
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
    IF r_user_id <> q_user_id THEN
      RAISE EXCEPTION 'User with ID % is not allowed to run this query.', r_user_id;
    END IF;
  END IF;
  
  -- Check if the input user ID exists in the users table
  IF NOT EXISTS (
    SELECT 1
    FROM users
    WHERE id = q_user_id
  ) THEN
    RAISE EXCEPTION 'User with ID % does not exist.', p_user_id;
  END IF;

  -- Retrieve the loans of the user
  RETURN QUERY
  SELECT
    l.id AS loan_id,
    b.book_name,
    l.borrowed_date AS borrow_date,
    l.returned_date AS return_date,
    l.due_date
  FROM
    loans l
    JOIN books b ON l.book_id = b.id
  WHERE
    l.user_id = q_user_id
  ORDER BY
    l.borrowed_date DESC
  LIMIT 25;

END;
$$ LANGUAGE plpgsql;
