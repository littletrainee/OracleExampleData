DECLARE
    V_EXIST NUMBER;
BEGIN
    SELECT COUNT(*)
      INTO V_EXIST
      FROM USER_TABLES
     WHERE TABLE_NAME = 'CUSTOMER_CUSTOMER_DEMO';
    IF V_EXIST <> 0 THEN
        EXECUTE IMMEDIATE 'DROP TABLE CUSTOMER_CUSTOMER_DEMO CASCADE CONSTRAINT PURGE';
    END IF; 
END;
/

CREATE TABLE CUSTOMER_CUSTOMER_DEMO(
    CUSTOMER_ID CHAR(5) NOT NULL,
    CUSTOMER_TYPE_ID CHAR(10) NOT NULL,
    CONSTRAINT PK_CUSTOMER_CUSTOMER_DEMO PRIMARY KEY (CUSTOMER_ID, CUSTOMER_TYPE_ID),
    CONSTRAINT FK_CUSTOMER_CUSTOMER_TYPE_ID FOREIGN KEY (CUSTOMER_TYPE_ID) REFERENCES CUSTOMER_DEMO_GRAPHICS (CUSTOMER_TYPE_ID),
    CONSTRAINT FK_CUSTOMER_CUSTOMER_ID FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMERS (CUSTOMER_ID)
);