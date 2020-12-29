<<<<<<< HEAD
/*¹®Á¦1.
Á÷¿øµéÀÇ »ç¹ø(employee_id), ÀÌ¸§(firt_name), ¼º(last_name)°ú ºÎ¼­¸í(department_name)À»
Á¶È¸ÇÏ¿© ºÎ¼­ÀÌ¸§(department_name) ¿À¸§Â÷¼ø, »ç¹ø(employee_id) ³»¸²Â÷¼ø À¸·Î Á¤·ÄÇÏ¼¼¿ä.
(106°Ç)
*/
select
        em.employee_id »ç¹ø,
        em.first_name ÀÌ¸§,
        em.last_name ¼º,
        de.department_name ºÎ¼­¸í
from employees em , departments de
where em.department_id = de.department_id
order by em.employee_id DESC;

/*¹®Á¦2.
employees Å×ÀÌºíÀÇ job_id´Â ÇöÀçÀÇ ¾÷¹«¾ÆÀÌµð¸¦ °¡Áö°í ÀÖ½À´Ï´Ù.
Á÷¿øµéÀÇ »ç¹ø(employee_id), ÀÌ¸§(firt_name), ±Þ¿©(salary), ºÎ¼­¸í(department_name),
ÇöÀç¾÷¹«(job_title)¸¦ »ç¹ø(employee_id) ¿À¸§Â÷¼ø À¸·Î Á¤·ÄÇÏ¼¼¿ä.
ºÎ¼­°¡ ¾ø´Â Kimberely(»ç¹ø 178)Àº Ç¥½ÃÇÏÁö ¾Ê½À´Ï´Ù.
(106°Ç)
*/
select
        em.employee_id »ç¹ø,
        em.first_name ÀÌ¸§,
        em.salary ±Þ¿©,
        de.department_name ºÎ¼­¸í,
        jo.job_title ÇöÀç¾÷¹«
from employees em , departments de , jobs jo
where em.department_id = de.department_id
and em.job_id = jo.job_id
order by em.employee_id ASC;

/*¹®Á¦2-1.
¹®Á¦2¿¡¼­ ºÎ¼­°¡ ¾ø´Â Kimberely(»ç¹ø 178)±îÁö Ç¥½ÃÇØ º¸¼¼¿ä
(107°Ç)
*/
select
        em.employee_id »ç¹ø,
        em.first_name ÀÌ¸§,
        em.salary ±Þ¿©,
        de.department_name ºÎ¼­¸í,
        jo.job_title ÇöÀç¾÷¹«
from employees em , departments de , jobs jo
where em.department_id = de.department_id(+)
and em.job_id = jo.job_id
order by em.employee_id ASC;


/*¹®Á¦3.
µµ½Ãº°·Î À§Ä¡ÇÑ ºÎ¼­µéÀ» ÆÄ¾ÇÇÏ·Á°í ÇÕ´Ï´Ù.
µµ½Ã¾ÆÀÌµð, µµ½Ã¸í, ºÎ¼­¸í, ºÎ¼­¾ÆÀÌµð¸¦ µµ½Ã¾ÆÀÌµð(¿À¸§Â÷¼ø)·Î Á¤·ÄÇÏ¿© Ãâ·ÂÇÏ¼¼¿ä 
ºÎ¼­°¡ ¾ø´Â µµ½Ã´Â Ç¥½ÃÇÏÁö ¾Ê½À´Ï´Ù.
(27°Ç)
*/
select
        lo.location_id,
        lo.city,
        de.department_name,
        de.department_id
from locations lo, departments de
where lo.location_id = de.location_id
order by lo.location_id asc;

/*¹®Á¦3-1.
¹®Á¦3¿¡¼­ ºÎ¼­°¡ ¾ø´Â µµ½Ãµµ Ç¥½ÃÇÕ´Ï´Ù. 
(43°Ç)
*/
select
        lo.location_id,
        lo.city,
        de.department_name,
        de.department_id
from locations lo, departments de
where lo.location_id = de.location_id(+)--¿ÞÂÊ(µµ½ÃÀÇid¸¦ ¸ðµÎ Ç¥½ÃÇÔ Áï ºÎ¼­°¡ ¾øÀ»¶§µµ.)
order by lo.location_id asc;


