create or replace view report_query1 
as 
    SELECT
        CASE GROUPING(T.PUBLISHER_ID) 
            WHEN 1 THEN 'ALL'
            ELSE T.PUBLISHER_ID
        END AS PUBLISHER_ID,
        AVG(T.PRICE) AS AVERAGE_PRICE
    FROM TITLES T
    WHERE PRICE IS NOT NULL
    GROUP BY ROLLUP(T.PUBLISHER_ID)
    ORDER BY CASE GROUPING(T.PUBLISHER_ID)
                 WHEN 1 THEN NULL
                 ELSE T.PUBLISHER_ID
             END;

                