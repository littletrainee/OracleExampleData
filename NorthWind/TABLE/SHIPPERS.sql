DECLARE 
    V_EXIST NUMBER;
BEGIN
    SELECT COUNT(*)
      INTO V_EXIST
      FROM USER_TABLES
     WHERE TABLE_NAME = 'SHIPPERS';

    IF V_EXIST <> 0 THEN
        EXECUTE IMMEDIATE 'DROP TABLE SHIPPERS CASCADE CONSTRAINT PURGE';
    END IF;

    SELECT COUNT(*)
      INTO V_EXIST
      FROM USER_SEQUENCES
     WHERE SEQUENCE_NAME = 'SEQ_SHIPPERS';

    IF V_EXIST <> 0 THEN
       EXECUTE IMMEDIATE 'DROP SEQUENCE SEQ_SHIPPERS'; 
    END IF;
END;
/

CREATE TABLE SHIPPERS (
    SHIPPER_ID NUMBER(10,0) NOT NULL,
    COMPANY_NAME VARCHAR2(40) NOT NULL,
    PHONE VARCHAR2(24),
    CONSTRAINT PK_SHIPPERS PRIMARY KEY(SHIPPER_ID)
);

CREATE SEQUENCE SEQ_SHIPPERS;

CREATE OR REPLACE TRIGGER TRI_SHIPPERS_AUTO_INCREMENT
BEFORE INSERT ON SHIPPERS
FOR EACH ROW
BEGIN
    IF :NEW.SHIPPER_ID IS NULL THEN
        SELECT SEQ_SHIPPERS.NEXTVAL 
            INTO :NEW.SHIPPER_ID 
          FROM DUAL;
    END IF;
END;
/

INSERT INTO SHIPPERS -- 1
VALUES (
    NULL,                                         -- SHIPPER_ID
    'Speedy Express',                             -- COMPANY_NAME
    '(503) 555-9831'                              -- PHONE
);

INSERT INTO SHIPPERS -- 2
VALUES (
    NULL,                                         -- SHIPPER_ID
    'United Package',                             -- COMPANY_NAME
    '(503) 555-3199'                              -- PHONE
);

INSERT INTO SHIPPERS --3 
VALUES (
    NULL,                                         -- SHIPPER_ID
    'Federal Shipping',                           -- COMPANY_NAME
    '(503) 555-9931'                              -- PHONE
);