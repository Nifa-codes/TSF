
DROP FUNCTION IF EXISTS delete_user(INT) CASCADE;
DROP FUNCTION IF EXISTS get_user(INT) CASCADE;
DROP FUNCTION IF EXISTS update_user(INT, TEXT, TEXT, TEXT) CASCADE;
DROP FUNCTION IF EXISTS get_all_users() CASCADE;
DROP FUNCTION IF EXISTS add_user(TEXT, TEXT, TEXT) CASCADE;

CREATE OR REPLACE FUNCTION add_user(
    _name VARCHAR(50), 
    _email VARCHAR(50), 
    _number VARCHAR(50)
)
RETURNS TABLE (
    id INT, 
    name VARCHAR(50), 
    email VARCHAR(50), 
    number VARCHAR(50), 
    created_at TIMESTAMP
) AS $$
BEGIN
    RETURN QUERY
    INSERT INTO users (name, email, number)
    VALUES (_name, _email, _number)
    RETURNING users.id, users.name, users.email, users.number, users.created_at;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION update_user(
    _id INT, 
    _name VARCHAR(50), 
    _email VARCHAR(50), 
    _number VARCHAR(50)
)
RETURNS TABLE (
    id INT, 
    name VARCHAR(50), 
    email VARCHAR(50), 
    number VARCHAR(50), 
    created_at TIMESTAMP
) AS $$
BEGIN
    RETURN QUERY
    UPDATE users u
    SET name = _name, email = _email, number = _number
    WHERE u.id = _id
    RETURNING u.id, u.name, u.email, u.number, u.created_at;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION delete_user(_id INT)
RETURNS TABLE (
    id INT, 
    name VARCHAR(50), 
    email VARCHAR(50), 
    number VARCHAR(50), 
    created_at TIMESTAMP
) AS $$
BEGIN
    RETURN QUERY
    DELETE FROM users u
    WHERE u.id = _id
    RETURNING u.id, u.name, u.email, u.number, u.created_at;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION get_user(_id INT)
RETURNS TABLE (
    id INT, 
    name VARCHAR(50), 
    email VARCHAR(50), 
    number VARCHAR(50), 
    created_at TIMESTAMP
) AS $$
BEGIN
    RETURN QUERY
    SELECT u.id, u.name, u.email, u.number, u.created_at 
    FROM users u
    WHERE u.id = _id;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION get_all_users()
RETURNS TABLE (
    id INT, 
    name VARCHAR(50), 
    email VARCHAR(50), 
    number VARCHAR(50), 
    created_at TIMESTAMP
) AS $$
BEGIN
    RETURN QUERY
    SELECT u.id, u.name, u.email, u.number, u.created_at 
    FROM users u;
END;
$$ LANGUAGE plpgsql;