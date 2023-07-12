CREATE OR REPLACE FUNCTION register_user(
  first_name TEXT,
  last_name TEXT,
  password INTEGER
)
RETURNS INTEGER
AS $$
DECLARE
  user_id INTEGER;
BEGIN
  INSERT INTO public.users (first_name, last_name, password)
  VALUES (first_name, last_name, password)
  RETURNING id INTO user_id;

  RETURN user_id;
END;
$$ LANGUAGE plpgsql;



SELECT register_user('rich', 'lee', 123);
