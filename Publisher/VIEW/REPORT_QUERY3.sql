CREATE OR REPLACE VIEW REPORT_QUERY3 
AS
      SELECT CASE 
                 WHEN GROUPING(T.PUBLISHER_ID) = 1 THEN 'ALL' 
                 ELSE T.PUBLISHER_ID 
             END AS PUBLISHER_ID,
             CASE 
                 WHEN GROUPING(T.TYPE) = 1 THEN 'ALL' 
                 ELSE T.TYPE 
             END AS TYPE,
             COUNT(T.TITLE_ID) AS "COUNT"
        FROM TITLES T
    GROUP BY ROLLUP(T.PUBLISHER_ID, T.TYPE);