/*¹®Á¦4.
Áö¿ª(regions)¿¡ ¼ÓÇÑ ³ª¶óµéÀ» Áö¿ªÀÌ¸§(region_name), 
³ª¶óÀÌ¸§(country_name)À¸·Î Ãâ·ÂÇÏµÇ 
Áö¿ªÀÌ¸§(¿À¸§Â÷¼ø), ³ª¶óÀÌ¸§(³»¸²Â÷¼ø) À¸·Î Á¤·ÄÇÏ¼¼¿ä.
(25°Ç)
*/
select
    re.region_name Áö¿ªÀÌ¸§,
    co.country_name ³ª¶óÀÌ¸§
from regions re,countries co
where re.region_id = co.region_id
order by re.region_name asc, co.country_name desc;


/*¹®Á¦5. 
ÀÚ½ÅÀÇ ¸Å´ÏÀúº¸´Ù Ã¤¿ëÀÏ(hire_date)ÀÌ ºü¸¥ »ç¿øÀÇ 
»ç¹ø(employee_id), ÀÌ¸§(first_name)°ú Ã¤¿ëÀÏ(hire_date),
¸Å´ÏÀúÀÌ¸§(first_name), ¸Å´ÏÀúÀÔ»çÀÏ(hire_date)À» Á¶È¸ÇÏ¼¼¿ä.
(37°Ç)
*/
select
   emp.employee_id »ç¹ø,
   emp.first_name ÀÌ¸§,
   emp.hire_date Ã¤¿ëÀÏ,
   man.first_name ¸Å´ÏÀúÀÌ¸§,
   man.hire_date ¸Å´ÏÀúÀÔ»çÀÏ
   
from employees emp, employees man
where emp.manager_id = man.employee_id
and emp.hire_date < man.hire_date;

/*¹®Á¦6.
³ª¶óº°·Î ¾î¶°ÇÑ ºÎ¼­µéÀÌ À§Ä¡ÇÏ°í ÀÖ´ÂÁö ÆÄ¾ÇÇÏ·Á°í ÇÕ´Ï´Ù.
³ª¶ó¸í, ³ª¶ó¾ÆÀÌµð, µµ½Ã¸í, µµ½Ã¾ÆÀÌµð, ºÎ¼­¸í, ºÎ¼­¾ÆÀÌµð¸¦ ³ª¶ó¸í(¿À¸§Â÷¼ø)·Î Á¤·ÄÇÏ¿© Ãâ·ÂÇÏ¼¼¿ä.
°ªÀÌ ¾ø´Â °æ¿ì Ç¥½ÃÇÏÁö ¾Ê½À´Ï´Ù.
(27°Ç)
*/
select
   co.country_name ³ª¶ó,
   co.country_id ³ª¶ó¾ÆÀÌµð,
   lo.city µµ½Ã¸í,
   lo.location_id µµ½Ã¾ÆÀÌµð,
   de.department_name ºÎ¼­¸í,
   de.department_id ºÎ¼­¾ÆÀÌµð
from countries co, locations lo, departments de
where co.country_id = lo.country_id
and lo.location_id = de.location_id;

/*¹®Á¦7.
job_history Å×ÀÌºíÀº °ú°ÅÀÇ ´ã´ç¾÷¹«ÀÇ µ¥ÀÌÅÍ¸¦ °¡Áö°í ÀÖ´Ù.
°ú°ÅÀÇ ¾÷¹«¾ÆÀÌµð(job_id)°¡ ¡®AC_ACCOUNT¡¯·Î ±Ù¹«ÇÑ »ç¿øÀÇ »ç¹ø, ÀÌ¸§(Ç®³×ÀÓ), ¾÷¹«¾ÆÀÌµð, ½ÃÀÛÀÏ, Á¾·áÀÏÀ» Ãâ·ÂÇÏ¼¼¿ä.
ÀÌ¸§Àº first_name°ú last_nameÀ» ÇÕÃÄ Ãâ·ÂÇÕ´Ï´Ù.
(2°Ç)
*/
select
        joh.employee_id,
        em.first_name||' '||em.last_name Ç®³×ÀÓ,
        em.job_id ¾÷¹«¾ÆÀÌµð,
        joh.start_date ½ÃÀÛÀÏ,
        joh.end_date Á¾·áÀÏ
from job_history joh,employees em
where joh.employee_id = em.employee_id
and joh.job_id = 'AC_ACCOUNT';

