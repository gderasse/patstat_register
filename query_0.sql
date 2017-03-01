CREATE TABLE wind_patents AS 
SELECT 
   DISTINCT t1.appln_id 
FROM
   tls201_appln t1
      INNER JOIN
   tls209_appln_ipc t9 ON t1.appln_id = t9.appln_id
WHERE
   t1.appln_auth = 'EP'
      AND (t1.appln_kind = 'A' OR t1.appln_kind = 'W')
      AND year(t1.appln_filing_date) BETWEEN 2000 AND 2010
      AND t9.ipc_class_symbol LIKE 'F03D%'
