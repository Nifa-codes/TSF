CREATE FUNCTION add_user(_name TEXT,_email TEXT,_number TEXT)
RETURNS TABLE (id INT, name TEXT, email TEXT, number TEXT, created_at TIMESTAMP) AS $$
BEGIN
    RETURN QUERY
    INSERT INTO users (name, email, number)
    VALUES (_name,_email,_number)
    RETURNING *;
END;
$$ LANGUAGE plpgsql;
CREATE FUNCTION update_user(_id INT, _name TEXT, _email TEXT, _number TEXT)
RETURNS TABLE (id INT, name TEXT, email TEXT, number TEXT, created_at TIMESTAMP) AS $$
BEGIN
    RETURN QUERY
    UPDATE users
    SET name = _name, email = _email, number = _number
    WHERE id = _id
    RETURNING *;
END;
$$ LANGUAGE plpgsql;
CREATE FUNCTION delete_user(_id INT)
RETURNS TABLE (id INT, name TEXT, email TEXT, number TEXT, created_at TIMESTAMP) AS $$
DECLARE
    deleted_user users;
BEGIN
    DELETE FROM users
    WHERE id = _id
    RETURNING * INTO deleted_user;
    RETURN QUERY
    SELECT delete_user;
END;
$$ LANGUAGE plpgsql;
CREATE FUNCTION get_user(_id INT)
RETURNS TABLE (id INT, name TEXT, email TEXT, number TEXT, created_at TIMESTAMP) AS $$
BEGIN
    RETURN QUERY
    SELECT * FROM users
    WHERE id = _id;
END;
$$ LANGUAGE plpgsql;
CREATE FUNCTION get_all_users()
RETURNS TABLE (id INT, name TEXT, email TEXT, number TEXT, created_at TIMESTAMP) AS $$
BEGIN
    RETURN QUERY
    SELECT * FROM users;
END;
$$ LANGUAGE plpgsql;