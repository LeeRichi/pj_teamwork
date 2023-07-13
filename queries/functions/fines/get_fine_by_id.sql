CREATE OR REPLACE FUNCTION get_fine_by_id(r_user_id INT, p_fine_id INT) RETURNS JSONB
AS $$
DECLARE
  exception_message TEXT;
  fine_info JSONB;
  is_librarian BOOLEAN;
  is_fine_owner BOOLEAN;
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
      FROM fine
	  JOIN loans ON fine.loan_id = loans.id
      WHERE fine.id = p_fine_id AND loans.user_id = r_user_id
    ) INTO is_fine_owner;
  
    IF is_fine_owner IS FALSE THEN
      RAISE EXCEPTION 'User with ID % is not allowed to run this query.', r_user_id;
    END IF;
  END IF;
  
  SELECT
    JSONB_BUILD_OBJECT(
      'id', f.id,
      'user_name', CONCAT(u.first_name, ' ', u.last_name),
	    'email', u.email,
	    'created_date', f.created_date,
	    'due_date', f.due_date,
	    'payment_date', f.payment_date,
      'book_name', b.book_name,
      'balance', f.balance
    )
  INTO
    fine_info
  FROM
    fine f
    JOIN loans l ON f.loan_id = l.id
	JOIN books b ON l.book_id = b.id
	JOIN users u ON u.id = l.user_id
  WHERE
    f.id = p_fine_id;
    
  RETURN fine_info;

END;
$$ LANGUAGE plpgsql;

