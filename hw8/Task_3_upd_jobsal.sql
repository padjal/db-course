-- update the minimum and maximum salaries for a specific job ID in the JOBS table
create procedure UPD_JOBSAL(job_id varchar, new_min_salary int, new_max_salary int)
    language plpgsql
as
$$
BEGIN
    -- Exception handling on invalid job id in the jobs table
    if not exists(
            select *
            from jobs
            where id = job_id)
    then
        raise exception 'invalid job id in the jobs table';
    end if;

    -- Raise an exception if the new max is less than the new min
    if new_max_salary < new_min_salary then
        raise exception 'new max is less than the new min salary';
    end if;

    update jobs
    set min_salary = new_min_salary, max_salary = new_max_salary
    where id = job_id;
end;
$$;

--Execute the UPD_JOBSAL procedure by using a job ID of 'SY_ANAL', a minimum salary of 7000, and a maximum salary of 140.
call UPD_JOBSAL('SY_ANAL', 7000, 140);

-- Disable triggers on the EMPLOYEES and JOBS tables.
alter table employees disable trigger all;
alter table jobs disable trigger all;

--Execute the UPD_JOBSAL procedure using a job ID of 'SY_ANAL', a minimum salary of 7000, and a maximum salary of 14000.
call UPD_JOBSAL('SY_ANAL', 7000, 14000);

--Query the JOBS table to view your changes, and then commit the changes.
select *
from jobs
where jobs.id = 'SY_ANAL';

--Enable the triggers on the EMPLOYEES and JOBS tables
alter table employees enable trigger all;
alter table jobs enable trigger all;