SELECT
   r101.id, r101.appln_id, max(r107.set_seq_nr) AS nb_changes
FROM
   wind_patents wp
      INNER JOIN  
   reg101_appln r101 ON wp.appln_id = r101.appln_id
      INNER JOIN
   reg107_parties r107 ON r101.id = r107.id
WHERE 
   r107.type = 'A'
GROUP BY 
   r101.id, r101.appln_id	   
ORDER BY 
   nb_changes DESC, r101.id ASC;
