<<<<<<< HEAD
/*¹®Á¦1.
´ã´ç ¸Å´ÏÀú°¡ ¹èÁ¤µÇ¾îÀÖÀ¸³ª Ä¿¹Ì¼ÇºñÀ²ÀÌ ¾ø°í, ¿ù±ÞÀÌ 3000ÃÊ°úÀÎ Á÷¿øÀÇ 
ÀÌ¸§, ¸Å´ÏÀú¾ÆÀÌµð, Ä¿¹Ì¼Ç ºñÀ², ¿ù±Þ À» Ãâ·ÂÇÏ¼¼¿ä.
(45°Ç)
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
/*¹®Á¦2. 
°¢ ºÎ¼­º°·Î ÃÖ°íÀÇ ±Þ¿©¸¦ ¹Þ´Â »ç¿øÀÇ Á÷¿ø¹øÈ£(employee_id),
ÀÌ¸§(first_name), ±Þ¿©(salary), ÀÔ»çÀÏ(hire_date),
ÀüÈ­¹øÈ£(phone_number), ºÎ¼­¹øÈ£(department_id) ¸¦ Á¶È¸ÇÏ¼¼¿ä 
-Á¶°ÇÀýºñ±³ ¹æ¹ýÀ¸·Î ÀÛ¼ºÇÏ¼¼¿ä
-±Þ¿©ÀÇ ³»¸²Â÷¼øÀ¸·Î Á¤·ÄÇÏ¼¼¿ä
-ÀÔ»çÀÏÀº 2001-01-13 Åä¿äÀÏ Çü½ÄÀ¸·Î Ãâ·ÂÇÕ´Ï´Ù.
-ÀüÈ­¹øÈ£´Â 515-123-4567 Çü½ÄÀ¸·Î Ãâ·ÂÇÕ´Ï´Ù.
(11°Ç)
*/
select
    employee_id Á÷¿ø¹øÈ£,
    first_name ÀÌ¸§,
    salary ±Þ¿©,
    to_char(hire_date,'yyyy-mm-dd day') ÀÔ»çÀÏ,
    replace(phone_number,'.','-') ÀüÈ­¹øÈ£,
    department_id ºÎ¼­¹øÈ£
from employees
where (department_id,salary) in (select 
                                        department_id,
                                        max(salary)
                                from employees
                                group by department_id)
order by salary desc;

