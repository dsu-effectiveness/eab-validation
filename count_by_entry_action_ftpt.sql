--Entry Action FT_PT

/*************************************************************************************
 Compared to STUDENTS03

--County by Entry_Action and Full/Part-time

SELECT count(dsc_pidm),
       s_pt_ft,
       CASE
           WHEN s_entry_action IN ('FF', 'FH') THEN 'First-Time'
           WHEN s_entry_action = 'TU' THEN 'Transfer'
           WHEN s_entry_action IN ('CS', 'RS') THEN 'Continuing'
           WHEN s_entry_action IN ('NM', 'HS') THEN 'Non-Degree'
           WHEN s_entry_action LIKE ('%G') THEN 'Graduate'
           END AS enrollment
  FROM students03
 WHERE dsc_term_code = '20194E'
 GROUP BY s_pt_ft,
          CASE
              WHEN s_entry_action IN ('FF', 'FH') THEN 'First-Time'
              WHEN s_entry_action = 'TU' THEN 'Transfer'
              WHEN s_entry_action IN ('CS', 'RS') THEN 'Continuing'
              WHEN s_entry_action IN ('NM', 'HS') THEN 'Non-Degree'
              WHEN s_entry_action LIKE ('%G') THEN 'Graduate'
              END
 ORDER BY enrollment,
          s_pt_ft;
 ************************************************************************************/

-- Summary query logic
SELECT count(student_id),
       CASE
           WHEN entry_action_status IN ('FF', 'FH') THEN 'First-Time'
           WHEN entry_action_status = 'TU' THEN 'Transfer'
           WHEN entry_action_status IN ('CS', 'RS') THEN 'Continuing'
           WHEN entry_action_status IN ('NM', 'HS') THEN 'Non-Degree'
           WHEN entry_action_status LIKE ('%G') THEN 'Graduate'
           END AS enrollment,
       full_time_part_time_code
  FROM student_term_level
 WHERE term_id = '201940'
   AND full_time_part_time_code IN ('F', 'P')
 GROUP BY CASE
              WHEN entry_action_status IN ('FF', 'FH') THEN 'First-Time'
              WHEN entry_action_status = 'TU' THEN 'Transfer'
              WHEN entry_action_status IN ('CS', 'RS') THEN 'Continuing'
              WHEN entry_action_status IN ('NM', 'HS') THEN 'Non-Degree'
              WHEN entry_action_status LIKE ('%G') THEN 'Graduate'
              END,
          full_time_part_time_code
 ORDER BY enrollment,
          full_time_part_time_code;

--Student Level Query
SELECT student_id,
       entry_action_status,
       full_time_part_time_code,
       term_id,
       is_registered,
       registered_credits,
       *
  FROM student_term_level stl
 WHERE full_time_part_time_code IN ('F', 'P')
   --AND term_id = '201940'
   AND entry_action_status IS NULL
   AND student_id = '00047074';




