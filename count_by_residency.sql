--Residency
--Student Level Query
SELECT stl.student_id,
       CASE
           WHEN stl.residency_code IN ('C', 'S') THEN 'R'
           WHEN stl.residency_code IN ('0', 'H') THEN 'N'
           ELSE residency_code
           END AS s_rpt_res,
       stl.full_time_part_time_code,
       stl.term_id,
       stl.is_registered
  FROM student_term_level stl
       LEFT JOIN term t
                 ON stl.term_id = t.term_id
       LEFT JOIN student s
                 ON s.student_id = stl.student_id
 WHERE stl.level_id <> 'GR'
   AND t.term_id = '201940'
   AND stl.student_id = '00409316';

--Students03 summary query logic
SELECT count(stl.student_id),
       CASE
           WHEN stl.residency_code IN ('C', 'S') THEN 'R'
           WHEN stl.residency_code IN ('0', 'H') THEN 'N'
           ELSE residency_code
           END AS s_rpt_res
  FROM student_term_level stl
       LEFT JOIN term t
                 ON stl.term_id = t.term_id
       LEFT JOIN student s
                 ON s.student_id = stl.student_id
 WHERE stl.level_id <> 'GR'
   AND t.term_id = '201940'
   --AND s.is_registered = 'Y'
   AND stl.full_time_part_time_code in ('F', 'P')
 GROUP BY CASE
              WHEN stl.residency_code IN ('C', 'S') THEN 'R'
              WHEN stl.residency_code IN ('0', 'H') THEN 'N'
              ELSE residency_code
              END;

SELECT is_in_state_resident
  FROM student;

/*
             case
                when sgbstdn_resd_code in ('R', 'N', 'A', 'M', 'G') then sgbstdn_resd_code
                when sgbstdn_resd_code in ('C', 'S') then 'R'
                when sgbstdn_resd_code in ('0', 'H') then 'N'
            end as s_regent_res
 */