SELECT 
   r107.id, p.appln_id, r107.bulletin_year, r107.bulletin_nr,
   r107.name
FROM
   reg107_parties r107
      INNER JOIN 
   (SELECT r102.id, r101.appln_id, 
           min(concat(cast(bulletin_year AS CHAR),
                      cast(bulletin_nr AS CHAR))) 
           AS bulletin_first_publication
   FROM 
      reg102_pat_publn r102
         INNER JOIN 
      reg101_appln r101 ON r101.id = r102.id
         INNER JOIN 
      wind_patents wp ON wp.appln_id = r101.appln_id
   GROUP BY 
      r102.id, r101.appln_id) p 
   ON r107.id = p.id 
      AND concat(cast(r107.bulletin_year AS CHAR),
                 cast(r107.bulletin_nr AS CHAR))
          = p.bulletin_first_publication
WHERE 
   type = 'R'
ORDER BY 
   r107.id;
