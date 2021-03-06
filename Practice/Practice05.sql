<<<<<<< HEAD
/*문제1.
담당 매니저가 배정되어있으나 커미션비율이 없고, 월급이 3000초과인 직원의 
이름, 매니저아이디, 커미션 비율, 월급 을 출력하세요.
(45건)
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
/*문제2. 
각 부서별로 최고의 급여를 받는 사원의 직원번호(employee_id),
이름(first_name), 급여(salary), 입사일(hire_date),
전화번호(phone_number), 부서번호(department_id) 를 조회하세요 
-조건절비교 방법으로 작성하세요
-급여의 내림차순으로 정렬하세요
-입사일은 2001-01-13 토요일 형식으로 출력합니다.
-전화번호는 515-123-4567 형식으로 출력합니다.
(11건)
*/
select
    employee_id 직원번호,
    first_name 이름,
    salary 급여,
    to_char(hire_date,'yyyy-mm-dd day') 입사일,
    replace(phone_number,'.','-') 전화번호,
    department_id 부서번호
from employees
where (department_id,salary) in (select 
                                        department_id,
                                        max(salary)
                                from employees
                                group by department_id)
order by salary desc;

-------------------------------------------------------------
/*문제3
매니저별로 평균급여 최소급여 최대급여를 알아보려고 한다.
-통계대상(직원)은 2005년 이후의 입사자 입니다.
-매니저별 평균급여가 5000이상만 출력합니다.
-매니저별 평균급여의 내림차순으로 출력합니다.
-매니저별 평균급여는 소수점 첫째자리에서 반올림 합니다.
-출력내용은 매니저아이디, 매니저이름(first_name), 매니저별평균급여, 매니저별최소급여, 매니저별최대급여 입니다.
(9건)
*/
select 
        ma.manager_id 매니저아이디,
        em.first_name 매니저이름,
        ma.avgsal 매니저별평균급여,
        ma.minsal 매니저별최소급여,
        ma.maxsal 매니저별최대급여
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
/*문제4.
각 사원(employee)에 대해서 사번(employee_id),
이름(first_name), 부서명(department_name),
매니저(manager)의 이름(first_name)을 조회하세요.
부서가 없는 직원(Kimberely)도 표시합니다.
(106명)
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
/*문제5.
2005년 이후 입사한 직원중에 입사일이 11번째에서 20번째의 직원의 
사번, 이름, 부서명, 급여, 입사일을 입사일 순서로 출력하세요
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
/*문제6.
가장 늦게 입사한 직원의 이름(first_name last_name)과
연봉(salary)과 근무하는 부서 이름(department_name)은?
*/

select
    em.first_name || ' '|| em.last_name 이름,
    em.salary 연봉,
    de.department_name 부서이름,
    em.hire_date
from employees em,departments de ,(select
                                         max(hire_date) maxhire
                                    from employees
                                    ) eh
where em.hire_date = eh.maxhire
and em.department_id = de.department_id;
-------------------------------------------------------------
/*문제7.
평균연봉(salary)이 가장 높은 부서 직원들의 직원번호(employee_id),
이름(firt_name), 성(last_name)과  업무(job_title), 연봉(salary)을 조회하시오.
*/
select 
        em.employee_id 사번,
        em.first_name 이름,
        em.last_name 성,
        jo.job_title 업무,
        av.avsal,
        em.salary 연봉 
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
/*문제8.
평균 급여(salary)가 가장 높은 부서는? 
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

--2번째 방법
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
/*문제9.
평균 급여(salary)가 가장 높은 지역은? 
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
--2번째 방법 rownum 이용하기
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
/*문제10.
평균 급여(salary)가 가장 높은 업무는? 
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
--방법2
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
       
=======
/*臾몄젣1.
�떞�떦 留ㅻ땲���媛� 諛곗젙�릺�뼱�엳�쑝�굹 而ㅻ�몄뀡鍮꾩쑉�씠 �뾾怨�, �썡湲됱씠 3000珥덇낵�씤 吏곸썝�쓽 
�씠由�, 留ㅻ땲����븘�씠�뵒, 而ㅻ�몄뀡 鍮꾩쑉, �썡湲� �쓣 異쒕젰�븯�꽭�슂.
(45嫄�)
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
/*臾몄젣2. 
媛� 遺��꽌蹂꾨줈 理쒓퀬�쓽 湲됱뿬瑜� 諛쏅뒗 �궗�썝�쓽 吏곸썝踰덊샇(employee_id),
�씠由�(first_name), 湲됱뿬(salary), �엯�궗�씪(hire_date),
�쟾�솕踰덊샇(phone_number), 遺��꽌踰덊샇(department_id) 瑜� 議고쉶�븯�꽭�슂 
-議곌굔�젅鍮꾧탳 諛⑸쾿�쑝濡� �옉�꽦�븯�꽭�슂
-湲됱뿬�쓽 �궡由쇱감�닚�쑝濡� �젙�젹�븯�꽭�슂
-�엯�궗�씪��� 2001-01-13 �넗�슂�씪 �삎�떇�쑝濡� 異쒕젰�빀�땲�떎.
-�쟾�솕踰덊샇�뒗 515-123-4567 �삎�떇�쑝濡� 異쒕젰�빀�땲�떎.
(11嫄�)
*/
select
    employee_id 吏곸썝踰덊샇,
    first_name �씠由�,
    salary 湲됱뿬,
    to_char(hire_date,'yyyy-mm-dd day') �엯�궗�씪,
    replace(phone_number,'.','-') �쟾�솕踰덊샇,
    department_id 遺��꽌踰덊샇
