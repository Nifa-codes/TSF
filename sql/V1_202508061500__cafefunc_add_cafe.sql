CREATE OR REPLACE FUNCTION add_cafe(
    _name VARCHAR(100),
    _description VARCHAR(300),
    _location VARCHAR(100),
    _phone VARCHAR(14)
)
RETURNS cafes AS $$
    INSERT INTO cafes(name, description, location, phone)
    VALUES(_name, _description, _location, _phone)
    RETURNING *;
$$ LANGUAGE SQL;