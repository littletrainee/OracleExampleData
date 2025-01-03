DECLARE -- 刪除 EMPLOYEES TABLE 相關物件
    V_EXIST NUMBER;
BEGIN
    SELECT COUNT(*)
      INTO V_EXIST
      FROM USER_TABLES
     WHERE TABLE_NAME = 'SUPPLIERS';

    IF V_EXIST <> 0 THEN
        EXECUTE IMMEDIATE 'DROP TABLE SUPPLIERS CASCADE CONSTRAINT PURGE';
    END IF;

    SELECT COUNT(*)
      INTO V_EXIST
      FROM USER_SEQUENCES
     WHERE SEQUENCE_NAME = 'SEQ_SUPPLIERS';

    IF V_EXIST <> 0 THEN
       EXECUTE IMMEDIATE 'DROP SEQUENCE SEQ_SUPPLIERS'; 
    END IF;
END;
/

CREATE TABLE SUPPLIERS (
    SUPPLIER_ID NUMBER(10,0) NOT NULL,
    COMPANY_NAME VARCHAR2(40) NOT NULL,
    CONTACT_NAME VARCHAR2(30),
    CONTACT_TITLE VARCHAR2(30),
    ADDRESS VARCHAR2(60),
    CITY VARCHAR2(15),
    REGION VARCHAR2(15),
    POSTAL_CODE VARCHAR2(10),
    COUNTRY VARCHAR2(15),
    PHONE VARCHAR2(24),
    FAX VARCHAR2(24),
    HOME_PAGE CLOB,
    CONSTRAINT PK_SUPPLIERS PRIMARY KEY(SUPPLIER_ID)
);

CREATE INDEX IDX_SUPPLIERS_COMPANY_NAME ON SUPPLIERS(COMPANY_NAME);

CREATE INDEX IDX_SUPPLIERS_POSTAL_CODE ON SUPPLIERS(POSTAL_CODE);

CREATE SEQUENCE SEQ_SUPPLIERS;

CREATE OR REPLACE TRIGGER TRI_SUPPLIERS_AUTO_INCREMENT
BEFORE INSERT ON SUPPLIERS
FOR EACH ROW
BEGIN
    IF :NEW.SUPPLIER_ID IS NULL THEN
        SELECT SEQ_SUPPLIERS.NEXTVAL
            INTO :NEW.SUPPLIER_ID
          FROM DUAL;
    END IF;
END;
/

INSERT INTO SUPPLIERS -- 1
VALUES (
    NULL,                                         -- SUPPLIER_ID
    'Exotic Liquids',                             -- COMPANY_NAME
    'Charlotte Cooper',                           -- CONTACT_NAME
    'Purchasing Manager',                         -- CONTACT_TITLE
    '49 Gilbert St.',                             -- ADDRESS
    'London',                                     -- CITY
    NULL,                                         -- REGION
    'EC1 4SD',                                    -- POSTAL_CODE
    'UK',                                         -- COUNTRY
    '(171) 555-2222',                             -- PHONE
    NULL,                                         -- FAX
    NULL                                          -- HOME_PAGE
);

INSERT INTO SUPPLIERS  -- 2
VALUES (
    NULL,                                         -- SUPPLIER_ID
    'New Orleans Cajun Delights',                 -- COMPANY_NAME
    'Shelley Burke',                              -- CONTACT_NAME
    'Order Administrator',                        -- CONTACT_TITLE
    'P.O. Box 78934',                             -- ADDRESS
    'New Orleans',                                -- CITY
    'LA',                                         -- REGION
    '70117',                                      -- POSTAL_CODE
    'USA',                                        -- COUNTRY
    '(100) 555-4822',                             -- PHONE
    NULL,                                         -- FAX
    '#CAJUN.HTM#'                                 -- HOME_PAGE
);

INSERT INTO SUPPLIERS -- 3
VALUES (
    NULL,                                         -- SUPPLIER_ID
    'Grandma Kelly''s Homestead',                 -- COMPANY_NAME
    'Regina Murphy',                              -- CONTACT_NAME
    'Sales Representative',                       -- CONTACT_TITLE
    '707 Oxford Rd.',                             -- ADDRESS
    'Ann Arbor',                                  -- CITY
    'MI',                                         -- REGION
    '48104',                                      -- POSTAL_CODE
    'USA',                                        -- COUNTRY
    '(313) 555-5735',                             -- PHONE
    '(313) 555-3349',                             -- FAX
    NULL                                          -- HOME_PAGE
);

