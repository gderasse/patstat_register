SELECT
   r101.id, r101.appln_id, r101.appln_filing_date, 
   r301.event_date AS exam_date, 
   datediff(r301.event_date, r101.appln_filing_date) 
   AS days_to_exam 
FROM
   wind_patents wp
      INNER JOIN  
   reg101_appln r101 ON wp.appln_id = r101.appln_id
      INNER JOIN 
   reg301_event_data r301 ON r101.id = r301.id
WHERE 
   event_code = '0009185'
ORDER BY 
   days_to_exam ASC;