-------------------------------------------------------------
/*¹®Á¦3
¸Å´ÏÀúº°·Î Æò±Õ±Þ¿© ÃÖ¼Ò±Þ¿© ÃÖ´ë±Þ¿©¸¦ ¾Ë¾Æº¸·Á°í ÇÑ´Ù.
-Åë°è´ë»ó(Á÷¿ø)Àº 2005³â ÀÌÈÄÀÇ ÀÔ»çÀÚ ÀÔ´Ï´Ù.
-¸Å´ÏÀúº° Æò±Õ±Þ¿©°¡ 5000ÀÌ»ó¸¸ Ãâ·ÂÇÕ´Ï´Ù.
-¸Å´ÏÀúº° Æò±Õ±Þ¿©ÀÇ ³»¸²Â÷¼øÀ¸·Î Ãâ·ÂÇÕ´Ï´Ù.
-¸Å´ÏÀúº° Æò±Õ±Þ¿©´Â ¼Ò¼öÁ¡ Ã¹Â°ÀÚ¸®¿¡¼­ ¹Ý¿Ã¸² ÇÕ´Ï´Ù.
-Ãâ·Â³»¿ëÀº ¸Å´ÏÀú¾ÆÀÌµð, ¸Å´ÏÀúÀÌ¸§(first_name), ¸Å´ÏÀúº°Æò±Õ±Þ¿©, ¸Å´ÏÀúº°ÃÖ¼Ò±Þ¿©, ¸Å´ÏÀúº°ÃÖ´ë±Þ¿© ÀÔ´Ï´Ù.
(9°Ç)
*/
select 
        ma.manager_id ¸Å´ÏÀú¾ÆÀÌµð,
        em.first_name ¸Å´ÏÀúÀÌ¸§,
        ma.avgsal ¸Å´ÏÀúº°Æò±Õ±Þ¿©,
        ma.minsal ¸Å´ÏÀúº°ÃÖ¼Ò±Þ¿©,
        ma.maxsal ¸Å´ÏÀúº°ÃÖ´ë±Þ¿©
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
/*¹®Á¦4.
°¢ »ç¿ø(employee)¿¡ ´ëÇØ¼­ »ç¹ø(employee_id),
ÀÌ¸§(first_name), ºÎ¼­¸í(department_name),
¸Å´ÏÀú(manager)ÀÇ ÀÌ¸§(first_name)À» Á¶È¸ÇÏ¼¼¿ä.
ºÎ¼­°¡ ¾ø´Â Á÷¿ø(Kimberely)µµ Ç¥½ÃÇÕ´Ï´Ù.
(106¸í)
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
/*¹®Á¦5.
2005³â ÀÌÈÄ ÀÔ»çÇÑ Á÷¿øÁß¿¡ ÀÔ»çÀÏÀÌ 11¹øÂ°¿¡¼­ 20¹øÂ°ÀÇ Á÷¿øÀÇ 
»ç¹ø, ÀÌ¸§, ºÎ¼­¸í, ±Þ¿©, ÀÔ»çÀÏÀ» ÀÔ»çÀÏ ¼ø¼­·Î Ãâ·ÂÇÏ¼¼¿ä
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
/*¹®Á¦6.
°¡Àå ´Ê°Ô ÀÔ»çÇÑ Á÷¿øÀÇ ÀÌ¸§(first_name last_name)°ú
¿¬ºÀ(salary)°ú ±Ù¹«ÇÏ´Â ºÎ¼­ ÀÌ¸§(department_name)Àº?
*/

select
    em.first_name || ' '|| em.last_name ÀÌ¸§,
    em.salary ¿¬ºÀ,
    de.department_name ºÎ¼­ÀÌ¸§,
    em.hire_date
from employees em,departments de ,(select
                                         max(hire_date) maxhire
                                    from employees
                                    ) eh
