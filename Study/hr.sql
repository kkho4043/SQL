SELECT * 
from departments;


SELECT  employee_id, 
        first_name,
        last_name 
from employees;

SELECT first_name,
       last_name,
       salary,
       phone_number,
       hire_date
from employees;

select employee_id as empno,
       first_name "f-name",
       salary
from employees;

select employee_id as empno,
       first_name "f-name",
       salary "연봉"
from employees;

select first_name "이름",
       phone_number "전화번호",
       hire_date "입사일",
       salary "급여"
from employees;

select first_name "이름",
       last_name "성",
       salary "급여",
       phone_number "전화번호",
       job_id "이메일",
       hire_date "입사일"
from employees;

select employee_id "사원번호",
       first_name "이름",
       last_name "성",
       salary "급여",
       phone_number "전화번호",
       job_id "이메일",
       hire_date "입사일"
from employees;

select * from employees;

select employee_id "사원번호",
       first_name "이름",
       last_name "성",
       salary "급여",
       phone_number "전화번호",
       email "이메일",
       hire_date "입사일"
from employees;

select 
       first_name ||' '|| last_name 이름
from employees;

select  first_name,
        salary,
        salary*12,
        (salary+300)*12
from EMPLOYEES;

select 
       first_name
from employees
where salary > 15000;

select 
       first_name,
       salary
from employees
where salary > 15000;

select 
       first_name,
       salary
from employees
where salary >= 15000;

select 
       first_name,
       hire_date
from employees
where hire_date >= '07/01/01';


select first_name
from employees
where first_name >= 'lex';


select 
       first_name

from employees
where first_name >= 'Lex';

select 
       first_name,
       salary
from employees
where first_name >= 'Lex';

select 
       first_name,
       salary
from employees
where first_name = 'Lex';

select 
       first_name,
       salary
from employees
where first_name = 'Le*';

select 
       first_name,
       salary
from employees
where first_name = 'Le?';

select * 
from employees
ORDER by salary desc;

select * 
from employees
ORDER by first_name desc;


select  first_name,
        salary

from employees
WHERE salary >= 9000
ORDER by first_name desc;


select  *
from employees
WHERE salary >= 9000
ORDER by first_name desc;
select  department_id 팀,
        salary 급여,
        last_name 이름
from employees
WHERE salary >= 1000
ORDER by department_id asc;


select  department_id,
        salary,
        first_name
from employees
ORDER by department_id asc, salary desc;


select first_name||''||last_name
from employees;
select first_name||'하이드'||last_name

from employees;
select first_name||' ''하이드'' '||last_name
from employees;