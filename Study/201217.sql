SELECT
        email,
        INITCAP('aaaa'),
        department_id
from employees
WHERE department_id = 100;

select  first_name,
        Lower(first_name),
        upper(first_name)
from employees
where department_id = 100;

select
        first_name,
        SUBSTR(first_name,1,3)
        first_name
from EMPLOYEES;

select
        first_name,
        replace(first_name,'a','*'),
        first_name
from EMPLOYEES;

select
        first_name,
        replace(first_name,substr(first_name,2,4),'****'),
        first_name
from EMPLOYEES;

SELECT 
        ROUND(123.454,1) r2
from dual;

SELECT
        sysdate,
        to_char(SYSDATE,'YYYY')YYYY,
        to_char(SYSDATE,'YY')YY,
        to_char(SYSDATE,'MM')MM,
        to_char(SYSDATE,'MONTH')MONTH,
        to_char(SYSDATE,'DD')DD,
        to_char(SYSDATE,'DAY')DAY,
        to_char(SYSDATE,'HH')HH,
        to_char(SYSDATE,'HH24')HH24,
        to_char(SYSDATE,'MI')MI,
        to_char(SYSDATE,'SS')SS
from dual;

SELECT
        sysdate,
        to_char(SYSDATE,'YYYY-MM-DD HH24:MI:SS ')YYYY
from dual;

SELECT
        first_name,
        to_char(hire_date,'YYYY-MM-DD HH24:MI:SS ')YYYY
from employees;

select  first_name,
        commission_pct,
        NVL(commission_pct,0)commission_pct,
        NVL2(commission_pct,100,0)
from employees;