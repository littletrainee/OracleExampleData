DECLARE
    V_EXIST NUMBER;
BEGIN
    SELECT COUNT(*)
      INTO V_EXIST
      FROM USER_TABLES
     WHERE TABLE_NAME = 'AUTHORS';
    IF V_EXIST <> 0 THEN
        EXECUTE IMMEDIATE 'DROP TABLE AUTHORS CASCADE CONSTRAINT PURGE';
    END IF; 
END;
/

CREATE TABLE AUTHORS(
    AUTHOR_ID CHAR(11) NOT NULL,
    AUTHOR_LAST_NAME VARCHAR2(40) NOT NULL,
    AUTHOR_FIRST_NAME VARCHAR2(20) NOT NULL,
    PHONE CHAR(12) DEFAULT 'UNKNOW' NOT NULL ,
    ADDRESS VARCHAR2(40),
    CITY VARCHAR2(20),
    STATE CHAR(2),
    ZIP CHAR(5),
    CONTRACT NUMBER(1,0) NOT NULL, 
    CONSTRAINT PK_AUTHORS PRIMARY KEY (AUTHOR_ID),
    CONSTRAINT CK_AUTHORS_AUTHOR_ID CHECK(REGEXP_LIKE(AUTHOR_ID, '^[0-9]{3}-[0-9]{2}-[0-9]{4}$')),
    CONSTRAINT CK_AUTHORS_ZIP CHECK (REGEXP_LIKE(ZIP, '^[0-9]{5}$'))
);

CREATE INDEX AUTHORS_FULL_NAME ON AUTHORS(AUTHOR_LAST_NAME, AUTHOR_FIRST_NAME);


INSERT INTO AUTHORS VALUES ('409-56-7008', 'Bennet', 'Abraham', '415 658-9932', '6223 Bateman St.', 'Berkeley', 'CA', '94705', 1);
INSERT INTO AUTHORS VALUES ('213-46-8915', 'Green', 'Marjorie', '415 986-7020', '309 63rd St. #411', 'Oakland', 'CA', '94618', 1);
INSERT INTO AUTHORS VALUES ('238-95-7766', 'Carson', 'Cheryl', '415 548-7723', '589 Darwin Ln.', 'Berkeley', 'CA', '94705', 1);
INSERT INTO AUTHORS VALUES ('998-72-3567', 'Ringer', 'Albert', '801 826-0752', '67 Seventh Av.', 'Salt Lake City', 'UT', '84152', 1);
INSERT INTO AUTHORS VALUES ('899-46-2035', 'Ringer', 'Anne', '801 826-0752', '67 Seventh Av.', 'Salt Lake City', 'UT', '84152', 1);
INSERT INTO AUTHORS VALUES ('722-51-5454', 'DeFrance', 'Michel', '219 547-9982', '3 Balding Pl.', 'Gary', 'IN', '46403', 1);
INSERT INTO AUTHORS VALUES ('807-91-6654', 'Panteley', 'Sylvia', '301 946-8853', '1956 Arlington Pl.', 'Rockville', 'MD', '20853', 1);
INSERT INTO AUTHORS VALUES ('893-72-1158', 'McBadden', 'Heather', '707 448-4982', '301 Putnam', 'Vacaville', 'CA', '95688', 0);
INSERT INTO AUTHORS VALUES ('724-08-9931', 'Stringer', 'Dirk', '415 843-2991', '5420 Telegraph Av.', 'Oakland', 'CA', '94609', 0);
INSERT INTO AUTHORS VALUES ('274-80-9391', 'Straight', 'Dean', '415 834-2919', '5420 College Av.', 'Oakland', 'CA', '94609', 1);
INSERT INTO AUTHORS VALUES ('756-30-7391', 'Karsen', 'Livia', '415 534-9219', '5720 McAuley St.', 'Oakland', 'CA', '94609', 1);
INSERT INTO AUTHORS VALUES ('724-80-9391', 'MacFeather', 'Stearns', '415 354-7128', '44 Upland Hts.', 'Oakland', 'CA', '94612', 1);
INSERT INTO AUTHORS VALUES ('427-17-2319', 'Dull', 'Ann', '415 836-7128', '3410 Blonde St.', 'Palo Alto', 'CA', '94301', 1);
INSERT INTO AUTHORS VALUES ('672-71-3249', 'Yokomoto', 'Akiko', '415 935-4228', '3 Silver Ct.', 'Walnut Creek', 'CA', '94595', 1);
INSERT INTO AUTHORS VALUES ('267-41-2394', 'O''Leary', 'Michael', '408 286-2428', '22 Cleveland Av. #14', 'San Jose', 'CA', '95128', 1);
INSERT INTO AUTHORS VALUES ('472-27-2349', 'Gringlesby', 'Burt', '707 938-6445', 'PO Box 792', 'Covelo', 'CA', '95428', 3);
INSERT INTO AUTHORS VALUES ('527-72-3246', 'Greene', 'Morningstar', '615 297-2723', '22 Graybar House Rd.', 'Nashville', 'TN', '37215', 0);
INSERT INTO AUTHORS VALUES ('172-32-1176', 'White', 'Johnson', '408 496-7223', '10932 Bigge Rd.', 'Menlo Park', 'CA', '94025', 1);
INSERT INTO AUTHORS VALUES ('712-45-1867', 'del Castillo', 'Innes', '615 996-8275', '2286 Cram Pl. #86', 'Ann Arbor', 'MI', '48105', 1);
INSERT INTO AUTHORS VALUES ('846-92-7186', 'Hunter', 'Sheryl', '415 836-7128', '3410 Blonde St.', 'Palo Alto', 'CA', '94301', 1);
INSERT INTO AUTHORS VALUES ('486-29-1786', 'Locksley', 'Charlene', '415 585-4620', '18 Broadway Av.', 'San Francisco', 'CA', '94130', 1);
INSERT INTO AUTHORS VALUES ('648-92-1872', 'Blotchet-Halls', 'Reginald', '503 745-6402', '55 Hillsdale Bl.', 'Corvallis', 'OR', '97330', 1);
INSERT INTO AUTHORS VALUES ('341-22-1782', 'Smith', 'Meander', '913 843-0462', '10 Mississippi Dr.', 'Lawrence', 'KS', '66044', 0);