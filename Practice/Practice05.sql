/*����1.
��� �Ŵ����� �����Ǿ������� Ŀ�̼Ǻ����� ����, ������ 3000�ʰ��� ������ 
�̸�, �Ŵ������̵�, Ŀ�̼� ����, ���� �� ����ϼ���.
(45��)
*/
select
    first_name,
    manager_id,
    commission_pct,
    salary
from employees
where employees.commission_pct is null
and employees.manager_id is not null
and salary > 3000
order by salary desc;
-------------------------------------------------------------
/*����2. 
�� �μ����� �ְ��� �޿��� �޴� ����� ������ȣ(employee_id),
�̸�(first_name), �޿�(salary), �Ի���(hire_date),
��ȭ��ȣ(phone_number), �μ���ȣ(department_id) �� ��ȸ�ϼ��� 
-�������� ������� �ۼ��ϼ���
-�޿��� ������������ �����ϼ���
-�Ի����� 2001-01-13 ����� �������� ����մϴ�.
-��ȭ��ȣ�� 515-123-4567 �������� ����մϴ�.
(11��)
*/
select
    employee_id ������ȣ,
    first_name �̸�,
    salary �޿�,
    to_char(hire_date,'yyyy-mm-dd day') �Ի���,
    replace(phone_number,'.','-') ��ȭ��ȣ,
    department_id �μ���ȣ
from employees
where (department_id,salary) in (select 
                                        department_id,
                                        max(salary)
                                from employees
                                group by department_id)
order by salary desc;

-------------------------------------------------------------
/*����3
�Ŵ������� ��ձ޿� �ּұ޿� �ִ�޿��� �˾ƺ����� �Ѵ�.
-�����(����)�� 2005�� ������ �Ի��� �Դϴ�.
-�Ŵ����� ��ձ޿��� 5000�̻� ����մϴ�.
-�Ŵ����� ��ձ޿��� ������������ ����մϴ�.
-�Ŵ����� ��ձ޿��� �Ҽ��� ù°�ڸ����� �ݿø� �մϴ�.
-��³����� �Ŵ������̵�, �Ŵ����̸�(first_name), �Ŵ�������ձ޿�, �Ŵ������ּұ޿�, �Ŵ������ִ�޿� �Դϴ�.
(9��)
*/
select 
        ma.manager_id �Ŵ������̵�,
        em.first_name �Ŵ����̸�,
        ma.avgsal �Ŵ�������ձ޿�,
        ma.minsal �Ŵ������ּұ޿�,
        ma.maxsal �Ŵ������ִ�޿�
from employees em,(select
                   manager_id manager_id,
                   round(avg(salary),0) avgsal,
                   min(salary) minsal,
                   max(salary) maxsal
                   from (select * 
                         from employees
                         where hire_date >= '2005/01/01'
                         )
                   group by manager_id
                   ) ma
                   
where em.employee_id = ma.manager_id
and ma.avgsal >= 5000;
-------------------------------------------------------------
/*����4.
�� ���(employee)�� ���ؼ� ���(employee_id),
�̸�(first_name), �μ���(department_name),
�Ŵ���(manager)�� �̸�(first_name)�� ��ȸ�ϼ���.
�μ��� ���� ����(Kimberely)�� ǥ���մϴ�.
(106��)
*/
select 
    em.employee_id,
    em.first_name,
    de.department_name,
    ma.first_name
from employees em left outer join departments de
on em.department_id = de.department_id ,employees ma
where em.manager_id = ma.employee_id
;
--
select 
    em.employee_id,
    em.first_name,
    de.department_name,
    ma.first_name
from employees em, departments de ,employees ma
where em.department_id = de.department_id(+)
and em.manager_id = ma.employee_id
;
--
select 
    em.employee_id,
    em.first_name,
    de.department_name,
    ma.first_name
from employees em, departments de ,employees ma
where em.manager_id = ma.employee_id
and em.department_id = de.department_id(+)
;
--
select 
    em.employee_id,
    em.first_name,
    em.department_name,
    ma.first_name
from (select
      e.employee_id,
      e.first_name,
      d.department_name,
      e.manager_id
      from employees e full outer join departments d
      on e.department_id = d.department_id) em,employees ma
where em.manager_id = ma.employee_id
;


-------------------------------------------------------------
/*����5.
2005�� ���� �Ի��� �����߿� �Ի����� 11��°���� 20��°�� ������ 
���, �̸�, �μ���, �޿�, �Ի����� �Ի��� ������ ����ϼ���
*/
select
    ro.employee_id,
    ro.first_name,
    ro.salary,
    ro.department_name,
    ro.hire_date 
