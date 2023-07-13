CREATE OR REPLACE FUNCTION get_all_fines_by_a_user(r_user_id INT, q_user_id INT) RETURNS JSON
AS $$
DECLARE
  exception_message TEXT;
  fines JSON;
  is_librarian BOOLEAN;
BEGIN
  -- Check if the user with r_user_id has 'Librarian' role
  SELECT EXISTS (
    SELECT 1
    FROM users u
    JOIN roles r ON u.role = r.id
    WHERE u.id = r_user_id AND r.name = 'Librarian'
  ) INTO is_librarian;

  IF is_librarian OR q_user_id = r_user_id THEN
    -- Retrieve the fines for the user specified by q_user_id
    SELECT JSON_AGG(
      JSON_BUILD_OBJECT(
        'fine_id', f.id,
        'created_date', f.created_date,
        'due_date', f.due_date,
        'book_name', b.book_name,
        'balance', f.balance
      )
    ) INTO fines
    FROM fine f
    JOIN loans l ON f.loan_id = l.id
    JOIN books b ON l.book_id = b.id
    WHERE l.user_id = q_user_id;
  ELSE
      -- Throw an exception indicating unauthorized access
      exception_message := 'User with ID ' || r_user_id || ' is not authorized to access fines for User with ID ' || q_user_id || '.';
      RAISE EXCEPTION '%', exception_message;
  END IF;
  
  RETURN fines;

  EXCEPTION
  	WHEN OTHERS THEN
    	ROLLBACK;
END;
$$ LANGUAGE plpgsql;
