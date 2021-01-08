/*
  || COPY_TABLES.sql
  || Create tables for demonstration of when row level
  || and statement level triggers fire
*/
-- create a table to copy rows from
DROP TABLE from_table;
CREATE TABLE from_table
(col1 NUMBER);

-- create a table to copy rows into
DROP TABLE to_table;
CREATE TABLE to_table
(col1 NUMBER);

-- populate the copy from table
BEGIN
  FOR counter IN 1..10 LOOP
    INSERT INTO from_table VALUES(counter);
  END LOOP;
END;
/

INSERT INTO to_table
  VALUES (1);
UPDATE to_table
  SET col1 = 10;
DELETE to_table;

COMMIT;


/*======================================================================
| Supplement to the third edition of Oracle PL/SQL Programming by Steven
| Feuerstein with Bill Pribyl, Copyright (c) 1997-2002 O'Reilly &
| Associates, Inc. To submit corrections or find more code samples visit
| http://www.oreilly.com/catalog/oraclep3/
*/
