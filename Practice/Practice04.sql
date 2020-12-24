/*����1.
��� �޿����� ���� �޿��� �޴� ������ ������� ���Ͻÿ�.
(56��)
*/
select
        count(*)
from employees
where salary < (select avg(salary)
                from employees
                );

--//////////////////////////////////////////////////////////////////////////////////////
/*����2. 
��ձ޿� �̻�, �ִ�޿� ������ ������ �޴� ����� 
������ȣ(employee_id), �̸�(first_name), �޿�(salary), 
��ձ޿�, �ִ�޿��� �޿��� ������������ �����Ͽ� ����ϼ��� 
(51��)
*/
select
        e.employee_id,
        e.first_name,
        e.salary,
        a.salary "avg salary",
        m.salary "max salary"
from employees e,(select 
                  avg(salary) salary
                  from employees) a,
                  (select 
                  max(salary) salary
                  from employees) m
where e.salary > a.salary
and e.salary <= m.salary
order by salary asc;

--//////////////////////////////////////////////////////////////////////////////////////
/*����3.
������ Steven(first_name) king(last_name)�� �Ҽӵ� �μ�(departments)�� �ִ� ����
�ּҸ� �˾ƺ����� �Ѵ�.
���þ��̵�(location_id), �Ÿ���(street_address), �����ȣ(postal_code),
���ø�(city), ��(state_province), ������̵�(country_id) �� ����ϼ���
(1��)
*/
--���� �����.
select
   lo.*
from employees e, departments de, locations lo
where e.department_id = de.department_id
and de.location_id = lo.location_id
and e.first_name = 'Steven'
and last_name = 'King'
;

--from���� �ϴ� ��� 1?
select
    lo.*
from employees e,(select
                  department_id,
                  location_id
                  from departments) de,
                  (select
                   location_id,
                   street_address,
                   postal_code,
                   city,
                   state_province,
                   country_id
                   from locations) lo
where e.department_id = de.department_id
and de.location_id = lo.location_id
and e.first_name = 'Steven'
and last_name = 'King'
;

--from���� �ϴ� ��� 2?
select
    lo.*
from locations lo,(select
                  location_id
                  from departments
                  where department_id = (select department_id 
                                         from employees 
                                         where first_name = 'Steven'
                                         and last_name = 'King')) de
where de.location_id = lo.location_id
;
--where���� �ϴ¹��
select
    lo.*
from locations lo
where lo.location_id = (select  de.location_id
                        from departments de
                        where de.department_id = (select 
                                                  em.department_id
                                                  from employees em
                                                  where em.first_name = 'Steven'
                                                  and em.last_name = 'King'))
;
  --//////////////////////////////////////////////////////////////////////////////////////    
  
/*����4.
job_id �� 'ST_MAN' �� ������ �޿����� ���� ������ 
���,�̸�,�޿��� �޿��� ������������ ����ϼ���  -ANY������ ���
(74��)
*/
--���1
select
        employee_id,
        first_name,
        salary
from employees
where salary <any (select 
                salary salary
                from employees
                where job_id = 'ST_MAN'
                )
order by salary desc;

--���2
select DISTINCT --�ߺ�����.
        em.employee_id,
        em.first_name,
        em.salary
from employees em,(select
                   salary
                   from employees
                   where job_id = 'ST_MAN')ss
where em.salary < ss.salary
order by salary desc;

select 
        em.employee_id,
        em.first_name,
        em.salary
from employees em , (select
                   department_id department_id,
                   avg(salary) salary
                   from employees
                   group by department_id) ss
where em.salary > ss.salary
and em.department_id = ss.department_id

--//////////////////////////////////////////////////////////////////////////////////////
/*����5. 
�� �μ����� �ְ��� �޿��� �޴� ����� ������ȣ(employee_id), �̸�(first_name)�� �޿�(salary) �μ���ȣ(department_id)�� ��ȸ�ϼ��� 
�� ��ȸ����� �޿��� ������������ ���ĵǾ� ��Ÿ���� �մϴ�. 
��������, ���̺����� 2���� ������� �ۼ��ϼ���
(11��)
*/
--������ ��
select 
        employee_id,
        first_name,
        salary,
        department_id
from employees
where (department_id, salary) in (select  
                                        department_id,
                                        max(salary)
                                  from employees
                                  group by department_id);                
--���̺�����                                   
select 
        em.employee_id,
        em.first_name,
        em.salary,
        em.department_id
from employees em ,(select  
                        department_id,
                        max(salary)salary
                        from employees
                        group by department_id)ss
where em.department_id = ss.department_id                                 
and em.salary = ss.salary;
--//////////////////////////////////////////////////////////////////////////////////////
/*����6.
�� ����(job) ���� ����(salary)�� ������ ���ϰ��� �մϴ�. 
���� ������ ���� ���� �������� ������(job_title)�� ���� ������ ��ȸ�Ͻÿ� 
(19��)
*/
select 
        jo.job_title,
        sum(em.salary)
from employees em ,jobs jo
where em.job_id = jo.job_id
group by jo.job_title;
--//////////////////////////////////////////////////////////////////////////////////////
/*����7.
�ڽ��� �μ� ��� �޿����� ����(salary)�� ���� ������ ������ȣ(employee_id),
�̸�(first_name)�� �޿�(salary)�� ��ȸ�ϼ��� 
(38��)
*/
select 
        em.employee_id,
        em.first_name,
        em.salary
from employees em , (select
                   department_id department_id,
                   avg(salary) salary
                   from employees
                   group by department_id) ss
where em.salary > ss.salary
and em.department_id = ss.department_id;
                   
/*����8.
���� �Ի����� 11��°���� 15��°�� ������ ���, 
�̸�, �޿�, �Ի����� �Ի��� ������ ����ϼ���
*/
