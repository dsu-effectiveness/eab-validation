/*  Validated student_section with student_course
    Still seeing issues with is_registered.
    There is a ticket out there on this
 */
SELECT DISTINCT
       sis_system_id AS pidm,
       is_registered,
       term_id,
       a.*
  FROM student_section a
 WHERE term_id = '202030'
   AND is_registered = 'Y'
ORDER BY 1;

/* Course Table
   Current Course Ind
   Have a ticket out there with CK 5/22/2020
   case when scbcrky_term_code_end = '999999' then 'true' else 'false' end as current_course_ind
   The course below should be inactive and is not a current course
*/

SELECT DISTINCT subject_code, course_number
FROM course
WHERE is_current_course = TRUE
AND subject_code = 'BIOL' AND course_number = '1625A'
ORDER BY 1, 2;

SELECT course_id
FROM student_term_level;

SELECT *
FROM student_section a
LEFT JOIN course b on b.course_id = a.course_id;

/* Current Course from Student Section */
SELECT DISTINCT
a.course_reference_number,
a.subject_id,
a.course_number,
c.is_current_course
FROM student_section a
LEFT JOIN section b ON a.section_id = b.section_id
LEFT JOIN course c on c.course_id = b.course_id
WHERE a.term_id = '202030'
ORDER BY course_reference_number, subject_id, course_reference_number;



/* This table validates with Summer 202030 to courses_current
select sum (c_enrl)
    --c_crn, c_crs_subject, c_crs_number, c_crs_section, c_enrl
from courses_current;
--order by 1,2,3,4,5;

Trying to validate with Fall
 */

SELECT course_reference_number,
       subject_id,
       course_number,
       section_number,
       actual_enrollment,
       a.enrollment_census,
       a.campus_desc,
       a.campus_id
  FROM section a
 WHERE term_id = '201940' AND section_status_code = 'A' AND actual_enrollment != 0 AND campus_id != 'XXX'
 ORDER BY 1,2,3,4;






