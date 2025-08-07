CREATE OR REPLACE FUNCTION update_cafe(
    _id INT,
    _name VARCHAR(100),
    _description VARCHAR(300),
    _location VARCHAR(100),
    _phone VARCHAR(14)
)
RETURNS cafes AS $$
    UPDATE cafes
    SET
        name=_name,
        description=_description,
        location=_location,
        phone=_phone
    WHERE id=_id
    RETURNING *;
$$ LANGUAGE SQL;
