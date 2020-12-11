/*
  Banner Source: Use sfrstca or sfrstcr
  WITH max_activity_date AS (SELECT sfrstca_pidm,
                                    sfrstca_crn,
                                    sfrstca_term_code,
                                    MAX(sfrstca_activity_date) AS sfrstca_activity_date
                               FROM sfrstca
                              WHERE sfrstca_source_cde = 'BASE'
                                AND sfrstca_term_code = '202040'
                              GROUP BY sfrstca_pidm,
                                       sfrstca_crn,
                                       sfrstca_term_code)


SELECT COUNT(DISTINCT a.sfrstca_pidm)
  FROM sfrstca a
  INNER JOIN max_activity_date b ON a.sfrstca_pidm = b.sfrstca_pidm AND a.sfrstca_crn = b.sfrstca_crn AND a.sfrstca_term_code = b.sfrstca_term_code AND a.sfrstca_activity_date = b.sfrstca_activity_date
  LEFT JOIN stvrsts c ON c.stvrsts_code = a.sfrstca_rsts_code
  WHERE sfrstca_source_cde = 'BASE'
  AND stvrsts_incl_sect_enrl = 'Y';
 */


select distinct COUNT(DISTINCT sis_system_id)
from student_term_level a
where term_id = '202040'
--and is_registered = 'Y'
and is_enrolled = 'Y'
order by 1;

/* Demographics - Gender*/
select COUNT(DISTINCT a.sis_system_id) AS student_count,  b.gender_code
--select distinct a.sis_system_id AS student_count,  b.gender_code
from student_term_level a
left join student b on b.student_id = a.student_id
where a.term_id = '202040'
and a.is_enrolled = 'Y'
--and b.gender_code = 'M';
group by b.gender_code;

select gender_code
from student where sis_system_id = '269784';

/* Demographics - Marital Status*/
--select COUNT(DISTINCT a.sis_system_id) AS student_count,  b.marital_status_code, b.marital_status_desc
select distinct a.sis_system_id AS student_count, b.marital_status_code, b.marital_status_desc
from student_term_level a
left join student b on b.student_id = a.student_id
where a.term_id = '201820'
and a.is_enrolled = 'Y'
and b.marital_status_desc IS NULL;
--and b.gender_code = 'M';
--group by b.marital_status_code, b.marital_status_desc;

SELECT a.marital_status_code
FROM student a;

SELECT marital_status_code
FROM student where sis_system_id = '252999';


select COUNT(DISTINCT a.sis_system_id), b.gender_code
from student_section a
left join student b on a.student_id = a.student_id
where term_id = '202040'
and a.is_enrolled = 'Y'
group by b.gender_code;

select *
from student_section a
where term_id = '202040'
and is_enrolled = 'Y'
and campus_id = 'XXX';



select distinct sis_system_id
from student_section
where term_id = '202030'
and is_registered = 'Y';

select is_registered, registration_status_code
from student_term_level
where term_id = '202030' and sis_system_id ='48684';

select distinct registration_status_code, COUNT(*)
from student_section a
where term_id = '202030'
and is_registered = false
group by registration_status_code;

select is_other_race, is_white, is_hispanic_latino_ethnicity, is_hawaiian_pacific_islander, is_american_indian_alaskan, ethnicity_code, is_international, ethnicity_desc
from student
order by 1;

select is_registered
from student_term_level
where sis_system_id = '26691'
and term_id = '202030';

select is_registered
from student_section
where sis_system_id = '26691'
and term_id = '202030';

/* EAB Validation Query includes Advising Metrics*/
SELECT
    level_id
  , level_desc
  , term_id
  , term_desc
  , COUNT(DISTINCT student_id)                                          AS registered_students
  , COUNT(DISTINCT student_id)
    FILTER ( WHERE primary_advisor_employee_id IS NOT NULL)             AS registered_students_with_advisor
  , COUNT(DISTINCT primary_advisor_employee_id)
    FILTER ( WHERE primary_advisor_employee_id IS NOT NULL)             AS advisors
 FROM student_term_level
 WHERE is_primary_level
  AND (is_registered OR is_registered_other_level)
  AND student_term_level.term_id IN (
    SELECT
        term_id
    FROM term
    WHERE term_start_date BETWEEN current_date - INTERVAL '2 year' AND current_date
                                    )
 GROUP BY
    1, 2, 3, 4
 ORDER BY
    1 DESC, 3 DESC

/* EAB Validation Query: Demographics  */

SELECT
    student.primary_level_id
  , student.gender_code
  , COUNT(DISTINCT student.student_id)                                             AS total_current_registered_students
  , COUNT(student.student_id)
    FILTER ( WHERE student.is_american_indian_alaskan )                            AS american_indian_alaskan_student_count
  , COUNT(student.student_id) FILTER ( WHERE student.is_asian )                    AS asian_student_count
  , COUNT(student.student_id) FILTER ( WHERE student.is_black )                    AS black_student_count
  , COUNT(student.student_id)
    FILTER ( WHERE student.is_hawaiian_pacific_islander )                          AS hawaiian_pacific_islander_student_count
  , COUNT(student.student_id) FILTER ( WHERE student.is_white )                    AS white_student_count
  , COUNT(student.student_id) FILTER ( WHERE student.is_multi_racial )             AS multi_racial_student_count
  , COUNT(student.student_id) FILTER ( WHERE student.is_hispanic_latino_ethnicity ) AS hispanic_student_count
  , COUNT(student.student_id) FILTER ( WHERE student.is_first_generation)          AS first_generation_student_count
  , COUNT(student.student_id) FILTER ( WHERE student.is_veteran )                  AS veteran_student_count
  , AVG(number_of_race_entries)                                                    AS average_number_of_race_detail_entries
 FROM person           AS person
    INNER JOIN student AS student
               ON person.student_id = student.student_id
    LEFT JOIN (
                   SELECT
                       person_id
                     , COUNT(DISTINCT race_code) AS number_of_race_entries
                   FROM person__race_detail
                   GROUP BY person_id
               )      AS race_count USING (person_id)
 WHERE student.is_registered
 GROUP BY
    student.primary_level_id
  , student.gender_code


