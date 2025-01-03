DECLARE
    V_EXIST NUMBER;
BEGIN
    SELECT COUNT(*)
      INTO V_EXIST
      FROM USER_TABLES
     WHERE TABLE_NAME = 'CUSTOMERS';
    IF V_EXIST <> 0 THEN
        EXECUTE IMMEDIATE 'DROP TABLE CUSTOMERS CASCADE CONSTRAINT PURGE';
    END IF; 
END;
/

CREATE TABLE CUSTOMERS(
    CUSTOMER_ID CHAR(5) NOT NULL,
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
    CONSTRAINT PK_CUSTOMERS PRIMARY KEY(CUSTOMER_ID)
);

CREATE INDEX IDX_CUSTOMERS_CITY ON CUSTOMERS(CITY);

CREATE INDEX IDX_CUSTOMERS_COMPANY_NAME ON CUSTOMERS(COMPANY_NAME);

CREATE INDEX IDX_CUSTOMERS_POSTAL_CODE ON CUSTOMERS(POSTAL_CODE);

CREATE INDEX IDX_CUSTOMERS_REGION ON CUSTOMERS(REGION);

INSERT INTO CUSTOMERS -- ALFKI
VALUES (
    'ALFKI',                                      -- CUSTOMER_ID
    'Alfreds Futterkiste',                        -- COMPANY_NAME
    'Maria Anders',                               -- CONTACT_NAME
    'Sales Representative',                       -- CONTACT_TITLE
    'Obere Str. 57',                              -- ADDRESS
    'Berlin',                                     -- CITY
    NULL,                                         -- REGION
    '12209',                                      -- POSTAL_CODE
    'Germany',                                    -- COUNTRY
    '030-0074321',                                -- PHONE
    '030-0076545'                                 -- FAX
);

INSERT INTO CUSTOMERS -- ANATR
VALUES (
    'ANATR',                                      -- CUSTOMER_ID
    'Ana Trujillo Emparedados y helados',         -- COMPANY_NAME
    'Ana Trujillo',                               -- CONTACT_NAME
    'Owner',                                      -- CONTACT_TITLE
    'Avda. de la Constitución 2222',              -- ADDRESS
    'México D.F.',                                -- CITY
    NULL,                                         -- REGION
    '05021',                                      -- POSTAL_CODE
    'Mexico',                                     -- COUNTRY
    '(5) 555-4729',                               -- PHONE
    '(5) 555-3745'                                -- FAX
);

INSERT INTO CUSTOMERS -- ANTON
VALUES (
    'ANTON',                                      -- CUSTOMER_ID
    'Antonio Moreno Taquería',                    -- COMPANY_NAME
    'Antonio Moreno',                             -- CONTACT_NAME
    'Owner',                                      -- CONTACT_TITLE
    'Mataderos  2312',                            -- ADDRESS
    'México D.F.',                                -- CITY
    NULL,                                         -- REGION
    '05023',                                      -- POSTAL_CODE
    'Mexico',                                     -- COUNTRY
    '(5) 555-3932',                               -- PHONE
    NULL                                          -- FAX
);

INSERT INTO CUSTOMERS -- AROUT
VALUES (
    'AROUT',                                      -- CUSTOMER_ID
    'Around the Horn',                            -- COMPANY_NAME
    'Thomas Hardy',                               -- CONTACT_NAME
    'Sales Representative',                       -- CONTACT_TITLE
    '120 Hanover Sq.',                            -- ADDRESS
    'London',                                     -- CITY
    NULL,                                         -- REGION
    'WA1 1DP',                                    -- POSTAL_CODE
    'UK',                                         -- COUNTRY
    '(171) 555-7788',                             -- PHONE
    '(171) 555-6750'                              -- FAX
);

INSERT INTO CUSTOMERS -- BERGS
VALUES (
    'BERGS',                                      -- CUSTOMER_ID
    'Berglunds snabbköp',                         -- COMPANY_NAME
    'Christina Berglund',                         -- CONTACT_NAME
    'Order Administrator',                        -- CONTACT_TITLE
    'Berguvsvägen  8',                            -- ADDRESS 
    'Luleå',                                      -- CITY
    NULL,                                         -- REGION  
    'S-958 22',                                   -- POSTAL_CODE
    'Sweden',                                     -- COUNTRY
    '0921-12 34 65',                              -- PHONE
    '0921-12 34 67'                               -- FAX
);

INSERT INTO CUSTOMERS -- BLAUS
VALUES (
    'BLAUS',                                      -- CUSTOMER_ID   
    'Blauer See Delikatessen',                    -- COMPANY_NAME
    'Hanna Moos',                                 -- CONTACT_NAME
    'Sales Representative',                       -- CONTACT_TITLE
    'Forsterstr. 57',                             -- ADDRESS 
    'Mannheim',                                   -- CITY
    NULL,                                         -- REGION  
    '68306',                                      -- POSTAL_CODE
    'Germany',                                    -- COUNTRY
    '0621-08460',                                 -- PHONE
    '0621-08924'                                  -- FAX
);

INSERT INTO CUSTOMERS -- BLONP
VALUES (
    'BLONP',                                      -- CUSTOMER_ID
    'Blondesddsl père et fils',                   -- COMPANY_NAME
    'Frédérique Citeaux',                         -- CONTACT_NAME
    'Marketing Manager',                          -- CONTACT_TITLE
    '24, place Kléber',                           -- ADDRESS 
    'Strasbourg',                                 -- CITY
    NULL,                                         -- REGION
    '67000',                                      -- POSTAL_CODE
    'France',                                     -- COUNTRY
    '88.60.15.31',                                -- PHONE
    '88.60.15.32'                                 -- FAX
);

INSERT INTO CUSTOMERS -- BOLID
VALUES (
    'BOLID',                                      -- CUSTOMER_ID
    'Bólido Comidas preparadas',                  -- COMPANY_NAME
    'Martín Sommer',                              -- CONTACT_NAME
    'Owner',                                      -- CONTACT_TITLE
    'C/ Araquil, 67',                             -- ADDRESS 
    'Madrid',                                     -- CITY
    NULL,                                         -- REGION
    '28023',                                      -- POSTAL_CODE
    'Spain',                                      -- COUNTRY
    '(91) 555 22 82',                             -- PHONE
    '(91) 555 91 99'                              -- FAX
);

INSERT INTO CUSTOMERS -- BONAP
VALUES (
    'BONAP',                                      -- CUSTOMER_ID
    'Bon app''',                                  -- COMPANY_NAME
    'Laurence Lebihan',                           -- CONTACT_NAME
    'Owner',                                      -- CONTACT_TITLE
    '12, rue des Bouchers',                       -- ADDRESS 
    'Marseille',                                  -- CITY
    NULL,                                         -- REGION
    '13008',                                      -- POSTAL_CODE
    'France',                                     -- COUNTRY
    '91.24.45.40',                                -- PHONE
    '91.24.45.41'                                 -- FAX
);

INSERT INTO CUSTOMERS -- BOTTM
VALUES (
    'BOTTM',                                      -- CUSTOMER_ID
    'Bottom-Dollar Markets',                      -- COMPANY_NAME
    'Elizabeth Lincoln',                          -- CONTACT_NAME
    'Accounting Manager',                         -- CONTACT_TITLE
    '23 Tsawassen Blvd.',                         -- ADDRESS 
    'Tsawassen',                                  -- CITY
    'BC',                                         -- REGION
    'T2F 8M4',                                    -- POSTAL_CODE
    'Canada',                                     -- COUNTRY
    '(604) 555-4729',                             -- PHONE
    '(604) 555-3745'                              -- FAX
);

