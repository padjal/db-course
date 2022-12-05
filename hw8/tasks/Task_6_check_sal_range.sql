create or replace function CHECK_SAL_RANGE() returns trigger
    language plpgsql
as
$$
BEGIN
    if new.max_salary < new.min_salary then raise exception 'Max salary cannot be less than min!'; end if;

    if new.max_salary < (select max(salary)
                         from employees
                         where job_id = old.id) or new.min_salary > (select min(salary)
                                                                     from employees
                                                                     where job_id = old.id) then
        raise exception 'Some employees are not whithin the new range!';
    end if;

    return new;
end;
$$;



--create a trigger to ensure that the minimum and maximum salaries of a job are never modified such that the salary
-- of an existing employee with that job ID is outside the new range specified for the job.
create or replace trigger CHECK_SAL_RANGE
    before update of min_salary, max_salary
    on jobs
    for each row
execute function CHECK_SAL_RANGE();

-- Test the trigger
-- Test the trigger using the SY_ANAL job, setting the new minimum salary to 5000 and the new maximum salary to 7000.
--Before you make the change, write a query to display the current salary range for the SY_ANAL job ID, and another query
-- to display the employee ID, last name, and salary for the same job ID. After the update, query the change (if any) to the JOBS table for the specified job ID.

select *
from employees
where job_id = 'SY_ANAL';

--Display salary range
select (select max(salary)
                         from employees
                         where job_id = 'SY_ANAL') max, (select min(salary)
                                                                     from employees
                                                                     where job_id = 'SY_ANAL') min;

update jobs
set min_salary = 5500
where id = 'SY_ANAL';

select (select max(salary)
                         from employees
                         where job_id = 'SY_ANAL') max, (select min(salary)
                                                                     from employees
                                                                     where job_id = 'SY_ANAL') min;