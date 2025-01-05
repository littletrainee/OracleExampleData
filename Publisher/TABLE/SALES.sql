DECLARE
    V_EXIST NUMBER;
BEGIN
    SELECT COUNT(*)
      INTO V_EXIST
      FROM USER_TABLES
     WHERE TABLE_NAME = 'SALES';
    IF V_EXIST <> 0 THEN
        EXECUTE IMMEDIATE 'DROP TABLE SALES CASCADE CONSTRAINT PURGE';
    END IF; 
END;
/

CREATE TABLE SALES(
    STORE_ID CHAR(4) NOT NULL,
    ORDER_NUMBER VARCHAR2(20) NOT NULL,
    ORDER_DATE DATE NOT NULL,
    QUANTITY NUMBER(5,0) NOT NULL,
    PAYTERMS VARCHAR2(12) NOT NULL,
    TITLE_ID CHAR(6),
    CONSTRAINT PK_SALES PRIMARY KEY (STORE_ID, ORDER_NUMBER, TITLE_ID),
    CONSTRAINT FK_SALES_STORE_ID FOREIGN KEY (STORE_ID) REFERENCES STORES (STORE_ID),
    CONSTRAINT FK_SALES_TITLE_ID FOREIGN KEY (TITLE_ID) REFERENCES TITLES (TITLE_ID)
);

CREATE INDEX IDX_SALES_TITLE_ID ON SALES (TITLE_ID);

INSERT INTO SALES VALUES ('7066', 'QA7442.3', TO_DATE('1994/09/13', 'YYYY/MM/DD'), 75, 'ON invoice','PS2091');
INSERT INTO SALES VALUES ('7067', 'D4482', TO_DATE('1994/09/14', 'YYYY/MM/DD'), 10, 'Net 60','PS2091');
INSERT INTO SALES VALUES ('7131', 'N914008', TO_DATE('1994/09/14', 'YYYY/MM/DD'), 20, 'Net 30','PS2091');
INSERT INTO SALES VALUES ('7131', 'N914014', TO_DATE('1994/09/14', 'YYYY/MM/DD'), 25, 'Net 30','MC3021');
INSERT INTO SALES VALUES ('8042', '423LL922', TO_DATE('1994/09/14', 'YYYY/MM/DD'), 15, 'ON invoice','MC3021');
INSERT INTO SALES VALUES ('8042', '423LL930', TO_DATE('1994/09/14', 'YYYY/MM/DD'), 10, 'ON invoice','BU1032');
INSERT INTO SALES VALUES ('6380', '722a', TO_DATE('1994/09/13', 'YYYY/MM/DD'), 3, 'Net 60','PS2091');
INSERT INTO SALES VALUES ('6380', '6871', TO_DATE('1994/09/14', 'YYYY/MM/DD'), 5, 'Net 60','BU1032');
INSERT INTO SALES VALUES ('8042','P723', TO_DATE('1993/03/11', 'YYYY/MM/DD'), 25, 'Net 30', 'BU1111');
INSERT INTO SALES VALUES ('7896','X999', TO_DATE('1993/02/21', 'YYYY/MM/DD'), 35, 'ON invoice', 'BU2075');
INSERT INTO SALES VALUES ('7896','QQ2299', TO_DATE('1993/10/28', 'YYYY/MM/DD'), 15, 'Net 60', 'BU7832');
INSERT INTO SALES VALUES ('7896','TQ456', TO_DATE('1993/12/12', 'YYYY/MM/DD'), 10, 'Net 60', 'MC2222');
INSERT INTO SALES VALUES ('8042','QA879.1', TO_DATE('1993/05/22', 'YYYY/MM/DD'), 30, 'Net 30', 'PC1035');
INSERT INTO SALES VALUES ('7066','A2976', TO_DATE('1993/05/24', 'YYYY/MM/DD'), 50, 'Net 30', 'PC8888');
INSERT INTO SALES VALUES ('7131','P3087a', TO_DATE('1993/05/29', 'YYYY/MM/DD'), 20, 'Net 60', 'PS1372');
INSERT INTO SALES VALUES ('7131','P3087a', TO_DATE('1993/05/29', 'YYYY/MM/DD'), 25, 'Net 60', 'PS2106');
INSERT INTO SALES VALUES ('7131','P3087a', TO_DATE('1993/05/29', 'YYYY/MM/DD'), 15, 'Net 60', 'PS3333');
INSERT INTO SALES VALUES ('7131','P3087a', TO_DATE('1993/05/29', 'YYYY/MM/DD'), 25, 'Net 60', 'PS7777');
INSERT INTO SALES VALUES ('7067','P2121', TO_DATE('1992/06/15', 'YYYY/MM/DD'), 40, 'Net 30', 'TC3218');
INSERT INTO SALES VALUES ('7067','P2121', TO_DATE('1992/06/15', 'YYYY/MM/DD'), 20, 'Net 30', 'TC4203');
INSERT INTO SALES VALUES ('7067','P2121', TO_DATE('1992/06/15', 'YYYY/MM/DD'), 20, 'Net 30', 'TC7777');
