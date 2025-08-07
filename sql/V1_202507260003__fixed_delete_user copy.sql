CREATE OR REPLACE FUNCTION delete_user(_id INT)
RETURNS TABLE (id INT, name TEXT, email TEXT, number TEXT, created_at TIMESTAMP) AS $$
BEGIN
    RETURN QUERY
    DELETE FROM users
    WHERE id = _id
    RETURNING *;
END;
$$ LANGUAGE plpgsql;