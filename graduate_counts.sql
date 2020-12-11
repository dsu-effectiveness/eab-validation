SELECT COUNT(*), graduated_term_id
FROM degrees_awarded
group by graduated_term_id;

SELECT COUNT(*), graduated_term_id, degree_id
FROM degrees_awarded
group by graduated_term_id, degree_id
ORDER BY 2 desc, degree_id;

SELECT
    student_degree_program_application.level_id
  , student_degree_program_application.graduated_term_id
  , term.term_desc
  , COUNT(DISTINCT student_degree_program_application_id)
    FILTER ( WHERE student_degree_program_application.is_graduated )                        AS total_number_of_degrees_conferred
  , COUNT(DISTINCT student_degree_program_application.student_id)
    FILTER ( WHERE student_degree_program_application.is_graduated )                        AS number_of_students_conferred_degree
  , COUNT(DISTINCT student_degree_program_application.program_code)
    FILTER ( WHERE NULLIF(student_degree_program_application.program_code, '') IS NOT NULL ) AS number_programs_completed
 FROM degrees_awarded AS student_degree_program_application
    INNER JOIN degree
               USING (degree_id)
    LEFT JOIN student_term_level      AS student_term_level
               ON student_term_level.student_id = student_degree_program_application.student_id
                   AND student_term_level.term_id = student_degree_program_application.graduated_term_id
                   AND student_term_level.level_id = student_degree_program_application.level_id
    JOIN      term                    AS term ON term.term_id = student_degree_program_application.graduated_term_id
    AND term_start_date BETWEEN current_date - INTERVAL '4 year' AND current_date
 GROUP BY
    1
  , 2
  , 3
 ORDER BY
    1 DESC
  , 2 DESC;
















