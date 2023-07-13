CREATE OR REPLACE FUNCTION login_user(
  p_email TEXT,
  p_password TEXT
)
RETURNS BOOLEAN
AS $$
DECLARE
  is_valid BOOLEAN;
  hashed_password TEXT;
BEGIN
  SELECT password INTO hashed_password
  FROM users
  WHERE email = p_email;

  IF hashed_password IS NOT NULL AND crypt(p_password, hashed_password) = hashed_password THEN
    is_valid := TRUE;
    RAISE NOTICE 'Login successful';
  ELSE
    is_valid := FALSE;
    RAISE NOTICE 'Login fail';
  END IF;

END;
$$ LANGUAGE plpgsql;
