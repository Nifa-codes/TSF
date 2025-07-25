-- Fixed get_user function
CREATE OR REPLACE FUNCTION get_user(_id INT)
RETURNS TABLE (id INT, name TEXT, email TEXT, number TEXT, created_at TIMESTAMP) AS $$
BEGIN
    RETURN QUERY
    SELECT u.id, u.name, u.email, u.number, u.created_at 
    FROM users u
    WHERE u.id = _id;  
END;
$$ LANGUAGE plpgsql;

-- Fixed delete_user function
CREATE OR REPLACE FUNCTION delete_user(_id INT)
RETURNS TABLE (id INT, name TEXT, email TEXT, number TEXT, created_at TIMESTAMP) AS $$
BEGIN
    RETURN QUERY
    DELETE FROM users u
    WHERE u.id = _id
    RETURNING u.id, u.name, u.email, u.number, u.created_at;
END;
$$ LANGUAGE plpgsql;

-- Fixed get_all_users function
CREATE OR REPLACE FUNCTION get_all_users()
RETURNS TABLE (id INT, name TEXT, email TEXT, number TEXT, created_at TIMESTAMP) AS $$
BEGIN
    RETURN QUERY
    SELECT u.id, u.name, u.email, u.number, u.created_at 
    FROM users u; 
END;
$$ LANGUAGE plpgsql;

-- Fixed update_user function
CREATE OR REPLACE FUNCTION update_user(_id INT, _name TEXT, _email TEXT, _number TEXT)
RETURNS TABLE (id INT, name TEXT, email TEXT, number TEXT, created_at TIMESTAMP) AS $$
BEGIN
    RETURN QUERY
    UPDATE users u
    SET name = _name, email = _email, number = _number
    WHERE u.id = _id
    RETURNING u.id, u.name, u.email, u.number, u.created_at;
END;
$$ LANGUAGE plpgsql;

-- Fixed add_user function
CREATE OR REPLACE FUNCTION add_user(_name TEXT, _email TEXT, _number TEXT)
RETURNS TABLE (id INT, name TEXT, email TEXT, number TEXT, created_at TIMESTAMP) AS $$
BEGIN
    RETURN QUERY
    INSERT INTO users (name, email, number)
    VALUES (_name, _email, _number)
    RETURNING users.id, users.name, users.email, users.number, users.created_at;  
END;
$$ LANGUAGE plpgsql;