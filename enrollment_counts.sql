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

SELECT registration_status_code, level_id
FROM student_term_level a
WHERE term_id = '202030'
AND sis_system_id = '26691';

SELECT is_registered, registration_status_code, course_level_id
FROM student_section a
WHERE sis_system_id = '26691' and term_id = '202030';

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