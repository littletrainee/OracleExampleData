CREATE VIEW SUMMARY_OF_SALES_BY_QUARTER 
AS
    SELECT O.SHIPPED_DATE, 
           O.ORDER_ID, 
           OST.SUB_TOTAL
      FROM ORDERS O 
      JOIN ORDER_SUB_TOTALS OST ON O.ORDER_ID = OST.ORDER_ID
     WHERE O.SHIPPED_DATE IS NOT NULL;