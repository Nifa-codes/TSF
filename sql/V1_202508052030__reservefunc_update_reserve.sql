CREATE OR REPLACE FUNCTION update_reserve(
    _id INT,
    _cafe_id INT,
    _status reservation_status,
    _date INT,
    _user_id INT,
    _table_id INT
) 
RETURNS reservations AS $$
    UPDATE reservations
    SET 
        cafe_id = _cafe_id,
        status = _status,
        date = _date,
        user_id = _user_id,
        table_id = _table_id
    WHERE id = _id
    RETURNING *;
$$ LANGUAGE SQL;