from (select  
         rownum rn,
         o.employee_id,
         o.first_name,
         o.salary,
         o.department_name,
         o.hire_date
      from (select         
            e.employee_id,
            e.first_name,
            e.salary,
            d.department_name,
            e.hire_date
            from employees e,departments d
            where e.department_id = d.department_id
            and e.hire_date >= '05/01/01'
            order by e.hire_date asc) o
     )ro 
where ro.rn >= 11
and ro.rn <= 20;
-------------------------------------------------------------
/*����6.
���� �ʰ� �Ի��� ������ �̸�(first_name last_name)��
����(salary)�� �ٹ��ϴ� �μ� �̸�(department_name)��?
*/

select
    em.first_name || ' '|| em.last_name �̸�,
    em.salary ����,
    de.department_name �μ��̸�,
    em.hire_date
from employees em,departments de ,(select
                                         max(hire_date) maxhire
                                    from employees
                                    ) eh
where em.hire_date = eh.maxhire
and em.department_id = de.department_id;
-------------------------------------------------------------
/*����7.
��տ���(salary)�� ���� ���� �μ� �������� ������ȣ(employee_id),
�̸�(firt_name), ��(last_name)��  ����(job_title), ����(salary)�� ��ȸ�Ͻÿ�.
*/
select 
        em.employee_id ���,
        em.first_name �̸�,
        em.last_name ��,
        jo.job_title ����,
        av.avsal,
        em.salary ���� 
from employees em , (select 
                     department_id department_id,
                     avg(em.salary) avsal
                     from employees em
                     group by department_id) av,
                     (select  
                      max(avg(mm.salary)) mxsal
                      from employees mm
                      group by department_id) mx
                      ,jobs jo
where em.department_id = av.department_id
and av.avsal = mx.mxsal
and em.job_id = jo.job_id
;

-------------------------------------------------------------
/*����8.
��� �޿�(salary)�� ���� ���� �μ���? 
*/
select 
        av.department_name
from (select
      de.department_name department_name,
      avg(em.salary) avsal
      from employees em , departments de
      where em.department_id = de.department_id
      group by de.department_name) av,
      (select
      max(avg(em.salary)) mxsal
      from employees em 
      group by em.department_id) mx
where av.avsal = mx.mxsal;    

--2��° ���
select 
        av.department_name
from (select
          rownum rn,
          a.department_name department_name,
          a.avsal
      from(select 
                de.department_name department_name,
                avg(em.salary) avsal
           from employees em , departments de
           where em.department_id = de.department_id
           group by de.department_name
           order by avsal desc)a
      )av
where av.rn = 1;
-------------------------------------------------------------------------------      
/*����9.
��� �޿�(salary)�� ���� ���� ������? 
*/     
select 
        av.region_name
from (select
        re.region_name region_name,
        avg(em.salary) avsal
        from employees em,departments de,locations lo,countries co,regions re
        where em.department_id = de.department_id
        and de.location_id = lo.location_id
        and lo.country_id = co.country_id
        and co.region_id = re.region_id
        group by re.region_name
     )av,
     (select
        max(avg(em.salary)) mxsal
        from employees em,departments de,locations lo,countries co,regions re
        where em.department_id = de.department_id
        and de.location_id = lo.location_id
        and lo.country_id = co.country_id
        and co.region_id = re.region_id
        group by re.region_name
     )mv
where av.avsal = mv.mxsal
;
--2��° ��� rownum �̿��ϱ�
select 
        av.region_name
from (select
        rownum rn,
        a.region_name,
        a.avsal
        from(select 
                    re.region_name region_name,
                    avg(em.salary) avsal
             from employees em,departments de,locations lo,countries co,regions re
             where em.department_id = de.department_id
             and de.location_id = lo.location_id
             and lo.country_id = co.country_id
             and co.region_id = re.region_id
             group by re.region_name
             order by avsal desc)a
     )av
where av.rn = 1;
-------------------------------------------------------------
/*����10.
��� �޿�(salary)�� ���� ���� ������? 
*/
select
        av.job_title
from (select
            jo.job_title job_title,
            avg(em.salary) avsal
      from employees em , jobs jo
      where em.job_id = jo.job_id
      group by jo.job_title
      )av,
      (select
           
            max(avg(em.salary)) mxsal
      from employees em , jobs jo
      where em.job_id = jo.job_id
      group by jo.job_title
      )mx
where av.avsal = mx.mxsal;
--���2
select
        av.job_title
from (select
            rownum rn,
            a.job_title,
            a.avsal
      from (select 
            jo.job_title job_title,
            avg(em.salary) avsal
            from employees em , jobs jo
            where em.job_id = jo.job_id
            group by jo.job_title
            order by avsal desc)a 
      )av
where av.rn = 1;
       