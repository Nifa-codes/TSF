CREATE OR REPLACE FUNCTION update_table(
    _id INT,
    _cafe_id INT,
    _capacity INT,
    _number INT,
    _status table_status
) 
RETURNS tables AS $$
    UPDATE tables
    SET 
        cafe_id = _cafe_id,
        capacity = _capacity,
        number = _number,
        status = _status
    WHERE id = _id
    RETURNING *;
$$ LANGUAGE SQL;