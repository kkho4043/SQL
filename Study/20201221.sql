SELECT
        e.first_name,
        d.department_name,
        j.job_title  
from employees e ,departments d , jobs j
where e.department_id = d.department_id
and e.job_id = j.job_id;


SELECT
        e.first_name,
        d.department_name,
        j.job_title  
from employees e ,departments d , jobs j
where e.department_id =  d.department_id
and e.job_id = j.job_id;

select 
*
from employees em right outer join departments de
on em.department_id = de.department_id;

select
        e.department_id,
        e.first_name,
        d.department_name
from employees e full outer join departments d
on e.department_id = d.department_id ; 


