CREATE OR REPLACE FUNCTION get_all_users(
  sort_column TEXT DEFAULT 'id',
  sort_order TEXT DEFAULT 'ASC',
  filter_column TEXT DEFAULT NULL,
  filter_value TEXT DEFAULT NULL,
  page_number INTEGER DEFAULT 1,
  page_limit INTEGER DEFAULT 10
)
RETURNS TABLE (
  id INTEGER,
  first_name CHARACTER VARYING(30),
  last_name CHARACTER VARYING(30),
  email CHARACTER VARYING(50),
  password CHARACTER VARYING(50),
  role INTEGER
)
AS $$
BEGIN
  RETURN QUERY
  SELECT users.id, users.first_name, users.last_name, users.email, users.password, users.role
  FROM users
  WHERE
    CASE WHEN filter_column IS NOT NULL THEN
      filter_column ILIKE '%' || filter_value || '%'
    ELSE TRUE END
  ORDER BY sort_column || ' ' || sort_order
  LIMIT page_limit OFFSET (page_number - 1) * page_limit;
END;
$$ LANGUAGE plpgsql;
