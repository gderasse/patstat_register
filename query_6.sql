SELECT
   r101.id, r101.appln_id, count(r301.id) AS nb_events
FROM
   wind_patents wp 
      INNER JOIN
   reg101_appln r101 ON wp.appln_id = r101.appln_id
      INNER JOIN
   reg301_event_data r301 ON r101.id = r301.id
WHERE 
   r301.event_code IN('0008299OPPO','0009260','EPIDOSCLIM1',
   'EPIDOSCRVR1','EPIDOSCRVR6','EPIDOSNLIM1','EPIDOSNRVR1',
   'EPIDOSNRVR6')
GROUP BY 
   r101.id, r101.appln_id
ORDER BY 
   nb_events DESC;
