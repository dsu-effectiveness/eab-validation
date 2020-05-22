/*
Need to add in_catalog_ind.  This comes from scbcrky_term_code_end = '999999'
 */

 -- Main Query
 select distinct
    ss.subject_id,
    c.subject_id,
    ss.course_number,
    c.course_number,
    c.course_title,
    ss.section_format_type_code,
    ss.section_format_type_desc,
    ss.subject_id || ss.course_number,
     c.course_status_code
from student_section ss
inner join term t on t.term_id = ss.term_id
left join course c on c.subject_id  = ss.subject_id and ss.course_number = c.course_number
where (ss.section_format_type_code in ('CLN', 'PRA', 'SUP', 'INT'))
order by 1, 2;

select *
from course
where subject_id = 'RADT';

select distinct department_id, subject_id
from course
order by 1;
where college_id = 'HS';
and department_id = 'RADT';

select *
from section;

-- Show Andrea Query
select distinct
    ss.subject_id,
    c.subject_id,
    ss.course_number,
    c.course_title,
    ss.section_format_type_code,
    ss.section_format_type_desc,
    c.max_term_id_effective,
    c.subject_id || ss.course_number,
    c.course_id
from student_section ss
left join term t on t.term_id = ss.term_id
inner join course c on c.subject_id  = ss.subject_id and ss.course_number = c.course_number
where
    c.course_status_code = 'A'
    and (ss.section_format_type_code in ('CLN', 'PRA', 'SUP', 'INT') or ss.subject_id = 'COOP')
    and ss.subject_id = 'ACCT' and ss.course_number in ('3440', '3500')
    and max_term_id_effective = '201940'
order by ss.subject_id, ss.course_number;
--
-- select *
-- from section;

select
    max_term_id_effective,
    course_number,
    subject_id,
    course_desc,
    course_status_code
from course
where course_status_code <> 'A'
order by 1,3,2;

--
-- select *
-- from section_schedule;
--
-- select *,
--        subject_id || course_number as course_temp_id
-- from course
-- where course_number = '0100';
--
select distinct
    course_number,
    subject_id,
    COUNT(*)
from course
group by course_number, subject_id
order by 1;
--
-- select
--     course_number,
--     subject_id
-- from student_section;

select
    section_format_type_code,
    section_format_type_desc
from section
where section_format_type_code IN ('CLN', 'PRA', 'SUP', 'INT');

select *
from section_schedule;

select *
from student_section;

select *
from term;

select
    course_number, subject_id,
    COUNT(*)
from course
group by course_number, subject_id
HAVING count(*) > 1
order by 1;