from employees
where (department_id,salary) in (select 
                                        department_id,
                                        max(salary)
                                from employees
                                group by department_id)
order by salary desc;

-------------------------------------------------------------
/*臾몄젣3
留ㅻ땲���蹂꾨줈 �룊洹좉툒�뿬 理쒖냼湲됱뿬 理쒕��湲됱뿬瑜� �븣�븘蹂대젮怨� �븳�떎.
-�넻怨꾨���긽(吏곸썝)��� 2005�뀈 �씠�썑�쓽 �엯�궗�옄 �엯�땲�떎.
-留ㅻ땲���蹂� �룊洹좉툒�뿬媛� 5000�씠�긽留� 異쒕젰�빀�땲�떎.
-留ㅻ땲���蹂� �룊洹좉툒�뿬�쓽 �궡由쇱감�닚�쑝濡� 異쒕젰�빀�땲�떎.
-留ㅻ땲���蹂� �룊洹좉툒�뿬�뒗 �냼�닔�젏 泥レ㎏�옄由ъ뿉�꽌 諛섏삱由� �빀�땲�떎.
-異쒕젰�궡�슜��� 留ㅻ땲����븘�씠�뵒, 留ㅻ땲����씠由�(first_name), 留ㅻ땲���蹂꾪룊洹좉툒�뿬, 留ㅻ땲���蹂꾩턀�냼湲됱뿬, 留ㅻ땲���蹂꾩턀���湲됱뿬 �엯�땲�떎.
(9嫄�)
*/
select 
        ma.manager_id 留ㅻ땲����븘�씠�뵒,
        em.first_name 留ㅻ땲����씠由�,
        ma.avgsal 留ㅻ땲���蹂꾪룊洹좉툒�뿬,
        ma.minsal 留ㅻ땲���蹂꾩턀�냼湲됱뿬,
        ma.maxsal 留ㅻ땲���蹂꾩턀���湲됱뿬
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
/*臾몄젣4.
媛� �궗�썝(employee)�뿉 ����빐�꽌 �궗踰�(employee_id),
�씠由�(first_name), 遺��꽌紐�(department_name),
留ㅻ땲���(manager)�쓽 �씠由�(first_name)�쓣 議고쉶�븯�꽭�슂.
遺��꽌媛� �뾾�뒗 吏곸썝(Kimberely)�룄 �몴�떆�빀�땲�떎.
(106紐�)
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
/*臾몄젣5.
2005�뀈 �씠�썑 �엯�궗�븳 吏곸썝以묒뿉 �엯�궗�씪�씠 11踰덉㎏�뿉�꽌 20踰덉㎏�쓽 吏곸썝�쓽 
�궗踰�, �씠由�, 遺��꽌紐�, 湲됱뿬, �엯�궗�씪�쓣 �엯�궗�씪 �닚�꽌濡� 異쒕젰�븯�꽭�슂
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
/*臾몄젣6.
媛��옣 �뒭寃� �엯�궗�븳 吏곸썝�쓽 �씠由�(first_name last_name)怨�
�뿰遊�(salary)怨� 洹쇰Т�븯�뒗 遺��꽌 �씠由�(department_name)���?
*/

select
    em.first_name || ' '|| em.last_name �씠由�,
    em.salary �뿰遊�,
    de.department_name 遺��꽌�씠由�,
    em.hire_date
from employees em,departments de ,(select
                                         max(hire_date) maxhire
                                    from employees
                                    ) eh
where em.hire_date = eh.maxhire
and em.department_id = de.department_id;
-------------------------------------------------------------
/*臾몄젣7.
�룊洹좎뿰遊�(salary)�씠 媛��옣 �넂��� 遺��꽌 吏곸썝�뱾�쓽 吏곸썝踰덊샇(employee_id),
�씠由�(firt_name), �꽦(last_name)怨�  �뾽臾�(job_title), �뿰遊�(salary)�쓣 議고쉶�븯�떆�삤.
*/
select 
        em.employee_id �궗踰�,
        em.first_name �씠由�,
        em.last_name �꽦,
        jo.job_title �뾽臾�,
        av.avsal,
        em.salary �뿰遊� 
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
/*臾몄젣8.
�룊洹� 湲됱뿬(salary)媛� 媛��옣 �넂��� 遺��꽌�뒗? 
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

--2踰덉㎏ 諛⑸쾿
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
/*臾몄젣9.
�룊洹� 湲됱뿬(salary)媛� 媛��옣 �넂��� 吏��뿭���? 
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
--2踰덉㎏ 諛⑸쾿 rownum �씠�슜�븯湲�
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
/*臾몄젣10.
�룊洹� 湲됱뿬(salary)媛� 媛��옣 �넂��� �뾽臾대뒗? 
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
--諛⑸쾿2
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
       
>>>>>>> refs/remotes/origin/master