/*¹®Á¦8.
°¢ ºÎ¼­(department)¿¡ ´ëÇØ¼­ ºÎ¼­¹øÈ£(department_id), ºÎ¼­ÀÌ¸§(department_name), 
¸Å´ÏÀú(manager)ÀÇ ÀÌ¸§(first_name), À§Ä¡(locations)ÇÑ µµ½Ã(city),
³ª¶ó(countries)ÀÇ ÀÌ¸§(countries_name) ±×¸®°í Áö¿ª±¸ºÐ(regions)ÀÇ ÀÌ¸§(resion_name)±îÁö ÀüºÎ Ãâ·ÂÇØ º¸¼¼¿ä.
(11°Ç)
*/
select 
        em.department_id ºÎ¼­¹øÈ£,
        de.department_name ºÎ¼­ÀÌ¸§,
        em.first_name ¸Å´ÏÀúÀÌ¸§,
        lo.city µµ½Ã,
        co.country_name ³ª¶ó,
        re.region_name Áö¿ª
from employees em,departments de,locations lo,countries co,regions re
where em.employee_id = de.manager_id 
and de.location_id = lo.location_id
and lo.country_id = co.country_id
and co.region_id = re.region_id;

/*¹®Á¦9.
°¢ »ç¿ø(employee)¿¡ ´ëÇØ¼­ »ç¹ø(employee_id), ÀÌ¸§(first_name),
ºÎ¼­¸í(department_name), ¸Å´ÏÀú(manager)ÀÇ ÀÌ¸§(first_name)À» Á¶È¸ÇÏ¼¼¿ä.
ºÎ¼­°¡ ¾ø´Â Á÷¿ø(Kimberely)µµ Ç¥½ÃÇÕ´Ï´Ù.
(106¸í)
*/
select 
        em.employee_id »ç¹ø,
        em.first_name ÀÌ¸§,
        de.department_name ºÎ¼­¸í,
        ma.first_name ¸Å´ÏÀú
=======
/*ë¬¸ì œ1.
ì§ì›ë“¤ì˜ ì‚¬ë²ˆ(employee_id), ì´ë¦„(firt_name), ì„±(last_name)ê³¼ ë¶€ì„œëª…(department_name)ì„
ì¡°íšŒí•˜ì—¬ ë¶€ì„œì´ë¦„(department_name) ì˜¤ë¦„ì°¨ìˆœ, ì‚¬ë²ˆ(employee_id) ë‚´ë¦¼ì°¨ìˆœ ìœ¼ë¡œ ì •ë ¬í•˜ì„¸ìš”.
(106ê±´)
*/
select
        em.employee_id ì‚¬ë²ˆ,
        em.first_name ì´ë¦„,
        em.last_name ì„±,
        de.department_name ë¶€ì„œëª…
from employees em , departments de
where em.department_id = de.department_id
order by em.employee_id DESC;

/*ë¬¸ì œ2.
employees í…Œì´ë¸”ì˜ job_idëŠ” í˜„ìž¬ì˜ ì—…ë¬´ì•„ì´ë””ë¥¼ ê°€ì§€ê³  ìžˆìŠµë‹ˆë‹¤.
ì§ì›ë“¤ì˜ ì‚¬ë²ˆ(employee_id), ì´ë¦„(firt_name), ê¸‰ì—¬(salary), ë¶€ì„œëª…(department_name),
í˜„ìž¬ì—…ë¬´(job_title)ë¥¼ ì‚¬ë²ˆ(employee_id) ì˜¤ë¦„ì°¨ìˆœ ìœ¼ë¡œ ì •ë ¬í•˜ì„¸ìš”.
ë¶€ì„œê°€ ì—†ëŠ” Kimberely(ì‚¬ë²ˆ 178)ì€ í‘œì‹œí•˜ì§€ ì•ŠìŠµë‹ˆë‹¤.
(106ê±´)
*/
select
        em.employee_id ì‚¬ë²ˆ,
        em.first_name ì´ë¦„,
        em.salary ê¸‰ì—¬,
        de.department_name ë¶€ì„œëª…,
        jo.job_title í˜„ìž¬ì—…ë¬´
from employees em , departments de , jobs jo
where em.department_id = de.department_id
and em.job_id = jo.job_id
order by em.employee_id ASC;

/*ë¬¸ì œ2-1.
ë¬¸ì œ2ì—ì„œ ë¶€ì„œê°€ ì—†ëŠ” Kimberely(ì‚¬ë²ˆ 178)ê¹Œì§€ í‘œì‹œí•´ ë³´ì„¸ìš”
(107ê±´)
*/
select
        em.employee_id ì‚¬ë²ˆ,
        em.first_name ì´ë¦„,
        em.salary ê¸‰ì—¬,
        de.department_name ë¶€ì„œëª…,
        jo.job_title í˜„ìž¬ì—…ë¬´
