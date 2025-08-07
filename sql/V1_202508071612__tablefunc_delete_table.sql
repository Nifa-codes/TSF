CREATE OR REPLACE FUNCTION delete_table(_id INT) 
RETURNS tables AS $$
    DELETE FROM tables 
    WHERE id = _id 
    RETURNING *;
$$ LANGUAGE SQL;