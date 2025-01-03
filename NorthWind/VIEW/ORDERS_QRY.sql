CREATE OR REPLACE VIEW ORDERS_QRY
AS 
    SELECT O.ORDER_ID,
           O.CUSTOMER_ID,
           O.EMPLOYEE_ID,
           O.ORDER_DATE,
           O.REQUIRED_DATE,
           O.SHIPPED_DATE,
           O.SHIP_VIA,
           O.FREIGHT,
           O.SHIP_NAME,
           O.SHIP_ADDRESS,
           O.SHIP_CITY,
           O.SHIP_REGION,
           O.SHIP_POSTAL_CODE,
           O.SHIP_COUNTRY,
           C.COMPANY_NAME,
           C.ADDRESS,
           C.CITY,
           C.REGION,
           C.POSTAL_CODE,
           C.COUNTRY
      FROM CUSTOMERS C
      JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID;