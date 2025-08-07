CREATE OR REPLACE FUNCTION get_tables(_cafe_id INT) 
RETURNS SETOF tables AS $$
    SELECT * FROM tables WHERE cafe_id = _cafe_id;
$$ LANGUAGE SQL;