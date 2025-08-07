CREATE OR REPLACE FUNCTION delete_cafe(_id INT) 
RETURNS cafes AS $$
    DELETE FROM cafes 
    WHERE id = _id 
    RETURNING *;
$$ LANGUAGE SQL;