select *from employees;
/*����1.
�Ŵ����� �ִ� ������ �� ���Դϱ�? �Ʒ��� ����� �������� �������� �ۼ��ϼ���
*/
select 
        count(manager_id) "haveMngCnt"
from employees;

/*����2. 
�����߿� �ְ��ӱ�(salary)��  �����ӱ��� ���ְ��ӱ�, �������ӱݡ��������� Ÿ��Ʋ�� �Բ� ����� ������. 
�� �ӱ��� ���̴� ���ΰ���?  ���ְ��ӱ� ? �����ӱݡ��̶� Ÿ��Ʋ�� �Բ� ����� ������.
*/
select 
       max(salary) �ְ��ӱ�,
       min(salary) �����ӱ�,
       (max(salary)-min(salary)) "�ְ��ӱ� - �����ӱ�"
       
from employees;
/*����3.
���������� ���Ի���� ���� ���� ���� �Դϱ�? ���� �������� ������ּ���.
��) 2014�� 07�� 10��
*/
select 
     TO_CHAR(max(hire_date),'YYYY"��"MM"��"DD"��"')
from employees;

/*����4.
�μ����� ����ӱ�, �ְ��ӱ�, �����ӱ��� �μ����̵�(department_id)�� �Բ� ����մϴ�.
���ļ����� �μ���ȣ(department_id) ���������Դϴ�.
*/

select 
        AVG(salary) ����ӱ�,
        MAX(salary) �ְ��ӱ�,
        MIN(salary) �����ӱ�,
        department_id �μ����̵�
from employees
GROUP by department_id
ORDER by department_id DESC;

/*����5.
����(job_id)���� ����ӱ�, �ְ��ӱ�, �����ӱ��� �������̵�(job_id)�� �Բ� ����ϰ� ���ļ�����
�����ӱ� ��������, ����ӱ�(�Ҽ��� �ݿø�), �������� ���Դϴ�.
(���ļ����� �ּ��ӱ� 2500 �����϶� Ȯ���غ� ��)
*/
select 
        AVG(salary) ����ӱ�,
        MAX(salary) �ְ��ӱ�,
        MIN(salary) �����ӱ�,
        job_id �������̵�
from employees
GROUP by job_id
ORDER by MIN(salary) DESC,AVG(salary) asc;

/*����6.
���� ���� �ټ��� ������ �Ի����� �����ΰ���? ���� �������� ������ּ���.
��) 2001-01-13 �����
*/
select 
     TO_CHAR(min(hire_date),'YYYY-MM-DD day')
from employees;

/*����7.
����ӱݰ� �����ӱ��� ���̰� 2000 �̸��� �μ�(department_id),
����ӱ�, �����ӱ� �׸��� (����ӱ� ? �����ӱ�)�� (����ӱ� ? �����ӱ�)�� ������������ �����ؼ� ����ϼ���.
*/
select 

        AVG(salary) ����ӱ�,
        MIN(salary) �����ӱ�,
       (AVG(salary)-min(salary)) "����ӱ� - �����ӱ�"
from employees
GROUP by department_id
having (AVG(salary)- MIN(salary)) < 2000
ORDER by (AVG(salary)-min(salary)) DESC;


/*����8.
����(JOBS)���� �ְ��ӱݰ� �����ӱ��� ���̸� ����غ�����.
���̸� Ȯ���� �� �ֵ��� ������������ �����ϼ���? 
*/
select 
        job_id,
       (MAX(salary)-min(salary)) "�ְ��ӱ� - �����ӱ�"
from employees
GROUP by job_id
ORDER by(MAX(salary)-min(salary)) DESC;

/*
����9
2005�� ���� �Ի����� �����ں��� ��ձ޿� �ּұ޿� �ִ�޿��� �˾ƺ����� �Ѵ�.
����� �����ں��� ��ձ޿��� 5000�̻� �߿� ��ձ޿� �ּұ޿� �ִ�޿��� ����մϴ�.
��ձ޿��� ������������ �����ϰ� ��ձ޿��� �Ҽ��� ù°¥������ �ݿø� �Ͽ� ����մϴ�
*/

select 
        ROUND(AVG(salary),0) ��ձ޿�,
        MIN(salary) �����޿�,
        MAX(salary) �ִ�޿�
from employees
GROUP by manager_id
HAVING AVG(salary) >= 5000
ORDER by AVG(salary) DESC;

/*����10
�Ʒ�ȸ��� ���ʽ� ������ ���� ������ �Ի��� �������� �������� �մϴ�. 
�Ի����� 02/12/31�� �����̸� 'â���ɹ�, 03���� '03���Ի硯, 04���� ��04���Ի硯 
�����Ի��ڴ� �����������Ի硯 optDate �÷��� �����ͷ� ����ϼ���.
������ �Ի��Ϸ� ������������ �����մϴ�.
*/

select 
        hire_date,
        case when TO_DATE(hire_date,'YY.MM.DD') > TO_DATE(04.12.31,'YY.MM.DD') then 'â���ɹ�'
             when TO_DATE(hire_date,'YY.MM.DD') > 03/12/31 then '03���Ի�'
             when TO_DATE(hire_date,'YY.MM.DD') > 02/12/31 then '04���Ի�'
             else '���������Ի�'
        end optDate
from employees;

select
        hire_date,
WHERE TO_DATE(hire_date,'YYMMDD') > TO_DATE(041231,'YYMMDD')
from employees;