where em.hire_date = eh.maxhire
and em.department_id = de.department_id;
-------------------------------------------------------------
/*¹®Á¦7.
Æò±Õ¿¬ºÀ(salary)ÀÌ °¡Àå ³ôÀº ºÎ¼­ Á÷¿øµéÀÇ Á÷¿ø¹øÈ£(employee_id),
ÀÌ¸§(firt_name), ¼º(last_name)°ú  ¾÷¹«(job_title), ¿¬ºÀ(salary)À» Á¶È¸ÇÏ½Ã¿À.
*/
select 
        em.employee_id »ç¹ø,
        em.first_name ÀÌ¸§,
        em.last_name ¼º,
        jo.job_title ¾÷¹«,
        av.avsal,
        em.salary ¿¬ºÀ 
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
/*¹®Á¦8.
Æò±Õ ±Þ¿©(salary)°¡ °¡Àå ³ôÀº ºÎ¼­´Â? 
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

--2¹øÂ° ¹æ¹ý
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
/*¹®Á¦9.
Æò±Õ ±Þ¿©(salary)°¡ °¡Àå ³ôÀº Áö¿ªÀº? 
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
--2¹øÂ° ¹æ¹ý rownum ÀÌ¿ëÇÏ±â
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
/*¹®Á¦10.
Æò±Õ ±Þ¿©(salary)°¡ °¡Àå ³ôÀº ¾÷¹«´Â? 
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
--¹æ¹ý2
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
/*ë¬¸ì œ1.
ë‹´ë‹¹ ë§¤ë‹ˆì €ê°€ ë°°ì •ë˜ì–´ìžˆìœ¼ë‚˜ ì»¤ë¯¸ì…˜ë¹„ìœ¨ì´ ì—†ê³ , ì›”ê¸‰ì´ 3000ì´ˆê³¼ì¸ ì§ì›ì˜ 
ì´ë¦„, ë§¤ë‹ˆì €ì•„ì´ë””, ì»¤ë¯¸ì…˜ ë¹„ìœ¨, ì›”ê¸‰ ì„ ì¶œë ¥í•˜ì„¸ìš”.
(45ê±´)
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
/*ë¬¸ì œ2. 
ê° ë¶€ì„œë³„ë¡œ ìµœê³ ì˜ ê¸‰ì—¬ë¥¼ ë°›ëŠ” ì‚¬ì›ì˜ ì§ì›ë²ˆí˜¸(employee_id),
ì´ë¦„(first_name), ê¸‰ì—¬(salary), ìž…ì‚¬ì¼(hire_date),
ì „í™”ë²ˆí˜¸(phone_number), ë¶€ì„œë²ˆí˜¸(department_id) ë¥¼ ì¡°íšŒí•˜ì„¸ìš” 
-ì¡°ê±´ì ˆë¹„êµ ë°©ë²•ìœ¼ë¡œ ìž‘ì„±í•˜ì„¸ìš”
-ê¸‰ì—¬ì˜ ë‚´ë¦¼ì°¨ìˆœìœ¼ë¡œ ì •ë ¬í•˜ì„¸ìš”
-ìž…ì‚¬ì¼ì€ 2001-01-13 í† ìš”ì¼ í˜•ì‹ìœ¼ë¡œ ì¶œë ¥í•©ë‹ˆë‹¤.
-ì „í™”ë²ˆí˜¸ëŠ” 515-123-4567 í˜•ì‹ìœ¼ë¡œ ì¶œë ¥í•©ë‹ˆë‹¤.
(11ê±´)
*/
select
    employee_id ì§ì›ë²ˆí˜¸,
    first_name ì´ë¦„,
    salary ê¸‰ì—¬,
    to_char(hire_date,'yyyy-mm-dd day') ìž…ì‚¬ì¼,
    replace(phone_number,'.','-') ì „í™”ë²ˆí˜¸,
    department_id ë¶€ì„œë²ˆí˜¸
from employees
where (department_id,salary) in (select 
                                        department_id,
                                        max(salary)
                                from employees
                                group by department_id)
order by salary desc;

