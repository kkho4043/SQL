select 
      ro.first_name,
      ro.salary
from (select   
      rownum rnum,
      o.first_name,
      o.salary
      from (select 
            emp.first_name,
            emp.salary
            from employees emp
            order by salary desc) o
      ) ro 
where rnum  >= 2
and rnum <= 5;

select  ro.rn,
        ro.employee_id,
        ro.first_name,
        ro.salary,
        ro.hire_date
        from(select  rownum rn,
                     o.employee_id,
                     o.first_name,
                     o.salary,
                     o.hire_date
             from(select employee_id,
                         first_name,
                         salary,
                         hire_date
                  from employees
                  where hire_date >= '07/01/01'
                  and hire_date <=  '07/12/31'
                  order by salary desc) o
             ) ro
where ro.rn >= 1
and ro.rn < 11

       



