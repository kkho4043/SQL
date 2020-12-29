<<<<<<< HEAD
/*¹®Á¦1.
Æò±Õ ±Ş¿©º¸´Ù ÀûÀº ±Ş¿©À» ¹Ş´Â Á÷¿øÀº ¸î¸íÀÎÁö ±¸ÇÏ½Ã¿ä.
(56°Ç)
*/
select
        count(*)
from employees
where salary < (select avg(salary)
                from employees
                );

--//////////////////////////////////////////////////////////////////////////////////////
/*¹®Á¦2. 
Æò±Õ±Ş¿© ÀÌ»ó, ÃÖ´ë±Ş¿© ÀÌÇÏÀÇ ¿ù±ŞÀ» ¹Ş´Â »ç¿øÀÇ 
Á÷¿ø¹øÈ£(employee_id), ÀÌ¸§(first_name), ±Ş¿©(salary), 
Æò±Õ±Ş¿©, ÃÖ´ë±Ş¿©¸¦ ±Ş¿©ÀÇ ¿À¸§Â÷¼øÀ¸·Î Á¤·ÄÇÏ¿© Ãâ·ÂÇÏ¼¼¿ä 
(51°Ç)
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
/*¹®Á¦3.
Á÷¿øÁß Steven(first_name) king(last_name)ÀÌ ¼Ò¼ÓµÈ ºÎ¼­(departments)°¡ ÀÖ´Â °÷ÀÇ
ÁÖ¼Ò¸¦ ¾Ë¾Æº¸·Á°í ÇÑ´Ù.
µµ½Ã¾ÆÀÌµğ(location_id), °Å¸®¸í(street_address), ¿ìÆí¹øÈ£(postal_code),
µµ½Ã¸í(city), ÁÖ(state_province), ³ª¶ó¾ÆÀÌµğ(country_id) ¸¦ Ãâ·ÂÇÏ¼¼¿ä
(1°Ç)
*/
--¾îÁ¦ ¹è¿î¹æ¹ı.
select
   lo.*
from employees e, departments de, locations lo
where e.department_id = de.department_id
and de.location_id = lo.location_id
and e.first_name = 'Steven'
and last_name = 'King'
;

--from¿¡¼­ ÇÏ´Â ¹æ¹ı 1?
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

--from¿¡¼­ ÇÏ´Â ¹æ¹ı 2?
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
--where¿¡¼­ ÇÏ´Â¹æ¹ı
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
  
/*¹®Á¦4.
job_id °¡ 'ST_MAN' ÀÎ Á÷¿øÀÇ ±Ş¿©º¸´Ù ÀÛÀº Á÷¿øÀÇ 
»ç¹ø,ÀÌ¸§,±Ş¿©¸¦ ±Ş¿©ÀÇ ³»¸²Â÷¼øÀ¸·Î Ãâ·ÂÇÏ¼¼¿ä  -ANY¿¬»êÀÚ »ç¿ë
(74°Ç)
*/
--¹æ¹ı1
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

--¹æ¹ı2
select DISTINCT --Áßº¹Á¦°Å.
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
/*¹®Á¦5. 
°¢ ºÎ¼­º°·Î ÃÖ°íÀÇ ±Ş¿©¸¦ ¹Ş´Â »ç¿øÀÇ Á÷¿ø¹øÈ£(employee_id), ÀÌ¸§(first_name)°ú ±Ş¿©(salary) ºÎ¼­¹øÈ£(department_id)¸¦ Á¶È¸ÇÏ¼¼¿ä 
´Ü Á¶È¸°á°ú´Â ±Ş¿©ÀÇ ³»¸²Â÷¼øÀ¸·Î Á¤·ÄµÇ¾î ³ªÅ¸³ª¾ß ÇÕ´Ï´Ù. 
Á¶°ÇÀıºñ±³, Å×ÀÌºíÁ¶ÀÎ 2°¡Áö ¹æ¹ıÀ¸·Î ÀÛ¼ºÇÏ¼¼¿ä
(11°Ç)
*/
--Á¶°ÇÀı ºñ±³
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
--Å×ÀÌºíÁ¶ÀÎ                                   
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
/*¹®Á¦6.
°¢ ¾÷¹«(job) º°·Î ¿¬ºÀ(salary)ÀÇ ÃÑÇÕÀ» ±¸ÇÏ°íÀÚ ÇÕ´Ï´Ù. 
¿¬ºÀ ÃÑÇÕÀÌ °¡Àå ³ôÀº ¾÷¹«ºÎÅÍ ¾÷¹«¸í(job_title)°ú ¿¬ºÀ ÃÑÇÕÀ» Á¶È¸ÇÏ½Ã¿À 
(19°Ç)
*/
select 
        jo.job_title,
        sum(em.salary)