INSERT INTO CUSTOMERS -- BSBEV
VALUES (
    'BSBEV',                                      -- CUSTOMER_ID
    'B''s Beverages',                             -- COMPANY_NAME
    'Victoria Ashworth',                          -- CONTACT_NAME
    'Sales Representative',                       -- CONTACT_TITLE
    'Fauntleroy Circus',                          -- ADDRESS
    'London',                                     -- CITY
    NULL,                                         -- REGION
    'EC2 5NT',                                    -- POSTAL_CODE
    'UK',                                         -- COUNTRY
    '(171) 555-1212',                             -- PHONE
    NULL                                          -- FAX
);

INSERT INTO CUSTOMERS -- CACTU
VALUES (
    'CACTU',                                      -- CUSTOMER_ID
    'Cactus Comidas para llevar',                 -- COMPANY_NAME
    'Patricio Simpson',                           -- CONTACT_NAME
    'Sales Agent',                                -- CONTACT_TITLE
    'Cerrito 333',                                -- ADDRESS
    'Buenos Aires',                               -- CITY
    NULL,                                         -- REGION
    '1010',                                       -- POSTAL_CODE
    'Argentina',                                  -- COUNTRY
    '(1) 135-5555',                               -- PHONE
    '(1) 135-4892'                                -- FAX
);

INSERT INTO CUSTOMERS -- CENTC
VALUES (
    'CENTC',                                      -- CUSTOMER_ID
    'Centro comercial Moctezuma',                 -- COMPANY_NAME
    'Francisco Chang',                            -- CONTACT_NAME
    'Marketing Manager',                          -- CONTACT_TITLE
    'Sierras de Granada 9993',                    -- ADDRESS
    'México D.F.',                                -- CITY
    NULL,                                         -- REGION
    '05022',                                      -- POSTAL_CODE
    'Mexico',                                     -- COUNTRY
    '(5) 555-3392',                               -- PHONE
    '(5) 555-7293'                                -- FAX
);

INSERT INTO CUSTOMERS -- CHOPS
VALUES (
    'CHOPS',                                      -- CUSTOMER_ID
    'Chop-suey Chinese',                          -- COMPANY_NAME
    'Yang Wang',                                  -- CONTACT_NAME
    'Owner',                                      -- CONTACT_TITLE
    'Hauptstr. 29',                               -- ADDRESS
    'Bern',                                       -- CITY
    NULL,                                         -- REGION
    '3012',                                       -- POSTAL_CODE
    'Switzerland',                                -- COUNTRY
    '0452-076545',                                -- PHONE
    NULL                                          -- FAX
);

INSERT INTO CUSTOMERS -- COMMI
VALUES (
    'COMMI',                                      -- CUSTOMER_ID
    'Comércio Mineiro',                           -- COMPANY_NAME
    'Pedro Afonso',                               -- CONTACT_NAME
    'Sales Associate',                            -- CONTACT_TITLE
    'Av. dos Lusíadas, 23',                       -- ADDRESS
    'Sao Paulo',                                  -- CITY
    'SP',                                         -- REGION
    '05432-043',                                  -- POSTAL_CODE
    'Brazil',                                     -- COUNTRY
    '(11) 555-7647',                              -- PHONE
    NULL                                          -- FAX
);

INSERT INTO CUSTOMERS -- CONSH
VALUES (
    'CONSH',                                      -- CUSTOMER_ID
    'Consolidated Holdings',                      -- COMPANY_NAME
    'Elizabeth Brown',                            -- CONTACT_NAME
    'Sales Representative',                       -- CONTACT_TITLE
    'Berkeley Gardens 12  Brewery',               -- ADDRESS
    'London',                                     -- CITY
    NULL,                                         -- REGION
    'WX1 6LT',                                    -- POSTAL_CODE
    'UK',                                         -- COUNTRY
    '(171) 555-2282',                             -- PHONE
    '(171) 555-9199'                              -- FAX
);

INSERT INTO CUSTOMERS -- DRACD
VALUES (
    'DRACD',                                      -- CUSTOMER_ID
    'Drachenblut Delikatessen',                   -- COMPANY_NAME
    'Sven Ottlieb',                               -- CONTACT_NAME
    'Order Administrator',                        -- CONTACT_TITLE
    'Walserweg 21',                               -- ADDRESS
    'Aachen',                                     -- CITY
    NULL,                                         -- REGION
    '52066',                                      -- POSTAL_CODE
    'Germany',                                    -- COUNTRY
    '0241-039123',                                -- PHONE
    '0241-059428'                                 -- FAX
);

INSERT INTO CUSTOMERS -- DUMON
VALUES (
    'DUMON',                                      -- CUSTOMER_ID
    'Du monde entier',                            -- COMPANY_NAME
    'Janine Labrune',                             -- CONTACT_NAME
    'Owner',                                      -- CONTACT_TITLE
    '67, rue des Cinquante Otages',               -- ADDRESS
    'Nantes',                                     -- CITY
    NULL,                                         -- REGION
    '44000',                                      -- POSTAL_CODE
    'France',                                     -- COUNTRY
    '40.67.88.88',                                -- PHONE
    '40.67.89.89'                                 -- FAX
);

INSERT INTO CUSTOMERS -- EASTC
VALUES (
    'EASTC',                                      -- CUSTOMER_ID
    'Eastern Connection',                         -- COMPANY_NAME
    'Ann Devon',                                  -- CONTACT_NAME
    'Sales Agent',                                -- CONTACT_TITLE
    '35 King George',                             -- ADDRESS
    'London',                                     -- CITY
    NULL,                                         -- REGION
    'WX3 6FW',                                    -- POSTAL_CODE
    'UK',                                         -- COUNTRY
    '(171) 555-0297',                             -- PHONE
    '(171) 555-3373'                              -- FAX
);

INSERT INTO CUSTOMERS -- ERNSH
VALUES (
    'ERNSH',                                      -- CUSTOMER_ID
    'Ernst Handel',                               -- COMPANY_NAME
    'Roland Mendel',                              -- CONTACT_NAME
    'Sales Manager',                              -- CONTACT_TITLE
    'Kirchgasse 6',                               -- ADDRESS
    'Graz',                                       -- CITY
    NULL,                                         -- REGION
    '8010',                                       -- POSTAL_CODE
    'Austria',                                    -- COUNTRY
    '7675-3425',                                  -- PHONE
    '7675-3426'                                   -- FAX
);

INSERT INTO CUSTOMERS -- FAMIA
VALUES (
    'FAMIA',                                      -- CUSTOMER_ID
    'Familia Arquibaldo',                         -- COMPANY_NAME
    'Aria Cruz',                                  -- CONTACT_NAME
    'Marketing Assistant',                        -- CONTACT_TITLE
    'Rua Orós, 92',                               -- ADDRESS
    'Sao Paulo',                                  -- CITY
    'SP',                                         -- REGION
    '05442-030',                                  -- POSTAL_CODE
    'Brazil',                                     -- COUNTRY
    '(11) 555-9857',                              -- PHONE
    NULL                                          -- FAX
);

INSERT INTO CUSTOMERS -- FISSA
VALUES (
    'FISSA',                                      -- CUSTOMER_ID
    'FISSA Fabrica Inter. Salchichas S.A.',       -- COMPANY_NAME
    'Diego Roel',                                 -- CONTACT_NAME
    'Accounting Manager',                         -- CONTACT_TITLE
    'C/ Moralzarzal, 86',                         -- ADDRESS
    'Madrid',                                     -- CITY
    NULL,                                         -- REGION
    '28034',                                      -- POSTAL_CODE
    'Spain',                                      -- COUNTRY
    '(91) 555 94 44',                             -- PHONE
    '(91) 555 55 93'                              -- FAX
);

