DECLARE
    V_EXIST NUMBER;
BEGIN
    SELECT COUNT(*)
      INTO V_EXIST
      FROM USER_TABLES
     WHERE TABLE_NAME = 'TITLES';
    IF V_EXIST <> 0 THEN
        EXECUTE IMMEDIATE 'DROP TABLE TITLES CASCADE CONSTRAINT PURGE';
    END IF; 
END;
/

CREATE TABLE TITLES(
    TITLE_ID CHAR(6) NOT NULL,
    TITLE VARCHAR2(80) NOT NULL,
    TYPE CHAR(12) DEFAULT 'UNDECIDED' NOT NULL,
    PUBLISHER_ID CHAR(4),
    PRICE NUMBER(19,4),
    ADVANCE NUMBER(19,4),
    ROYALTY NUMBER(10,0),
    YEAR_TO_DATE_SALES NUMBER(10,0),
    NOTES VARCHAR2(200),
    PUBLISH_DATE DATE DEFAULT SYSDATE NOT NULL,
    CONSTRAINT PK_TITLES PRIMARY KEY(TITLE_ID),
    CONSTRAINT FK_TITLES_PUBLISHER_ID FOREIGN KEY(PUBLISHER_ID) REFERENCES PUBLISHERS (PUBLISHER_ID)
);

CREATE INDEX IDX_TITLES_TITLE ON TITLES (TITLE);

ALTER TABLE TITLES DISABLE CONSTRAINT FK_TITLES_PUBLISHER_ID;

INSERT INTO TITLES -- PC8888
VALUES (
    'PC8888',                                     -- TITLE_ID
    'Secrets of Silicon Valley',                  -- TITLE
    'popular_comp',                               -- TYPE
    '1389',                                       -- PUBLISHER_ID
    20.00,                                        -- PRICE
    8000.00,                                      -- ADVANCE
    10,                                           -- ROYALTY
    4095,                                         -- YEAR_TO_DATE_SALES
    'Muckraking reporting on the world''s largest'
        || ' computer hardware and software '
        || 'manufacturers.',                      -- NOTES
    TO_DATE('1994/06/12', 'YYYY/MM/DD')           -- PUBLISH_DATE
);

INSERT INTO TITLES -- BU1032
VALUES (
    'BU1032',                                     -- TITLE_ID
    'The Busy Executive''s Database Guide',       -- TITLE
    'business',                                   -- TYPE
    '1389',                                       -- PUBLISHER_ID
    19.99,                                        -- PRICE
    5000.00,                                      -- ADVANCE
    10,                                           -- ROYALTY
    4095,                                         -- YEAR_TO_DATE_SALES
    'An overview of available database systems '
        || 'with emphasis on common business '
        || 'applications. Illustrated.',          -- NOTES
    TO_DATE('1991/06/12', 'YYYY/MM/DD')           -- PUBLISH_DATE
);

INSERT INTO TITLES -- PS7777
VALUES (
    'PS7777',                                     -- TITLE_ID
    'Emotional Security: A New Algorithm',        -- TITLE
    'psychology',                                 -- TYPE
    '0736',                                       -- PUBLISHER_ID
    7.99,                                         -- PRICE
    4000.00,                                      -- ADVANCE
    10,                                           -- ROYALTY
    3336,                                         -- YEAR_TO_DATE_SALES
    'Protecting yourself and your loved ones from'
        || ' undue emotional stress in the modern'
        || ' world. Use of computer and '
        || 'nutritional aids emphasized.',        -- NOTES
    TO_DATE('1991/06/12', 'YYYY/MM/DD')           -- PUBLISH_DATE
);

INSERT INTO TITLES -- PS3333
VALUES (
    'PS3333',                                     -- TITLE_ID
    'Prolonged Data Deprivation: Four Case '
        || 'Studies',                             -- TITLE
    'psychology',                                 -- TYPE
    '0736',                                       -- PUBLISHER_ID
    19.99,                                        -- PRICE
    2000.00,                                      -- ADVANCE
    10,                                           -- ROYALTY
    4072,                                         -- YEAR_TO_DATE_SALES
    'What happens when the data runs dry?  '
        || 'Searching evaluations of information-'
        || 'shortage effects.',                   -- NOTES
    TO_DATE('1991/06/12', 'YYYY/MM/DD')           -- PUBLISH_DATE
);

