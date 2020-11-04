/*
 9/2/2020 Notes
 Still trying to validate is_registered to Banner
 Need to rerun after CK updates logic
 */
SELECT DISTINCT
       sis_system_id AS pidm,
       is_registered,
       registration_status_code
--        primary_major_campus_id,
--        term_id,
--        a.*
  FROM student_term_level a
 WHERE term_id = '202030'
AND is_registered = 'Y'
ORDER BY 1;

SELECT registration_status_code level_id, term_id
FROM student_term_level a
WHERE  sis_system_id = '102344';

/* CE Course Discussion.  Need to determine how and when to flag these as registered */
SELECT b.section_title, b.subject_desc, b.subject_id, b.course_reference_number, b.actual_enrollment, b.term_id
FROM section b
WHERE subject_id LIKE 'CE%'
ORDER BY term_id DESC;


SELECT DISTINCT
       sis_system_id AS pidm,
       is_registered,
       primary_major_campus_id,
       term_id,
       a.*
  FROM student_term_level a
 WHERE term_id = '202030'
   --AND is_registered = 'Y'
   AND sis_system_id = '2007'
ORDER BY 1;