CREATE OR REPLACE FUNCTION register_user(
  first_name TEXT,
  last_name TEXT,
  email TEXT,
  password TEXT
)
RETURNS INTEGER
AS $$
DECLARE
  user_id INTEGER;
BEGIN
  INSERT INTO public.users (first_name, last_name, email, password)
  VALUES (first_name, last_name, email, crypt(password, gen_salt('bf')))
  RETURNING id INTO user_id;

  RETURN user_id;
END;
$$ LANGUAGE plpgsql;


--test
SELECT register_user('dog', 'chi', 'dogchi@example.com', 'password123');