INSERT INTO CUSTOMERS -- FOLIG
VALUES (
    'FOLIG',                                      -- CUSTOMER_ID
    'Folies gourmandes',                          -- COMPANY_NAME
    'Martine Rancé',                              -- CONTACT_NAME
    'Assistant Sales Agent',                      -- CONTACT_TITLE
    '184, chaussée de Tournai',                   -- ADDRESS
    'Lille',                                      -- CITY
    NULL,                                         -- REGION
    '59000',                                      -- POSTAL_CODE
    'France',                                     -- COUNTRY
    '20.16.10.16',                                -- PHONE
    '20.16.10.17'                                 -- FAX
);

INSERT INTO CUSTOMERS -- FOLKO
VALUES (
    'FOLKO',                                      -- CUSTOMER_ID
    'Folk och fä HB',                             -- COMPANY_NAME
    'Maria Larsson',                              -- CONTACT_NAME
    'Owner',                                      -- CONTACT_TITLE
    'Åkergatan 24',                               -- ADDRESS
    'Bräcke',                                     -- CITY
    NULL,                                         -- REGION
    'S-844 67',                                   -- POSTAL_CODE
    'Sweden',                                     -- COUNTRY
    '0695-34 67 21',                              -- PHONE
    NULL                                          -- FAX
);

INSERT INTO CUSTOMERS -- FRANK
VALUES (
    'FRANK',                                      -- CUSTOMER_ID
    'Frankenversand',                             -- COMPANY_NAME
    'Peter Franken',                              -- CONTACT_NAME
    'Marketing Manager',                          -- CONTACT_TITLE
    'Berliner Platz 43',                          -- ADDRESS
    'München',                                    -- CITY
    NULL,                                         -- REGION
    '80805',                                      -- POSTAL_CODE
    'Germany',                                    -- COUNTRY
    '089-0877310',                                -- PHONE
    '089-0877451'                                 -- FAX
);

INSERT INTO CUSTOMERS -- FRANR
VALUES (
    'FRANR',                                      -- CUSTOMER_ID
    'France restauration',                        -- COMPANY_NAME
    'Carine Schmitt',                             -- CONTACT_NAME
    'Marketing Manager',                          -- CONTACT_TITLE
    '54, rue Royale',                             -- ADDRESS
    'Nantes',                                     -- CITY
    NULL,                                         -- REGION
    '44000',                                      -- POSTAL_CODE
    'France',                                     -- COUNTRY
    '40.32.21.21',                                -- PHONE
    '40.32.21.20'                                 -- FAX
);

INSERT INTO CUSTOMERS -- FRANS
VALUES (
    'FRANS',                                      -- CUSTOMER_ID
    'Franchi S.p.A.',                             -- COMPANY_NAME
    'Paolo Accorti',                              -- CONTACT_NAME
    'Sales Representative',                       -- CONTACT_TITLE
    'Via Monte Bianco 34',                        -- ADDRESS
    'Torino',                                     -- CITY
    NULL,                                         -- REGION
    '10100',                                      -- POSTAL_CODE
    'Italy',                                      -- COUNTRY
    '011-4988260',                                -- PHONE
    '011-4988261'                                 -- FAX
);

INSERT INTO CUSTOMERS -- FURIB
VALUES (
    'FURIB',                                      -- CUSTOMER_ID                               
    'Furia Bacalhau e Frutos do Mar',             -- COMPANY_NAME
    'Lino Rodriguez',                             -- CONTACT_NAME
    'Sales Manager',                              -- CONTACT_TITLE
    'Jardim das rosas n. 32',                     -- ADDRESS
    'Lisboa',                                     -- CITY
    NULL,                                         -- REGION
    '1675',                                       -- POSTAL_CODE
    'Portugal',                                   -- COUNTRY
    '(1) 354-2534',                               -- PHONE
    '(1) 354-2535'                                -- FAX
);

INSERT INTO CUSTOMERS -- GALED
VALUES (
    'GALED',                                      -- CUSTOMER_ID
    'Galería del gastrónomo',                     -- COMPANY_NAME
    'Eduardo Saavedra',                           -- CONTACT_NAME
    'Marketing Manager',                          -- CONTACT_TITLE
    'Rambla de Cataluña, 23',                     -- ADDRESS
    'Barcelona',                                  -- CITY
    NULL,                                         -- REGION
    '08022',                                      -- POSTAL_CODE
    'Spain',                                      -- COUNTRY
    '(93) 203 4560',                              -- PHONE
    '(93) 203 4561'                               -- FAX
);

INSERT INTO CUSTOMERS -- GODOS
VALUES (
    'GODOS',                                      -- CUSTOMER_ID
    'Godos Cocina Típica',                        -- COMPANY_NAME
    'José Pedro Freyre',                          -- CONTACT_NAME
    'Sales Manager',                              -- CONTACT_TITLE
    'C/ Romero, 33',                              -- ADDRESS
    'Sevilla',                                    -- CITY
    NULL,                                         -- REGION
    '41101',                                      -- POSTAL_CODE
    'Spain',                                      -- COUNTRY
    '(95) 555 82 82',                             -- PHONE
    NULL                                          -- FAX
);

INSERT INTO CUSTOMERS -- GOURL
VALUES (
    'GOURL',                                      -- CUSTOMER_ID
    'Gourmet Lanchonetes',                        -- COMPANY_NAME
    'André Fonseca',                              -- CONTACT_NAME
    'Sales Associate',                            -- CONTACT_TITLE
    'Av. Brasil, 442',                            -- ADDRESS
    'Campinas',                                   -- CITY
    'SP',                                         -- REGION
    '04876-786',                                  -- POSTAL_CODE
    'Brazil',                                     -- COUNTRY
    '(11) 555-9482',                              -- PHONE
    NULL                                          -- FAX
);

INSERT INTO CUSTOMERS -- GREAL
VALUES (
    'GREAL',                                      -- CUSTOMER_ID
    'Great Lakes Food Market',                    -- COMPANY_NAME
    'Howard Snyder',                              -- CONTACT_NAME
    'Marketing Manager',                          -- CONTACT_TITLE
    '2732 Baker Blvd.',                           -- ADDRESS
    'Eugene',                                     -- CITY
    'OR',                                         -- REGION
    '97403',                                      -- POSTAL_CODE
    'USA',                                        -- COUNTRY
    '(503) 555-7555',                             -- PHONE
    NULL                                          -- FAX
);

INSERT INTO CUSTOMERS -- GROSR
VALUES (
    'GROSR',                                      -- CUSTOMER_ID
    'GROSELLA-Restaurante',                       -- COMPANY_NAME
    'Manuel Pereira',                             -- CONTACT_NAME
    'Owner',                                      -- CONTACT_TITLE
    '5ª Ave. Los Palos Grandes',                  -- ADDRESS
    'Caracas',                                    -- CITY
    'DF',                                         -- REGION
    '1081',                                       -- POSTAL_CODE
    'Venezuela',                                  -- COUNTRY
    '(2) 283-2951',                               -- PHONE
    '(2) 283-3397'                                -- FAX
);

