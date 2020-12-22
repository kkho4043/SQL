select * 
from employees em inner join departments de
on em.department_id = de.department_id;


select  employee_id,
        first_name,
        salary
from employees
where salary >= (select salary
                from employees
                where first_name = 'Den');
                

select  
        first_name,
        salary
        employee_id
        
from employees
where salary = (select min(salary)
                 from employees);


select  
        first_name,
        salary
        employee_id
        
from employees
where salary < (select avg(salary)
                from employees);
                

select salary
from employees
where department_id = '110';

select  
        first_name,
        salary,
        employee_id,
        department_id
from employees
where salary in (select salary
                from employees
                where department_id = '110');
                
                
select 
        department_id, 
        employee_id, 
        first_name, 
        salary
from employees
where (department_id, salary) in (select 
                                            department_id,
                                            max(salary)
                                            from employees
                                            group by department_id);



select
        employee_id, 
        first_name, 
        salary
from employees
where salary < any (select salary
                    from employees
                    where department_id =110);
                    
select
        e.employee_id, 
        e.department_id,
        e.first_name,
        e.salary
from employees e,(select department_id,max(salary) salary
                  from employees
                  group by department_id) s
where e.department_id = s.department_id
and e.salary = s.salary;


select
        department_id,
        max(salary)
from employees
group by department_id;

select 
        e.department_id,
        e.first_name,
        e.salary,
        e.department_id,
        s.department_id
from employees e,(select department_id,
                  max(salary) salary
                  from employees
                  group by department_id)s
where e.department_id = s.department_id;