CREATE OR REPLACE FUNCTION search_cafes(_query TEXT) 
RETURNS SETOF cafes AS $$
    SELECT * 
    FROM cafes
    WHERE 
        name ILIKE '%' || _query || '%';
$$ LANGUAGE SQL;