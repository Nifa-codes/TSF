CREATE TYPE reservation_status AS ENUM (
  'pending',
  'preparing',
  'done',
  'canceled'
);
CREATE TABLE reservations(
    id SERIAL PRIMARY KEY,
    cafe_id INT NOT NULL,
    table_id INT NOT NULL,
    status reservation_status NOT NULL DEFAULT 'pending',
    date INT,
    created_at TIMESTAMP DEFAULT NOW(),
    --changed to user ID
    user_id INT NOT NULL,
    CONSTRAINT fk_reservations_users FOREIGN KEY (user_id) REFERENCES users(id)
);
CREATE OR REPLACE FUNCTION add_reserve(

    _cafe_id INT,
    _status reservation_status,
    _date INT,
    _user_id INT,
    _table_id INT
)
RETURNS TABLE(
    id INT,
    cafe_id INT,
    status reservation_status,
    date INT,
    created_at TIMESTAMP,
    user_id INT,
    table_id INT
) AS $$
BEGIN
    RETURN QUERY
    INSERT INTO reservations(cafe_id,status,date,user_id,table_id)
    VALUES (_cafe_id, _status, _date, _user_id,table_id)
    RETURNING reservations.id, reservations.cafe_id, reservations.status, reservations.date, reservations.created_at, reservations.user_id;
END;
$$ LANGUAGE plpgsql;