INSERT INTO TITLES -- BU1111
VALUES (
    'BU1111',                                     -- TITLE_ID
    'Cooking with Computers: Surreptitious '
        || 'Balance Sheets',                      -- TITLE
    'business',                                   -- TYPE
    '1389',                                       -- PUBLISHER_ID
    11.95,                                        -- PRICE
    5000.00,                                      -- ADVANCE
    10,                                           -- ROYALTY
    3876,                                         -- YEAR_TO_DATE_SALES
    'Helpful hints on how to use your electronic '
        || 'resources to the best advantage.',    -- NOTES
    TO_DATE('1991/06/09', 'YYYY/MM/DD')           -- PUBLISH_DATE
);

INSERT INTO TITLES -- MC2222
VALUES (
    'MC2222',                                     -- TITLE_ID
    'Silicon Valley Gastronomic Treats',          -- TITLE
    'mod_cook',                                   -- TYPE
    '0877',                                       -- PUBLISHER_ID
    19.99,                                        -- PRICE
    0.00,                                         -- ADVANCE
    12,                                           -- ROYALTY
    2032,                                         -- YEAR_TO_DATE_SALES
    'Favorite recipes for quick, easy, and '
        || 'elegant meals.',                      -- NOTES
    TO_DATE('1991/06/09', 'YYYY/MM/DD')           -- PUBLISH_DATE
);

INSERT INTO TITLES -- TC7777
VALUES (
    'TC7777',                                     -- TITLE_ID
    'Sushi, Anyone?',                             -- TITLE
    'trad_cook',                                  -- TYPE
    '0877',                                       -- PUBLISHER_ID
    14.99,                                        -- PRICE
    8000.00,                                      -- ADVANCE
    10,                                           -- ROYALTY
    4095,                                         -- YEAR_TO_DATE_SALES
    'Detailed instructions on how to make '
        || 'authentic Japanese sushi in your '
        || 'spare time.',                         -- NOTES
    TO_DATE('1991/06/12', 'YYYY/MM/DD')           -- PUBLISH_DATE
);

INSERT INTO TITLES -- TC4203
VALUES (
    'TC4203',                                     -- TITLE_ID
    'Fifty Years in Buckingham Palace Kitchens',  -- TITLE
    'trad_cook',                                  -- TYPE
    '0877',                                       -- PUBLISHER_ID
    11.95,                                        -- PRICE
    4000.00,                                      -- ADVANCE
    14,                                           -- ROYALTY
    15096,                                        -- YEAR_TO_DATE_SALES
    'More anecdotes from the Queen''s favorite '
        || 'cook describing life among English '
        || 'royalty. Recipes, techniques, tender '
        || 'vignettes.',                          -- NOTES
    TO_DATE('1991/06/12', 'YYYY/MM/DD')           -- PUBLISH_DATE
);

INSERT INTO TITLES -- PC1035
VALUES (
    'PC1035',                                     -- TITLE_ID
    'But Is It User Friendly?',                   -- TITLE
    'popular_comp',                               -- TYPE
    '1389',                                       -- PUBLISHER_ID
    22.95,                                        -- PRICE
    7000.00,                                      -- ADVANCE
    16,                                           -- ROYALTY
    8780,                                         -- YEAR_TO_DATE_SALES
    'A survey of software for the naive user, '
        || 'focusing on the ''friendliness'' of '
        || 'each.',                               -- NOTES
    TO_DATE('1991/06/30', 'YYYY/MM/DD')           -- PUBLISH_DATE
);

INSERT INTO TITLES -- BU2075
VALUES(
    'BU2075',                                     -- TITLE_ID
    'You Can Combat Computer Stress!',            -- TITLE
    'business',                                   -- TYPE
    '0736',                                       -- PUBLISHER_ID
    2.99,                                         -- PRICE
    10125.00,                                     -- ADVANCE
    24,                                           -- ROYALTY
    18722,                                        -- YEAR_TO_DATE_SALES
    'The latest medical and psychological '
        || 'techniques for living with the '
        || 'electronic office. Easy-to-understand'
        || ' explanations.',                      -- NOTES
    TO_DATE('1991/06/30', 'YYYY/MM/DD')           -- PUBLISH_DATE
);

INSERT INTO TITLES -- PS2091
VALUES (
    'PS2091',                                     -- TITLE_ID
    'Is Anger the Enemy?',                        -- TITLE
    'psychology',                                 -- TYPE
    '0736',                                       -- PUBLISHER_ID
    10.95,                                        -- PRICE
    2275.00,                                      -- ADVANCE
    12,                                           -- ROYALTY
    2045,                                         -- YEAR_TO_DATE_SALES
    'Carefully researched study of the effects of'
        || ' strong emotions on the body. '
        || 'Metabolic charts included.',          -- NOTES
    TO_DATE('1991/06/15', 'YYYY/MM/DD')           -- PUBLISH_DATE
);

