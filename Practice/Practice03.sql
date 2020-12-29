<<<<<<< HEAD
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
=======
/*문제1.
직원들의 사번(employee_id), 이름(firt_name), 성(last_name)과 부서명(department_name)을
조회하여 부서이름(department_name) 오름차순, 사번(employee_id) 내림차순 으로 정렬하세요.
(106건)
*/
select
        em.employee_id 사번,
        em.first_name 이름,
        em.last_name 성,
        de.department_name 부서명
from employees em , departments de
where em.department_id = de.department_id
order by em.employee_id DESC;

/*문제2.
employees 테이블의 job_id는 현재의 업무아이디를 가지고 있습니다.
직원들의 사번(employee_id), 이름(firt_name), 급여(salary), 부서명(department_name),
현재업무(job_title)를 사번(employee_id) 오름차순 으로 정렬하세요.
부서가 없는 Kimberely(사번 178)은 표시하지 않습니다.
(106건)
*/
select
        em.employee_id 사번,
        em.first_name 이름,
        em.salary 급여,
        de.department_name 부서명,
        jo.job_title 현재업무
from employees em , departments de , jobs jo
where em.department_id = de.department_id
and em.job_id = jo.job_id
order by em.employee_id ASC;

/*문제2-1.
문제2에서 부서가 없는 Kimberely(사번 178)까지 표시해 보세요
(107건)
*/
select
        em.employee_id 사번,
        em.first_name 이름,
        em.salary 급여,
        de.department_name 부서명,
        jo.job_title 현재업무
from employees em , departments de , jobs jo
where em.department_id = de.department_id(+)
and em.job_id = jo.job_id
order by em.employee_id ASC;


/*문제3.
도시별로 위치한 부서들을 파악하려고 합니다.
도시아이디, 도시명, 부서명, 부서아이디를 도시아이디(오름차순)로 정렬하여 출력하세요 
부서가 없는 도시는 표시하지 않습니다.
(27건)
*/
select
        lo.location_id,
        lo.city,
        de.department_name,
        de.department_id
from locations lo, departments de
where lo.location_id = de.location_id
order by lo.location_id asc;

/*문제3-1.
문제3에서 부서가 없는 도시도 표시합니다. 
(43건)
*/
select
        lo.location_id,
        lo.city,
        de.department_name,
        de.department_id
from locations lo, departments de
where lo.location_id = de.location_id(+)--왼쪽(도시의id를 모두 표시함 즉 부서가 없을때도.)
order by lo.location_id asc;


/*문제4.
지역(regions)에 속한 나라들을 지역이름(region_name), 
나라이름(country_name)으로 출력하되 
지역이름(오름차순), 나라이름(내림차순) 으로 정렬하세요.
(25건)
*/
select
    re.region_name 지역이름,
    co.country_name 나라이름
from regions re,countries co
where re.region_id = co.region_id
order by re.region_name asc, co.country_name desc;


/*문제5. 
자신의 매니저보다 채용일(hire_date)이 빠른 사원의 
사번(employee_id), 이름(first_name)과 채용일(hire_date),
매니저이름(first_name), 매니저입사일(hire_date)을 조회하세요.
(37건)
*/
select
   emp.employee_id 사번,
   emp.first_name 이름,
   emp.hire_date 채용일,
   man.first_name 매니저이름,
   man.hire_date 매니저입사일
   
from employees emp, employees man
where emp.manager_id = man.employee_id
and emp.hire_date < man.hire_date;

/*문제6.
나라별로 어떠한 부서들이 위치하고 있는지 파악하려고 합니다.
나라명, 나라아이디, 도시명, 도시아이디, 부서명, 부서아이디를 나라명(오름차순)로 정렬하여 출력하세요.
값이 없는 경우 표시하지 않습니다.
(27건)
*/
select
   co.country_name 나라,
   co.country_id 나라아이디,
   lo.city 도시명,
   lo.location_id 도시아이디,
   de.department_name 부서명,
   de.department_id 부서아이디
from countries co, locations lo, departments de
where co.country_id = lo.country_id
and lo.location_id = de.location_id;

/*문제7.
job_history 테이블은 과거의 담당업무의 데이터를 가지고 있다.
과거의 업무아이디(job_id)가 ‘AC_ACCOUNT’로 근무한 사원의 사번, 이름(풀네임), 업무아이디, 시작일, 종료일을 출력하세요.
이름은 first_name과 last_name을 합쳐 출력합니다.
(2건)
*/
select
        joh.employee_id,
        em.first_name||' '||em.last_name 풀네임,
        em.job_id 업무아이디,
        joh.start_date 시작일,
        joh.end_date 종료일
from job_history joh,employees em
where joh.employee_id = em.employee_id
and joh.job_id = 'AC_ACCOUNT';

/*문제8.
각 부서(department)에 대해서 부서번호(department_id), 부서이름(department_name), 
매니저(manager)의 이름(first_name), 위치(locations)한 도시(city),
나라(countries)의 이름(countries_name) 그리고 지역구분(regions)의 이름(resion_name)까지 전부 출력해 보세요.
(11건)
*/
select 
        em.department_id 부서번호,
        de.department_name 부서이름,
        em.first_name 매니저이름,
        lo.city 도시,
        co.country_name 나라,
        re.region_name 지역
from employees em,departments de,locations lo,countries co,regions re
where em.employee_id = de.manager_id 
and de.location_id = lo.location_id
and lo.country_id = co.country_id
and co.region_id = re.region_id;

/*문제9.
각 사원(employee)에 대해서 사번(employee_id), 이름(first_name),
부서명(department_name), 매니저(manager)의 이름(first_name)을 조회하세요.
부서가 없는 직원(Kimberely)도 표시합니다.
(106명)
*/
select 
        em.employee_id 사번,
        em.first_name 이름,
        de.department_name 부서명,
        ma.first_name 매니저
>>>>>>> refs/remotes/origin/master
from employees em ,employees ma ,departments de
where em.manager_id = ma.employee_id(+)
and em.department_id = de.department_id;


