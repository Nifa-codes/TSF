CREATE OR REPLACE FUNCTION get_all_reserves(_cafe_id INT)
RETURNS SETOF reservations AS $$
    SELECT * FROM reservations WHERE cafe_id = _cafe_id;
$$LANGUAGE SQL;