INSERT INTO TITLES -- PS2106
VALUES (
    'PS2106',                                     -- TITLE_ID
    'Life Without Fear',                          -- TITLE
    'psychology',                                 -- TYPE
    '0736',                                       -- PUBLISHER_ID
    7.00,                                         -- PRICE
    6000.00,                                      -- ADVANCE
    10,                                           -- ROYALTY
    111,                                          -- YEAR_TO_DATE_SALES
    'New exercise, meditation, and nutritional '
        || 'techniques that can reduce the shock '
        || 'of daily interactions. Popular '
        || 'audience. Sample menus included, '
        || 'exercise video available separately.',-- NOTES
    TO_DATE('1991/10/05', 'YYYY/MM/DD')           -- PUBLISH_DATE
);

INSERT INTO TITLES -- MC3021
VALUES (
    'MC3021',                                     -- TITLE_ID
    'The Gourmet Microwave',                      -- TITLE
    'mod_cook',                                   -- TYPE
    '0877',                                       -- PUBLISHER_ID
    2.99,                                         -- PRICE
    15000.00,                                     -- ADVANCE
    24,                                           -- ROYALTY
    22246,                                        -- YEAR_TO_DATE_SALES
    'Traditional French gourmet recipes adapted '
        || 'for modern microwave cooking.',       -- NOTES
    TO_DATE('1991/06/18', 'YYYY/MM/DD')           -- PUBLISH_DATE
);

INSERT INTO TITLES -- TC3218
VALUES (
    'TC3218',                                     -- TITLE_ID
    'Onions, Leeks, and Garlic: Cooking Secrets ' 
        || 'of the Mediterranean',                -- TITLE
    'trad_cook',                                  -- TYPE
    '0877',                                       -- PUBLISHER_ID
    20.95,                                        -- PRICE
    7000.00,                                      -- ADVANCE
    10,                                           -- ROYALTY
    375,                                          -- YEAR_TO_DATE_SALES
    'Profusely illustrated in color, this makes a'
        || ' wonderful gift book for a cuisine-'
        || 'oriented friend.',                    -- NOTES
    TO_DATE('1991/10/21', 'YYYY/MM/DD')           -- PUBLISH_DATE
);

INSERT INTO TITLES (-- MC3026
    TITLE_ID, 
    TITLE, 
    PUBLISHER_ID
) VALUES (
    'MC3026', 
    'The Psychology of Computer Cooking', 
    '0877'
); 

INSERT INTO TITLES -- BU7832
VALUES (
    'BU7832',                                     -- TITLE_ID
    'Straight Talk About Computers',              -- TITLE
    'business',                                   -- TYPE
    '1389',                                       -- PUBLISHER_ID
    19.99,                                        -- PRICE
    5000.00,                                      -- ADVANCE
    10,                                           -- ROYALTY
    4095,                                         -- YEAR_TO_DATE_SALES
    'Annotated analysis of what computers can do '
        || 'for you: a no-hype guide for the '
        || 'critical user.',                      -- NOTES
    TO_DATE('1991/06/22', 'YYYY/MM/DD')           -- PUBLISH_DATE
);

INSERT INTO TITLES -- PS1372
VALUES(
    'PS1372',                                     -- TITLE_ID
    'Computer Phobic AND Non-Phobic Individuals: '
        || 'Behavior Variations',                 -- TITLE
    'psychology',                                 -- TYPE
    '0877',                                       -- PUBLISHER_ID
    21.59,                                        -- PRICE
    7000.00,                                      -- ADVANCE
    10,                                           -- ROYALTY
    375,                                          -- YEAR_TO_DATE_SALES
    'A must for the specialist, this book '
        || 'examines the difference between those'
        || ' who hate and fear computers and '
        || 'those who don''t.',                   -- NOTES
    TO_DATE('1991/10/21', 'YYYY/MM/DD')           -- PUBLISH_DATE
);

INSERT INTO TITLES ( -- PC9999
    TITLE_ID, 
    TITLE, 
    TYPE, 
    PUBLISHER_ID, 
    NOTES
) VALUES (
    'PC9999', 
    'Net Etiquette', 
    'popular_comp', 
    '1389', 
    'A must-read for computer conferencing.'
);

ALTER TABLE TITLES ENABLE CONSTRAINT FK_TITLES_PUBLISHER_ID;