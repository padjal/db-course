
--Stored procedure for adding a new entry to the jobs table
--Max salary is automatically calculated as 2*min_salary
CREATE PROCEDURE NEW_JOB(id varchar,title varchar,min_salary int)
LANGUAGE plpgsql
AS
    $$BEGIN
        INSERT INTO jobs(id, title, min_salary, max_salary) VALUES (id, title, min_salary, min_salary*2);
        end;$$;

--Calling the stored procedure NEW_JOB
CALL NEW_JOB('SY_ANAL', 'System Analyst', 6000);
