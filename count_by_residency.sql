--Residency

/*************************************************************************************
 Compared to STUDENTS03

  --Count by Residency
SELECT count(dsc_pidm),
       s_rpt_res
  FROM students03
 WHERE dsc_term_code = '20194E'
   AND s_level <> 'GG'
 GROUP BY s_rpt_res
 ORDER BY s_rpt_res;
 ************************************************************************************/

-- Summary query logic
SELECT count(student_id),
       CASE
           WHEN residency_code IN ('C', 'S') THEN 'R'
           WHEN residency_code IN ('0', 'H') THEN 'N'
           ELSE residency_code
           END AS s_rpt_res
  FROM student_term_level
 WHERE level_id <> 'GR'
   AND term_id = '201940'
   --AND s.is_registered = 'Y'
   AND full_time_part_time_code IN ('F', 'P')
 GROUP BY CASE
              WHEN residency_code IN ('C', 'S') THEN 'R'
              WHEN residency_code IN ('0', 'H') THEN 'N'
              ELSE residency_code
              END;

--Student Level Query
SELECT student_id,
       CASE
           WHEN residency_code IN ('C', 'S') THEN 'R'
           WHEN residency_code IN ('0', 'H') THEN 'N'
           ELSE residency_code
           END AS s_rpt_res,
       full_time_part_time_code,
       term_id,
       is_registered
  FROM student_term_level stl
 WHERE level_id <> 'GR'
   AND full_time_part_time_code IN ('F', 'P')
   AND term_id = '201940';


