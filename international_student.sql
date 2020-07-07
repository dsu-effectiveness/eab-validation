select distinct
    s1.student_id,
    s2.sis_system_id,
    s2.is_international,
    t.term_desc,
    visa_type,
    us_citizenship_code,
    case when us_citizenship_code = '2' and visa_type = 'F1' then 'Y' else 'N' end as is_international
from student_term_level s1
     left join student s2 on s2.student_id = s1.student_id
     left join term t on t.term_id = s1.term_id
where t.term_desc = 'Fall 2018'
  and s2.is_international = 'Y'
  --and case when us_citizenship_code = '2' and visa_type = 'F1' then 'Y' else 'N' end = 'Y'
 -- and s2.sis_system_id = '274020'
order by 2 desc;
