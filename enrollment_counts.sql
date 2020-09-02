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

SELECT *
FROM student_section
WHERE sis_system_id = '2007';