INSERT INTO CUSTOMERS -- HANAR 
VALUES (
    'HANAR',                                      -- CUSTOMER_ID
    'Hanari Carnes',                              -- COMPANY_NAME
    'Mario Pontes',                               -- CONTACT_NAME
    'Accounting Manager',                         -- CONTACT_TITLE
    'Rua do Paço, 67',                            -- ADDRESS
    'Rio de Janeiro',                             -- CITY
    'RJ',                                         -- REGION
    '05454-876',                                  -- POSTAL_CODE
    'Brazil',                                     -- COUNTRY
    '(21) 555-0091',                              -- PHONE
    '(21) 555-8765'                               -- FAX
);

INSERT INTO CUSTOMERS -- HILAA
VALUES (
    'HILAA',                                      -- CUSTOMER_ID
    'HILARION-Abastos',                           -- COMPANY_NAME
    'Carlos Hernández',                           -- CONTACT_NAME
    'Sales Representative',                       -- CONTACT_TITLE
    'Carrera 22 con Ave. Carlos Soublette #8-35', -- ADDRESS
    'San Cristóbal',                              -- CITY
    'Táchira',                                    -- REGION
    '5022',                                       -- POSTAL_CODE
    'Venezuela',                                  -- COUNTRY
    '(5) 555-1340',                               -- PHONE
    '(5) 555-1948'                                -- FAX
);

INSERT INTO CUSTOMERS -- HUNGC
VALUES (
    'HUNGC',                                      -- CUSTOMER_ID
    'Hungry Coyote Import Store',                 -- COMPANY_NAME
    'Yoshi Latimer',                              -- CONTACT_NAME
    'Sales Representative',                       -- CONTACT_TITLE
    'City Center Plaza 516 Main St.',             -- ADDRESS
    'Elgin',                                      -- CITY
    'OR',                                         -- REGION
    '97827',                                      -- POSTAL_CODE
    'USA',                                        -- COUNTRY
    '(503) 555-6874',                             -- PHONE
    '(503) 555-2376'                              -- FAX
);

INSERT INTO CUSTOMERS -- HUNGO
VALUES (
    'HUNGO',                                      -- CUSTOMER_ID
    'Hungry Owl All-Night Grocers',               -- COMPANY_NAME
    'Patricia McKenna',                           -- CONTACT_NAME
    'Sales Associate',                            -- CONTACT_TITLE
    '8 Johnstown Road',                           -- ADDRESS
    'Cork',                                       -- CITY
    'Co. Cork',                                   -- REGION
    NULL,                                         -- POSTAL_CODE
    'Ireland',                                    -- COUNTRY
    '2967 542',                                   -- PHONE
    '2967 3333'                                   -- FAX
);

INSERT INTO CUSTOMERS -- ISLAT
VALUES (
    'ISLAT',                                      -- CUSTOMER_ID
    'Island Trading',                             -- COMPANY_NAME
    'Helen Bennett',                              -- CONTACT_NAME
    'Marketing Manager',                          -- CONTACT_TITLE
    'Garden House Crowther Way',                  -- ADDRESS
    'Cowes',                                      -- CITY
    'Isle of Wight',                              -- REGION
    'PO31 7PJ',                                   -- POSTAL_CODE
    'UK',                                         -- COUNTRY
    '(198) 555-8888',                             -- PHONE
    NULL                                          -- FAX
);

INSERT INTO CUSTOMERS -- KOENE
VALUES (
    'KOENE',                                      -- CUSTOMER_ID
    'Königlich Essen',                            -- COMPANY_NAME
    'Philip Cramer',                              -- CONTACT_NAME
    'Sales Associate',                            -- CONTACT_TITLE
    'Maubelstr. 90',                              -- ADDRESS
    'Brandenburg',                                -- CITY
    NULL,                                         -- REGION
    '14776',                                      -- POSTAL_CODE
    'Germany',                                    -- COUNTRY
    '0555-09876',                                 -- PHONE
    NULL                                          -- FAX
);

INSERT INTO CUSTOMERS -- LACOR
VALUES (
    'LACOR',                                      -- CUSTOMER_ID
    'La corne d''abondance',                      -- COMPANY_NAME
    'Daniel Tonini',                              -- CONTACT_NAME
    'Sales Representative',                       -- CONTACT_TITLE
    '67, avenue de l''Europe',                    -- ADDRESS
    'Versailles',                                 -- CITY
    NULL,                                         -- REGION
    '78000',                                      -- POSTAL_CODE
    'France',                                     -- COUNTRY
    '30.59.84.10',                                -- PHONE
    '30.59.85.11'                                 -- FAX
);

INSERT INTO CUSTOMERS -- LAMAI
VALUES (
    'LAMAI',                                      -- CUSTOMER_ID
    'La maison d''Asie',                          -- COMPANY_NAME
    'Annette Roulet',                             -- CONTACT_NAME
    'Sales Manager',                              -- CONTACT_TITLE
    '1 rue Alsace-Lorraine',                      -- ADDRESS
    'Toulouse',                                   -- CITY
    NULL,                                         -- REGION
    '31000',                                      -- POSTAL_CODE
    'France',                                     -- COUNTRY
    '61.77.61.10',                                -- PHONE
    '61.77.61.11'                                 -- FAX
);

INSERT INTO CUSTOMERS -- LAUGB
VALUES (
    'LAUGB',                                      -- CUSTOMER_ID
    'Laughing Bacchus Wine Cellars',              -- COMPANY_NAME
    'Yoshi Tannamuri',                            -- CONTACT_NAME
    'Marketing Assistant',                        -- CONTACT_TITLE
    '1900 Oak St.',                               -- ADDRESS
    'Vancouver',                                  -- CITY
    'BC',                                         -- REGION
    'V3F 2K1',                                    -- POSTAL_CODE
    'Canada',                                     -- COUNTRY
    '(604) 555-3392',                             -- PHONE
    '(604) 555-7293'                              -- FAX
);

INSERT INTO CUSTOMERS -- LAZYK
VALUES (
    'LAZYK',                                      -- CUSTOMER_ID
    'Lazy K Kountry Store',                       -- COMPANY_NAME
    'John Steel',                                 -- CONTACT_NAME
    'Marketing Manager',                          -- CONTACT_TITLE
    '12 Orchestra Terrace',                       -- ADDRESS
    'Walla Walla',                                -- CITY
    'WA',                                         -- REGION
    '99362',                                      -- POSTAL_CODE
    'USA',                                        -- COUNTRY
    '(509) 555-7969',                             -- PHONE
    '(509) 555-6221'                              -- FAX
);

INSERT INTO CUSTOMERS -- LEHMS
VALUES (
    'LEHMS',                                      -- CUSTOMER_ID
    'Lehmanns Marktstand',                        -- COMPANY_NAME
    'Renate Messner',                             -- CONTACT_NAME
    'Sales Representative',                       -- CONTACT_TITLE
    'Magazinweg 7',                               -- ADDRESS
    'Frankfurt a.M.',                             -- CITY
    NULL,                                         -- REGION
    '60528',                                      -- POSTAL_CODE
    'Germany',                                    -- COUNTRY
    '069-0245984',                                -- PHONE
    '069-0245874'                                 -- FAX
);

INSERT INTO CUSTOMERS -- LETSS
VALUES (
    'LETSS',                                      -- CUSTOMER_ID
    'Let''s Stop N Shop',                         -- COMPANY_NAME
    'Jaime Yorres',                               -- CONTACT_NAME
    'Owner',                                      -- CONTACT_TITLE
    '87 Polk St. Suite 5',                        -- ADDRESS
    'San Francisco',                              -- CITY
    'CA',                                         -- REGION
    '94117',                                      -- POSTAL_CODE
    'USA',                                        -- COUNTRY
    '(415) 555-5938',                             -- PHONE
    NULL                                          -- FAX
);

