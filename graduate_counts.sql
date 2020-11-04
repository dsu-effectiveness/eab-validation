--SELECT COUNT(DISTINCT sis_system_id)
SELECT DISTINCT sis_system_id
FROM student_degree a
WHERE a.graduated_term_id = '202020'
AND degree_status_code = 'AW';

SELECT sis_system_id
FROM student_degree_program_application a
WHERE a.graduated_term_id = '202020'
AND degree_status_code = 'AW';

SELECT *
FROM student_degree a
WHERE sis_system_id = '76749';

SELECT *
FROM student_degree_program_application
WHERE sis_system_id = '76749';

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


