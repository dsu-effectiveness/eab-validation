/*
 Waiting for EAB to add schedule type:
 Email sent 5/21/2020
 •	Issue name: Schedule Type  missing  from Section Schedule
•	Issue description: I don’t see ssbsect_schd_code or the section type in section_schedule.  Could we get this added from banner to the section_schedule table?  The banner table names are: ssbsect_schd_code & stvschd is the validation table.
•	Urgency: not urgent
•	Affected Quad entity: Section Schedule
•	Affected Quad field: schedule_type
 */

 -- Main Query
select
    ss.subject_id as subject_code,
    ss.course_number,
    c.course_title,
    c.course_number,
    ss.course_number
from student_section ss
left join course c on c.subject_id || ss.course_number = c.course_id
where ss.subject_id = 'COOP'
order by ss.subject_id, ss.course_number;
--
-- select *
-- from section;
--
-- select *
-- from course;
--
-- select *
-- from section_schedule;
--
-- select *,
--        subject_id || course_number as course_temp_id
-- from course
-- where course_number = '0100';
--
-- select distinct
--     course_number,
--     COUNT(*)
-- from course
-- group by course_number
-- order by 1;
--
-- select
--     course_number,
--     subject_id
-- from student_section;