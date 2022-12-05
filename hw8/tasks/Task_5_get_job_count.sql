--create a program to retrieve the number of different jobs that an employee worked on during his or her service (including the present job).
create or replace function GET_JOB_COUNT(empl_id int) returns int
    language plpgsql
as
$$
BEGIN
    -- Error handling accounting for invalid employee id
    if not exists(
            select *
            from employees
            where id = empl_id
        )
    then
        raise exception 'invalid employee id';
    end if;

    return count(ids) from(select distinct job_id
            from job_history jh
            where jh.employee_id = empl_id
            except
            select job_id
            from employees
            where id = empl_id) ids;

end;
$$;

--Invoke the function for an employee with ID 176.
select GET_JOB_COUNT(176);

select GET_JOB_COUNT(106);



