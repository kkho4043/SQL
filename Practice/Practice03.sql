<<<<<<< HEAD
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
=======
/*臾몄젣1.
吏곸썝�뱾�쓽 �궗踰�(employee_id), �씠由�(firt_name), �꽦(last_name)怨� 遺��꽌紐�(department_name)�쓣
議고쉶�븯�뿬 遺��꽌�씠由�(department_name) �삤由꾩감�닚, �궗踰�(employee_id) �궡由쇱감�닚 �쑝濡� �젙�젹�븯�꽭�슂.
(106嫄�)
*/
select
        em.employee_id �궗踰�,
        em.first_name �씠由�,
        em.last_name �꽦,
        de.department_name 遺��꽌紐�
from employees em , departments de
where em.department_id = de.department_id
order by em.employee_id DESC;

/*臾몄젣2.
employees �뀒�씠釉붿쓽 job_id�뒗 �쁽�옱�쓽 �뾽臾댁븘�씠�뵒瑜� 媛�吏�怨� �엳�뒿�땲�떎.
吏곸썝�뱾�쓽 �궗踰�(employee_id), �씠由�(firt_name), 湲됱뿬(salary), 遺��꽌紐�(department_name),
�쁽�옱�뾽臾�(job_title)瑜� �궗踰�(employee_id) �삤由꾩감�닚 �쑝濡� �젙�젹�븯�꽭�슂.
遺��꽌媛� �뾾�뒗 Kimberely(�궗踰� 178)��� �몴�떆�븯吏� �븡�뒿�땲�떎.
(106嫄�)
*/
select
        em.employee_id �궗踰�,
        em.first_name �씠由�,
        em.salary 湲됱뿬,
        de.department_name 遺��꽌紐�,
        jo.job_title �쁽�옱�뾽臾�
from employees em , departments de , jobs jo
where em.department_id = de.department_id
and em.job_id = jo.job_id
order by em.employee_id ASC;

/*臾몄젣2-1.
臾몄젣2�뿉�꽌 遺��꽌媛� �뾾�뒗 Kimberely(�궗踰� 178)源뚯�� �몴�떆�빐 蹂댁꽭�슂
(107嫄�)
*/
select
        em.employee_id �궗踰�,
        em.first_name �씠由�,
        em.salary 湲됱뿬,
        de.department_name 遺��꽌紐�,
        jo.job_title �쁽�옱�뾽臾�
from employees em , departments de , jobs jo
where em.department_id = de.department_id(+)
and em.job_id = jo.job_id
order by em.employee_id ASC;


/*臾몄젣3.
�룄�떆蹂꾨줈 �쐞移섑븳 遺��꽌�뱾�쓣 �뙆�븙�븯�젮怨� �빀�땲�떎.
�룄�떆�븘�씠�뵒, �룄�떆紐�, 遺��꽌紐�, 遺��꽌�븘�씠�뵒瑜� �룄�떆�븘�씠�뵒(�삤由꾩감�닚)濡� �젙�젹�븯�뿬 異쒕젰�븯�꽭�슂 
遺��꽌媛� �뾾�뒗 �룄�떆�뒗 �몴�떆�븯吏� �븡�뒿�땲�떎.
(27嫄�)
*/
select
        lo.location_id,
        lo.city,
        de.department_name,
        de.department_id
from locations lo, departments de
where lo.location_id = de.location_id
order by lo.location_id asc;

/*臾몄젣3-1.
臾몄젣3�뿉�꽌 遺��꽌媛� �뾾�뒗 �룄�떆�룄 �몴�떆�빀�땲�떎. 
(43嫄�)
*/
select
        lo.location_id,
        lo.city,
        de.department_name,
        de.department_id
from locations lo, departments de
where lo.location_id = de.location_id(+)--�쇊履�(�룄�떆�쓽id瑜� 紐⑤몢 �몴�떆�븿 利� 遺��꽌媛� �뾾�쓣�븣�룄.)
order by lo.location_id asc;


/*臾몄젣4.
吏��뿭(regions)�뿉 �냽�븳 �굹�씪�뱾�쓣 吏��뿭�씠由�(region_name), 
�굹�씪�씠由�(country_name)�쑝濡� 異쒕젰�븯�릺 
吏��뿭�씠由�(�삤由꾩감�닚), �굹�씪�씠由�(�궡由쇱감�닚) �쑝濡� �젙�젹�븯�꽭�슂.
(25嫄�)
*/
select
    re.region_name 吏��뿭�씠由�,
    co.country_name �굹�씪�씠由�
from regions re,countries co
where re.region_id = co.region_id
order by re.region_name asc, co.country_name desc;