from employees em ,jobs jo
where em.job_id = jo.job_id
group by jo.job_title;
--//////////////////////////////////////////////////////////////////////////////////////
/*¹®Á¦7.
ÀÚ½ÅÀÇ ºÎ¼­ Æò±Õ ±Ş¿©º¸´Ù ¿¬ºÀ(salary)ÀÌ ¸¹Àº Á÷¿øÀÇ Á÷¿ø¹øÈ£(employee_id),
ÀÌ¸§(first_name)°ú ±Ş¿©(salary)À» Á¶È¸ÇÏ¼¼¿ä 
(38°Ç)
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
                   
/*¹®Á¦8.
Á÷¿ø ÀÔ»çÀÏÀÌ 11¹øÂ°¿¡¼­ 15¹øÂ°ÀÇ Á÷¿øÀÇ »ç¹ø, 
ÀÌ¸§, ±Ş¿©, ÀÔ»çÀÏÀ» ÀÔ»çÀÏ ¼ø¼­·Î Ãâ·ÂÇÏ¼¼¿ä
=======
/*ë¬¸ì œ1.
í‰ê·  ê¸‰ì—¬ë³´ë‹¤ ì ì€ ê¸‰ì—¬ì„ ë°›ëŠ” ì§ì›ì€ ëª‡ëª…ì¸ì§€ êµ¬í•˜ì‹œìš”.
(56ê±´)
*/
select
        count(*)
from employees
where salary < (select avg(salary)
                from employees
                );

--//////////////////////////////////////////////////////////////////////////////////////
/*ë¬¸ì œ2. 
í‰ê· ê¸‰ì—¬ ì´ìƒ, ìµœëŒ€ê¸‰ì—¬ ì´í•˜ì˜ ì›”ê¸‰ì„ ë°›ëŠ” ì‚¬ì›ì˜ 
ì§ì›ë²ˆí˜¸(employee_id), ì´ë¦„(first_name), ê¸‰ì—¬(salary), 
í‰ê· ê¸‰ì—¬, ìµœëŒ€ê¸‰ì—¬ë¥¼ ê¸‰ì—¬ì˜ ì˜¤ë¦„ì°¨ìˆœìœ¼ë¡œ ì •ë ¬í•˜ì—¬ ì¶œë ¥í•˜ì„¸ìš” 
(51ê±´)
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
/*ë¬¸ì œ3.
ì§ì›ì¤‘ Steven(first_name) king(last_name)ì´ ì†Œì†ëœ ë¶€ì„œ(departments)ê°€ ìˆëŠ” ê³³ì˜
ì£¼ì†Œë¥¼ ì•Œì•„ë³´ë ¤ê³  í•œë‹¤.
ë„ì‹œì•„ì´ë””(location_id), ê±°ë¦¬ëª…(street_address), ìš°í¸ë²ˆí˜¸(postal_code),
ë„ì‹œëª…(city), ì£¼(state_province), ë‚˜ë¼ì•„ì´ë””(country_id) ë¥¼ ì¶œë ¥í•˜ì„¸ìš”
(1ê±´)
*/
--ì–´ì œ ë°°ìš´ë°©ë²•.
select
   lo.*
from employees e, departments de, locations lo
where e.department_id = de.department_id
and de.location_id = lo.location_id
and e.first_name = 'Steven'
and last_name = 'King'
;

