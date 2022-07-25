INSERT INTO employees
SELECT *
FROM (SELECT DISTINCT *
      FROM employees_temp)
ON CONFLICT ("Serial Number") DO UPDATE
    SET "Serial Number" = excluded."Serial Number"