INSERT INTO SUPPLIERS -- 4
VALUES (
    NULL,                                         -- SUPPLIER_ID
    'Tokyo Traders',                              -- COMPANY_NAME
    'Yoshi Nagase',                               -- CONTACT_NAME
    'Marketing Manager',                          -- CONTACT_TITLE
    '9-8 Sekimai Musashino-shi',                  -- ADDRESS
    'Tokyo',                                      -- CITY
    NULL,                                         -- REGION
    '100',                                        -- POSTAL_CODE
    'Japan',                                      -- COUNTRY
    '(03) 3555-5011',                             -- PHONE
    NULL,                                         -- FAX
    NULL                                          -- HOME_PAGE
);

INSERT INTO SUPPLIERS -- 5
VALUES (
    NULL,                                         -- SUPPLIER_ID
    'Cooperativa de Quesos ''Las Cabras''',       -- COMPANY_NAME
    'Antonio del Valle Saavedra',                 -- CONTACT_NAME
    'Export Administrator',                       -- CONTACT_TITLE
    'Calle del Rosal 4',                          -- ADDRESS
    'Oviedo',                                     -- CITY
    'Asturias',                                   -- REGION
    '33007',                                      -- POSTAL_CODE
    'Spain',                                      -- COUNTRY
    '(98) 598 76 54',                             -- PHONE
    NULL,                                         -- FAX
    NULL                                          -- HOME_PAGE
);

INSERT INTO SUPPLIERS -- 6
VALUES (
    NULL,                                         -- SUPPLIER_ID
    'Mayumi''s',                                  -- COMPANY_NAME
    'Mayumi Ohno',                                -- CONTACT_NAME
    'Marketing Representative',                   -- CONTACT_TITLE
    '92 Setsuko Chuo-ku',                         -- ADDRESS
    'Osaka',                                      -- CITY
    NULL,                                         -- REGION
    '545',                                        -- POSTAL_CODE
    'Japan',                                      -- COUNTRY
    '(06) 431-7877',                              -- PHONE
    NULL,                                         -- FAX
    'Mayumi''s (on the World Wide Web)#http://www'
        || '.microsoft.com/accessdev/sampleapps/'
        || 'mayumi.htm#'                          -- HOME_PAGE
);

INSERT INTO SUPPLIERS -- 7
VALUES (
    NULL,                                         -- SUPPLIER_ID
    'Pavlova, Ltd.',                              -- COMPANY_NAME
    'Ian Devling',                                -- CONTACT_NAME
    'Marketing Manager',                          -- CONTACT_TITLE
    '74 Rose St. Moonie Ponds',                   -- ADDRESS
    'Melbourne',                                  -- CITY
    'Victoria',                                   -- REGION
    '3058',                                       -- POSTAL_CODE
    'Australia',                                  -- COUNTRY
    '(03) 444-2343',                              -- PHONE
    '(03) 444-6588',                              -- FAX
    NULL                                          -- HOME_PAGE
);

INSERT INTO SUPPLIERS -- 8
VALUES (
    NULL,                                         -- SUPPLIER_ID
    'Specialty Biscuits, Ltd.',                   -- COMPANY_NAME
    'Peter Wilson',                               -- CONTACT_NAME
    'Sales Representative',                       -- CONTACT_TITLE
    '29 King''s Way',                             -- ADDRESS
    'Manchester',                                 -- CITY
    NULL,                                         -- REGION
    'M14 GSD',                                    -- POSTAL_CODE
    'UK',                                         -- COUNTRY
    '(161) 555-4448',                             -- PHONE
    NULL,                                         -- FAX
    NULL                                          -- HOME_PAGE
);

INSERT INTO SUPPLIERS -- 9
VALUES (
    NULL,                                         -- SUPPLIER_ID
    'PB Knäckebröd AB',                           -- COMPANY_NAME
    'Lars Peterson',                              -- CONTACT_NAME
    'Sales Agent',                                -- CONTACT_TITLE
    'Kaloadagatan 13',                            -- ADDRESS
    'Göteborg',                                   -- CITY
    NULL,                                         -- REGION
    'S-345 67',                                   -- POSTAL_CODE
    'Sweden',                                     -- COUNTRY
    '031-987 65 43',                              -- PHONE
    '031-987 65 91',                              -- FAX
    NULL                                          -- HOME_PAGE
);

INSERT INTO SUPPLIERS -- 10
VALUES (
    NULL,                                         -- SUPPLIER_ID
    'Refrescos Americanas LTDA',                  -- COMPANY_NAME
    'Carlos Diaz',                                -- CONTACT_NAME
    'Marketing Manager',                          -- CONTACT_TITLE
    'Av. das Americanas 12.890',                  -- ADDRESS
    'Sao Paulo',                                  -- CITY
    NULL,                                         -- REGION
    '5442',                                       -- POSTAL_CODE
    'Brazil',                                     -- COUNTRY
    '(11) 555 4640',                              -- PHONE
    NULL,                                         -- FAX
    NULL                                          -- HOME_PAGE
);

