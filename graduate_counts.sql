SELECT COUNT(*), graduated_term_id
FROM degrees_awarded
group by graduated_term_id;

SELECT COUNT(*), graduated_term_id, degree_id
FROM degrees_awarded
group by graduated_term_id, degree_id
ORDER BY 2 desc, degree_id;


