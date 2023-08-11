IF (SCHEMA_ID('attimport') IS NULL) 
BEGIN
    EXEC ('CREATE SCHEMA [attimport]')
END
