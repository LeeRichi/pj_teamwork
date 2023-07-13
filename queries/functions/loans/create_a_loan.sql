CREATE OR REPLACE FUNCTION create_loan(p_user_id INTEGER, p_book_id INTEGER)
  RETURNS JSONB
AS $$
DECLARE
  exception_message TEXT;
  loan_id INTEGER;
  borrow_date DATE := current_date;
  return_date DATE := NULL;
  due_date DATE;
  borrow_limit INTEGER;
  loan_count INTEGER;
  v_borrowing_period INTEGER;
BEGIN
  -- Check if the input user ID exists in the users table
  IF NOT EXISTS (
    SELECT 1
    FROM users
    WHERE id = p_user_id
  ) THEN
    exception_message := 'User with ID ' || p_user_id || ' does not exist.';
    RAISE EXCEPTION '%', exception_message;
  END IF;

  -- Check if the input book ID exists in the books table
  IF NOT EXISTS (
    SELECT 1
    FROM books
    WHERE id = p_book_id
  ) THEN
    exception_message := 'Book with ID ' || p_book_id || ' does not exist.';
    RAISE EXCEPTION '%', exception_message;
  END IF;

  -- Count the number of times the book is already borrowed
  SELECT COUNT(*) INTO loan_count
  FROM loans
  WHERE book_id = p_book_id;

  -- Check if the number of borrowed books exceeds the available quantity
  SELECT quantity INTO borrow_limit
  FROM books
  WHERE id = p_book_id;

  IF loan_count >= borrow_limit THEN
    RAISE NOTICE 'The book with ID % cannot be borrowed due to availability.', p_book_id;
    RETURN NULL;
  END IF;

  -- Calculate the due date based on the borrowing period of the book
  SELECT borrowing_period INTO v_borrowing_period
  FROM books
  WHERE id = p_book_id;

  -- Calculate the due date based on the borrowing period of the book
  due_date := borrow_date + v_borrowing_period;

  -- Insert the new loan record
  INSERT INTO loans (borrowed_date, returned_date, due_date, book_id, user_id)
  VALUES (borrow_date, return_date, due_date, p_book_id, p_user_id)
  RETURNING id INTO loan_id;

  -- Construct the loan object to return
  RETURN JSONB_BUILD_OBJECT(
    'loan_id', loan_id,
    'user_id', p_user_id,
    'book_id', p_book_id,
    'borrow_date', borrow_date,
    'return_date', return_date,
    'due_date', due_date
  );

  EXCEPTION
  	WHEN OTHERS THEN
    	ROLLBACK;
END;
$$ LANGUAGE plpgsql;
