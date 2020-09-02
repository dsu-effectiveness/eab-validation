SELECT DISTINCT
       sis_system_id AS pidm,
       is_registered,
       term_id,
       a.*
  FROM student_section a
 WHERE term_id = '202030'
   AND is_registered = 'Y'
   AND sis_system_id = '52845'
ORDER BY 1;

SELECT DISTINCT
       sis_system_id AS pidm,
       is_registered,
       term_id,
       a.*
  FROM student_section a
 WHERE term_id = '202030'
   AND sis_system_id = '52845'
ORDER BY 1;


