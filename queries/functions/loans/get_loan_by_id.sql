CREATE OR REPLACE FUNCTION get_loan_by_id_2(r_user_id INT, p_loan_id INT) 
RETURNS JSON AS $$
DECLARE
  result JSON;
  is_librarian BOOLEAN;
  is_loan_owner BOOLEAN;
BEGIN
  -- Check if the user with r_user_id has 'Librarian' role
  SELECT EXISTS (
    SELECT 1
    FROM users u
    JOIN roles r ON u.role = r.id
    WHERE u.id = r_user_id AND r.name = 'Librarian'
  ) INTO is_librarian;
  
  IF is_librarian IS FALSE THEN
    SELECT EXISTS (
      SELECT 1
      FROM loans
      WHERE id = p_loan_id AND user_id = r_user_id
    ) INTO is_loan_owner;
  
    IF is_loan_owner IS FALSE THEN
      RAISE EXCEPTION 'User with ID % is not allowed to run this query.', r_user_id;
    END IF;
  END IF;
  
  SELECT
    json_build_object(
      'loan_id', l.id,
      'is_librarian', is_librarian,
      'is_loan_owner', is_loan_owner,
      'user_name', CONCAT(u.first_name, ' ', u.last_name),
      'book_name', b.book_name,
      'borrow_date', l.borrowed_date,
      'return_date', l.returned_date,
      'due_date', l.due_date
    )
  INTO result
  FROM
    loans l
    JOIN users u ON l.user_id = u.id
    JOIN books b ON l.book_id = b.id
  WHERE
    l.id = p_loan_id;
  
  RETURN result;
END;
$$ LANGUAGE plpgsql;