from employees em , departments de , jobs jo
where em.department_id = de.department_id(+)
and em.job_id = jo.job_id
order by em.employee_id ASC;


/*ë¬¸ì œ3.
ë„ì‹œë³„ë¡œ ìœ„ì¹˜í•œ ë¶€ì„œë“¤ì„ íŒŒì•…í•˜ë ¤ê³  í•©ë‹ˆë‹¤.
ë„ì‹œì•„ì´ë””, ë„ì‹œëª…, ë¶€ì„œëª…, ë¶€ì„œì•„ì´ë””ë¥¼ ë„ì‹œì•„ì´ë””(ì˜¤ë¦„ì°¨ìˆœ)ë¡œ ì •ë ¬í•˜ì—¬ ì¶œë ¥í•˜ì„¸ìš” 
ë¶€ì„œê°€ ì—†ëŠ” ë„ì‹œëŠ” í‘œì‹œí•˜ì§€ ì•ŠìŠµë‹ˆë‹¤.
(27ê±´)
*/
select
        lo.location_id,
        lo.city,
        de.department_name,
        de.department_id
from locations lo, departments de
where lo.location_id = de.location_id
order by lo.location_id asc;

/*ë¬¸ì œ3-1.
ë¬¸ì œ3ì—ì„œ ë¶€ì„œê°€ ì—†ëŠ” ë„ì‹œë„ í‘œì‹œí•©ë‹ˆë‹¤. 
(43ê±´)
*/
select
        lo.location_id,
        lo.city,
        de.department_name,
        de.department_id
from locations lo, departments de
where lo.location_id = de.location_id(+)--ì™¼ìª½(ë„ì‹œì˜idë¥¼ ëª¨ë‘ í‘œì‹œí•¨ ì¦‰ ë¶€ì„œê°€ ì—†ì„ë•Œë„.)
order by lo.location_id asc;


/*ë¬¸ì œ4.
ì§€ì—­(regions)ì— ì†í•œ ë‚˜ë¼ë“¤ì„ ì§€ì—­ì´ë¦„(region_name), 
ë‚˜ë¼ì´ë¦„(country_name)ìœ¼ë¡œ ì¶œë ¥í•˜ë˜ 
ì§€ì—­ì´ë¦„(ì˜¤ë¦„ì°¨ìˆœ), ë‚˜ë¼ì´ë¦„(ë‚´ë¦¼ì°¨ìˆœ) ìœ¼ë¡œ ì •ë ¬í•˜ì„¸ìš”.
(25ê±´)
*/
select
    re.region_name ì§€ì—­ì´ë¦„,
    co.country_name ë‚˜ë¼ì´ë¦„
from regions re,countries co
where re.region_id = co.region_id
order by re.region_name asc, co.country_name desc;


/*ë¬¸ì œ5. 
ìžì‹ ì˜ ë§¤ë‹ˆì €ë³´ë‹¤ ì±„ìš©ì¼(hire_date)ì´ ë¹ ë¥¸ ì‚¬ì›ì˜ 
ì‚¬ë²ˆ(employee_id), ì´ë¦„(first_name)ê³¼ ì±„ìš©ì¼(hire_date),
ë§¤ë‹ˆì €ì´ë¦„(first_name), ë§¤ë‹ˆì €ìž…ì‚¬ì¼(hire_date)ì„ ì¡°íšŒí•˜ì„¸ìš”.
(37ê±´)
*/
select
   emp.employee_id ì‚¬ë²ˆ,
   emp.first_name ì´ë¦„,
   emp.hire_date ì±„ìš©ì¼,
   man.first_name ë§¤ë‹ˆì €ì´ë¦„,
   man.hire_date ë§¤ë‹ˆì €ìž…ì‚¬ì¼
   
from employees emp, employees man
where emp.manager_id = man.employee_id
and emp.hire_date < man.hire_date;

