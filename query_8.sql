SELECT
   DISTINCT r107.name,
   round(count(*) / count(DISTINCT r201.id), 2) AS avg_proc_steps
FROM  
   wind_patents wp
      INNER JOIN 
   reg101_appln r101 ON wp.appln_id = r101.appln_id
      INNER JOIN
   reg201_proc_step r201 ON r101.id = r201.id
      INNER JOIN
   reg107_parties r107 ON r107.id = r201.id
WHERE 
   r107.type = 'A' 
      AND r107.is_latest = 'Y'
GROUP BY 
   r107.name
ORDER BY 
   avg_proc_steps DESC, 
   r107.name;
