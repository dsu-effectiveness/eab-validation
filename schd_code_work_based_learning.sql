/*
Need to ask EAB to add an  add in_catalog_ind.
This comes from scbcrky_term_code_end = '999999'
scbcrky is joined on to scbcrse by crse_numb
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