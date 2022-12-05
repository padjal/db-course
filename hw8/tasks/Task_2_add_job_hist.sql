create procedure ADD_JOB_HIST(employee_id int, new_job_id varchar)
    language plpgsql
as
$$
BEGIN
    if not exists(select 1 from employees where id = employee_id) then
        raise exception 'No such employee found in database.';
    end if;

    -- new entry in job_history table for the old job: start_date -> hire_date, end_date -> today
    insert into job_history(employee_id, job_id, start_date, end_date)
    values (employee_id, (Select job_id
                          from employees
                          where id = employee_id),
            (Select hire_date
             from employees
             where id = employee_id), (select current_date));

    -- change in employees table : hire_date -> today, update job_id
    update employees
    set hire_date = current_date,
        job_id    = new_job_id,
        salary    = (select min_salary
                     from jobs
                     where jobs.id = new_job_id) + 500
    where id = employee_id;

end;
$$;


-- Call stored procedure