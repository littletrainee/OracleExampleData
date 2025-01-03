create view PRODUCTS_ABOVE_AVERAGE_PRICE 
AS
    SELECT P.PRODUCT_NAME, 
           P.UNIT_PRICE
      FROM PRODUCTS P
     WHERE P.UNIT_PRICE > (
                           SELECT AVG(P.UNIT_PRICE) 
                             FROM PRODUCTS P
                          );