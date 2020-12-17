
/*1��
��ü������ ���� ������ ��ȸ�ϼ���. ������ �Ի���(hire_date)�� 
�ø�����(ASC)���� ���� ���Ӻ��� ����� �ǵ��� �ϼ���. 
�̸�(first_name last_name),  ����(salary),
��ȭ��ȣ(phone_number), �Ի���(hire_date) �����̰� 
���̸���, �����ޡ�, ����ȭ��ȣ��, ���Ի��ϡ� �� �÷��̸��� ��ü�� ������.
*/
SELECT
        first_name �̸�,
        salary ����,
        phone_number ��ȭ��ȣ,
        hire_date �Ի���
FROM employees
ORDER by hire_date asc;

/*2��
����(jobs)���� �����̸�(job_title)�� 
�ְ����(max_salary)�� ������ ��������(DESC)�� �����ϼ���.
*/
SELECT
        job_title ����,
        max_salary �ְ����    
FROM jobs
ORDER by max_salary DESC;

/*3��
��� �Ŵ����� �����Ǿ������� Ŀ�̼Ǻ����� ����, ������ 3000�ʰ��� ������ �̸�, �Ŵ������̵�, Ŀ�̼� ����, ���� �� ����ϼ���.
*/
SELECT
        first_name,
        manager_id,
        commission_pct,
        salary
FROM employees
where manager_id is not null
and commission_pct is null
and salary > 3000;
/*4��
�ְ����(max_salary)�� 10000 �̻��� ������ �̸�(job_title)
�� �ְ����(max_salary)�� �ְ������(max_salary) 
��������(DESC)�� �����Ͽ� ����ϼ���.    
*/
SELECT
        job_title ����,
        max_salary �ְ����    
FROM jobs
WHERE max_salary > 10000
ORDER by max_salary DESC;

/*5��
������ 14000 �̸� 10000 �̻��� ������ �̸�(first_name),
����, Ŀ�̼��ۼ�Ʈ ��  ���޼�(��������) ����ϼ���.
�� Ŀ�̼��ۼ�Ʈ �� null �̸� 0 ���� ��Ÿ���ÿ�
*/
SELECT
        first_name �̸�,
        salary ����,
        NVL(commission_pct,0) Ŀ�̼��ۼ�Ʈ
FROM employees
where salary  between 10000 and 14000;
ORDER by salary DESC;


/*6��
�μ���ȣ�� 10, 90, 100 �� ������ �̸�, ����, �Ի���, �μ���ȣ�� ��Ÿ���ÿ�
�Ի����� 1977-12 �� ���� ǥ���Ͻÿ�
*/
SELECT
       first_name �̸�,
       salary ����,
       to_char(hire_date,'YYYY-MM')�Ի���,
       department_id �μ�
FROM employees
where department_id in (10 , 90 , 100);

/*7��
�̸�(first_name)�� S �Ǵ� s �� ���� ������ �̸�, ������ ��Ÿ���ÿ�
*/
SELECT
       first_name �̸�,
       salary ����
FROM employees
where first_name like'%s%' or first_name like '%S%';

/*
8��
��ü �μ��� ����Ϸ��� �մϴ�. ������ �μ��̸��� �� ������� ����� ������.
*/
SELECT
       NVL(department_id ,0)�μ�
FROM employees
ORDER by LENGTH(department_id);


/*9��.
��Ȯ���� ������, ���簡 ���� ������ ����Ǵ� ������� �����̸��� �빮�ڷ� ����ϰ�
�ø�����(ASC)���� ������ ������.
*/
SELECT
      upper(country_name) ����
FROM COUNTRIES
order by country_name ASC;
/*10��
�Ի����� 03/12/31 �� ���� �Ի��� ������ �̸�, ����, ��ȭ ��ȣ, �Ի����� ����ϼ���
��ȭ��ȣ�� 545-343-3433 �� ���� ���·� ����Ͻÿ�.
*/
SELECT
        first_name �̸�,
        salary ����,
        REPLACE (phone_number, '.', '-'),
        
        hire_date �Ի���
FROM EMPLOYEES
WHERE hire_date <('03/12/31');



