CREATE OR REPLACE FUNCTION update_loan(r_user_id INTEGER, p_loan_id INTEGER, is_returned BOOLEAN DEFAULT FALSE)
  RETURNS VOID
AS $$
DECLARE
  exception_message TEXT;
  is_librarian BOOLEAN;
  is_loan_owner BOOLEAN;
BEGIN
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

  -- If is_returned is true, update the returned_date column with the current date
  IF is_returned IS TRUE 
  THEN
    UPDATE loans
    SET returned_date = current_date
    WHERE id = p_loan_id;
  ELSE
    UPDATE loans
    SET due_date = due_date + (SELECT borrowing_period FROM books WHERE id = book_id)
    WHERE id = p_loan_id;
  END IF;
  
END;
$$ LANGUAGE plpgsql;
