CREATE OR REPLACE FUNCTION get_available_tables(_cafe_id INT) 
RETURNS SETOF tables AS $$
    SELECT * 
    FROM tables 
    WHERE 
        cafe_id = _cafe_id 
        AND status = 'available';
$$ LANGUAGE SQL;