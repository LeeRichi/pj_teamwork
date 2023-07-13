CREATE OR REPLACE FUNCTION get_user_by_id(user_id integer)
  RETURNS json AS
$$
DECLARE
  result json;
BEGIN
  SELECT json_agg(row_to_json(t))
    INTO result
    FROM (
      SELECT id, first_name, last_name, email, password, role
        FROM users
       WHERE id = user_id
    ) t;
  
  RETURN result;
END;
$$
LANGUAGE plpgsql;
