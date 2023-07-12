CREATE OR REPLACE FUNCTION login_user(
  p_email TEXT,
  p_password TEXT
)
RETURNS BOOLEAN
AS $$
DECLARE
  is_valid BOOLEAN;
BEGIN
  SELECT EXISTS(
    SELECT 1
    FROM users
    WHERE email = p_email
      AND password = p_password
  ) INTO is_valid;

  RETURN is_valid;
END;
$$ LANGUAGE plpgsql;



SELECT login_user('johndoe@example.com', 'pass123');