/*臾몄젣5. 
�옄�떊�쓽 留ㅻ땲���蹂대떎 梨꾩슜�씪(hire_date)�씠 鍮좊Ⅸ �궗�썝�쓽 
�궗踰�(employee_id), �씠由�(first_name)怨� 梨꾩슜�씪(hire_date),
留ㅻ땲����씠由�(first_name), 留ㅻ땲����엯�궗�씪(hire_date)�쓣 議고쉶�븯�꽭�슂.
(37嫄�)
*/
select
   emp.employee_id �궗踰�,
   emp.first_name �씠由�,
   emp.hire_date 梨꾩슜�씪,
   man.first_name 留ㅻ땲����씠由�,
   man.hire_date 留ㅻ땲����엯�궗�씪
   
from employees emp, employees man
where emp.manager_id = man.employee_id
and emp.hire_date < man.hire_date;

/*臾몄젣6.
�굹�씪蹂꾨줈 �뼱�뼚�븳 遺��꽌�뱾�씠 �쐞移섑븯怨� �엳�뒗吏� �뙆�븙�븯�젮怨� �빀�땲�떎.
�굹�씪紐�, �굹�씪�븘�씠�뵒, �룄�떆紐�, �룄�떆�븘�씠�뵒, 遺��꽌紐�, 遺��꽌�븘�씠�뵒瑜� �굹�씪紐�(�삤由꾩감�닚)濡� �젙�젹�븯�뿬 異쒕젰�븯�꽭�슂.
媛믪씠 �뾾�뒗 寃쎌슦 �몴�떆�븯吏� �븡�뒿�땲�떎.
(27嫄�)
*/
select
   co.country_name �굹�씪,
   co.country_id �굹�씪�븘�씠�뵒,
   lo.city �룄�떆紐�,
   lo.location_id �룄�떆�븘�씠�뵒,
   de.department_name 遺��꽌紐�,
   de.department_id 遺��꽌�븘�씠�뵒
from countries co, locations lo, departments de
where co.country_id = lo.country_id
and lo.location_id = de.location_id;

/*臾몄젣7.
job_history �뀒�씠釉붿�� 怨쇨굅�쓽 �떞�떦�뾽臾댁쓽 �뜲�씠�꽣瑜� 媛�吏�怨� �엳�떎.
怨쇨굅�쓽 �뾽臾댁븘�씠�뵒(job_id)媛� ��쁀C_ACCOUNT��숇줈 洹쇰Т�븳 �궗�썝�쓽 �궗踰�, �씠由�(����꽕�엫), �뾽臾댁븘�씠�뵒, �떆�옉�씪, 醫낅즺�씪�쓣 異쒕젰�븯�꽭�슂.
�씠由꾩�� first_name怨� last_name�쓣 �빀爾� 異쒕젰�빀�땲�떎.
(2嫄�)
*/
select
        joh.employee_id,
        em.first_name||' '||em.last_name ����꽕�엫,
        em.job_id �뾽臾댁븘�씠�뵒,
        joh.start_date �떆�옉�씪,
        joh.end_date 醫낅즺�씪
from job_history joh,employees em
where joh.employee_id = em.employee_id
and joh.job_id = 'AC_ACCOUNT';

/*臾몄젣8.
媛� 遺��꽌(department)�뿉 ����빐�꽌 遺��꽌踰덊샇(department_id), 遺��꽌�씠由�(department_name), 
留ㅻ땲���(manager)�쓽 �씠由�(first_name), �쐞移�(locations)�븳 �룄�떆(city),
�굹�씪(countries)�쓽 �씠由�(countries_name) 洹몃━怨� 吏��뿭援щ텇(regions)�쓽 �씠由�(resion_name)源뚯�� �쟾遺� 異쒕젰�빐 蹂댁꽭�슂.
(11嫄�)
*/
select 
        em.department_id 遺��꽌踰덊샇,
        de.department_name 遺��꽌�씠由�,
        em.first_name 留ㅻ땲����씠由�,
        lo.city �룄�떆,
        co.country_name �굹�씪,
        re.region_name 吏��뿭
from employees em,departments de,locations lo,countries co,regions re
where em.employee_id = de.manager_id 
and de.location_id = lo.location_id
and lo.country_id = co.country_id
and co.region_id = re.region_id;

/*臾몄젣9.
媛� �궗�썝(employee)�뿉 ����빐�꽌 �궗踰�(employee_id), �씠由�(first_name),
遺��꽌紐�(department_name), 留ㅻ땲���(manager)�쓽 �씠由�(first_name)�쓣 議고쉶�븯�꽭�슂.
遺��꽌媛� �뾾�뒗 吏곸썝(Kimberely)�룄 �몴�떆�빀�땲�떎.
(106紐�)
*/
select 
        em.employee_id �궗踰�,
        em.first_name �씠由�,
        de.department_name 遺��꽌紐�,
        ma.first_name 留ㅻ땲���
>>>>>>> refs/remotes/origin/master
from employees em ,employees ma ,departments de
where em.manager_id = ma.employee_id(+)
and em.department_id = de.department_id;


