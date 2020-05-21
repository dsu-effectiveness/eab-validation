select *
from student_section ss
left join section_schedule s on ss.section_id = s.section_id;

select *
from section;