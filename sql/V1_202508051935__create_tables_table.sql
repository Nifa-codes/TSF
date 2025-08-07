CREATE TYPE table_status AS ENUM(
 'available',
 'reserved'
);
CREATE TABLE tables(
    id SERIAL PRIMARY KEY,
    capacity INT,
    status table_status DEFAULT 'available',
    number INT,
    cafe_id INT,
    CONSTRAINT fk_tables_cafes FOREIGN KEY (cafe_id) REFERENCES cafes(id)
);