select *from employees;
<<<<<<< HEAD
/*문제1.
매니저가 있는 직원은 몇 명입니까? 아래의 결과가 나오도록 쿼리문을 작성하세요
*/
select 
        count(manager_id) "haveMngCnt"
from employees;

/*문제2. 
직원중에 최고임금(salary)과  최저임금을 “최고임금, “최저임금”프로젝션 타이틀로 함께 출력해 보세요. 
두 임금의 차이는 얼마인가요?  “최고임금 ? 최저임금”이란 타이틀로 함께 출력해 보세요.
*/
select 
       max(salary) 최고임금,
       min(salary) 최저임금,
       (max(salary)-min(salary)) "최고임금 - 최저임금"
       
from employees;
/*문제3.
마지막으로 신입사원이 들어온 날은 언제 입니까? 다음 형식으로 출력해주세요.
예) 2014년 07월 10일
*/
select 
     TO_CHAR(max(hire_date),'YYYY"년"MM"월"DD"일"')
from employees;

/*문제4.
부서별로 평균임금, 최고임금, 최저임금을 부서아이디(department_id)와 함께 출력합니다.
정렬순서는 부서번호(department_id) 내림차순입니다.
*/

select 
        AVG(salary) 평균임금,
        MAX(salary) 최고임금,
        MIN(salary) 최저임금,
        department_id 부서아이디
from employees
GROUP by department_id
ORDER by department_id DESC;

/*문제5.
업무(job_id)별로 평균임금, 최고임금, 최저임금을 업무아이디(job_id)와 함께 출력하고 정렬순서는
최저임금 내림차순, 평균임금(소수점 반올림), 오름차순 순입니다.
(정렬순서는 최소임금 2500 구간일때 확인해볼 것)
*/
select 
        AVG(salary) 평균임금,
        MAX(salary) 최고임금,
        MIN(salary) 최저임금,
        job_id 업무아이디
from employees
GROUP by job_id
ORDER by MIN(salary) DESC,AVG(salary) asc;

/*문제6.
가장 오래 근속한 직원의 입사일은 언제인가요? 다음 형식으로 출력해주세요.
예) 2001-01-13 토요일
*/
select 
     TO_CHAR(min(hire_date),'YYYY-MM-DD day')
from employees;

/*문제7.
평균임금과 최저임금의 차이가 2000 미만인 부서(department_id),
평균임금, 최저임금 그리고 (평균임금 ? 최저임금)를 (평균임금 ? 최저임금)의 내림차순으로 정렬해서 출력하세요.
*/
select 

        AVG(salary) 평균임금,
        MIN(salary) 최저임금,
       (AVG(salary)-min(salary)) "평균임금 - 최저임금"
from employees
GROUP by department_id
having (AVG(salary)- MIN(salary)) < 2000
ORDER by (AVG(salary)-min(salary)) DESC;


/*문제8.
업무(JOBS)별로 최고임금과 최저임금의 차이를 출력해보세요.
차이를 확인할 수 있도록 내림차순으로 정렬하세요? 
*/
select 
        job_id,
       (MAX(salary)-min(salary)) "최고임금 - 최저임금"
from employees
GROUP by job_id
ORDER by(MAX(salary)-min(salary)) DESC;

/*
문제9
2005년 이후 입사자중 관리자별로 평균급여 최소급여 최대급여를 알아보려고 한다.
출력은 관리자별로 평균급여가 5000이상 중에 평균급여 최소급여 최대급여를 출력합니다.
평균급여의 내림차순으로 정렬하고 평균급여는 소수점 첫째짜리에서 반올림 하여 출력합니다
*/

select 
        ROUND(AVG(salary),0) 평균급여,
        MIN(salary) 최저급여,
        MAX(salary) 최대급여
from employees
GROUP by manager_id
HAVING AVG(salary) >= 5000
ORDER by AVG(salary) DESC;

/*문제10
아래회사는 보너스 지급을 위해 직원을 입사일 기준으로 나눌려고 합니다. 
입사일이 02/12/31일 이전이면 '창립맴버, 03년은 '03년입사’, 04년은 ‘04년입사’ 
이후입사자는 ‘상장이후입사’ optDate 컬럼의 데이터로 출력하세요.
정렬은 입사일로 오름차순으로 정렬합니다.
*/

select 
        hire_date,
        case when TO_DATE(hire_date,'YY.MM.DD') < TO_DATE(20021231) then '창립맴버'
             when TO_DATE(hire_date,'YY.MM.DD') < TO_DATE(20031231) then '03년입사'
             when TO_DATE(hire_date,'YY.MM.DD') < TO_DATE(20041231) then '04년입사'
             else '상장이후입사'
        end "optDate"
from employees
order by hire_date asc;
=======
/*臾몄젣1.
留ㅻ땲���媛� �엳�뒗 吏곸썝��� 紐� 紐낆엯�땲源�? �븘�옒�쓽 寃곌낵媛� �굹�삤�룄濡� 荑쇰━臾몄쓣 �옉�꽦�븯�꽭�슂
*/
select 
        count(manager_id) "haveMngCnt"
from employees;

/*臾몄젣2. 
吏곸썝以묒뿉 理쒓퀬�엫湲�(salary)怨�  理쒖���엫湲덉쓣 ��쒖턀怨좎엫湲�, ��쒖턀����엫湲댿�앺봽濡쒖젥�뀡 ����씠���濡� �븿猿� 異쒕젰�빐 蹂댁꽭�슂. 
�몢 �엫湲덉쓽 李⑥씠�뒗 �뼹留덉씤媛��슂?  ��쒖턀怨좎엫湲� ? 理쒖���엫湲댿�앹씠��� ����씠���濡� �븿猿� 異쒕젰�빐 蹂댁꽭�슂.
*/
select 
       max(salary) 理쒓퀬�엫湲�,
       min(salary) 理쒖���엫湲�,
       (max(salary)-min(salary)) "理쒓퀬�엫湲� - 理쒖���엫湲�"
       
from employees;
/*臾몄젣3.
留덉��留됱쑝濡� �떊�엯�궗�썝�씠 �뱾�뼱�삩 �궇��� �뼵�젣 �엯�땲源�? �떎�쓬 �삎�떇�쑝濡� 異쒕젰�빐二쇱꽭�슂.
�삁) 2014�뀈 07�썡 10�씪
*/
select 
     TO_CHAR(max(hire_date),'YYYY"�뀈"MM"�썡"DD"�씪"')
from employees;

/*臾몄젣4.
遺��꽌蹂꾨줈 �룊洹좎엫湲�, 理쒓퀬�엫湲�, 理쒖���엫湲덉쓣 遺��꽌�븘�씠�뵒(department_id)��� �븿猿� 異쒕젰�빀�땲�떎.
�젙�젹�닚�꽌�뒗 遺��꽌踰덊샇(department_id) �궡由쇱감�닚�엯�땲�떎.
*/

select 
        AVG(salary) �룊洹좎엫湲�,
        MAX(salary) 理쒓퀬�엫湲�,
        MIN(salary) 理쒖���엫湲�,
        department_id 遺��꽌�븘�씠�뵒
from employees
GROUP by department_id
ORDER by department_id DESC;

/*臾몄젣5.
�뾽臾�(job_id)蹂꾨줈 �룊洹좎엫湲�, 理쒓퀬�엫湲�, 理쒖���엫湲덉쓣 �뾽臾댁븘�씠�뵒(job_id)��� �븿猿� 異쒕젰�븯怨� �젙�젹�닚�꽌�뒗
理쒖���엫湲� �궡由쇱감�닚, �룊洹좎엫湲�(�냼�닔�젏 諛섏삱由�), �삤由꾩감�닚 �닚�엯�땲�떎.
(�젙�젹�닚�꽌�뒗 理쒖냼�엫湲� 2500 援ш컙�씪�븣 �솗�씤�빐蹂� 寃�)
*/
select 
        AVG(salary) �룊洹좎엫湲�,
        MAX(salary) 理쒓퀬�엫湲�,
        MIN(salary) 理쒖���엫湲�,
        job_id �뾽臾댁븘�씠�뵒
from employees
GROUP by job_id
ORDER by MIN(salary) DESC,AVG(salary) asc;

/*臾몄젣6.
媛��옣 �삤�옒 洹쇱냽�븳 吏곸썝�쓽 �엯�궗�씪��� �뼵�젣�씤媛��슂? �떎�쓬 �삎�떇�쑝濡� 異쒕젰�빐二쇱꽭�슂.
�삁) 2001-01-13 �넗�슂�씪
*/
select 
     TO_CHAR(min(hire_date),'YYYY-MM-DD day')
from employees;

/*臾몄젣7.
�룊洹좎엫湲덇낵 理쒖���엫湲덉쓽 李⑥씠媛� 2000 誘몃쭔�씤 遺��꽌(department_id),
�룊洹좎엫湲�, 理쒖���엫湲� 洹몃━怨� (�룊洹좎엫湲� ? 理쒖���엫湲�)瑜� (�룊洹좎엫湲� ? 理쒖���엫湲�)�쓽 �궡由쇱감�닚�쑝濡� �젙�젹�빐�꽌 異쒕젰�븯�꽭�슂.
*/
select 

        AVG(salary) �룊洹좎엫湲�,
        MIN(salary) 理쒖���엫湲�,
       (AVG(salary)-min(salary)) "�룊洹좎엫湲� - 理쒖���엫湲�"
from employees
GROUP by department_id
having (AVG(salary)- MIN(salary)) < 2000
ORDER by (AVG(salary)-min(salary)) DESC;


/*臾몄젣8.
�뾽臾�(JOBS)蹂꾨줈 理쒓퀬�엫湲덇낵 理쒖���엫湲덉쓽 李⑥씠瑜� 異쒕젰�빐蹂댁꽭�슂.
李⑥씠瑜� �솗�씤�븷 �닔 �엳�룄濡� �궡由쇱감�닚�쑝濡� �젙�젹�븯�꽭�슂? 
*/
select 
        job_id,
       (MAX(salary)-min(salary)) "理쒓퀬�엫湲� - 理쒖���엫湲�"
from employees
GROUP by job_id
ORDER by(MAX(salary)-min(salary)) DESC;

/*
臾몄젣9
2005�뀈 �씠�썑 �엯�궗�옄以� 愿�由ъ옄蹂꾨줈 �룊洹좉툒�뿬 理쒖냼湲됱뿬 理쒕��湲됱뿬瑜� �븣�븘蹂대젮怨� �븳�떎.
異쒕젰��� 愿�由ъ옄蹂꾨줈 �룊洹좉툒�뿬媛� 5000�씠�긽 以묒뿉 �룊洹좉툒�뿬 理쒖냼湲됱뿬 理쒕��湲됱뿬瑜� 異쒕젰�빀�땲�떎.
�룊洹좉툒�뿬�쓽 �궡由쇱감�닚�쑝濡� �젙�젹�븯怨� �룊洹좉툒�뿬�뒗 �냼�닔�젏 泥レ㎏吏쒕━�뿉�꽌 諛섏삱由� �븯�뿬 異쒕젰�빀�땲�떎
*/

select 
        ROUND(AVG(salary),0) �룊洹좉툒�뿬,
        MIN(salary) 理쒖��湲됱뿬,
        MAX(salary) 理쒕��湲됱뿬
from employees
GROUP by manager_id
HAVING AVG(salary) >= 5000
ORDER by AVG(salary) DESC;

/*臾몄젣10
�븘�옒�쉶�궗�뒗 蹂대꼫�뒪 吏�湲됱쓣 �쐞�빐 吏곸썝�쓣 �엯�궗�씪 湲곗���쑝濡� �굹�닃�젮怨� �빀�땲�떎. 
�엯�궗�씪�씠 02/12/31�씪 �씠�쟾�씠硫� '李쎈┰留대쾭, 03�뀈��� '03�뀈�엯�궗���, 04�뀈��� ���04�뀈�엯�궗��� 
�씠�썑�엯�궗�옄�뒗 ��섏긽�옣�씠�썑�엯�궗��� optDate 而щ읆�쓽 �뜲�씠�꽣濡� 異쒕젰�븯�꽭�슂.
�젙�젹��� �엯�궗�씪濡� �삤由꾩감�닚�쑝濡� �젙�젹�빀�땲�떎.
*/

select 
        hire_date,
        case when TO_DATE(hire_date,'YY.MM.DD') < TO_DATE(20021231) then '李쎈┰留대쾭'
             when TO_DATE(hire_date,'YY.MM.DD') < TO_DATE(20031231) then '03�뀈�엯�궗'
             when TO_DATE(hire_date,'YY.MM.DD') < TO_DATE(20041231) then '04�뀈�엯�궗'
             else '�긽�옣�씠�썑�엯�궗'
        end "optDate"
from employees
order by hire_date asc;
>>>>>>> refs/remotes/origin/master
