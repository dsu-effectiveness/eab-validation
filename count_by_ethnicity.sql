--Student Level Query
select
    stl.student_id,
    s.ethnicity_code,
    s.ethnicity_desc,
    t.term_desc,
    stl.registration_status_code,
    stl.registration_status_desc,
    t.term_id,
    is_other_race,
    is_multi_racial,
    is_american_indian_alaskan,
    is_hawaiian_pacific_islander,
    is_hispanic_latino_ethnicity,
    case
        when s.is_multi_racial = 'Y' then '2'
        else s.ethnicity_code end as ethnicity_custom
from student_term_level stl
     left join term t on stl.term_id = t.term_id
     left join student s on s.student_id = stl.student_id
where stl.level_id <> 'GR'
  and t.term_id = '201940'
  and is_hawaiian_pacific_islander = 'Y'
  and is_multi_racial = 'N'
  and stl.is_registered = 'Y'
  and is_hispanic_latino_ethnicity = 'N'
  and s.student_id = '00304229';
--this student should be is_hispanic_latino_ethnicity


-- Summary Query
-- hispanic
select
    'hispanic' as IPEDS_Ethc_Desc,
    count(distinct s.student_id)
from student_term_level stl
     left join student s on s.student_id = stl.student_id
where stl.level_id <> 'GG'
  and term_id = '201940'
  and stl.is_registered = 'Y'
  and is_hispanic_latino_ethnicity = 'Y'

union
-- hawaiian/pacific
select
    'hawaiian/pacific',
    count(distinct s.student_id)
from student_term_level stl
     left join student s on s.student_id = stl.student_id
where stl.level_id <> 'GG'
  and term_id = '201940'
  and stl.is_registered = 'Y'
  and s.is_hawaiian_pacific_islander = 'Y'
  and is_hispanic_latino_ethnicity = 'N'

union
-- black
select
    'black',
    count(distinct s.student_id)
from student_term_level stl
     left join student s on s.student_id = stl.student_id
where stl.level_id <> 'GG'
  and term_id = '201940'
  and stl.is_registered = 'Y'
  and s.is_black = 'Y'
  and is_hispanic_latino_ethnicity = 'N'

union
-- american_indian_alaskan
select
    'american_indian_alaskan',
    count(distinct s.student_id)
from student_term_level stl
     left join student s on s.student_id = stl.student_id
where stl.level_id <> 'GG'
  and term_id = '201940'
  and stl.is_registered = 'Y'
  and s.is_american_indian_alaskan = 'Y'
  and is_hispanic_latino_ethnicity = 'N'

union
-- white
select
    'white',
    count(distinct s.student_id)
from student_term_level stl
     left join student s on s.student_id = stl.student_id
where stl.level_id <> 'GG'
  and term_id = '201940'
  and stl.is_registered = 'Y'
  and s.is_white = 'Y'
  and is_hispanic_latino_ethnicity = 'N'

union
-- asian
select
    'asian',
    count(distinct s.student_id)
from student_term_level stl
     left join student s on s.student_id = stl.student_id
where stl.level_id <> 'GG'
  and term_id = '201940'
  and stl.is_registered = 'Y'
  and s.is_asian = 'Y'
  and is_hispanic_latino_ethnicity = 'N'

union
-- is_multi_racial
select
    'multi_racial',
    count(distinct s.student_id)
from student_term_level stl
     left join student s on s.student_id = stl.student_id
where stl.level_id <> 'GG'
  and term_id = '201940'
  and stl.is_registered = 'Y'
  and s.is_multi_racial = 'Y'
  and is_hispanic_latino_ethnicity = 'N'

union
-- is_multi_racial
select
    'non_resident_alien',
    count(distinct s.student_id)
from student_term_level stl
     left join student s on s.student_id = stl.student_id
where stl.level_id <> 'GG'
  and term_id = '201940'
  and stl.is_registered = 'Y'
  and s.us_citizenship_code = '2';

