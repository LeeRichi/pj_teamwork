CREATE OR REPLACE FUNCTION update_review(
  review_id INTEGER,
  new_comment CHARACTER VARYING,
  new_rating INTEGER
)
RETURNS VOID
AS $$
BEGIN
  UPDATE reviews
  SET
    comment = new_comment,
    rating = new_rating
  WHERE id = review_id;
END;
$$ LANGUAGE plpgsql;
