CREATE OR REPLACE FUNCTION get_reserve(_id INT)
RETURNS SETOF reservations AS $$ 
    SELECT * FROM reservations WHERE id = _id;
$$ LANGUAGE SQL;