INSERT INTO SUPPLIERS -- 11
VALUES (
    NULL,                                         -- SUPPLIER_ID
    'Heli Süßwaren GmbH & Co. KG',                -- COMPANY_NAME
    'Petra Winkler',                              -- CONTACT_NAME
    'Sales Manager',                              -- CONTACT_TITLE
    'Tiergartenstraße 5',                         -- ADDRESS
    'Berlin',                                     -- CITY
    NULL,                                         -- REGION
    '10785',                                      -- POSTAL_CODE
    'Germany',                                    -- COUNTRY
    '(010) 9984510',                              -- PHONE
    NULL,                                         -- FAX
    NULL                                          -- HOME_PAGE
);

INSERT INTO SUPPLIERS -- 12
VALUES (
    NULL,                                         -- SUPPLIER_ID
    'Plutzer Lebensmittelgroßmärkte AG',          -- COMPANY_NAME
    'Martin Bein',                                -- CONTACT_NAME
    'International Marketing Mgr.',               -- CONTACT_TITLE
    'Bogenallee 51',                              -- ADDRESS
    'Frankfurt',                                  -- CITY
    NULL,                                         -- REGION
    '60439',                                      -- POSTAL_CODE
    'Germany',                                    -- COUNTRY
    '(069) 992755',                               -- PHONE
    NULL,                                         -- FAX
    'Plutzer (on the World Wide Web)#http://www.'
        || 'microsoft.com/accessdev/sampleapps/'
        || 'plutzer.htm#'                         -- HOME_PAGE
);

INSERT INTO SUPPLIERS -- 13
VALUES (
    NULL,                                         -- SUPPLIER_ID
    'Nord-Ost-Fisch Handelsgesellschaft mbH',     -- COMPANY_NAME
    'Sven Petersen',                              -- CONTACT_NAME
    'Coordinator Foreign Markets',                -- CONTACT_TITLE
    'Frahmredder 112a',                           -- ADDRESS
    'Cuxhaven',                                   -- CITY
    NULL,                                         -- REGION
    '27478',                                      -- POSTAL_CODE
    'Germany',                                    -- COUNTRY
    '(04721) 8713',                               -- PHONE
    '(04721) 8714',                               -- FAX
    NULL                                          -- HOME_PAGE
);

INSERT INTO SUPPLIERS -- 14
VALUES (
    NULL,                                         -- SUPPLIER_ID
    'Formaggi Fortini s.r.l.',                    -- COMPANY_NAME
    'Elio Rossi',                                 -- CONTACT_NAME
    'Sales Representative',                       -- CONTACT_TITLE
    'Viale Dante, 75',                            -- ADDRESS
    'Ravenna',                                    -- CITY
    NULL,                                         -- REGION
    '48100',                                      -- POSTAL_CODE
    'Italy',                                      -- COUNTRY
    '(0544) 60323',                               -- PHONE
    '(0544) 60603',                               -- FAX
    '#FORMAGGI.HTM#'                              -- HOME_PAGE
);

INSERT INTO SUPPLIERS -- 15
VALUES (
    NULL,                                         -- SUPPLIER_ID
    'Norske Meierier',                            -- COMPANY_NAME
    'Beate Vileid',                               -- CONTACT_NAME
    'Marketing Manager',                          -- CONTACT_TITLE
    'Hatlevegen 5',                               -- ADDRESS
    'Sandvika',                                   -- CITY
    NULL,                                         -- REGION
    '1320',                                       -- POSTAL_CODE
    'Norway',                                     -- COUNTRY
    '(0)2-953010',                                -- PHONE
    NULL,                                         -- FAX
    NULL                                          -- HOME_PAGE
);

INSERT INTO SUPPLIERS -- 16
VALUES (
    NULL,                                         -- SUPPLIER_ID
    'Bigfoot Breweries',                          -- COMPANY_NAME
    'Cheryl Saylor',                              -- CONTACT_NAME
    'Regional Account Rep.',                      -- CONTACT_TITLE
    '3400 - 8th Avenue Suite 210',                -- ADDRESS
    'Bend',                                       -- CITY
    'OR',                                         -- REGION
    '97101',                                      -- POSTAL_CODE
    'USA',                                        -- COUNTRY
    '(503) 555-9931',                             -- PHONE
    NULL,                                         -- FAX
    NULL                                          -- HOME_PAGE
);