--fromì—ì„œ í•˜ëŠ” ë°©ë²• 1?
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

--fromì—ì„œ í•˜ëŠ” ë°©ë²• 2?
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
--whereì—ì„œ í•˜ëŠ”ë°©ë²•
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
  
/*ë¬¸ì œ4.
job_id ê°€ 'ST_MAN' ì¸ ì§ì›ì˜ ê¸‰ì—¬ë³´ë‹¤ ì‘ì€ ì§ì›ì˜ 
ì‚¬ë²ˆ,ì´ë¦„,ê¸‰ì—¬ë¥¼ ê¸‰ì—¬ì˜ ë‚´ë¦¼ì°¨ìˆœìœ¼ë¡œ ì¶œë ¥í•˜ì„¸ìš”  -ANYì—°ì‚°ì ì‚¬ìš©
(74ê±´)
*/
--ë°©ë²•1
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

--ë°©ë²•2
select DISTINCT --ì¤‘ë³µì œê±°.
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
/*ë¬¸ì œ5. 
ê° ë¶€ì„œë³„ë¡œ ìµœê³ ì˜ ê¸‰ì—¬ë¥¼ ë°›ëŠ” ì‚¬ì›ì˜ ì§ì›ë²ˆí˜¸(employee_id), ì´ë¦„(first_name)ê³¼ ê¸‰ì—¬(salary) ë¶€ì„œë²ˆí˜¸(department_id)ë¥¼ ì¡°íšŒí•˜ì„¸ìš” 
ë‹¨ ì¡°íšŒê²°ê³¼ëŠ” ê¸‰ì—¬ì˜ ë‚´ë¦¼ì°¨ìˆœìœ¼ë¡œ ì •ë ¬ë˜ì–´ ë‚˜íƒ€ë‚˜ì•¼ í•©ë‹ˆë‹¤. 
ì¡°ê±´ì ˆë¹„êµ, í…Œì´ë¸”ì¡°ì¸ 2ê°€ì§€ ë°©ë²•ìœ¼ë¡œ ì‘ì„±í•˜ì„¸ìš”
(11ê±´)
*/
--ì¡°ê±´ì ˆ ë¹„êµ
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
--í…Œì´ë¸”ì¡°ì¸                                   
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
/*ë¬¸ì œ6.
ê° ì—…ë¬´(job) ë³„ë¡œ ì—°ë´‰(salary)ì˜ ì´í•©ì„ êµ¬í•˜ê³ ì í•©ë‹ˆë‹¤. 
ì—°ë´‰ ì´í•©ì´ ê°€ì¥ ë†’ì€ ì—…ë¬´ë¶€í„° ì—…ë¬´ëª…(job_title)ê³¼ ì—°ë´‰ ì´í•©ì„ ì¡°íšŒí•˜ì‹œì˜¤ 
(19ê±´)
*/
select 
        jo.job_title,
        sum(em.salary)
from employees em ,jobs jo
where em.job_id = jo.job_id
group by jo.job_title;
--//////////////////////////////////////////////////////////////////////////////////////
/*ë¬¸ì œ7.
ìì‹ ì˜ ë¶€ì„œ í‰ê·  ê¸‰ì—¬ë³´ë‹¤ ì—°ë´‰(salary)ì´ ë§ì€ ì§ì›ì˜ ì§ì›ë²ˆí˜¸(employee_id),
ì´ë¦„(first_name)ê³¼ ê¸‰ì—¬(salary)ì„ ì¡°íšŒí•˜ì„¸ìš” 
(38ê±´)
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
                   
/*ë¬¸ì œ8.
ì§ì› ì…ì‚¬ì¼ì´ 11ë²ˆì§¸ì—ì„œ 15ë²ˆì§¸ì˜ ì§ì›ì˜ ì‚¬ë²ˆ, 
ì´ë¦„, ê¸‰ì—¬, ì…ì‚¬ì¼ì„ ì…ì‚¬ì¼ ìˆœì„œë¡œ ì¶œë ¥í•˜ì„¸ìš”
>>>>>>> refs/remotes/origin/master
*/
