--Create a subprogram to retrieve the number of years of service for a specific employee.
create or replace function GET_YEARS_SERVICE(empl_id int) returns int
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

    return ((select sum(jh.end_date - jh.start_date) totalHistoryDays
            from job_history jh
            where jh.employee_id = empl_id) + (select current_date - employees.hire_date daysInCurrentJob
                                                   from employees
                                                   where id = empl_id))/365;
end;
$$;


--Invoke the GET_YEARS_SERVICE function in a call to DBMS_OUTPUT.PUT_LINE for an employee with ID 999.
select GET_YEARS_SERVICE(999);

--Display the number of years of service for employee 106 with DBMS_OUTPUT.PUT_LINE invoking the GET_YEARS_SERVICE function.
select GET_YEARS_SERVICE(106);

--Query the JOB_HISTORY and EMPLOYEES tables for the specified employee to verify that the modifications are accurate.
select job_id,
       start_date,
       end_date,
       (
           job_history.end_date - job_history.start_date
           ) / 365 as totalYears
from job_history
where employee_id = employee_id