INSERT INTO SUPPLIERS -- 17
VALUES (
    NULL,                                         -- SUPPLIER_ID
    'Svensk Sjöföda AB',                          -- COMPANY_NAME
    'Michael Björn',                              -- CONTACT_NAME
    'Sales Representative',                       -- CONTACT_TITLE
    'Brovallavägen 231',                          -- ADDRESS
    'Stockholm',                                  -- CITY
    NULL,                                         -- REGION
    'S-123 45',                                   -- POSTAL_CODE
    'Sweden',                                     -- COUNTRY
    '08-123 45 67',                               -- PHONE
    NULL,                                         -- FAX
    NULL                                          -- HOME_PAGE
);

INSERT INTO SUPPLIERS -- 18
VALUES (
    NULL,                                         -- SUPPLIER_ID
    'Aux joyeux ecclésiastiques',                 -- COMPANY_NAME
    'Guylène Nodier',                             -- CONTACT_NAME
    'Sales Manager',                              -- CONTACT_TITLE
    '203, Rue des Francs-Bourgeois',              -- ADDRESS
    'Paris',                                      -- CITY
    NULL,                                         -- REGION
    '75004',                                      -- POSTAL_CODE
    'France',                                     -- COUNTRY
    '(1) 03.83.00.68',                            -- PHONE
    '(1) 03.83.00.62',                            -- FAX
    NULL                                          -- HOME_PAGE
);

INSERT INTO SUPPLIERS -- 19
VALUES (
    NULL,                                         -- SUPPLIER_ID
    'New England Seafood Cannery',                -- COMPANY_NAME
    'Robb Merchant',                              -- CONTACT_NAME
    'Wholesale Account Agent',                    -- CONTACT_TITLE
    'Order Processing Dept. 2100 Paul Revere '
        || 'Blvd.',                               -- ADDRESS
    'Boston',                                     -- CITY
    'MA',                                         -- REGION
    '02134',                                      -- POSTAL_CODE
    'USA',                                        -- COUNTRY
    '(617) 555-3267',                             -- PHONE
    '(617) 555-3389',                             -- FAX
    NULL                                          -- HOME_PAGE
);

INSERT INTO SUPPLIERS -- 20
VALUES (
    NULL,                                         -- SUPPLIER_ID
    'Leka Trading',                               -- COMPANY_NAME
    'Chandra Leka',                               -- CONTACT_NAME
    'Owner',                                      -- CONTACT_TITLE
    '471 Serangoon Loop, Suite #402',             -- ADDRESS
    'Singapore',                                  -- CITY
    NULL,                                         -- REGION
    '0512',                                       -- POSTAL_CODE
    'Singapore',                                  -- COUNTRY
    '555-8787',                                   -- PHONE
    NULL,                                         -- FAX
    NULL                                          -- HOME_PAGE
);

INSERT INTO SUPPLIERS -- 21
VALUES(
    NULL,                                         -- SUPPLIER_ID
    'Lyngbysild',                                 -- COMPANY_NAME
    'Niels Petersen',                             -- CONTACT_NAME
    'Sales Manager',                              -- CONTACT_TITLE
    'Lyngbysild Fiskebakken 10',                  -- ADDRESS
    'Lyngby',                                     -- CITY
    NULL,                                         -- REGION
    '2800',                                       -- POSTAL_CODE
    'Denmark',                                    -- COUNTRY
    '43844108',                                   -- PHONE
    '43844115',                                   -- FAX
    NULL                                          -- HOME_PAGE
);

INSERT INTO SUPPLIERS -- 22
VALUES(
    NULL,                                         -- SUPPLIER_ID
    'Zaanse Snoepfabriek',                        -- COMPANY_NAME
    'Dirk Luchte',                                -- CONTACT_NAME
    'Accounting Manager',                         -- CONTACT_TITLE
    'Verkoop Rijnweg 22',                         -- ADDRESS
    'Zaandam',                                    -- CITY
    NULL,                                         -- REGION
    '9999 ZZ',                                    -- POSTAL_CODE
    'Netherlands',                                -- COUNTRY
    '(12345) 1212',                               -- PHONE
    '(12345) 1210',                               -- FAX
    NULL                                          -- HOME_PAGE
);

INSERT INTO SUPPLIERS -- 23
VALUES(
    NULL,                                         -- SUPPLIER_ID
    'Karkki Oy',                                  -- COMPANY_NAME
    'Anne Heikkonen',                             -- CONTACT_NAME
    'Product Manager',                            -- CONTACT_TITLE
    'Valtakatu 12',                               -- ADDRESS
    'Lappeenranta',                               -- CITY
    NULL,                                         -- REGION
    '53120',                                      -- POSTAL_CODE
    'Finland',                                    -- COUNTRY
    '(953) 10956',                                -- PHONE
    NULL,                                         -- FAX
    NULL                                          -- HOME_PAGE
);

