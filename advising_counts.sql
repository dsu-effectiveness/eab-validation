  WITH advising AS (SELECT DISTINCT
                           sgradvr_pidm,
                           MAX(sgradvr_term_code_eff),
                           sgradvr_advr_pidm
                      FROM sgradvr
                     WHERE sgradvr_prim_ind = 'Y'
                       AND sgradvr_term_code_eff <= '202040'
                     GROUP BY sgradvr_pidm,
                              sgradvr_advr_pidm)

select COUNT(DISTINCT sfrstcr_pidm),
       COUNT(DISTINCT b.sgradvr_pidm),
       COUNT(DISTINCT b.sgradvr_advr_pidm),
       sfrstcr_levl_code
  from sfrstcr a
       LEFT JOIN advising b
                 ON b.sgradvr_pidm = a.sfrstcr_pidm
 where sfrstcr_term_code = '202040'
   and sfrstcr_rsts_code IN ('RE', 'RW')
  Group by sfrstcr_levl_code;