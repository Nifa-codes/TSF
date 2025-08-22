CREATE OR REPLACE FUNCTION add_reserve_cte(
_cafe_id INT,
 _table_id INT,
_user_id INT,
_date INT,
_status reservation_status)
RETURNS reservations AS $$
WITH new_reserve AS(
    INSERT INTO reservations(cafe_id,table_id,user_id, date, status)
    VALUES (_cafe_id, _table_id, _user_id, _date, _status)
    RETURNING *
)
SELECT * FROM new_reserve;
$$ LANGUAGE SQL;