INSERT INTO SUPPLIERS -- 24
VALUES(
    NULL,                                         -- SUPPLIER_ID
    'G''day, Mate',                               -- COMPANY_NAME
    'Wendy Mackenzie',                            -- CONTACT_NAME
    'Sales Representative',                       -- CONTACT_TITLE
    '170 Prince Edward Parade Hunter''s Hill',    -- ADDRESS
    'Sydney',                                     -- CITY
    'NSW',                                        -- REGION
    '2042',                                       -- POSTAL_CODE
    'Australia',                                  -- COUNTRY
    '(02) 555-5914',                              -- PHONE
    '(02) 555-4873',                              -- FAX
    'G''day Mate (on the World Wide Web)#http://'
        || 'www.microsoft.com/accessdev/'
        || 'sampleapps/gdaymate.htm#'             -- HOME_PAGE
);

INSERT INTO SUPPLIERS -- 25
VALUES(
    NULL,                                         -- SUPPLIER_ID
    'Ma Maison',                                  -- COMPANY_NAME
    'Jean-Guy Lauzon',                            -- CONTACT_NAME
    'Marketing Manager',                          -- CONTACT_TITLE
    '2960 Rue St. Laurent',                       -- ADDRESS
    'Montréal',                                   -- CITY
    'Québec',                                     -- REGION
    'H1J 1C3',                                    -- POSTAL_CODE
    'Canada',                                     -- COUNTRY
    '(514) 555-9022',                             -- PHONE
    NULL,                                         -- FAX
    NULL                                          -- HOME_PAGE
);

INSERT INTO SUPPLIERS -- 26
VALUES(
    NULL,                                         -- SUPPLIER_ID
    'Pasta Buttini s.r.l.',                       -- COMPANY_NAME
    'Giovanni Giudici',                           -- CONTACT_NAME
    'Order Administrator',                        -- CONTACT_TITLE
    'Via dei Gelsomini, 153',                     -- ADDRESS
    'Salerno',                                    -- CITY
    NULL,                                         -- REGION
    '84100',                                      -- POSTAL_CODE
    'Italy',                                      -- COUNTRY
    '(089) 6547665',                              -- PHONE
    '(089) 6547667',                              -- FAX
    NULL                                          -- HOME_PAGE
);

INSERT INTO SUPPLIERS -- 27
VALUES(
    NULL,                                         -- SUPPLIER_ID
    'Escargots Nouveaux',                         -- COMPANY_NAME
    'Marie Delamare',                             -- CONTACT_NAME
    'Sales Manager',                              -- CONTACT_TITLE
    '22, rue H. Voiron',                          -- ADDRESS
    'Montceau',                                   -- CITY
    NULL,                                         -- REGION
    '71300',                                      -- POSTAL_CODE
    'France',                                     -- COUNTRY
    '85.57.00.07',                                -- PHONE
    NULL,                                         -- FAX
    NULL                                          -- HOME_PAGE
);

INSERT INTO SUPPLIERS -- 28
VALUES(
    NULL,                                         -- SUPPLIER_ID
    'Gai pâturage',                               -- COMPANY_NAME
    'Eliane Noz',                                 -- CONTACT_NAME
    'Sales Representative',                       -- CONTACT_TITLE
    'Bat. B 3, rue des Alpes',                    -- ADDRESS
    'Annecy',                                     -- CITY
    NULL,                                         -- REGION
    '74000',                                      -- POSTAL_CODE
    'France',                                     -- COUNTRY
    '38.76.98.06',                                -- PHONE
    '38.76.98.58',                                -- FAX
    NULL                                          -- HOME_PAGE
);

INSERT INTO SUPPLIERS -- 29
VALUES(
    NULL,                                         -- SUPPLIER_ID
    'Forêts d''érables',                          -- COMPANY_NAME
    'Chantal Goulet',                             -- CONTACT_NAME
    'Accounting Manager',                         -- CONTACT_TITLE
    '148 rue Chasseur',                           -- ADDRESS
    'Ste-Hyacinthe',                              -- CITY
    'Québec',                                     -- REGION
    'J2S 7S8',                                    -- POSTAL_CODE
    'Canada',                                     -- COUNTRY
    '(514) 555-2955',                             -- PHONE
    '(514) 555-2921',                             -- FAX
    NULL                                          -- HOME_PAGE
);