/*ë¬¸ì œ6.
ë‚˜ë¼ë³„ë¡œ ì–´ë– í•œ ë¶€ì„œë“¤ì´ ìœ„ì¹˜í•˜ê³  ìžˆëŠ”ì§€ íŒŒì•…í•˜ë ¤ê³  í•©ë‹ˆë‹¤.
ë‚˜ë¼ëª…, ë‚˜ë¼ì•„ì´ë””, ë„ì‹œëª…, ë„ì‹œì•„ì´ë””, ë¶€ì„œëª…, ë¶€ì„œì•„ì´ë””ë¥¼ ë‚˜ë¼ëª…(ì˜¤ë¦„ì°¨ìˆœ)ë¡œ ì •ë ¬í•˜ì—¬ ì¶œë ¥í•˜ì„¸ìš”.
ê°’ì´ ì—†ëŠ” ê²½ìš° í‘œì‹œí•˜ì§€ ì•ŠìŠµë‹ˆë‹¤.
(27ê±´)
*/
select
   co.country_name ë‚˜ë¼,
   co.country_id ë‚˜ë¼ì•„ì´ë””,
   lo.city ë„ì‹œëª…,
   lo.location_id ë„ì‹œì•„ì´ë””,
   de.department_name ë¶€ì„œëª…,
   de.department_id ë¶€ì„œì•„ì´ë””
from countries co, locations lo, departments de
where co.country_id = lo.country_id
and lo.location_id = de.location_id;

/*ë¬¸ì œ7.
job_history í…Œì´ë¸”ì€ ê³¼ê±°ì˜ ë‹´ë‹¹ì—…ë¬´ì˜ ë°ì´í„°ë¥¼ ê°€ì§€ê³  ìžˆë‹¤.
ê³¼ê±°ì˜ ì—…ë¬´ì•„ì´ë””(job_id)ê°€ â€˜AC_ACCOUNTâ€™ë¡œ ê·¼ë¬´í•œ ì‚¬ì›ì˜ ì‚¬ë²ˆ, ì´ë¦„(í’€ë„¤ìž„), ì—…ë¬´ì•„ì´ë””, ì‹œìž‘ì¼, ì¢…ë£Œì¼ì„ ì¶œë ¥í•˜ì„¸ìš”.
ì´ë¦„ì€ first_nameê³¼ last_nameì„ í•©ì³ ì¶œë ¥í•©ë‹ˆë‹¤.
(2ê±´)
*/
select
        joh.employee_id,
        em.first_name||' '||em.last_name í’€ë„¤ìž„,
        em.job_id ì—…ë¬´ì•„ì´ë””,
        joh.start_date ì‹œìž‘ì¼,
        joh.end_date ì¢…ë£Œì¼
from job_history joh,employees em
where joh.employee_id = em.employee_id
and joh.job_id = 'AC_ACCOUNT';

/*ë¬¸ì œ8.
ê° ë¶€ì„œ(department)ì— ëŒ€í•´ì„œ ë¶€ì„œë²ˆí˜¸(department_id), ë¶€ì„œì´ë¦„(department_name), 
ë§¤ë‹ˆì €(manager)ì˜ ì´ë¦„(first_name), ìœ„ì¹˜(locations)í•œ ë„ì‹œ(city),
ë‚˜ë¼(countries)ì˜ ì´ë¦„(countries_name) ê·¸ë¦¬ê³  ì§€ì—­êµ¬ë¶„(regions)ì˜ ì´ë¦„(resion_name)ê¹Œì§€ ì „ë¶€ ì¶œë ¥í•´ ë³´ì„¸ìš”.
(11ê±´)
*/
select 
        em.department_id ë¶€ì„œë²ˆí˜¸,
        de.department_name ë¶€ì„œì´ë¦„,
        em.first_name ë§¤ë‹ˆì €ì´ë¦„,
        lo.city ë„ì‹œ,
        co.country_name ë‚˜ë¼,
        re.region_name ì§€ì—­
from employees em,departments de,locations lo,countries co,regions re
where em.employee_id = de.manager_id 
and de.location_id = lo.location_id
and lo.country_id = co.country_id
and co.region_id = re.region_id;

/*ë¬¸ì œ9.
ê° ì‚¬ì›(employee)ì— ëŒ€í•´ì„œ ì‚¬ë²ˆ(employee_id), ì´ë¦„(first_name),
ë¶€ì„œëª…(department_name), ë§¤ë‹ˆì €(manager)ì˜ ì´ë¦„(first_name)ì„ ì¡°íšŒí•˜ì„¸ìš”.
ë¶€ì„œê°€ ì—†ëŠ” ì§ì›(Kimberely)ë„ í‘œì‹œí•©ë‹ˆë‹¤.
(106ëª…)
*/
select 
        em.employee_id ì‚¬ë²ˆ,
        em.first_name ì´ë¦„,
        de.department_name ë¶€ì„œëª…,
        ma.first_name ë§¤ë‹ˆì €
>>>>>>> refs/remotes/origin/master
from employees em ,employees ma ,departments de
where em.manager_id = ma.employee_id(+)
and em.department_id = de.department_id;


