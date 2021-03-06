<<<<<<< HEAD
/*문제1.
평균 급여보다 적은 급여을 받는 직원은 몇명인지 구하시요.
(56건)
*/
select
        count(*)
from employees
where salary < (select avg(salary)
                from employees
                );

--//////////////////////////////////////////////////////////////////////////////////////
/*문제2. 
평균급여 이상, 최대급여 이하의 월급을 받는 사원의 
직원번호(employee_id), 이름(first_name), 급여(salary), 
평균급여, 최대급여를 급여의 오름차순으로 정렬하여 출력하세요 
(51건)
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
/*문제3.
직원중 Steven(first_name) king(last_name)이 소속된 부서(departments)가 있는 곳의
주소를 알아보려고 한다.
도시아이디(location_id), 거리명(street_address), 우편번호(postal_code),
도시명(city), 주(state_province), 나라아이디(country_id) 를 출력하세요
(1건)
*/
--어제 배운방법.
select
   lo.*
from employees e, departments de, locations lo
where e.department_id = de.department_id
and de.location_id = lo.location_id
and e.first_name = 'Steven'
and last_name = 'King'
;

--from에서 하는 방법 1?
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

--from에서 하는 방법 2?
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
--where에서 하는방법
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
  
/*문제4.
job_id 가 'ST_MAN' 인 직원의 급여보다 작은 직원의 
사번,이름,급여를 급여의 내림차순으로 출력하세요  -ANY연산자 사용
(74건)
*/
--방법1
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

--방법2
select DISTINCT --중복제거.
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
/*문제5. 
각 부서별로 최고의 급여를 받는 사원의 직원번호(employee_id), 이름(first_name)과 급여(salary) 부서번호(department_id)를 조회하세요 
단 조회결과는 급여의 내림차순으로 정렬되어 나타나야 합니다. 
조건절비교, 테이블조인 2가지 방법으로 작성하세요
(11건)
*/
--조건절 비교
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
--테이블조인                                   
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
/*문제6.
각 업무(job) 별로 연봉(salary)의 총합을 구하고자 합니다. 
연봉 총합이 가장 높은 업무부터 업무명(job_title)과 연봉 총합을 조회하시오 
(19건)
*/
select 
        jo.job_title,
        sum(em.salary)
from employees em ,jobs jo
where em.job_id = jo.job_id
group by jo.job_title;
--//////////////////////////////////////////////////////////////////////////////////////
/*문제7.
자신의 부서 평균 급여보다 연봉(salary)이 많은 직원의 직원번호(employee_id),
이름(first_name)과 급여(salary)을 조회하세요 
(38건)
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
                   
/*문제8.
직원 입사일이 11번째에서 15번째의 직원의 사번, 
이름, 급여, 입사일을 입사일 순서로 출력하세요
=======
/*臾몄젣1.
�룊洹� 湲됱뿬蹂대떎 �쟻��� 湲됱뿬�쓣 諛쏅뒗 吏곸썝��� 紐뉖챸�씤吏� 援ы븯�떆�슂.
(56嫄�)
*/
select
        count(*)
from employees
where salary < (select avg(salary)
                from employees
                );

--//////////////////////////////////////////////////////////////////////////////////////
/*臾몄젣2. 
�룊洹좉툒�뿬 �씠�긽, 理쒕��湲됱뿬 �씠�븯�쓽 �썡湲됱쓣 諛쏅뒗 �궗�썝�쓽 
吏곸썝踰덊샇(employee_id), �씠由�(first_name), 湲됱뿬(salary), 
�룊洹좉툒�뿬, 理쒕��湲됱뿬瑜� 湲됱뿬�쓽 �삤由꾩감�닚�쑝濡� �젙�젹�븯�뿬 異쒕젰�븯�꽭�슂 
(51嫄�)
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
/*臾몄젣3.
吏곸썝以� Steven(first_name) king(last_name)�씠 �냼�냽�맂 遺��꽌(departments)媛� �엳�뒗 怨녹쓽
二쇱냼瑜� �븣�븘蹂대젮怨� �븳�떎.
�룄�떆�븘�씠�뵒(location_id), 嫄곕━紐�(street_address), �슦�렪踰덊샇(postal_code),
�룄�떆紐�(city), 二�(state_province), �굹�씪�븘�씠�뵒(country_id) 瑜� 異쒕젰�븯�꽭�슂
(1嫄�)
*/
--�뼱�젣 諛곗슫諛⑸쾿.
select
   lo.*
