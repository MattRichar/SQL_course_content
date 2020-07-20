--Are there any columns with null values in the Users table?--
  
 -- Trial and error with each column (indicated by column_name). --
-- I wrote a separate query for each column name and counted the number of NULL values within that column. --

SELECT 
    COUNT(*)
FROM 
    user
WHERE 
    column_name is NULL; --Indicates whether a value in column_name is NULL.--
