SELECT 
   r101.id, r101.appln_id, 
   count(DISTINCT t212.cited_pat_publn_id) AS n_cit
FROM
   tls212_citation t212 
      INNER JOIN
   tls211_pat_publn t211 ON t211.pat_publn_id = t212.pat_publn_id
      INNER JOIN
   wind_patents wp ON wp.appln_id = t211.appln_id
      INNER JOIN
   reg101_appln r101 ON r101.appln_id = wp.appln_id
WHERE
   t212.pat_citn_seq_nr > 0
GROUP BY r101.id, r101.appln_id 
ORDER BY n_cit DESC;
