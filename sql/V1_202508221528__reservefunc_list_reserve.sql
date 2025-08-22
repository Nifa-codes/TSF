CREATE OR REPLACE FUNCTION list_reserves(
    _page INT,
    _limit INT
) RETURNS TABLE(
    id INT,
    cafe_id INT,
    table_id INT,
    status reservation_status,
    date TIMESTAMP,
    created_at TIMESTAMP,
    user_id INT,
    total_count BIGINT
) AS $$
WITH count_reservations AS (
    SELECT COUNT(*) as total_count
    FROM reservations
)
SELECT 
    r.id,
    r.cafe_id,
    r.table_id,
    r.status,
    r.date,
    r.created_at,
    r.user_id,
    c.total_count
FROM reservations r
CROSS JOIN count_reservations c
LIMIT _limit
OFFSET (_page - 1) * _limit;
$$ LANGUAGE SQL;