INSERT INTO CUSTOMERS -- LILAS
VALUES (
    'LILAS',                                                -- CUSTOMER_ID
    'LILA-Supermercado',                                    -- COMPANY_NAME
    'Carlos González',                                      -- CONTACT_NAME
    'Accounting Manager',                                   -- CONTACT_TITLE
    'Carrera 52 con Ave. Bolívar #65-98 Llano Largo',       -- ADDRESS
    'Barquisimeto',                                         -- CITY
    'Lara',                                                 -- REGION
    '3508',                                                 -- POSTAL_CODE
    'Venezuela',                                            -- COUNTRY
    '(9) 331-6954',                                         -- PHONE
    '(9) 331-7256'                                          -- FAX
);

INSERT INTO CUSTOMERS -- LINOD
VALUES (
    'LINOD',                                      -- CUSTOMER_ID
    'LINO-Delicateses',                           -- COMPANY_NAME
    'Felipe Izquierdo',                           -- CONTACT_NAME
    'Owner',                                      -- CONTACT_TITLE
    'Ave. 5 de Mayo Porlamar',                    -- ADDRESS
    'I. de Margarita',                            -- CITY
    'Nueva Esparta',                              -- REGION
    '4980',                                       -- POSTAL_CODE
    'Venezuela',                                  -- COUNTRY
    '(8) 34-56-12',                               -- PHONE
    '(8) 34-93-93'                                -- FAX
);

INSERT INTO CUSTOMERS -- LONEP
VALUES (
    'LONEP',                                      -- CUSTOMER_ID
    'Lonesome Pine Restaurant',                   -- COMPANY_NAME
    'Fran Wilson',                                -- CONTACT_NAME
    'Sales Manager',                              -- CONTACT_TITLE
    '89 Chiaroscuro Rd.',                         -- ADDRESS
    'Portland',                                   -- CITY
    'OR',                                         -- REGION
    '97219',                                      -- POSTAL_CODE
    'USA',                                        -- COUNTRY
    '(503) 555-9573',                             -- PHONE
    '(503) 555-9646'                              -- FAX
);

INSERT INTO CUSTOMERS -- MAGAA
VALUES (
    'MAGAA',                                      -- CUSTOMER_ID
    'Magazzini Alimentari Riuniti',               -- COMPANY_NAME
    'Giovanni Rovelli',                           -- CONTACT_NAME
    'Marketing Manager',                          -- CONTACT_TITLE
    'Via Ludovico il Moro 22',                    -- ADDRESS
    'Bergamo',                                    -- CITY
    NULL,                                         -- REGION
    '24100',                                      -- POSTAL_CODE
    'Italy',                                      -- COUNTRY
    '035-640230',                                 -- PHONE
    '035-640231'                                  -- FAX
);

INSERT INTO CUSTOMERS -- MAISD
VALUES (
    'MAISD',                                      -- CUSTOMER_ID
    'Maison Dewey',                               -- COMPANY_NAME
    'Catherine Dewey',                            -- CONTACT_NAME
    'Sales Agent',                                -- CONTACT_TITLE
    'Rue Joseph-Bens 532',                        -- ADDRESS
    'Bruxelles',                                  -- CITY
    NULL,                                         -- REGION
    'B-1180',                                     -- POSTAL_CODE
    'Belgium',                                    -- COUNTRY
    '(02) 201 24 67',                             -- PHONE
    '(02) 201 24 68'                              -- FAX
);

INSERT INTO CUSTOMERS -- MEREP
VALUES (
    'MEREP',                                      -- CUSTOMER_ID
    'Mère Paillarde',                             -- COMPANY_NAME
    'Jean Fresnière',                             -- CONTACT_NAME
    'Marketing Assistant',                        -- CONTACT_TITLE
    '43 rue St. Laurent',                         -- ADDRESS
    'Montréal',                                   -- CITY
    'Québec',                                     -- REGION
    'H1J 1C3',                                    -- POSTAL_CODE
    'Canada',                                     -- COUNTRY
    '(514) 555-8054',                             -- PHONE
    '(514) 555-8055'                              -- FAX
);

INSERT INTO CUSTOMERS -- MORGK
VALUES (
    'MORGK',                                      -- CUSTOMER_ID
    'Morgenstern Gesundkost',                     -- COMPANY_NAME
    'Alexander Feuer',                            -- CONTACT_NAME
    'Marketing Assistant',                        -- CONTACT_TITLE
    'Heerstr. 22',                                -- ADDRESS
    'Leipzig',                                    -- CITY
    NULL,                                         -- REGION
    '04179',                                      -- POSTAL_CODE
    'Germany',                                    -- COUNTRY
    '0342-023176',                                -- PHONE
    NULL                                          -- FAX
);

INSERT INTO CUSTOMERS -- NORTS
VALUES (
    'NORTS',                                      -- CUSTOMER_ID
    'North/South',                                -- COMPANY_NAME
    'Simon Crowther',                             -- CONTACT_NAME
    'Sales Associate',                            -- CONTACT_TITLE
    'South House 300 Queensbridge',               -- ADDRESS
    'London',                                     -- CITY
    NULL,                                         -- REGION
    'SW7 1RZ',                                    -- POSTAL_CODE
    'UK',                                         -- COUNTRY
    '(171) 555-7733',                             -- PHONE
    '(171) 555-2530'                              -- FAX
);

INSERT INTO CUSTOMERS -- OCEAN
VALUES (
    'OCEAN',                                      -- CUSTOMER_ID
    'Océano Atlántico Ltda.',                     -- COMPANY_NAME
    'Yvonne Moncada',                             -- CONTACT_NAME
    'Sales Agent',                                -- CONTACT_TITLE
    'Ing. Gustavo Moncada 8585 Piso 20-A',        -- ADDRESS
    'Buenos Aires',                               -- CITY
    NULL,                                         -- REGION
    '1010',                                       -- POSTAL_CODE
    'Argentina',                                  -- COUNTRY
    '(1) 135-5333',                               -- PHONE
    '(1) 135-5535'                                -- FAX
);

INSERT INTO CUSTOMERS -- OLDWO
VALUES (
    'OLDWO',                                      -- CUSTOMER_ID
    'Old World Delicatessen',                     -- COMPANY_NAME
    'Rene Phillips',                              -- CONTACT_NAME
    'Sales Representative',                       -- CONTACT_TITLE
    '2743 Bering St.',                            -- ADDRESS
    'Anchorage',                                  -- CITY
    'AK',                                         -- REGION
    '99508',                                      -- POSTAL_CODE
    'USA',                                        -- COUNTRY
    '(907) 555-7584',                             -- PHONE
    '(907) 555-2880'                              -- FAX
);

INSERT INTO CUSTOMERS -- OTTIK
VALUES (
    'OTTIK',                                      -- CUSTOMER_ID
    'Ottilies Käseladen',                         -- COMPANY_NAME
    'Henriette Pfalzheim',                        -- CONTACT_NAME
    'Owner',                                      -- CONTACT_TITLE
    'Mehrheimerstr. 369',                         -- ADDRESS
    'Köln',                                       -- CITY
    NULL,                                         -- REGION
    '50739',                                      -- POSTAL_CODE
    'Germany',                                    -- COUNTRY
    '0221-0644327',                               -- PHONE
    '0221-0765721'                                -- FAX
);

