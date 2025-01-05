CREATE OR REPLACE VIEW REPORT_QUERY2 
AS
      SELECT CASE GROUPING(T.TYPE)
                 WHEN 1 THEN 'ALL'
                 ELSE T.TYPE
             END AS TYPE,
             CASE GROUPING(T.PUBLISHER_ID) 
                 WHEN 1 THEN 'ALL'
                 ELSE T.PUBLISHER_ID
             END AS PUBLISHER_ID,
             AVG(T.YEAR_TO_DATE_SALES) AS AVERAGE_YEAR_TO_DATE_SALES
        FROM TITLES T
       WHERE T.PUBLISHER_ID IS NOT NULL
    GROUP BY ROLLUP(PUBLISHER_ID, TYPE);