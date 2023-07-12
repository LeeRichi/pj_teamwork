CREATE OR REPLACE FUNCTION delete_review(
  review_id INTEGER
)
RETURNS VOID
AS $$
BEGIN
  DELETE FROM reviews
  WHERE id = review_id;
END;
$$ LANGUAGE plpgsql;
