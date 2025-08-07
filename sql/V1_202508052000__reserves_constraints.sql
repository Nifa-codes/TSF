ALTER TABLE reservations
ADD CONSTRAINT fk_reservations_cafes FOREIGN KEY (cafe_id) REFERENCES cafes(id),
ADD CONSTRAINT fk_reservations_tables FOREIGN KEY (table_id) REFERENCES tables(id),
ADD CONSTRAINT fk_reservations_dates FOREIGN KEY (date) REFERENCES dates(id);