INSERT INTO CUSTOMERS -- PARIS
VALUES (
    'PARIS',                                      -- CUSTOMER_ID
    'Paris spécialités',                          -- COMPANY_NAME
    'Marie Bertrand',                             -- CONTACT_NAME
    'Owner',                                      -- CONTACT_TITLE
    '265, boulevard Charonne',                    -- ADDRESS
    'Paris',                                      -- CITY
    NULL,                                         -- REGION
    '75012',                                      -- POSTAL_CODE
    'France',                                     -- COUNTRY
    '(1) 42.34.22.66',                            -- PHONE
    '(1) 42.34.22.77'                             -- FAX
);

INSERT INTO CUSTOMERS -- PERIC
VALUES (
    'PERIC',                                      -- CUSTOMER_ID
    'Pericles Comidas clásicas',                  -- COMPANY_NAME
    'Guillermo Fernández',                        -- CONTACT_NAME
    'Sales Representative',                       -- CONTACT_TITLE
    'Calle Dr. Jorge Cash 321',                   -- ADDRESS
    'México D.F.',                                -- CITY
    NULL,                                         -- REGION
    '05033',                                      -- POSTAL_CODE
    'Mexico',                                     -- COUNTRY
    '(5) 552-3745',                               -- PHONE
    '(5) 545-3745'                                -- FAX
);

INSERT INTO CUSTOMERS -- PICCO
VALUES (
    'PICCO',                                      -- CUSTOMER_ID
    'Piccolo und mehr',                           -- COMPANY_NAME
    'Georg Pipps',                                -- CONTACT_NAME
    'Sales Manager',                              -- CONTACT_TITLE
    'Geislweg 14',                                -- ADDRESS
    'Salzburg',                                   -- CITY
    NULL,                                         -- REGION
    '5020',                                       -- POSTAL_CODE
    'Austria',                                    -- COUNTRY
    '6562-9722',                                  -- PHONE
    '6562-9723'                                   -- FAX
);

INSERT INTO CUSTOMERS -- PRINI
VALUES (
    'PRINI',                                      -- CUSTOMER_ID
    'Princesa Isabel Vinhos',                     -- COMPANY_NAME
    'Isabel de Castro',                           -- CONTACT_NAME
    'Sales Representative',                       -- CONTACT_TITLE
    'Estrada da saúde n. 58',                     -- ADDRESS
    'Lisboa',                                     -- CITY
    NULL,                                         -- REGION
    '1756',                                       -- POSTAL_CODE
    'Portugal',                                   -- COUNTRY
    '(1) 356-5634',                               -- PHONE
    NULL                                          -- FAX
);

INSERT INTO CUSTOMERS -- QUEDE
VALUES (
    'QUEDE',                                      -- CUSTOMER_ID
    'Que Delícia',                                -- COMPANY_NAME
    'Bernardo Batista',                           -- CONTACT_NAME
    'Accounting Manager',                         -- CONTACT_TITLE
    'Rua da Panificadora, 12',                    -- ADDRESS
    'Rio de Janeiro',                             -- CITY
    'RJ',                                         -- REGION
    '02389-673',                                  -- POSTAL_CODE
    'Brazil',                                     -- COUNTRY
    '(21) 555-4252',                              -- PHONE
    '(21) 555-4545'                               -- FAX
);

INSERT INTO CUSTOMERS -- QUEEN
VALUES (
    'QUEEN',                                      -- CUSTOMER_ID
    'Queen Cozinha',                              -- COMPANY_NAME
    'Lúcia Carvalho',                             -- CONTACT_NAME
    'Marketing Assistant',                        -- CONTACT_TITLE
    'Alameda dos Canàrios, 891',                  -- ADDRESS
    'Sao Paulo',                                  -- CITY
    'SP',                                         -- REGION
    '05487-020',                                  -- POSTAL_CODE
    'Brazil',                                     -- COUNTRY
    '(11) 555-1189',                              -- PHONE
    NULL                                          -- FAX
);

INSERT INTO CUSTOMERS -- QUICK
VALUES (
    'QUICK',                                      -- CUSTOMER_ID
    'QUICK-Stop',                                 -- COMPANY_NAME
    'Horst Kloss',                                -- CONTACT_NAME
    'Accounting Manager',                         -- CONTACT_TITLE
    'Taucherstraße 10',                           -- ADDRESS
    'Cunewalde',                                  -- CITY
    NULL,                                         -- REGION
    '01307',                                      -- POSTAL_CODE
    'Germany',                                    -- COUNTRY
    '0372-035188',                                -- PHONE
    NULL                                          -- FAX
);

INSERT INTO CUSTOMERS -- RANCH
VALUES (
    'RANCH',                                      -- CUSTOMER_ID
    'Rancho grande',                              -- COMPANY_NAME
    'Sergio Gutiérrez',                           -- CONTACT_NAME
    'Sales Representative',                       -- CONTACT_TITLE
    'Av. del Libertador 900',                     -- ADDRESS
    'Buenos Aires',                               -- CITY
    NULL,                                         -- REGION
    '1010',                                       -- POSTAL_CODE
    'Argentina',                                  -- COUNTRY
    '(1) 123-5555',                               -- PHONE
    '(1) 123-5556'                                -- FAX
);

INSERT INTO CUSTOMERS -- RATTC
VALUES (
    'RATTC',                                      -- CUSTOMER_ID
    'Rattlesnake Canyon Grocery',                 -- COMPANY_NAME
    'Paula Wilson',                               -- CONTACT_NAME
    'Assistant Sales Representative',             -- CONTACT_TITLE
    '2817 Milton Dr.',                            -- ADDRESS
    'Albuquerque',                                -- CITY
    'NM',                                         -- REGION
    '87110',                                      -- POSTAL_CODE
    'USA',                                        -- COUNTRY
    '(505) 555-5939',                             -- PHONE
    '(505) 555-3620'                              -- FAX
);

INSERT INTO CUSTOMERS -- REGGC
VALUES (
    'REGGC',                                      -- CUSTOMER_ID
    'Reggiani Caseifici',                         -- COMPANY_NAME
    'Maurizio Moroni',                            -- CONTACT_NAME
    'Sales Associate',                            -- CONTACT_TITLE
    'Strada Provinciale 124',                     -- ADDRESS
    'Reggio Emilia',                              -- CITY
    NULL,                                         -- REGION
    '42100',                                      -- POSTAL_CODE
    'Italy',                                      -- COUNTRY
    '0522-556721',                                -- PHONE
    '0522-556722'                                 -- FAX
);

INSERT INTO CUSTOMERS -- RICAR
VALUES (
    'RICAR',                                      -- CUSTOMER_ID
    'Ricardo Adocicados',                         -- COMPANY_NAME
    'Janete Limeira',                             -- CONTACT_NAME
    'Assistant Sales Agent',                      -- CONTACT_TITLE
    'Av. Copacabana, 267',                        -- ADDRESS
    'Rio de Janeiro',                             -- CITY
    'RJ',                                         -- REGION
    '02389-890',                                  -- POSTAL_CODE
    'Brazil',                                     -- COUNTRY
    '(21) 555-3412',                              -- PHONE
    NULL                                          -- FAX
);

INSERT INTO CUSTOMERS -- RICSU
VALUES (
    'RICSU',                                      -- CUSTOMER_ID
    'Richter Supermarkt',                         -- COMPANY_NAME
    'Michael Holz',                               -- CONTACT_NAME
    'Sales Manager',                              -- CONTACT_TITLE
    'Grenzacherweg 237',                          -- ADDRESS
    'Genève',                                     -- CITY
    NULL,                                         -- REGION
    '1203',                                       -- POSTAL_CODE
    'Switzerland',                                -- COUNTRY
    '0897-034214',                                -- PHONE
    NULL                                          -- FAX
);

