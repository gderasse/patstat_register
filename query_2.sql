SELECT
   r101.id, r101.appln_id,
   count(DISTINCT r112.licensee_country) AS nb_lic_ctry
FROM
   wind_patents wp
      INNER JOIN  
   reg101_appln r101 ON wp.appln_id = r101.appln_id
      INNER JOIN  
   reg112_licensee_states r112 ON r101.id = r112.id
GROUP BY
   r101.id, r101.appln_id
ORDER BY nb_lic_ctry DESC;
