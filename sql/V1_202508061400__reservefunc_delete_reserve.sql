CREATE OR REPLACE FUNCTION delete_reserve(_id INT)
RETURNS reservations AS $$
    UPDATE reservations
    SET status = 'canceled'
    WHERE id = _id
    RETURNING *;
$$ LANGUAGE SQL;