INSERT INTO CUSTOMERS -- ROMEY
VALUES (
    'ROMEY',                                      -- CUSTOMER_ID
    'Romero y tomillo',                           -- COMPANY_NAME
    'Alejandra Camino',                           -- CONTACT_NAME
    'Accounting Manager',                         -- CONTACT_TITLE
    'Gran Vía, 1',                                -- ADDRESS
    'Madrid',                                     -- CITY
    NULL,                                         -- REGION
    '28001',                                      -- POSTAL_CODE
    'Spain',                                      -- COUNTRY
    '(91) 745 6200',                              -- PHONE
    '(91) 745 6210'                               -- FAX
);

INSERT INTO CUSTOMERS -- SANTG
VALUES (
    'SANTG',                                      -- CUSTOMER_ID
    'Santé Gourmet',                              -- COMPANY_NAME
    'Jonas Bergulfsen',                           -- CONTACT_NAME
    'Owner',                                      -- CONTACT_TITLE
    'Erling Skakkes gate 78',                     -- ADDRESS
    'Stavern',                                    -- CITY
    NULL,                                         -- REGION
    '4110',                                       -- POSTAL_CODE
    'Norway',                                     -- COUNTRY
    '07-98 92 35',                                -- PHONE
    '07-98 92 47'                                 -- FAX
);

INSERT INTO CUSTOMERS -- SAVEA
VALUES (
    'SAVEA',                                      -- CUSTOMER_ID
    'Save-a-lot Markets',                         -- COMPANY_NAME
    'Jose Pavarotti',                             -- CONTACT_NAME
    'Sales Representative',                       -- CONTACT_TITLE
    '187 Suffolk Ln.',                            -- ADDRESS
    'Boise',                                      -- CITY
    'ID',                                         -- REGION
    '83720',                                      -- POSTAL_CODE
    'USA',                                        -- COUNTRY
    '(208) 555-8097',                             -- PHONE
    NULL                                          -- FAX
);

INSERT INTO CUSTOMERS -- SEVES
VALUES (
    'SEVES',                                      -- CUSTOMER_ID
    'Seven Seas Imports',                         -- COMPANY_NAME
    'Hari Kumar',                                 -- CONTACT_NAME
    'Sales Manager',                              -- CONTACT_TITLE
    '90 Wadhurst Rd.',                            -- ADDRESS
    'London',                                     -- CITY
    NULL,                                         -- REGION
    'OX15 4NB',                                   -- POSTAL_CODE
    'UK',                                         -- COUNTRY
    '(171) 555-1717',                             -- PHONE
    '(171) 555-5646'                              -- FAX
);

INSERT INTO CUSTOMERS -- SIMOB
VALUES (
    'SIMOB',                                      -- CUSTOMER_ID
    'Simons bistro',                              -- COMPANY_NAME
    'Jytte Petersen',                             -- CONTACT_NAME
    'Owner',                                      -- CONTACT_TITLE
    'Vinbæltet 34',                               -- ADDRESS
    'Kobenhavn',                                  -- CITY
    NULL,                                         -- REGION
    '1734',                                       -- POSTAL_CODE
    'Denmark',                                    -- COUNTRY
    '31 12 34 56',                                -- PHONE
    '31 13 35 57'                                 -- FAX
);

INSERT INTO CUSTOMERS -- SPECD
VALUES (
    'SPECD',                                      -- CUSTOMER_ID
    'Spécialités du monde',                       -- COMPANY_NAME
    'Dominique Perrier',                          -- CONTACT_NAME
    'Marketing Manager',                          -- CONTACT_TITLE
    '25, rue Lauriston',                          -- ADDRESS
    'Paris',                                      -- CITY
    NULL,                                         -- REGION
    '75016',                                      -- POSTAL_CODE
    'France',                                     -- COUNTRY
    '(1) 47.55.60.10',                            -- PHONE
    '(1) 47.55.60.20'                             -- FAX
);

INSERT INTO CUSTOMERS -- SPLIR
VALUES (
    'SPLIR',                                      -- CUSTOMER_ID
    'Split Rail Beer & Ale',                      -- COMPANY_NAME
    'Art Braunschweiger',                         -- CONTACT_NAME
    'Sales Manager',                              -- CONTACT_TITLE
    'P.O. Box 555',                               -- ADDRESS
    'Lander',                                     -- CITY
    'WY',                                         -- REGION
    '82520',                                      -- POSTAL_CODE
    'USA',                                        -- COUNTRY
    '(307) 555-4680',                             -- PHONE
    '(307) 555-6525'                              -- FAX
);

INSERT INTO CUSTOMERS -- SUPRD
VALUES (
    'SUPRD',                                      -- CUSTOMER_ID
    'Suprêmes délices',                           -- COMPANY_NAME
    'Pascale Cartrain',                           -- CONTACT_NAME
    'Accounting Manager',                         -- CONTACT_TITLE
    'Boulevard Tirou, 255',                       -- ADDRESS
    'Charleroi',                                  -- CITY
    NULL,                                         -- REGION
    'B-6000',                                     -- POSTAL_CODE
    'Belgium',                                    -- COUNTRY
    '(071) 23 67 22 20',                          -- PHONE
    '(071) 23 67 22 21'                           -- FAX
);

INSERT INTO CUSTOMERS -- THEBI
VALUES (
    'THEBI',                                      -- CUSTOMER_ID
    'The Big Cheese',                             -- COMPANY_NAME
    'Liz Nixon',                                  -- CONTACT_NAME
    'Marketing Manager',                          -- CONTACT_TITLE
    '89 Jefferson Way Suite 2',                   -- ADDRESS
    'Portland',                                   -- CITY
    'OR',                                         -- REGION
    '97201',                                      -- POSTAL_CODE
    'USA',                                        -- COUNTRY
    '(503) 555-3612',                             -- PHONE
    NULL                                          -- FAX
);

INSERT INTO CUSTOMERS -- THECR
VALUES (
    'THECR',                                      -- CUSTOMER_ID
    'The Cracker Box',                            -- COMPANY_NAME
    'Liu Wong',                                   -- CONTACT_NAME
    'Marketing Assistant',                        -- CONTACT_TITLE
    '55 Grizzly Peak Rd.',                        -- ADDRESS
    'Butte',                                      -- CITY
    'MT',                                         -- REGION
    '59801',                                      -- POSTAL_CODE
    'USA',                                        -- COUNTRY
    '(406) 555-5834',                             -- PHONE
    '(406) 555-8083'                              -- FAX
);

INSERT INTO CUSTOMERS -- TOMSP
VALUES (
    'TOMSP',                                      -- CUSTOMER_ID
    'Toms Spezialitäten',                         -- COMPANY_NAME
    'Karin Josephs',                              -- CONTACT_NAME
    'Marketing Manager',                          -- CONTACT_TITLE
    'Luisenstr. 48',                              -- ADDRESS
    'Münster',                                    -- CITY
    NULL,                                         -- REGION
    '44087',                                      -- POSTAL_CODE
    'Germany',                                    -- COUNTRY
    '0251-031259',                                -- PHONE
    '0251-035695'                                 -- FAX
);

