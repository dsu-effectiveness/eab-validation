select
    pe.sis_student_id,
    pe.max_date_exam_score,
    stl.primary_degree_id,
    d.degree_desc,
    stl.entry_action_status
from student_term_level stl
     left join prospect_exam pe on stl.student_id = pe.sis_student_id
     left join term t on stl.term_id = t.term_id
     left join degree d on stl.primary_degree_id = d.degree_id
where t.term_desc = 'Fall 2019'
  and level_desc <> 'Graduate'
  and primary_degree_desc <> 'Non-Degree Seeking'
  and exam_code = 'A05'
  and pe.sis_student_id in (
'00234326',
'00280241',
'00306199',
'00317255',
'00320393',
'00280119',
'00217995',
'00284509',
'00331466',
'00318829' )
order by max_date_exam_score;

select distinct student_time_code
from student_term_level;