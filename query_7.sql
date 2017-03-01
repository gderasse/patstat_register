SELECT
   r101.id, r101.appln_id,
   count(DISTINCT l501ep) AS nb_validated_states
FROM
   reg101_appln r101 
      INNER JOIN
   wind_patents wp ON r101.appln_id = wp.appln_id
      INNER JOIN
   tls221_inpadoc_prs t221 ON r101.appln_id = t221.appln_id
WHERE 
   prs_code = 'PGFP'
GROUP BY 
   r101.id, r101.appln_id
ORDER BY 
   nb_validated_states DESC, r101.id ASC;