INSERT INTO CUSTOMERS -- TORTU
VALUES (
    'TORTU',                                      -- CUSTOMER_ID
    'Tortuga Restaurante',                        -- COMPANY_NAME
    'Miguel Angel Paolino',                       -- CONTACT_NAME
    'Owner',                                      -- CONTACT_TITLE
    'Avda. Azteca 123',                           -- ADDRESS
    'México D.F.',                                -- CITY
    NULL,                                         -- REGION
    '05033',                                      -- POSTAL_CODE
    'Mexico',                                     -- COUNTRY
    '(5) 555-2933',                               -- PHONE
    NULL                                          -- FAX
);

INSERT INTO CUSTOMERS -- TRADH
VALUES (
    'TRADH',                                      -- CUSTOMER_ID
    'Tradição Hipermercados',                     -- COMPANY_NAME
    'Anabela Domingues',                          -- CONTACT_NAME
    'Sales Representative',                       -- CONTACT_TITLE
    'Av. Inês de Castro, 414',                    -- ADDRESS
    'Sao Paulo',                                  -- CITY
    'SP',                                         -- REGION
    '05634-030',                                  -- POSTAL_CODE
    'Brazil',                                     -- COUNTRY
    '(11) 555-2167',                              -- PHONE
    '(11) 555-2168'                               -- FAX
);

INSERT INTO CUSTOMERS -- TRAIH
VALUES (
    'TRAIH',                                      -- CUSTOMER_ID
    'Trail''s Head Gourmet Provisioners',         -- COMPANY_NAME
    'Helvetius Nagy',                             -- CONTACT_NAME
    'Sales Associate',                            -- CONTACT_TITLE
    '722 DaVinci Blvd.',                          -- ADDRESS
    'Kirkland',                                   -- CITY
    'WA',                                         -- REGION
    '98034',                                      -- POSTAL_CODE
    'USA',                                        -- COUNTRY
    '(206) 555-8257',                             -- PHONE
    '(206) 555-2174'                               -- FAX
);

INSERT INTO CUSTOMERS -- VAFFE
VALUES (
    'VAFFE',                                      -- CUSTOMER_ID
    'Vaffeljernet',                               -- COMPANY_NAME
    'Palle Ibsen',                                -- CONTACT_NAME
    'Sales Manager',                              -- CONTACT_TITLE
    'Smagsloget 45',                              -- ADDRESS
    'Århus',                                      -- CITY
    NULL,                                         -- REGION
    '8200',                                       -- POSTAL_CODE
    'Denmark',                                    -- COUNTRY
    '86 21 32 43',                                -- PHONE
    '86 22 33 44'                                 -- FAX
);

INSERT INTO CUSTOMERS -- VICTE
VALUES (
    'VICTE',                                      -- CUSTOMER_ID
    'Victuailles en stock',                       -- COMPANY_NAME
    'Mary Saveley',                               -- CONTACT_NAME
    'Sales Agent',                                -- CONTACT_TITLE
    '2, rue du Commerce',                         -- ADDRESS
    'Lyon',                                       -- CITY
    NULL,                                         -- REGION
    '69004',                                      -- POSTAL_CODE
    'France',                                     -- COUNTRY
    '78.32.54.86',                                -- PHONE
    '78.32.54.87'                                 -- FAX
);

INSERT INTO CUSTOMERS -- VINET
VALUES (
    'VINET',                                      -- CUSTOMER_ID
    'Vins et alcools Chevalier',                  -- COMPANY_NAME
    'Paul Henriot',                               -- CONTACT_NAME
    'Accounting Manager',                         -- CONTACT_TITLE
    '59 rue de l''Abbaye',                        -- ADDRESS
    'Reims',                                      -- CITY
    NULL,                                         -- REGION
    '51100',                                      -- POSTAL_CODE
    'France',                                     -- COUNTRY
    '26.47.15.10',                                -- PHONE
    '26.47.15.11'                                 -- FAX
);

INSERT INTO CUSTOMERS -- WANDK
VALUES (
    'WANDK',                                      -- CUSTOMER_ID
    'Die Wandernde Kuh',                          -- COMPANY_NAME
    'Rita Müller',                                -- CONTACT_NAME
    'Sales Representative',                       -- CONTACT_TITLE
    'Adenauerallee 900',                          -- ADDRESS
    'Stuttgart',                                  -- CITY
    NULL,                                         -- REGION
    '70563',                                      -- POSTAL_CODE
    'Germany',                                    -- COUNTRY
    '0711-020361',                                -- PHONE
    '0711-035428'                                 -- FAX
);

INSERT INTO CUSTOMERS -- WARTH
VALUES (
    'WARTH',                                      -- CUSTOMER_ID
    'Wartian Herkku',                             -- COMPANY_NAME
    'Pirkko Koskitalo',                           -- CONTACT_NAME
    'Accounting Manager',                         -- CONTACT_TITLE
    'Torikatu 38',                                -- ADDRESS
    'Oulu',                                       -- CITY
    NULL,                                         -- REGION
    '90110',                                      -- POSTAL_CODE
    'Finland',                                    -- COUNTRY
    '981-443655',                                 -- PHONE
    '981-443655'                                  -- FAX
);

INSERT INTO CUSTOMERS -- WELLI
VALUES (
    'WELLI',                                      -- CUSTOMER_ID
    'Wellington Importadora',                     -- COMPANY_NAME
    'Paula Parente',                              -- CONTACT_NAME
    'Sales Manager',                              -- CONTACT_TITLE
    'Rua do Mercado, 12',                         -- ADDRESS
    'Resende',                                    -- CITY
    'SP',                                         -- REGION
    '08737-363',                                  -- POSTAL_CODE
    'Brazil',                                     -- COUNTRY
    '(14) 555-8122',                              -- PHONE
    NULL                                          -- FAX
);

INSERT INTO CUSTOMERS -- WHITC
VALUES (
    'WHITC',                                      -- CUSTOMER_ID
    'White Clover Markets',                       -- COMPANY_NAME
    'Karl Jablonski',                             -- CONTACT_NAME
    'Owner',                                      -- CONTACT_TITLE
    '305 - 14th Ave. S. Suite 3B',                -- ADDRESS
    'Seattle',                                    -- CITY
    'WA',                                         -- REGION
    '98128',                                      -- POSTAL_CODE
    'USA',                                        -- COUNTRY
    '(206) 555-4112',                             -- PHONE
    '(206) 555-4115'                              -- FAX
);

INSERT INTO CUSTOMERS -- WILMK
VALUES (
    'WILMK',                                      -- CUSTOMER_ID
    'Wilman Kala',                                -- COMPANY_NAME
    'Matti Karttunen',                            -- CONTACT_NAME
    'Owner/Marketing Assistant',                  -- CONTACT_TITLE
    'Keskuskatu 45',                              -- ADDRESS
    'Helsinki',                                   -- CITY
    NULL,                                         -- REGION
    '21240',                                      -- POSTAL_CODE
    'Finland',                                    -- COUNTRY
    '90-224 8858',                                -- PHONE
    '90-224 8858'                                 -- FAX
);

INSERT INTO CUSTOMERS -- WOLZA
VALUES (
    'WOLZA',                                      -- CUSTOMER_ID
    'Wolski  Zajazd',                             -- COMPANY_NAME
    'Zbyszek Piestrzeniewicz',                    -- CONTACT_NAME
    'Owner',                                      -- CONTACT_TITLE
    'ul. Filtrowa 68',                            -- ADDRESS
    'Warszawa',                                   -- CITY
    NULL,                                         -- REGION
    '01-012',                                     -- POSTAL_CODE
    'Poland',                                     -- COUNTRY
    '(26) 642-7012',                              -- PHONE
    '(26) 642-7012'                               -- FAX
);