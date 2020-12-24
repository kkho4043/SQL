/*����1.
�������� ���(employee_id), �̸�(firt_name), ��(last_name)�� �μ���(department_name)��
��ȸ�Ͽ� �μ��̸�(department_name) ��������, ���(employee_id) �������� ���� �����ϼ���.
(106��)
*/
select
        em.employee_id ���,
        em.first_name �̸�,
        em.last_name ��,
        de.department_name �μ���
from employees em , departments de
where em.department_id = de.department_id
order by em.employee_id DESC;

/*����2.
employees ���̺��� job_id�� ������ �������̵� ������ �ֽ��ϴ�.
�������� ���(employee_id), �̸�(firt_name), �޿�(salary), �μ���(department_name),
�������(job_title)�� ���(employee_id) �������� ���� �����ϼ���.
�μ��� ���� Kimberely(��� 178)�� ǥ������ �ʽ��ϴ�.
(106��)
*/
select
        em.employee_id ���,
        em.first_name �̸�,
        em.salary �޿�,
        de.department_name �μ���,
        jo.job_title �������
from employees em , departments de , jobs jo
where em.department_id = de.department_id
and em.job_id = jo.job_id
order by em.employee_id ASC;

/*����2-1.
����2���� �μ��� ���� Kimberely(��� 178)���� ǥ���� ������
(107��)
*/
select
        em.employee_id ���,
        em.first_name �̸�,
        em.salary �޿�,
        de.department_name �μ���,
        jo.job_title �������
from employees em , departments de , jobs jo
where em.department_id = de.department_id(+)
and em.job_id = jo.job_id
order by em.employee_id ASC;


/*����3.
���ú��� ��ġ�� �μ����� �ľ��Ϸ��� �մϴ�.
���þ��̵�, ���ø�, �μ���, �μ����̵� ���þ��̵�(��������)�� �����Ͽ� ����ϼ��� 
�μ��� ���� ���ô� ǥ������ �ʽ��ϴ�.
(27��)
*/
select
        lo.location_id,
        lo.city,
        de.department_name,
        de.department_id
from locations lo, departments de
where lo.location_id = de.location_id
order by lo.location_id asc;

/*����3-1.
����3���� �μ��� ���� ���õ� ǥ���մϴ�. 
(43��)
*/
select
        lo.location_id,
        lo.city,
        de.department_name,
        de.department_id
from locations lo, departments de
where lo.location_id = de.location_id(+)--����(������id�� ��� ǥ���� �� �μ��� ��������.)
order by lo.location_id asc;


/*����4.
����(regions)�� ���� ������� �����̸�(region_name), 
�����̸�(country_name)���� ����ϵ� 
�����̸�(��������), �����̸�(��������) ���� �����ϼ���.
(25��)
*/
select
    re.region_name �����̸�,
    co.country_name �����̸�
from regions re,countries co
where re.region_id = co.region_id
order by re.region_name asc, co.country_name desc;


/*����5. 
�ڽ��� �Ŵ������� ä����(hire_date)�� ���� ����� 
���(employee_id), �̸�(first_name)�� ä����(hire_date),
�Ŵ����̸�(first_name), �Ŵ����Ի���(hire_date)�� ��ȸ�ϼ���.
(37��)
*/
select
   emp.employee_id ���,
   emp.first_name �̸�,
   emp.hire_date ä����,
   man.first_name �Ŵ����̸�,
   man.hire_date �Ŵ����Ի���
   
from employees emp, employees man
where emp.manager_id = man.employee_id
and emp.hire_date < man.hire_date;

/*����6.
���󺰷� ��� �μ����� ��ġ�ϰ� �ִ��� �ľ��Ϸ��� �մϴ�.
�����, ������̵�, ���ø�, ���þ��̵�, �μ���, �μ����̵� �����(��������)�� �����Ͽ� ����ϼ���.
���� ���� ��� ǥ������ �ʽ��ϴ�.
(27��)
*/
select
   co.country_name ����,
   co.country_id ������̵�,
   lo.city ���ø�,
   lo.location_id ���þ��̵�,
   de.department_name �μ���,
   de.department_id �μ����̵�
from countries co, locations lo, departments de
where co.country_id = lo.country_id
and lo.location_id = de.location_id;

/*����7.
job_history ���̺��� ������ �������� �����͸� ������ �ִ�.
������ �������̵�(job_id)�� ��AC_ACCOUNT���� �ٹ��� ����� ���, �̸�(Ǯ����), �������̵�, ������, �������� ����ϼ���.
�̸��� first_name�� last_name�� ���� ����մϴ�.
(2��)
*/
select
        joh.employee_id,
        em.first_name||' '||em.last_name Ǯ����,
        em.job_id �������̵�,
        joh.start_date ������,
        joh.end_date ������
from job_history joh,employees em
where joh.employee_id = em.employee_id
and joh.job_id = 'AC_ACCOUNT';

/*����8.
�� �μ�(department)�� ���ؼ� �μ���ȣ(department_id), �μ��̸�(department_name), 
�Ŵ���(manager)�� �̸�(first_name), ��ġ(locations)�� ����(city),
����(countries)�� �̸�(countries_name) �׸��� ��������(regions)�� �̸�(resion_name)���� ���� ����� ������.
(11��)
*/
select 
        em.department_id �μ���ȣ,
        de.department_name �μ��̸�,
        em.first_name �Ŵ����̸�,
        lo.city ����,
        co.country_name ����,
        re.region_name ����
from employees em,departments de,locations lo,countries co,regions re
where em.employee_id = de.manager_id 
and de.location_id = lo.location_id
and lo.country_id = co.country_id
and co.region_id = re.region_id;

/*����9.
�� ���(employee)�� ���ؼ� ���(employee_id), �̸�(first_name),
�μ���(department_name), �Ŵ���(manager)�� �̸�(first_name)�� ��ȸ�ϼ���.
�μ��� ���� ����(Kimberely)�� ǥ���մϴ�.
(106��)
*/
select 
        em.employee_id ���,
        em.first_name �̸�,
        de.department_name �μ���,
        ma.first_name �Ŵ���
from employees em ,employees ma ,departments de
where em.manager_id = ma.employee_id(+)
and em.department_id = de.department_id;


