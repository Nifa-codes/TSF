CREATE OR REPLACE FUNCTION add_table(
    _cafe_id INT,
    _capacity INT,
    _number INT,
    _status table_status
)
RETURNS tables AS $$
    INSERT INTO tables ( cafe_id, capacity, number, status)
    VALUES ( _cafe_id, _capacity, _number, _status)
    RETURNING *;
$$ LANGUAGE SQL;