from employees e, departments de, locations lo
where e.department_id = de.department_id
and de.location_id = lo.location_id
and e.first_name = 'Steven'
and last_name = 'King'
;

--from�뿉�꽌 �븯�뒗 諛⑸쾿 1?
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

--from�뿉�꽌 �븯�뒗 諛⑸쾿 2?
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
--where�뿉�꽌 �븯�뒗諛⑸쾿
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
  
/*臾몄젣4.
job_id 媛� 'ST_MAN' �씤 吏곸썝�쓽 湲됱뿬蹂대떎 �옉��� 吏곸썝�쓽 
�궗踰�,�씠由�,湲됱뿬瑜� 湲됱뿬�쓽 �궡由쇱감�닚�쑝濡� 異쒕젰�븯�꽭�슂  -ANY�뿰�궛�옄 �궗�슜
(74嫄�)
*/
--諛⑸쾿1
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

--諛⑸쾿2
select DISTINCT --以묐났�젣嫄�.
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
/*臾몄젣5. 
媛� 遺��꽌蹂꾨줈 理쒓퀬�쓽 湲됱뿬瑜� 諛쏅뒗 �궗�썝�쓽 吏곸썝踰덊샇(employee_id), �씠由�(first_name)怨� 湲됱뿬(salary) 遺��꽌踰덊샇(department_id)瑜� 議고쉶�븯�꽭�슂 
�떒 議고쉶寃곌낵�뒗 湲됱뿬�쓽 �궡由쇱감�닚�쑝濡� �젙�젹�릺�뼱 �굹����굹�빞 �빀�땲�떎. 
議곌굔�젅鍮꾧탳, �뀒�씠釉붿“�씤 2媛�吏� 諛⑸쾿�쑝濡� �옉�꽦�븯�꽭�슂
(11嫄�)
*/
--議곌굔�젅 鍮꾧탳
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
--�뀒�씠釉붿“�씤                                   
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
/*臾몄젣6.
媛� �뾽臾�(job) 蹂꾨줈 �뿰遊�(salary)�쓽 珥앺빀�쓣 援ы븯怨좎옄 �빀�땲�떎. 
�뿰遊� 珥앺빀�씠 媛��옣 �넂��� �뾽臾대���꽣 �뾽臾대챸(job_title)怨� �뿰遊� 珥앺빀�쓣 議고쉶�븯�떆�삤 
(19嫄�)
*/
select 
        jo.job_title,
        sum(em.salary)
from employees em ,jobs jo
where em.job_id = jo.job_id
group by jo.job_title;
--//////////////////////////////////////////////////////////////////////////////////////
/*臾몄젣7.
�옄�떊�쓽 遺��꽌 �룊洹� 湲됱뿬蹂대떎 �뿰遊�(salary)�씠 留롮�� 吏곸썝�쓽 吏곸썝踰덊샇(employee_id),
�씠由�(first_name)怨� 湲됱뿬(salary)�쓣 議고쉶�븯�꽭�슂 
(38嫄�)
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
                   
/*臾몄젣8.
吏곸썝 �엯�궗�씪�씠 11踰덉㎏�뿉�꽌 15踰덉㎏�쓽 吏곸썝�쓽 �궗踰�, 
�씠由�, 湲됱뿬, �엯�궗�씪�쓣 �엯�궗�씪 �닚�꽌濡� 異쒕젰�븯�꽭�슂
>>>>>>> refs/remotes/origin/master
*/