-------------------------------------------------------------
/*ë¬¸ì œ3
ë§¤ë‹ˆì €ë³„ë¡œ í‰ê· ê¸‰ì—¬ ìµœì†Œê¸‰ì—¬ ìµœëŒ€ê¸‰ì—¬ë¥¼ ì•Œì•„ë³´ë ¤ê³  í•œë‹¤.
-í†µê³„ëŒ€ìƒ(ì§ì›)ì€ 2005ë…„ ì´í›„ì˜ ìž…ì‚¬ìž ìž…ë‹ˆë‹¤.
-ë§¤ë‹ˆì €ë³„ í‰ê· ê¸‰ì—¬ê°€ 5000ì´ìƒë§Œ ì¶œë ¥í•©ë‹ˆë‹¤.
-ë§¤ë‹ˆì €ë³„ í‰ê· ê¸‰ì—¬ì˜ ë‚´ë¦¼ì°¨ìˆœìœ¼ë¡œ ì¶œë ¥í•©ë‹ˆë‹¤.
-ë§¤ë‹ˆì €ë³„ í‰ê· ê¸‰ì—¬ëŠ” ì†Œìˆ˜ì  ì²«ì§¸ìžë¦¬ì—ì„œ ë°˜ì˜¬ë¦¼ í•©ë‹ˆë‹¤.
-ì¶œë ¥ë‚´ìš©ì€ ë§¤ë‹ˆì €ì•„ì´ë””, ë§¤ë‹ˆì €ì´ë¦„(first_name), ë§¤ë‹ˆì €ë³„í‰ê· ê¸‰ì—¬, ë§¤ë‹ˆì €ë³„ìµœì†Œê¸‰ì—¬, ë§¤ë‹ˆì €ë³„ìµœëŒ€ê¸‰ì—¬ ìž…ë‹ˆë‹¤.
(9ê±´)
*/
select 
        ma.manager_id ë§¤ë‹ˆì €ì•„ì´ë””,
        em.first_name ë§¤ë‹ˆì €ì´ë¦„,
        ma.avgsal ë§¤ë‹ˆì €ë³„í‰ê· ê¸‰ì—¬,
        ma.minsal ë§¤ë‹ˆì €ë³„ìµœì†Œê¸‰ì—¬,
        ma.maxsal ë§¤ë‹ˆì €ë³„ìµœëŒ€ê¸‰ì—¬
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
/*ë¬¸ì œ4.
ê° ì‚¬ì›(employee)ì— ëŒ€í•´ì„œ ì‚¬ë²ˆ(employee_id),
ì´ë¦„(first_name), ë¶€ì„œëª…(department_name),
ë§¤ë‹ˆì €(manager)ì˜ ì´ë¦„(first_name)ì„ ì¡°íšŒí•˜ì„¸ìš”.
ë¶€ì„œê°€ ì—†ëŠ” ì§ì›(Kimberely)ë„ í‘œì‹œí•©ë‹ˆë‹¤.
(106ëª…)
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
/*ë¬¸ì œ5.
2005ë…„ ì´í›„ ìž…ì‚¬í•œ ì§ì›ì¤‘ì— ìž…ì‚¬ì¼ì´ 11ë²ˆì§¸ì—ì„œ 20ë²ˆì§¸ì˜ ì§ì›ì˜ 
ì‚¬ë²ˆ, ì´ë¦„, ë¶€ì„œëª…, ê¸‰ì—¬, ìž…ì‚¬ì¼ì„ ìž…ì‚¬ì¼ ìˆœì„œë¡œ ì¶œë ¥í•˜ì„¸ìš”
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
/*ë¬¸ì œ6.
ê°€ìž¥ ëŠ¦ê²Œ ìž…ì‚¬í•œ ì§ì›ì˜ ì´ë¦„(first_name last_name)ê³¼
ì—°ë´‰(salary)ê³¼ ê·¼ë¬´í•˜ëŠ” ë¶€ì„œ ì´ë¦„(department_name)ì€?
*/

select
    em.first_name || ' '|| em.last_name ì´ë¦„,
    em.salary ì—°ë´‰,
    de.department_name ë¶€ì„œì´ë¦„,
    em.hire_date
from employees em,departments de ,(select
                                         max(hire_date) maxhire
                                    from employees
                                    ) eh
where em.hire_date = eh.maxhire
and em.department_id = de.department_id;
-------------------------------------------------------------
/*ë¬¸ì œ7.
í‰ê· ì—°ë´‰(salary)ì´ ê°€ìž¥ ë†’ì€ ë¶€ì„œ ì§ì›ë“¤ì˜ ì§ì›ë²ˆí˜¸(employee_id),
ì´ë¦„(firt_name), ì„±(last_name)ê³¼  ì—…ë¬´(job_title), ì—°ë´‰(salary)ì„ ì¡°íšŒí•˜ì‹œì˜¤.
*/
select 
        em.employee_id ì‚¬ë²ˆ,
        em.first_name ì´ë¦„,
        em.last_name ì„±,
        jo.job_title ì—…ë¬´,
        av.avsal,
        em.salary ì—°ë´‰ 
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
/*ë¬¸ì œ8.
í‰ê·  ê¸‰ì—¬(salary)ê°€ ê°€ìž¥ ë†’ì€ ë¶€ì„œëŠ”? 
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

--2ë²ˆì§¸ ë°©ë²•
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
/*ë¬¸ì œ9.
í‰ê·  ê¸‰ì—¬(salary)ê°€ ê°€ìž¥ ë†’ì€ ì§€ì—­ì€? 
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
--2ë²ˆì§¸ ë°©ë²• rownum ì´ìš©í•˜ê¸°
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
/*ë¬¸ì œ10.
í‰ê·  ê¸‰ì—¬(salary)ê°€ ê°€ìž¥ ë†’ì€ ì—…ë¬´ëŠ”? 
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
--ë°©ë²•2
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
