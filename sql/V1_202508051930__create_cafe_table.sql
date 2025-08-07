CREATE TABLE cafes(
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    description VARCHAR(300),
    location VARCHAR(100),
    phone VARCHAR(14),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);