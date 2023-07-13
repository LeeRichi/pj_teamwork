CREATE OR REPLACE FUNCTION delete_loan(r_user_id INTEGER, p_loan_id INTEGER)
  RETURNS VOID
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
  
  -- Check if the input loan ID exists in the loans table
  IF NOT EXISTS (
    SELECT 1
    FROM loans
    WHERE id = p_loan_id
  ) THEN
    exception_message := 'Loan with ID ' || p_loan_id || ' does not exist.';
    RAISE EXCEPTION '%', exception_message;
  END IF;

  DELETE FROM loans
	WHERE loans.id = p_loan_id;

END;
$$ LANGUAGE plpgsql;
